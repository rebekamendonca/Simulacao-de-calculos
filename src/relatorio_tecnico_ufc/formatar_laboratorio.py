"""Gera os PDFs UFC a partir dos dados de uma execução do laboratório."""
import argparse
from csv import reader
import json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import shutil
import subprocess
from tempfile import TemporaryDirectory

import pymupdf

TEMPLATE = Path(__file__).resolve().parent
ESCAPE = str.maketrans({"&": r"\&", "%": r"\%", "#": r"\#", "_": r"\_",
                        "$": r"\$", "Δ": r"\ensuremath{\Delta}",
                        "−": r"\ensuremath{-}", "<": r"\textless{}",
                        ">": r"\textgreater{}", "^": r"\textasciicircum{}"})
EQUATIONS = {
    "estatico": r"u=\frac{P}{k}",
    "oscilador": r"A(\omega)=\frac{1}{k-m\omega^2+ic\omega},\qquad f_n=\frac{1}{2\pi}\sqrt{\frac{k}{m}}",
    "contato": r"\mathbf N=-(\mathbf F+\mathbf F_H+\mathbf A)^{-1}\boldsymbol\Delta,\quad \boldsymbol\Delta=a\begin{bmatrix}1\\e^{-i\omega d/v}\end{bmatrix}",
    "solo": r"u=\frac{P H_0 (1+r/r_0)^{-1/2}\exp(-\alpha rq-i2\pi fr/v_s)}{1-q^2+2i\zeta q},\qquad q=f/f_r",
    "laje": r"U=PA,\qquad F_t=(k+i\omega c)U,\qquad T=\left|F_t/P\right|",
    "edificio": r"\begin{bmatrix}K_b-m_b\omega^2&-K_b\\-K_b&K_b+Z_s\end{bmatrix}\begin{bmatrix}u_{\rm piso}\\u_{\rm base}\end{bmatrix}=\begin{bmatrix}0\\Z_su_0\end{bmatrix}",
}


def tex(text):
    return text.replace("±", "+/-").translate(ESCAPE)


def paragraph(label, text):
    return rf"\noindent\textbf{{{tex(label)}.}} {tex(text)}\par"


def figure(plot, legend):
    return rf"""
\begin{{figure}}[H]
\centering
\includegraphics[width=\linewidth]{{plots/{plot.name}}}
\caption{{{tex(legend)}}}
\figsource{{gráfico exportado pelo MATLAB na execução publicada.}}
\end{{figure}}
"""


def results_table(csv_path, entry, note):
    with csv_path.open(encoding="utf-8-sig", newline="") as file:
        data = reader(file)
        assert next(data) == ["Grandeza", "Referencia", "A", "Delta_A", "Pct_A", "B", "Delta_B", "Pct_B"]
        rows = [["Grandeza", "Ref.", "A", "Δ A", "% A", "B", "Δ B", "% B"]]
        for name, *numbers in data:
            name = {
                "MaximoNaMalha": "Máx. " + entry["eixo_y"],
                "CoordenadaDoMaximo": "Abscissa do máx. (" + entry["eixo_x"] + ")",
            }.get(name, name.replace("_", " "))
            values = ["—" if n.strip() in ("", "NaN") else f"{float(n):.3g}" for n in numbers]
            rows.append([name, *values])
    head, *data = [" & ".join(map(tex, row)) + r" \\" for row in rows]
    return "\n".join([
        paragraph("Resultados", note),
        r"\begin{center}\setstretch{1}\footnotesize\setlength{\tabcolsep}{4pt}",
        r"\begin{tabular}{@{}p{0.38\linewidth}*{7}{r}@{}}\toprule",
        head, r"\midrule", *data, r"\bottomrule\end{tabular}\end{center}",
    ])


def collect(publication):
    records = {}
    for entry in publication["ensaios"]:
        code = entry["codigo"]
        name = f"Experimento_{code.split('_', 1)[0]}"
        plot = Path(f"{code}.png")
        labels_and_text = entry["secoes"]
        middle = len(labels_and_text) // 2
        data = dict(enumerate(zip(labels_and_text[:middle], labels_and_text[middle:], strict=True), 1))
        records.setdefault(name, []).append((entry, publication["data"], data, plot))
    if not records:
        raise ValueError("A execução não contém ensaios.")
    return records


def report_body(name, items, reports):
    group = name.split("_")[1]
    paragraphs = []
    modelos = set()
    for i, (entry, date, data, plot) in enumerate(items, 1):
        parameter = entry["parametro"]
        kind = plot.stem.split("_")[1]
        paragraphs.append(rf"\section*{{Experimento {group} · Ensaio {i} · {tex(parameter)}}}")
        paragraphs.append(rf"\noindent\textit{{Data da simulação: {tex(date)}.}}\par")
        paragraphs.extend(paragraph(*data[j]) for j in (1, 3, 4))
        paragraphs.append(figure(plot, "Resultados da referência e dos testes A e B."))
        paragraphs.append(paragraph(*data[6]))
        paragraphs.append(paragraph(*data[2]))
        if kind not in modelos:
            paragraphs.append(rf"\begin{{equation}}{EQUATIONS[kind]}\label{{eq:{kind}}}\end{{equation}}")
            modelos.add(kind)
        else:
            paragraphs.append(rf"\noindent Formulação na Equação~\eqref{{eq:{kind}}}.\par")
        paragraphs.append(results_table(reports / plot.with_suffix('.csv'), entry, data[5][1]))
        paragraphs.extend(paragraph(*data[j]) for j in range(7, 11))
    paragraphs.append(paragraph(*items[-1][2][11]))
    return "\n".join(paragraphs)


def consolidated(publication):
    return "\n".join([
        r"\section*{Comparação consolidada}",
        paragraph("Simulação", publication["data"]),
        "Variação percentual de A e B em relação à referência do próprio ensaio.",
        "Nos ensaios dinâmicos, os percentuais referem-se ao máximo na malha;",
        "no solo, ao receptor; no contato, à roda 1; e na estática, ao deslocamento final.",
        r"\par\medskip{\footnotesize\setstretch{1}\noindent",
        *(tex(line) + r"\par\smallskip" for line in publication["panorama"]),
        "}",
    ])


def compile_pdf(task, work, compiler):
    name, source, destination = task
    tex_file = work / f"{name}.tex"
    tex_file.write_text(source, encoding="utf-8")
    result = subprocess.run([str(compiler), "--keep-logs", tex_file.name], cwd=work,
                            capture_output=True, text=True, errors="replace")
    if result.returncode:
        raise RuntimeError(f"{name}\n{result.stdout}\n{result.stderr}")
    path = work / f"{name}.pdf"
    with pymupdf.open(path) as pdf:
        pages = [p.get_text() for p in pdf]
        assert sum("UNIVERSIDADE FEDERAL DO CEARÁ" in p for p in pages) == 1
        assert all(abs(page.rect.width - 595.28) < 1 and abs(page.rect.height - 841.89) < 1 for page in pdf)
        assert all("??" not in p for p in pages)
        assert all(len(p.strip()) > 40 for p in pages)
    return path, destination


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("execucao", type=Path, help="Pasta com publicacao.json, CSVs e imagens_publicacao")
    parser.add_argument("--tectonic", default="tectonic", help="Executável do Tectonic")
    args = parser.parse_args()
    reports = args.execucao.resolve()
    destination = reports.parent / "relatorios" / "ufc"
    compiler = shutil.which(args.tectonic)
    if not compiler:
        parser.error("Tectonic não encontrado. Informe seu executável com --tectonic.")
    base = (TEMPLATE / "main.tex").read_text(encoding="utf-8-sig")
    publication = json.loads((reports / "publicacao.json").read_text(encoding="utf-8-sig"))
    records = collect(publication)
    tasks = []

    def add(name, body, grafico=False):
        output = destination / "graficos" if grafico else destination
        tasks.append((name, base.replace("% CONTEUDO_UFC", body, 1), output))

    for name, items in records.items():
        add(name, report_body(name, items, reports))
        for i, (entry, date, data, plot) in enumerate(items, 1):
            parameter = entry["parametro"]
            group = name.split("_")[1]
            title = f"Experimento {group} · Ensaio {i}"
            add(plot.stem, "\n".join([
                rf"\section*{{{tex(title)}}}",
                paragraph("Simulação", date),
                figure(plot, "Resultados da referência e dos testes A e B."),
                *(paragraph(*data[j]) for j in (1, 3, 4, 6)),
            ]), grafico=True)
    add("Consolidado", consolidated(publication))

    with TemporaryDirectory(prefix="ferrovia-ufc-") as directory:
        work = Path(directory)
        (work / "plots").mkdir()
        shutil.copy2(TEMPLATE / "ufc.png", work)
        for entry in publication["ensaios"]:
            name = f"{entry['codigo']}.png"
            shutil.copy2(reports / "imagens_publicacao" / name, work / "plots" / name)
        with ThreadPoolExecutor(max_workers=4) as pool:
            products = list(pool.map(lambda task: compile_pdf(task, work, compiler), tasks))
        for pdf, destination in products:
            destination.mkdir(parents=True, exist_ok=True)
            shutil.copy2(pdf, destination)
    print(f"{len(products)} PDFs A4 gerados em resultados/relatorios/ufc.")


if __name__ == "__main__":
    main()
