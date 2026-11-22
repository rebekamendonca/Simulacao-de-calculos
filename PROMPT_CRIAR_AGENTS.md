# Prompt — Criar e validar `AGENTS.md`

Crie um arquivo chamado `AGENTS.md` na raiz do meu repositório, com instruções operacionais concisas (aproximadamente 40 a 80 linhas) para agentes de IA que forem consultar, modificar, executar e testar o projeto.

## Inspeção do repositório

Antes de escrever, examine a estrutura de diretórios, identifique scripts e funções MATLAB, testes, arquivos de configuração e rotinas de exportação de gráficos e relatórios PDF. Preserve convenções existentes. Não invente caminhos ou funcionalidades.

## Regra obrigatória: MATLAB somente por CLI Batch

Toda execução e validação de código MATLAB **deve ocorrer exclusivamente por `matlab -batch` na linha de comando**, sem abrir ou controlar a interface gráfica do MATLAB.

Verifique na documentação oficial a sintaxe aplicável ao ambiente e tente os comandos:

```bash
matlab -batch "disp('MATLAB Batch OK')"
matlab -batch "nome_da_funcao"
matlab -batch "run('caminho/do/script.m')"
matlab -batch "results = runtests('tests'); assertSuccess(results)"
```

Adapte caminhos, nomes e testes à estrutura real do repositório. `assertSuccess` exige que os resultados de teste sejam compatíveis com essa função e que ela esteja disponível na versão em uso. Antes de registrar os comandos como validados, verifique a disponibilidade do executável, o código de saída e o log. Se não houver MATLAB disponível, registre a limitação sem declarar execução bem-sucedida.

## Alterações e testes

- Leia os arquivos relevantes antes de modificar o código.
- Evite mudanças fora do escopo e preserve a arquitetura atual.
- Não modifique dados experimentais originais nem sobrescreva resultados sem autorização.
- Mantenha unidades físicas, consistência dimensional e justificativa para mudanças nas equações.
- Execute os testes pertinentes com MATLAB Batch e verifique os artefatos produzidos.
- Informe precisamente os testes realizados, os resultados e os impedimentos.

## Organização e prevenção de duplicações

- Antes de criar qualquer arquivo, função, experimento ou pasta, procure implementações e resultados equivalentes no repositório.
- Reutilize e, quando necessário, refatore componentes existentes em vez de criar cópias quase idênticas. Extraia rotinas comuns (configuração, cálculos, gráficos e exportação) para funções compartilhadas.
- Mantenha uma estrutura de pastas coerente, separando código-fonte, testes, dados de entrada, resultados gerados e relatórios; respeite a organização já adotada pelo projeto.
- Use nomes consistentes e descritivos. Evite arquivos como `final_v2`, `novo_teste`, `copia` ou múltiplos scripts com a mesma finalidade.
- Não duplique constantes, parâmetros de referência, equações ou estilos de gráficos em vários arquivos: mantenha uma fonte única de configuração quando possível.
- Antes de mover, renomear, consolidar ou excluir arquivos, verifique referências, chamadas, dependências e testes; preserve dados originais e histórico relevante. Não apague arquivos potencialmente úteis sem confirmação.
- Após reorganizar, atualize caminhos e documentação, execute os testes relevantes por `matlab -batch` e confira se os gráficos e PDFs continuam sendo produzidos corretamente.
- Ao concluir, relate resumidamente o que foi reorganizado, o que foi reaproveitado e quais duplicações foram eliminadas.

## Contexto científico e relatórios

O projeto estuda vibrações ferroviárias por meio de massa, rigidez, amortecimento, receptâncias dinâmicas, interação veículo–via, propagação no terreno, lajes flutuantes e resposta de edificações. Priorize testes OFAT (um parâmetro variado por vez, demais constantes), com configurações de referência e comparações reproduzíveis.

Os gráficos devem ter fundo branco, contraste legível, unidades explícitas, legenda sem sobreposição, identificação dos parâmetros e frequências de pico quando aplicável. Os relatórios PDF devem explicar cada diferença matematicamente e fisicamente, registrar hipóteses e limitações e relacionar os modelos à tese de Carla Patrícia Filipe da Costa e Lopes **somente quando houver correspondência documental verificada**. Não apresente modelos didáticos como equivalências exatas a modelos 2.5D ou subestruturados.

Use o template e o brasão em `src/relatorio_tecnico_ufc/` para a publicação visual. Os relatórios oficiais e gráficos ficam nas pastas `ufc/` de `resultados/`.

## Entrega

Crie efetivamente `AGENTS.md`, apresente seu conteúdo e descreva quais comandos Batch foram executados com sucesso ou não puderam ser executados. Não declare validação sem evidência.
