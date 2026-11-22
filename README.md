# Laboratório de dinâmica ferroviária

## Executar os ensaios e ver os gráficos

Com a raiz do projeto como pasta atual no MATLAB, use o ponto de entrada
[`src/laboratorio_ferroviario.m`](src/laboratorio_ferroviario.m).

```matlab
addpath('src')
laboratorio_ferroviario(2)
```

Ao terminar no MATLAB Desktop, abre a aba **Gráficos do laboratório ferroviário**.
Selecione o experimento nas abas superiores e o gráfico nas abas laterais.
Use `Mostrar=false` para atualizar as imagens sem abrir a aba.

Use qualquer número de 1 a 5, um vetor como `[2 5]` ou omita o número para
executar todos. Para alterar os parâmetros só naquela execução, passe uma
estrutura de ajustes. Cada vetor contém os valores de referência, teste A e
teste B, nessa ordem. Os parâmetros fixos recebem um escalar.

```matlab
P.oscilador.m = [450 600 900];     % kg
P.oscilador.k = [2e7 1.5e7 3e7]; % N/m
pasta = laboratorio_ferroviario(2, Parametros=P);
```

Os nomes e unidades estão em [`src/configuracao_ferroviaria.m`](src/configuracao_ferroviaria.m).
Para mudar os valores padrão de todas as execuções, edite esse arquivo.

O MATLAB exporta os gráficos diretamente para `figure/`, na raiz do projeto,
como imagens PNG. Cada ensaio tem um nome fixo. Reexecutar um experimento
substitui somente as imagens dos ensaios selecionados.

No PowerShell, o mesmo comando atualiza as imagens em modo Batch.

```powershell
matlab -wait -noFigureWindows -batch "addpath('src'); laboratorio_ferroviario"
```

| Experimento | Como interpretar |
| --- | --- |
| 1 · Estática | Compare a inclinação P/u e os marcadores de carga prescrita. |
| 2 · Oscilador | Compare frequência natural, frequência amortecida, pico e largura de meia potência. A tabela indica quando a largura não está definida. |
| 3 · Veículo–via | Compare as duas rodas a 12 Hz. Velocidade e espaçamento mudam a fase relativa nessa frequência. |
| 4 · Solo | Leia os pontos no par distância/frequência escolhido e compare as curvas nos dois domínios. |
| 5 · Laje e edifício | Compare deslocamento, força e transmissibilidade. Acima do limiar T = 1 em frequência a laje isola no modelo de base rígida. A razão do piso usa o movimento incidente como referência. |

Os máximos na malha são limitados ao intervalo configurado. As frequências do
oscilador linear e o limiar da laje são analíticos. As tabelas dão diferenças
com sinal e omitem percentuais de referência nula ou indefinida. As entradas
numéricas são didáticas e as hipóteses estão nos relatórios.

Verificações físicas:

```powershell
matlab -wait -noFigureWindows -batch "addpath('src'); validar_laboratorio_ferroviario"
```


## Grade opcional de dois fatores

Use a grade massa × rigidez para cruzar todos os valores de `m` e `k` do
oscilador, com `c` no valor de referência. A tabela é independente do OFAT.

```powershell
matlab -wait -noFigureWindows -batch "addpath('src'); disp(grade_massa_rigidez_ferroviaria())"
```

## Publicação UFC

- [Dados da simulação e imagens da publicação](resultados/dados_simulacao/).
- [Cinco relatórios e consolidado](resultados/relatorios/ufc/).
- [Gráficos avulsos](resultados/relatorios/ufc/graficos/).
- [Template LaTeX, brasão e código de publicação](src/relatorio_tecnico_ufc/).

Para preparar uma publicação completa, rode `laboratorio_ferroviario(1:5, DadosUFC=true)`.
O MATLAB atualiza os PNGs de trabalho em `figure/` e registra uma cópia dos
mesmos PNGs com o MAT, os CSVs e o JSON em `resultados/dados_simulacao/`.
A publicação usa essa cópia, vinculada aos dados do ensaio.

Com Python, PyMuPDF e Tectonic disponíveis, gere os PDFs:

```powershell
py src/relatorio_tecnico_ufc/formatar_laboratorio.py 'resultados/dados_simulacao'
```

Use `--tectonic 'C:/caminho/tectonic.exe'` se o executável estiver fora do
`PATH`. A saída fica em `resultados/relatorios/ufc/`.
