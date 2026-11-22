# PROMPT — LABORATÓRIO MATLAB DE DINÂMICA FERROVIÁRIA COM ANÁLISE PARAMÉTRICA E RELATÓRIOS PDF

## 1. Objetivo geral

Desenvolva um ambiente didático e científico no MATLAB para investigar os principais fenômenos relacionados à geração, transmissão, propagação e recepção de vibrações ferroviárias.

O objetivo principal NÃO é simplesmente produzir gráficos. É permitir que o estudante compreenda matematicamente e fisicamente por que os resultados mudam quando um parâmetro é modificado.

Utilize como referência metodológica a tese de Carla Patrícia Filipe da Costa e Lopes, *Vibrações induzidas por tráfego ferroviário em túneis*, especialmente os capítulos 3, 4, 5 e 6.

Use o template `src/relatorio_tecnico_ufc/main.tex` e o brasão `src/relatorio_tecnico_ufc/ufc.png` na publicação dos relatórios UFC.

O sistema deve ser implementado em MATLAB, com gráficos explicativos, análises comparativas e exportação automática de relatórios em PDF.

## 2. Princípio fundamental dos experimentos

O sistema deve permitir uma análise paramétrica controlada.

Em cada comparação, modifique somente UMA variável, mantendo todas as demais constantes.

Exemplo:

**Experimento: influência da massa**

| Configuração | Massa    | Rigidez   | Amortecimento |
| ------------ | -------- | --------- | ------------- |
| Referência   | 450 kg   | 2×10⁷ N/m | 20.000 N·s/m  |
| Teste A      | 1.000 kg | 2×10⁷ N/m | 20.000 N·s/m  |
| Teste B      | 2.000 kg | 2×10⁷ N/m | 20.000 N·s/m  |

O programa deve:

1. Calcular as respostas dos três casos.
2. Mostrar as curvas simultaneamente.
3. Identificar visualmente cada configuração.
4. Determinar as frequências naturais, frequências dos picos e respectivas amplitudes.
5. Calcular as diferenças absolutas e percentuais em relação à referência.
6. Explicar matematicamente por que ocorreram as diferenças.
7. Explicar o significado físico dos resultados.
8. Identificar possíveis implicações para sistemas ferroviários.
9. Relacionar o experimento a uma equação ou formulação efetivamente utilizada por Patrícia Lopes.
10. Exportar os dados, gráficos, cálculos e explicações para PDF.

Além da análise OFAT, permitir opcionalmente uma análise de dois fatores, como massa × rigidez, sem confundir os resultados com os testes de uma variável por vez.

## 3. Experimentos necessários

### Experimento 1 — Força, rigidez e deslocamento

Estudar a relação entre a força aplicada e a deformação de um sistema elástico.

Equação:

[
P=ku
]

Realizar comparações modificando:

- Rigidez, mantendo a força constante.
- Força, mantendo a rigidez constante.

Mostrar:

- Gráfico força × deslocamento.
- Tabela de valores.
- Explicação da influência da rigidez.
- Diferença entre rigidez e flexibilidade.

Relacionar conceitualmente esse experimento à caracterização da flexibilidade dinâmica da via utilizada na tese.

Esclarecer que a relação estática (P=ku) é uma simplificação didática, não a formulação completa da via ferroviária utilizada pela autora.

### Experimento 2 — Massa, rigidez, amortecimento e ressonância

Representar um sistema massa–mola–amortecedor.

Equação:

[
m\ddot{u}+c\dot{u}+ku=P(t)
]

Receptância dinâmica:

[
A(\omega)=\frac{1}{k-m\omega^2+i c\omega}
]

Frequência natural não amortecida:

[
f_n=\frac{1}{2\pi}\sqrt{\frac{k}{m}}
]

Realizar três análises independentes:

**Teste 2A — Variação da massa**

Modificar somente a massa.

Explicar como a massa influencia a frequência natural, a frequência de ressonância e a amplitude da receptância.

**Teste 2B — Variação da rigidez**

Modificar somente a rigidez.

Explicar por que a frequência natural aumenta com a rigidez e como isso altera a resposta vibratória.

**Teste 2C — Variação do amortecimento**

Modificar somente o amortecimento.

Explicar como o amortecimento altera a amplitude do pico, sua largura e a dissipação de energia.

Para cada teste, apresentar gráficos comparativos e resultados numéricos.

Distinguir frequência natural não amortecida, frequência natural amortecida e frequência de máximo da receptância.

Explicar que não são necessariamente iguais.

### Experimento 3 — Interação dinâmica veículo–via

Construir um modelo simplificado que permita compreender como a flexibilidade dinâmica do trem e a flexibilidade da via influenciam a força roda–trilho.

Utilizar como referência a equação (5.4) da tese:

[
{N(\Omega)}=
-\left([F]+[F^H]+[A]\right)^{-1}{\Delta u(\Omega)}
]

Explicar cada matriz e vetor.

Realizar comparações variando individualmente:

- Massa equivalente do veículo.
- Rigidez da suspensão.
- Amortecimento da suspensão.
- Rigidez da via.
- Amplitude das irregularidades.
- Velocidade do trem.
- Espaçamento entre eixos.

Mostrar a influência dessas alterações nas forças dinâmicas de contato.

Quando for utilizado um modelo reduzido, declarar explicitamente quais mecanismos físicos foram desprezados.

Não apresentar uma aproximação escalar como equivalente exata da equação matricial da tese.

### Experimento 4 — Propagação das vibrações no terreno

Estudar como a força aplicada ao trilho produz vibrações em pontos afastados da fonte.

Utilizar inicialmente uma função de transferência simplificada:

[
u_g(\omega)=H_g(\omega)N(\omega)
]

Comparar individualmente:

- Distância entre fonte e receptor.
- Atenuação do meio.
- Frequência de excitação.
- Amplitude da força aplicada.

Mostrar gráficos de amplitude em função da distância e da frequência.

Explicar as diferenças entre:

- Atenuação geométrica.
- Amortecimento material.
- Amplificação dinâmica.
- Alterações no conteúdo espectral.

Relacionar o experimento ao modelo 2.5D MEF-PML desenvolvido no capítulo 3 da tese.

Não afirmar que uma função exponencial simplificada reproduz integralmente a propagação tridimensional das ondas no terreno.

### Experimento 5 — Laje flutuante e interação solo–estrutura

Este experimento deve receber atenção especial, pois é central para o estudo de mitigação de vibrações ferroviárias.

Modelar inicialmente uma massa apoiada sobre elementos resilientes.

Utilizar:

[
f_n=\frac{1}{2\pi}\sqrt{\frac{k}{m}}
]

Estudar separadamente:

**Teste 5A — Massa da laje flutuante**

Variar a massa e manter a rigidez e o amortecimento constantes.

**Teste 5B — Rigidez da manta resiliente**

Variar a rigidez e manter a massa e o amortecimento constantes.

**Teste 5C — Amortecimento da manta**

Variar o amortecimento e manter massa e rigidez constantes.

**Teste 5D — Transmissibilidade**

Calcular a razão entre a amplitude da força transmitida e a amplitude da força aplicada, para um modelo com base rígida, deixando explícitas essas hipóteses.

**Teste 5E — Resposta do edifício**

Utilizar um modelo reduzido de interação solo–estrutura para verificar como as propriedades dinâmicas da estrutura alteram sua resposta.

Apresentar três gráficos fundamentais:

1. Deslocamento da laje em função da frequência.
2. Força transmitida ao apoio em função da frequência.
3. Transmissibilidade em função da frequência.

Identificar regiões de amplificação, ressonância e isolamento.

Relacionar os resultados às seções 4.10.2, 4.10.4 e 6.3 da tese.

Explicar que a redução da vibração na laje não implica necessariamente redução proporcional da força transmitida ao terreno.

## 4. Requisitos dos gráficos MATLAB

Todos os gráficos devem possuir excelente legibilidade.

Adotar preferencialmente:

- Fundo branco.
- Títulos em preto, tamanho 18–20 pt.
- Rótulos dos eixos em 15–17 pt.
- Legendas em 13–15 pt.
- Linhas com espessura mínima de 2 pt.
- Cores contrastantes e distinguíveis.
- Grade discreta.
- Unidades físicas explícitas.
- Legendas posicionadas sem encobrir os dados.
- Títulos curtos e completos.
- Exportação vetorial, quando possível.

Nunca colocar textos brancos sobre fundos brancos.

Evitar sobreposição de anotações, legendas, títulos e curvas.

Os gráficos devem manter a mesma identidade visual em todos os experimentos.

Quando houver ressonância, destacar visualmente sua frequência e amplitude.

Os gráficos devem ser exportados preferencialmente em PDF vetorial ou em imagens de alta resolução, quando o formato vetorial não for adequado.

## 5. Explicação obrigatória de cada gráfico

Cada gráfico deve ser acompanhado de uma análise estruturada.

**A. O que foi simulado?**

Explicar o fenômeno físico e a finalidade do experimento.

**B. O que foi modificado?**

Identificar o parâmetro alterado, incluindo valores e unidades.

**C. O que permaneceu constante?**

Apresentar todos os parâmetros controlados, para evitar interpretações equivocadas.

**D. Qual equação foi utilizada?**

Apresentar a equação efetivamente implementada.

Explicar os símbolos, as unidades e as hipóteses.

**E. O que aconteceu no gráfico?**

Descrever objetivamente como as curvas mudaram.

Informar valores e diferenças percentuais.

**F. Por que isso aconteceu?**

Fornecer uma explicação matemática, seguida da explicação física.

Por exemplo:

Quando a massa aumenta e a rigidez permanece constante, a frequência natural não amortecida diminui, pois é proporcional ao inverso da raiz quadrada da massa.

**G. O que isso significa para uma ferrovia?**

Relacionar o resultado ao comportamento do veículo, da via, da laje flutuante, do solo ou da edificação.

Evitar extrapolações não sustentadas pelo modelo.

**H. Relação com Patrícia Lopes**

Criar sempre um quadro com:

- Formulação ou equação correspondente da tese.
- Número da equação e seção, quando verificados.
- Significado dos termos.
- Semelhanças entre o experimento e a formulação da autora.
- Simplificações introduzidas.
- Diferenças entre o modelo didático e o modelo original.

Se não existir uma equação diretamente correspondente, indicar:

"Não foi identificada equivalência matemática direta; a relação apresentada é conceitual."

Nunca inventar números de equações ou resultados atribuídos à tese.

**I. Conclusão do teste**

Escrever uma conclusão curta que responda:

- Qual parâmetro teve influência?
- Em qual grandeza?
- Em qual direção?
- Sob quais condições?

## 6. Estrutura dos relatórios PDF

Use como referência visual o template em `src/relatorio_tecnico_ufc/main.tex`.

Reproduzir sua organização acadêmica e identidade visual, adaptando-as à nova finalidade.

O relatório deverá conter:

**Cabeçalho institucional**

UNIVERSIDADE FEDERAL DO CEARÁ

RELATÓRIO DE SIMULAÇÃO

Análise paramétrica de vibrações ferroviárias

Incluir data, identificação do experimento e configuração analisada.

Caso exista um logotipo institucional autorizado e disponível, utilizá-lo. Não inventar ou redesenhar marcas institucionais.

**Seção 1 — Objetivo do experimento**

Apresentar o fenômeno estudado e a pergunta que a simulação procura responder.

**Seção 2 — Modelo matemático**

Apresentar as equações, variáveis e hipóteses.

**Seção 3 — Dados de entrada**

Apresentar tabela com unidades e valores.

Destacar o parâmetro alterado e os parâmetros constantes.

**Seção 4 — Configurações comparadas**

Apresentar o caso de referência e os casos alternativos.

**Seção 5 — Resultados numéricos**

Apresentar frequências, amplitudes, forças, deslocamentos ou outras grandezas relevantes.

Incluir diferenças absolutas e percentuais.

**Seção 6 — Gráficos comparativos**

Inserir os gráficos exportados pelo MATLAB, em boa resolução, sem alterar sua escala física.

Cada gráfico deve ter legenda e identificação.

**Seção 7 — Interpretação matemática e física**

Explicar por que os resultados mudaram.

Distinguir resultados calculados de interpretações e hipóteses.

**Seção 8 — Relação com a tese de Patrícia Lopes**

Apresentar a equação da tese da Patricia Lopes, quando houver, e explicar a relação entre o experimento e a metodologia da tese.

**Seção 9 — Limitações**

Informar simplificações, hipóteses e informações não disponíveis.

**Seção 10 — Conclusões**

Sintetizar os principais efeitos observados.

**Seção 11 — Referências**

Incluir somente as fontes efetivamente utilizadas.

## 7. Identidade visual do PDF

Seguir as características gerais do relatório fornecido:

- Formato A4, orientação vertical.
- Cabeçalho institucional consistente.
- Títulos e subtítulos hierarquizados.
- Tabelas alinhadas, com espaçamento adequado.
- Separadores discretos.
- Fundo branco.
- Gráficos com boa legibilidade.
- Rodapé com identificação do experimento e número da página.
- Cores institucionais discretas, preservando a clareza dos dados.

Não copiar automaticamente os resultados numéricos do PDF de referência, pois pertencem a outra simulação.

Não misturar níveis de vibração em dB com receptâncias em mm/kN ou forças em N sem uma conversão física e matemática válida.

O PDF deve possuir texto selecionável, equações legíveis e gráficos nítidos.

Verificar visualmente todas as páginas após a exportação.

## 8. Comparação entre experimentos

Além de relatórios individuais, criar um relatório consolidado.

O relatório deverá mostrar:

- Efeito da massa sobre a frequência e a receptância.
- Efeito da rigidez sobre a frequência e a receptância.
- Efeito do amortecimento sobre a amplitude e a largura da ressonância.
- Efeito das irregularidades sobre as forças roda–trilho.
- Efeito da distância sobre a propagação.
- Efeito das propriedades da laje flutuante sobre a transmissibilidade.
- Efeito da resposta estrutural sobre as vibrações no receptor.

As comparações devem utilizar grandezas compatíveis e condições de referência claramente identificadas.

Não comparar diretamente amplitudes de receptância com forças ou níveis em dB como se fossem a mesma grandeza.

## 9. Requisitos da implementação MATLAB

Organizar o código em funções ou módulos reutilizáveis.

Separar:

1. Definição dos parâmetros.
2. Cálculo dos modelos físicos.
3. Execução dos testes paramétricos.
4. Identificação dos resultados.
5. Geração dos gráficos.
6. Produção das explicações.
7. Exportação para PDF.

Permitir a alteração dos parâmetros a partir de uma área central de configuração.

Executar os testes sem exigir que o usuário edite várias partes do código.

Identificar unidades, testar a consistência dimensional e evitar variáveis sem definição.

Os cálculos de frequência natural, ressonância e transmissibilidade devem ser consistentes com as hipóteses dos modelos utilizados.

Quando o modelo exigir números complexos, preservar amplitude e fase. Não substituir automaticamente operações complexas por operações entre magnitudes.

Salvar os resultados numéricos em arquivos organizados para permitir reprodução e comparação futura.

## 10. Resultado esperado

Entregar:

1. Código MATLAB completo e executável.
2. Cinco experimentos paramétricos guiados.
3. Gráficos comparativos claros.
4. Tabelas com valores e diferenças percentuais.
5. Explicações matemáticas e físicas dos resultados.
6. Referências verificadas às formulações de Patrícia Lopes.
7. Relatórios individuais em PDF.
8. Um relatório consolidado em PDF.
9. Uma breve orientação para executar e interpretar cada teste.

O objetivo final é permitir que um estudante com conhecimentos básicos de matemática consiga compreender progressivamente os mecanismos de vibração ferroviária, sem perder o rigor necessário para avançar posteriormente para os modelos subestruturados e 2.5D apresentados na tese.

**Prioridade absoluta:** os gráficos devem mostrar claramente o que mudou, por que mudou e quais consequências físicas podem ser inferidas. Não apresentar uma conclusão sem relacioná-la às equações e hipóteses utilizadas.
