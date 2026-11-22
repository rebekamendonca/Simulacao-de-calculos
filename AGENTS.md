# AGENTS.md

## Projeto

- Laboratório didático de vibrações ferroviárias em MATLAB.
- Leia os dois prompts e as seções pertinentes da tese local antes de alterar modelos ou relatórios.
- Use `src/laboratorio_ferroviario.m` como ponto de entrada do laboratório.
- Preserve `archive/Experimento-simplorio-ferroviario.m` como referência dos primeiros ensaios.
- Busque rotinas e resultados equivalentes com `rg` antes de criar arquivos.

## Organização

- `src/configuracao_ferroviaria.m` concentra valores, unidades, malhas e o roteiro científico.
- `src/modelo_ferroviario.m` calcula respostas complexas em SI e métricas físicas.
- `src/laboratorio_ferroviario.m` executa comparações e atualiza os gráficos PNG em `figure/`.
- `src/relatorio_ferroviario.m` organiza os textos técnicos gravados em `publicacao.json`.
- `src/grade_massa_rigidez_ferroviaria.m` executa a análise opcional de dois fatores fora do OFAT.
- O fluxo padrão exporta PNGs de nome fixo diretamente do MATLAB para `figure/`.
- A opção explícita `DadosUFC=true` atualiza MAT, CSVs, JSON e a cópia dos PNGs para publicação em `resultados/dados_simulacao/`.
- `src/relatorio_tecnico_ufc/` contém o template A4, o brasão e o formatador.
- Publique PDFs oficiais em `resultados/relatorios/ufc/`, com os gráficos avulsos em `graficos/`. Consulte o README para os caminhos e a execução.
- Reutilize a configuração, os modelos e o estilo existentes.
- Confira chamadas, caminhos e dependências antes de mover ou consolidar arquivos.
- Preserve entradas originais, resultados publicados e histórico.

## Execução e validação

- Execute MATLAB exclusivamente por CLI com `-batch`.
- No Windows, use `-wait` para capturar o código de saída.
- Use `-noFigureWindows` para executar scripts com gráficos.
- Rode os comandos a partir da raiz do projeto.
- Confirme o executável, o log e o código de saída antes de relatar sucesso.

```powershell
matlab -wait -noFigureWindows -batch "disp('MATLAB Batch OK')"
matlab -wait -noFigureWindows -batch "addpath('src'); laboratorio_ferroviario"
matlab -wait -noFigureWindows -batch "addpath('src'); laboratorio_ferroviario(3)"
matlab -wait -noFigureWindows -batch "addpath('src'); validar_laboratorio_ferroviario"
```

- Para executar o script histórico, copie-o de `archive/` para uma pasta temporária com o nome `Experimento_simplorio_ferroviario.m` e invoque `run` nessa cópia. O nome original contém hífens.
- Se houver uma suíte em `tests/`, execute `results = runtests('tests'); assertSuccess(results)` por Batch em versão compatível.
- Confira os PNGs em `figure/` após cada execução. Ao publicar, confira os dados UFC e os PDFs em `ufc/`.
- Revise as páginas exportadas buscando recortes, legendas sobrepostas e falhas de acentuação.
- Informe quais comandos foram tentados, o que foi verificado e eventuais bloqueios.

## Critérios científicos e relatórios

- Compare um parâmetro por vez com uma referência comum.
- Mantenha os cálculos em SI e preserve a fase até a extração das amplitudes.
- Diferencie frequência natural, frequência amortecida e máximo da resposta.
- Informe unidade, hipótese, diferença absoluta e percentual nos resultados.
- Vincule equações e seções da tese apenas após conferência no texto.
- Descreva explicitamente as diferenças entre os modelos reduzidos e o 2.5D ou a subestruturação.
- Use fundo branco, curvas contrastantes, legendas externas e unidades explícitas.
- Use o PDF de referência, quando disponível, como fonte visual e estrutural.
- Documente a justificativa física para alterações nas equações.
