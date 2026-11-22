Faculdade de Engenharia da Universidade do Porto Doutoramento em Engenharia Civil

Carla Patrícia Filipe da Costa e Lopes

# VIBRAÇÕES INDUZIDAS POR TRÁFEGO FERROVIÁRIO EM TÚNEIS 

Dissertação apresentada na Faculdade de Engenharia da Universidade do Porto para obtenção do grau de Doutor em Engenharia Civil.
Orientadores: Rui Calçada (Professor Catedrático); António Silva Cardoso (Professor Catedrático); Pedro Alves Costa (Professor Auxiliar).

Ao Pedro, à nossa filha Rita e aos meus pais

## RESUMO

O estudo de vibrações induzidas por tráfego ferroviário em túneis é o objeto desta tese. O trabalho desenvolve, implementa e valida experimentalmente modelos de previsão que simulam a geração de vibrações pela interação veículo-via, sua propagação pelo sistema túnel-maciço geotécnico e, por fim, sua interação com as estruturas próximas.

Após a contextualização do tema e uma breve apresentação dos aspectos básicos do problema, apresenta-se um modelo baseado no método dos elementos finitos combinado com o método das camadas de absorção perfeita, ambos formulados segundo o conceito 2.5D. O modelo foi desenvolvido especificamente para simular a propagação de vibrações em meios semi-infinitos. A versatilidade do método dos elementos finitos torna o modelo especialmente adequado à simulação tridimensional da propagação de ondas elásticas no sistema túnel-maciço. A eficiência da formulação matemática decorre do desenvolvimento das equações de equilíbrio no domínio número de onda--frequência, característico da formulação 2.5D.

Para alcançar elevada eficiência computacional e permitir uma interpretação cuidadosa dos fenômenos estudados, o modelo global emprega técnicas de subestruturação e acopla módulos adaptados aos diferentes aspectos do problema. Um módulo computacional independente representa a interação veículo-via, permitindo modelar a estrutura do trem e calcular as forças dinâmicas de interação induzidas por irregularidades geométricas verticais da via. Outro módulo considera a interação dinâmica solo-estrutura sob a excitação causada pelo tráfego ferroviário no túnel. Nesse módulo, são apresentadas e analisadas diferentes técnicas de acoplamento entre a estrutura e o maciço de fundação.

São apresentados estudos paramétricos para identificar os fatores que condicionam a resposta do sistema via-túnel-maciço. Em uma abordagem mais abrangente, um estudo integrado analisa a influência da rigidez do maciço geotécnico nos diferentes aspectos do problema, desde a geração das vibrações até sua recepção no interior dos edifícios. Esse estudo também avalia a eficiência e a eficácia de soluções de laje flutuante na mitigação das vibrações, tanto no sistema via-túnel-maciço quanto nas edificações próximas.

O modelo proposto também é validado experimentalmente por meio de um estudo de caso em um trecho de via férrea subterrânea de uma linha suburbana da rede ferroviária de Madrid. As escolhas adotadas na análise são apresentadas e discutidas, e os resultados numéricos são comparados aos experimentais. Essa comparação permite
atestar a adequação e a confiabilidade do modelo proposto para prever vibrações no interior de edifícios causadas pelo tráfego ferroviário em túneis.

Por fim, sintetizam-se as principais conclusões dos estudos realizados e apresen-tam-se perspectivas de pesquisa futura sobre o tema da tese.


#### Abstract

This thesis investigates vibrations induced by railway traffic in tunnels. It presents the development, implementation and experimental validation of prediction models that simulate vibration generation through dynamic train-track interaction, propagation through the tunnel-ground system, and interaction with buildings near the railway infrastructure.

After introducing the topic and its fundamental aspects, the thesis presents a numerical model developed to simulate vibration propagation in unbounded domains. The model couples the finite element method with the perfectly matched layer technique, both formulated in the 2.5D domain. The flexibility of the finite element approach enables the simulation of three-dimensional wave propagation through the tunnel-ground system. Computational efficiency is achieved by formulating the dynamic equilibrium equations in the wavenumber-frequency domain, as required by the 2.5D approach.

The overall model uses a substructuring approach to achieve computationally efficient simulations and a detailed understanding of the physical mechanisms involved. Separate models use the techniques most suitable for each domain and are then coupled. Dynamic train-track interaction is simulated by a dedicated model that accounts for the train's structural behaviour and the interaction caused by track unevenness. A second model describes soil-structure interaction under dynamic excitation from railway traffic in the tunnel. Techniques with different degrees of accuracy and complexity are presented and analysed.

Parametric studies identify the factors that most strongly influence the dynamic response of the track-tunnel-ground system. An integrated study examines the influence of ground stiffness on vibration generation and on vibration levels inside buildings. It also evaluates the effectiveness of floating slab track systems in mitigating vibrations, considering their effects on generation, propagation and reception.

The proposed model is experimentally validated using a section of an underground railway line in Madrid. The numerical modelling choices are presented and discussed, and measured and computed results are compared. Their agreement supports the suitability and reliability of the proposed model for predicting vibrations inside buildings caused by underground railway traffic.

Finally, the thesis presents its main conclusions and identifies topics for further research.


## AGRADECIMENTOS

Concluído este trabalho, a autora gostaria de expressar um sincero e profundo agradecimento a todas as pessoas e instituições que, de diferentes formas, contribuíram para sua realização. Pela relevância de suas contribuições, são apresentados os seguintes agradecimentos:

- Aos orientadores científicos, Professores Doutores Rui Calçada, António Silva Cardoso e Pedro Alves Costa, pelo apoio, interesse e dedicação demonstrados ao longo deste trabalho e, principalmente, pela amizade e disponibilidade em todos os momentos;
- Ao Professor Doutor Miguel Ferraz, pelo apoio e disponibilidade na elaboração dos modelos estruturais dos edifícios;
- Ao Professor Doutor Raimundo Delgado, pelo apoio e pragmatismo na resolução de diversas questões burocráticas no âmbito do PRODEC;
- Ao Instituto Politécnico do Porto (IPP), pelo apoio concedido por meio da dispensa das atividades de ensino durante o último ano de desenvolvimento do trabalho;
- Ao Instituto Superior de Engenharia do Porto (ISEP), pelo apoio institucional e pela criação de condições para a realização desta tese. Agradece-se também ao seu Presidente, Professor Doutor João Rocha, pela compreensão, disponibilidade e atenção dedicadas à criação de condições para que este trabalho pudesse ser realizado com serenidade;
- Ao Diretor do Departamento de Engenharia Civil do ISEP, Professor Rui Gomes dos Santos, por todo o apoio e pragmatismo nas iniciativas para criar condições que permitissem a realização do trabalho;
- Ao Professor Doutor Jesús Fernández Ruiz, da Universidade da Corunha, pela disponibilização dos dados experimentais que permitiram a validação experimental dos modelos desenvolvidos;
- À Metro do Porto, pela colaboração nos trabalhos experimentais que, embora não estejam apresentados nesta tese, contribuíram muito para uma compreensão mais profunda do tema;
- À Fundação para a Ciência e Tecnologia, pela Bolsa de Doutoramento concedida (SFRH/BD/69290/2010);
- Ao colega Aires Colaço, por todo o apoio e boa vontade na realização de trabalhos no campo experimental do Pólo Universitário;
- A todos os colegas e amigos que, com gestos de amizade e apoio, contribuíram para tornar o trabalho menos árduo, em particular ao Professor António Pestana, ao Tiago Domingues, ao Cândido Freitas, à Elza Mendes e à Ana Magalhães.

Por fim, a autora não poderia deixar de expressar profunda gratidão, estima e admiração a seus pais e irmãos e, de modo especial, ao Pedro e à nossa filha Rita, pelo apoio, incentivo e compreensão que sempre encontrou neles ao longo deste trabalho.

## ÍNDICE

1 Introdução ..... 1
1.1 Enquadramento do tema ..... 1
1.2 Motivação ..... 3
1.3 Objetivos e principais contribuições ..... 4
1.4 Organização da tese ..... 6
2 Vibrações induzidas por tráfego ferroviário em túneis: fenomenologia básica ..... 9
2.1 Contextualização e impacto ambiental das vibrações ..... 9
2.2 Modelos de previsão ..... 13
2.2.1 Generalidades ..... 13
2.2.2 Mecanismos de excitação e interação veículo-via ..... 16
2.2.3 Propagação de ondas elásticas e interação dinâmica do sistema via- -túnel-maciço ..... 19
2.2.4 Interação dinâmica maciço-edificação ..... 28
2.2.5 Ruído re-radiado em edifícios ..... 29
2.3 Efeitos das vibrações. Breve referência a normas ..... 30
2.3.1 Generalidades ..... 30
2.3.2 Efeito das vibrações sobre os ocupantes dos edifícios ..... 30
2.3.3 Efeito das vibrações em equipamentos sensíveis ..... 33
2.3.4 Dano em edificações devido a vibrações induzidas por tráfego ..... 37
2.4 Medidas de mitigação ..... 39
2.4.1 Generalidades ..... 39
2.4.2 Medidas de mitigação na fonte ..... 39
2.4.3 Medidas de mitigação no trajeto de propagação ..... 43
2.4.4 Medidas de mitigação nos edifícios ..... 47
2.5 Considerações finais ..... 49
3 Modelagem da resposta dinâmica do sistema via-túnel-maciço ..... 51
3.1 Contextualização ..... 51
3.2 Modelo numérico 2.5D MEF-PML: conceitos e formulação ..... 56
3.2.1 Generalidades. O conceito PML ..... 56
3.2.2 Formulação geral do MEF 2.5D ..... 59
3.2.3 Tratamento de fronteiras através da técnica PML - 2.5D ..... 65
3.3 Simulação de elementos particulares no contexto ferroviário ..... 69
3.3.1 Generalidades ..... 69
3.3.2 Breve apresentação de tipologias de via férrea usadas em túneis ..... 70
3.3.3 Modelagem do sistema de via férrea ..... 71
3.4 Generalização do modelo para carregamentos móveis ..... 73
3.5 Validação teórica ..... 75
3.5.1 Considerações iniciais ..... 75
3.5.2 Propagação unidirecional de ondas - problema 1 D ..... 75
3.5.3 Resposta de um meio indefinido - modelagem 2.5D e 2D ..... 78
3.5.4 Simulação quase tridimensional do sistema túnel-maciço geotécnico ..... 83
3.6 Considerações finais ..... 97
4 Propagação de vibrações no sistema túnel-maciço: estudo paramétrico ..... 99
4.1 Considerações iniciais ..... 99
4.2 Descrição do cenário de referência ..... 100
4.3 Influência da cavidade e do túnel na resposta dinâmica do maciço ..... 102
4.4 Influência da profundidade do túnel ..... 109
4.5 Influência da espessura do revestimento do túnel ..... 115
4.6 Influência da geometria do túnel ..... 120
4.7 Influência do invert ..... 127
4.8 Influência da rigidez do solo ..... 134
4.9 Influência do amortecimento material do solo ..... 138
4.10 Influência das propriedades da via férrea ..... 144
4.10.1 Considerações iniciais ..... 144
4.10.2 A influência da rigidez da manta resiliente ..... 145
4.10.3 A influência do amortecimento da manta resiliente ..... 154
4.10.4 Breve nota sobre a influência da massa da laje ..... 157
4.10.5 Breve nota sobre a influência das propriedades das palmilhas ..... 158
4.11 Conclusões ..... 159
5 Modelagem da interação veículo-via e maciço-edificação ..... 163
5.1 Considerações gerais ..... 163
5.2 Estratégia de modelagem: modelo global subestruturado ..... 166
5.3 Interação trem-via ..... 167
5.3.1 Mecanismos de excitação ..... 167
5.3.2 Modelagem da interação dinâmica veículo-via ..... 170
5.3.3 Resposta dinâmica em um ponto genérico do domínio ..... 180
5.4 Interação solo-estrutura adjacente ..... 181
5.4.1 Considerações gerais ..... 181
5.4.2 Formulação do modelo ..... 183
5.4.3 Validação do modelo ..... 185
5.4.4 Generalização do modelo ..... 189
5.4.5 Metodologias para avaliação da impedância da fundação ..... 190
5.5 Exemplo de aplicação ..... 205
5.5.1 Descrição geral ..... 205
5.5.2 Resposta dinâmica da via férrea ..... 208
5.5.3 Resposta dinâmica do campo livre induzida pela passagem do trem ..... 209
5.5.4 Resposta dinâmica do edifício ..... 211
5.5.5 Breves conclusões ..... 215
5.6 Considerações finais ..... 215
6 Estudo numérico integrado: desde a fonte até o receptor ..... 217
6.1 Considerações iniciais ..... 217
6.2 Caso de estudo base ..... 219
6.2.1 Descrição do cenário de referência ..... 219
6.2.2 Resposta dinâmica da via férrea ..... 224
6.2.3 Resposta dinâmica do campo livre induzida pela passagem do trem ..... 226
6.2.4 Resposta dinâmica do edifício ..... 228
6.3 Influência da rigidez da manta resiliente ..... 242
6.3.1 Descrição geral ..... 242
6.3.2 Resposta dinâmica da via férrea ..... 244
6.3.3 Resposta dinâmica do campo livre induzida pela passagem do trem ..... 248
6.3.4 Resposta dinâmica do edifício devido ao tráfego ferroviário no túnel ..... 250
6.4 Influência da rigidez do solo ..... 259
6.4.1 Descrição geral ..... 259
6.4.2 Resposta dinâmica da via férrea ..... 260
6.4.3 Resposta dinâmica do campo livre induzida pela passagem do trem ..... 261
6.4.4 Resposta dinâmica do edifício ao tráfego subterrâneo ..... 264
6.4.5 Relevância da análise da interação solo-estrutura e abordagens alternativas ..... 267
6.5 Considerações finais e conclusões ..... 269
7 Validação experimental: túnel ferroviário em Madrid ..... 275
7.1 Preâmbulo ..... 275
7.2 Descrição geral do caso de estudo ..... 276
7.2.1 Localização e aspectos gerais ..... 276
7.2.2 Descrição do túnel e infraestrutura ferroviária ..... 277
7.2.3 Descrição do cenário geotécnico ..... 280
7.2.4 Breve descrição do edifício sobre o túnel ..... 281
7.2.5 Material rodante utilizado nos testes realizados pelo CEDEX ..... 282
7.2.6 Breve nota sobre a campanha de monitoramento realizada pelo CEDEX ..... 283
7.3 Modelagem numérica ..... 285
7.3.1 Descrição geral do modelo ..... 285
7.3.2 Reflexão sobre as hipóteses consideradas ..... 288
7.4 Validação experimental ..... 293
7.4.1 Resposta da via férrea ..... 293
7.4.2 Resposta do edifício ..... 296
7.4.3 Reflexão sobre os resultados alcançados ..... 300
7.5 Proposta de medidas de mitigação ..... 300
7.5.1 Considerações gerais ..... 300
7.5.2 Melhoria da qualidade geométrica da via férrea ..... 300
7.5.3 Introdução de um sistema de laje flutuante ..... 303
7.6 Considerações finais ..... 306
8 Conclusões e propostas de desenvolvimentos futuros ..... 307
8.1 Conclusões ..... 307
8.2 Propostas para pesquisa futura ..... 310
BIBLIOGRAFIA ..... 313

## 1 Introdução

### 1.1 Enquadramento do tema

O sistema de transportes é um dos vetores estratégicos para o desenvolvimento das cidades modernas, devendo, por isso, atender a requisitos diversos e complexos, entre os quais a sustentabilidade ambiental. Esse aspecto é fundamental, sobretudo porque, segundo a ONU, estima-se que em 2050 cerca de 66\% da população mundial viva em cidades e centros metropolitanos [1].

O transporte ferroviário e o metrô pertencem à categoria dos sistemas de transporte de massa, pois permitem transportar um grande número de pessoas em uma única viagem. Quando subterrâneos, constituem um dos modos mais eficientes de transporte em áreas densamente povoadas, dada a sua capacidade para transportar muitos passageiros de forma fácil e rápida, reduzindo, muitas vezes, o tempo de deslocamento em comparação com outros meios de transporte, como o rodoviário. Contudo, embora os benefícios (de natureza econômica e social) inerentes ao transporte ferroviário sejam evidentes, a sua implementação e o seu funcionamento suscitam preocupações de caráter ambiental, motivadas pela geração e propagação de vibrações e seus reflexos no conforto e na qualidade de vida dos habitantes nas imediações da infraestrutura.

A relevância dos problemas ambientais relacionados com as vibrações induzidas pelo tráfego ferroviário e metroviário aumentou significativamente nos últimos anos, constituindo atualmente uma grande preocupação em meios urbanos. O efeito das vibrações nos ocupantes de edifícios situados nas imediações das infraestruturas ferroviárias é considerado atualmente, segundo alguns organismos, um dos sete principais problemas ambientais das sociedades modernas [2]. A perturbação e o incômodo originados por essas vibrações em zonas habitacionais, de serviços/escritórios ou industriais têm sido motivo para muitas queixas em áreas densamente povoadas. De fato, trata-se não apenas de incômodo para os habitantes, mas também da ocorrência de problemas graves de saúde, como distúrbios cardíacos e do sono [3], [4], [5]. Um levantamento estatístico realizado no Japão aponta que cerca de 14\% das queixas de interesse público relativas a vibrações e ruído re-radiado se devem a sistemas de transportes urbanos [2].

As vibrações geradas pelo tráfego propagam-se pelo maciço envolvente, atingem as edificações existentes nas proximidades e provocam: i) desconforto nos ocupantes, podendo afetar a sua capacidade de concentração ou, no limite, provocar distúrbios de saúde; ii) mau funcionamento de equipamentos sensíveis como, por exemplo,
equipamentos eletrônicos; iii) ou mesmo danos com diferentes graus de gravidade nos edifícios. Embora, em geral, essas vibrações não estejam associadas a danos estruturais nas construções vizinhas da infraestrutura, o seu impacto ambiental tem originado sérias preocupações em zonas urbanas com maior densidade populacional.

A expansão das infraestruturas de transporte por ferrovia em áreas urbanas, ocorrida nos últimos anos para satisfazer as necessidades crescentes das populações, assim como o aumento significativo das exigências sociais e ambientais, tanto nos requisitos de conforto dos habitantes quanto no funcionamento de equipamentos sensíveis, têm contribuído muito para a crescente importância dessa temática.

O elevado preço dos combustíveis, o congestionamento de tráfego urbano, o aumento da poluição ambiental e o crescimento exponencial da população urbana são alguns dos fatores que estão na origem de uma crescente demanda por transporte público e da consequente necessidade de construir novas redes ferroviárias e de metrô no interior das cidades, de modo a disponibilizar um sistema de transportes integrado e eficaz.

A densificação da rede de infraestruturas de transporte ferroviário, superficial e sobretudo subterrâneo, torna inevitável sua proximidade com as edificações existentes, dadas as limitações de espaço, especialmente em zonas mais densamente urbanizadas, o que torna cada vez mais comuns os problemas ambientais decorrentes dessa proximidade.

Nesse contexto, cabe destacar que os problemas ambientais causados pelas vibrações induzidas por tráfego ferroviário são especialmente relevantes no caso de tráfego em túneis inseridos na malha urbana, dado que a proximidade da infraestrutura com as fundações dos edifícios, sobretudo no caso de túneis mais superficiais, conduz a um agravamento do problema de vibração estrutural e, portanto, das suas consequências, em edifícios com os mais diversos usos: habitacional, de serviços, de lazer ou de indústria tecnológica, em que à perturbação e ao incômodo provocados nos ocupantes se aliam as elevadas exigências funcionais quanto à ocorrência de vibrações. A modelagem numérica eficiente e abrangente desse tipo de vibrações, desde a fonte (trem) até o receptor (edifício), é o foco do presente trabalho de pesquisa.

O problema da geração e propagação de vibrações devido ao tráfego ferroviário em túneis compreende, de forma genérica e muito sucinta, as seguintes etapas: o movimento do trem ao longo da via constitui uma fonte de vibração; as vibrações geradas propagam-se pelo túnel e maciço envolvente; o campo de vibrações atinge os edifícios situados nas imediações da infraestrutura, induzindo vibrações e ruído
re-radiado com as consequências prejudiciais já referidas. A Figura 1.1 resume, de forma ilustrativa, o problema.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-017_1015_1759_298_153.jpg)
Figura 1.1: Geração e propagação de vibrações devido ao tráfego em túneis.

O aumento das preocupações acima apontadas tem levado a comunidade científica, ao longo da última década, a dedicar maior atenção à necessidade de realizar estudos sobre a geração e propagação deste tipo de vibrações com o objetivo de contribuir para uma melhor compreensão e posterior mitigação dos problemas enunciados. Nesse âmbito, destaca-se a necessidade de desenvolver modelos abrangentes que possibilitem a análise e previsão das vibrações induzidas pelo tráfego ferroviário no interior de edifícios existentes na vizinhança, possibilitando a avaliação do seu impacto e a identificação antecipada de problemas ambientais graves ou outras situações problemáticas e, assim, o estudo de soluções de mitigação adequadas.

### 1.2 Motivação

Diversos fatores motivaram a autora a estudar o tema da presente tese, sejam eles de caráter científico, institucional ou mesmo circunstancial.

Na seção anterior, foram apresentadas algumas das razões que justificam o crescente interesse científico e social pela avaliação e redução do impacto das vibrações induzidas pelo tráfego ferroviário subterrâneo, o que requer a realização de estudos complexos. Embora se tenham observado esforços e avanços científicos no desenvolvimento de ferramentas de previsão, especialmente de caráter mecanicista, adequadas
à problemática que se aborda na presente tese, persistem lacunas consideráveis que os modelos e estudos desenvolvidos na pesquisa aqui apresentada buscam ajudar a superar.

O desenvolvimento das metodologias de previsão agora apresentadas considerou duas necessidades fundamentais: i) a construção de um modelo global em que a geração, a propagação e a recepção de vibrações fossem consideradas de forma integrada; ii) o fato de o modelo global dever ser tão simples quanto possível para que pudesse ser transposto da academia para a engenharia prática, sem, contudo, negligenciar os aspectos cruciais do problema em estudo.

Os aspectos institucionais também reforçaram a motivação científica, destacando--se a existência de uma linha estratégica de pesquisa dedicada às infraestruturas ferroviárias na unidade de pesquisa em que a presente tese foi desenvolvida (CONS-TRUCT-FEUP). Com efeito, a existência de massa crítica, de pesquisadores com experiência, de um centro de competências específico - Centro de Saber da Ferrovia - e de parcerias com outras instituições acadêmicas de destaque internacional com objetivos científicos similares constituiu um importante fator de motivação.

Os fatores circunstanciais também foram relevantes. De fato, a necessidade de aumentar a sustentabilidade ambiental dos ambientes urbanos é um desafio com contornos complexos, evidenciado por diversos organismos internacionais tais como a União Europeia, a Organização das Nações Unidas ou a Organização Mundial de Saúde. Para atingir esse objetivo, espera-se, pelo menos no âmbito da União Europeia, a alocação de recursos significativos para o desenvolvimento e melhoria dos sistemas de transporte ferroviários, constituindo-se assim uma oportunidade para uma intensa colaboração entre os meios acadêmico e industrial, como exemplifica a iniciativa Shift2Rail promovida no âmbito do programa Horizon 2020. Assim, considerando o contexto europeu, bem como os interesses específicos da unidade de pesquisa em que a autora se insere, o desenvolvimento do presente estudo assume especial relevância, o que foi muito importante para a motivação da autora. Assim, pode-se afirmar que a presente tese se enquadra em uma estratégia coordenada para o desenvolvimento de competências nacionais no âmbito das infraestruturas de transporte ferroviário.

### 1.3 Objetivos e principais contribuições

É nesse contexto que se desenvolve o presente trabalho de pesquisa, o qual pretende contribuir para um melhor entendimento da problemática da geração, propagação e recepção em edifícios de vibrações induzidas por tráfego ferroviário em túneis, em uma perspectiva integrada e abrangente.

O trabalho apresentado nesta tese concentra-se no desenvolvimento, implementação e validação experimental de uma ferramenta numérica que permite uma simulação eficiente das vibrações induzidas pelo tráfego ferroviário em túneis, desde a fonte (trem) até o receptor (edifício), permitindo, assim, uma previsão precisa das vibrações no interior das edificações e a avaliação da eficiência de medidas de mitigação passíveis de serem aplicadas para minimizar o impacto ambiental dessas vibrações.

Assim, o procedimento numérico proposto compreende três partes distintas: i) a simulação do material rodante e da sua interação com a via férrea; ii) a simulação do sistema via-túnel-maciço; iii) a simulação da resposta do edifício, considerando a interação solo-estrutura. A solução global é obtida por meio de uma formulação de compatibilidade entre os três subsistemas. Desse modo, contempla-se não só a problemática da geração e propagação de vibrações induzidas pelo tráfego ferroviário no túnel, como também a resposta dinâmica de edificações próximas à infraestrutura ferroviária. Cabe observar que a integração do acoplamento edifício-maciço de fundação constitui um dos aspectos fundamentais para uma simulação precisa do problema global.

O uso da ferramenta desenvolvida na realização de um conjunto de estudos de sensibilidade e de avaliação da eficiência de algumas medidas de mitigação constitui um objetivo de grande interesse, pois permite extrair conclusões que podem ser facilmente aplicadas na prática da engenharia.

Não menos relevante é a validação experimental dos modelos desenvolvidos. Embora não sejam apresentados estudos experimentais conduzidos pela autora, tal objetivo não foi descartado, tendo sido perseguido através da utilização de dados experimentais reunidos por outros autores.

Considerando os objetivos apresentados, do trabalho que agora se apresenta resultam as seguintes contribuições principais:

- Desenvolvimento e implementação de um modelo 2.5D baseado no método dos elementos finitos, dotado de técnicas de tratamento de fronteiras artificiais que permitem a simulação de meios semi-infinitos com elevado rigor e eficiência computacional;
- Desenvolvimento e implementação de metodologias para a análise dos efeitos de interação solo-estrutura com diferentes graus de complexidade, desde o acoplamento 3D entre os métodos dos elementos finitos e dos elementos de contorno até a utilização de modelos de parâmetros condensados;

- Desenvolvimento de um modelo integrado para o estudo de vibrações induzidas por tráfego ferroviário em túneis, incluindo a problemática da geração devido à interação dinâmica veículo-via, da propagação pelo sistema túnel-maciço e da sua interação com edificações existentes na proximidade da infraestrutura ferroviária;
- Validação experimental do modelo de previsão global;
- Realização e análise de um amplo conjunto de estudos paramétricos para examinar a influência de diversos parâmetros intervenientes na resposta dinâmica do sistema trem-via-túnel-maciço de fundação-edifício.

### 1.4 Organização da tese

A presente tese está organizada em oito capítulos. Apresenta-se a seguir uma breve descrição de cada um desses capítulos.

No presente capítulo, o primeiro, procede-se a um enquadramento geral do tema e identificam-se os objetivos e as principais contribuições do trabalho desenvolvido.

No Capítulo 2, de caráter geral, apresentam-se os aspectos básicos associados à problemática das vibrações induzidas por tráfego ferroviário em túneis. Inicia-se com uma breve referência ao impacto ambiental deste tipo de vibrações, a que se segue uma descrição global dos principais mecanismos envolvidos, desde a geração de vibrações até sua percepção no interior de edifícios. Nesse contexto, é apresentada uma resenha das principais técnicas de modelagem existentes para a previsão de vibrações devidas ao tráfego ferroviário, evidenciando-se as principais contribuições de diversos autores até então. O capítulo prossegue com uma discussão sobre os efeitos das vibrações nos habitantes dos edifícios e em equipamentos sensíveis e sobre os danos causados nas edificações. São ainda abordadas algumas medidas de mitigação passíveis de serem aplicadas com o objetivo de minimizar as vibrações em edifícios devido ao tráfego ferroviário em túneis. Identificadas as principais carências e lacunas decorrentes de estudos anteriores, apresentam-se as perspectivas e as justificativas para os desenvolvimentos apresentados nos capítulos seguintes.

No Capítulo 3 são apresentados o desenvolvimento, a implementação e a validação teórica de um modelo numérico concebido para a simulação de problemas de interação túnel-maciço de fundação e de propagação de ondas pelo meio envolvente. O modelo baseia-se em uma formulação 2.5D aplicada ao método dos elementos finitos e ao método das camadas de absorção perfeita (2.5D MEF-PML). São apresentados neste capítulo os pressupostos inerentes à formulação do modelo, bem como a sua validação teórica. Após uma sucinta exposição do método dos elementos finitos 2.5D,
em que se destacam os aspectos particulares que devem ser considerados na simulação do sistema via-túnel-maciço, é apresentada a técnica 2.5D PML para o tratamento do problema associado às fronteiras artificiais provenientes da limitação geométrica do meio. Segue-se uma referência à simulação de elementos particulares no contexto ferroviário. O capítulo termina com um conjunto de estudos de validação teórica, em que os resultados previstos pelo modelo são comparados com soluções analíticas e/ ou com resultados obtidos com técnicas de modelagem alternativas.

O modelo apresentado no Capítulo 3 é utilizado no Capítulo 4, dedicado à apresentação de um amplo estudo paramétrico cujo objetivo é contribuir para um melhor entendimento fenomenológico e permitir a identificação dos fatores condicionantes da resposta do sistema via-túnel-maciço. No estudo paramétrico é avaliada a influência de diversos parâmetros relacionados com as características do túnel (geometria do túnel, espessura do revestimento, invert do túnel), do maciço (rigidez e amortecimento), do sistema túnel-maciço (profundidade do túnel) e da via férrea (propriedades mecânicas dos elementos resilientes) nas vibrações induzidas à superfície e no interior do maciço e em pontos localizados no túnel.

O Capítulo 5 retoma a formulação de modelos matemáticos, sendo apresentados os modelos adotados para a simulação do material rodante e sua interação com a via, bem como as metodologias propostas para a incorporação de edifícios tridimensionais com fundações superficiais no procedimento de análise. Especial atenção é dedicada ao último aspecto, dado que são desenvolvidos modelos desde o início para a interação solo-estrutura. São apresentados os principais pressupostos das metodologias numéricas adotadas, sendo sua apresentação acompanhada de alguns exemplos de aplicação visando, por um lado, a validação teórica dos modelos e, por outro, a análise fenomenológica dos mecanismos de interação entre os diferentes meios.

Como a disponibilidade de um modelo global para a previsão de vibrações induzidas por tráfego ferroviário em túneis constitui uma ferramenta poderosa para uma visão holística dos problemas visados na presente tese, o Capítulo 6 explora esse potencial, sendo apresentado um conjunto de estudos numéricos integrados em que o problema é abordado desde a fonte até o receptor. Levando em conta algumas das conclusões alcançadas nos estudos numéricos preliminares apresentados no Capítulo 4, os estudos integrados desenvolvidos no Capítulo 6 visam alcançar um melhor entendimento da influência da rigidez do maciço no problema e também avaliar a eficiência de sistemas de laje flutuante como técnicas mitigadoras de vibrações em edifícios induzidas pelo tráfego ferroviário em túneis.

O Capítulo 7 dedica-se à validação experimental dos modelos propostos. O caso de estudo selecionado refere-se a um trecho de uma linha ferroviária subterrânea da cidade de Madrid, onde foram realizadas medições de vibrações induzidas por tráfego ferroviário na via e em um edifício adjacente ao túnel. O caso de estudo é simulado, sendo discutidas as opções tomadas para superar algumas dificuldades decorrentes de lacunas na caracterização do sistema.

Por último, no Capítulo 8 são sintetizadas as principais conclusões da tese e apontadas perspectivas de pesquisa futura, tidas como pertinentes no âmbito da temática abordada ao longo do presente estudo.

## 2 Vibrações induzidas por tráfego ferroviário em túneis: fenomenologia básica

### 2.1 Contextualização e impacto ambiental das vibrações

No capítulo anterior, foram apresentados os diversos benefícios econômicos e sociais do transporte ferroviário, que o tornam um meio de transporte atrativo e muito eficiente em zonas urbanas densamente povoadas. Todavia, a operação das infraestruturas ferroviárias está associada ao problema das vibrações geradas pela circulação do tráfego, que se propagam pelo meio envolvente até os edifícios existentes nas imediações, manifestando-se como ruído e vibrações que podem causar incômodo aos seus ocupantes, causar o mau funcionamento de máquinas ou equipamentos sensíveis às vibrações e, no limite, provocar danos arquitetônicos ou estruturais nos edifícios, com possíveis repercussões na sua funcionalidade, levando, assim, a prejuízos econômicos.

Os problemas ambientais relacionados com as vibrações induzidas pelo tráfego ferroviário e metroviário vêm ganhando cada vez maior relevância nos últimos anos. O efeito destas vibrações em ambientes de trabalho e habitacionais constitui atualmente uma grande preocupação ambiental em áreas urbanas e tem dado origem a muitas queixas em zonas com elevada densidade populacional, como se ilustra, a título de exemplo, na Figura 2.1.

Na origem da crescente importância do impacto ambiental das vibrações estão fatores como: a demanda por expansão das redes ferroviárias e de metrô em zonas urbanas; o aumento da sensibilidade do público ao ruído e às vibrações; a construção de novos edifícios com elevadas exigências funcionais na proximidade de infraestruturas ferroviárias, dada muitas vezes a carência de espaço; o aumento das exigências sociais e ambientais, incidindo sobre os requisitos de conforto dos habitantes e de funcionamento de equipamentos sensíveis, como resultado de uma legislação mais rigorosa para alcançar um desenvolvimento sustentável.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-024_781_1763_111_148.jpg)
Figura 2.1: Recortes de jornal referentes a reclamações relacionadas com vibrações excessivas originadas por tráfego ferroviário subterrâneo em diferentes localizações: a) Metrô de Toronto; b) Metrô de Brooklyn.

As vibrações originadas pela circulação de transportes ferroviários, na generalidade dos casos, não representam um problema para a integridade estrutural dos edifícios situados nas proximidades, podendo, contudo, causar problemas em elementos não estruturais e perturbações ambientais. O desconforto para as pessoas que os habitam e o mau funcionamento de equipamentos sensíveis são apontados como as principais consequências [6], [7], embora, em situações extremas, possam ocorrer danos causados pelas vibrações, como no caso relatado na Figura 2.1b.

Quanto à resposta humana às vibrações, verifica-se que estas são percebidas de forma distinta conforme as faixas de frequência envolvidas. O limite inferior para a percepção humana de vibrações é de cerca de 0,1 mm/s [8], valor que pode ser facilmente ultrapassado em áreas urbanas com uma rede ferroviária densa. As vibrações transmitidas aos edifícios são percebidas pelos seus ocupantes tanto diretamente, sob a forma de vibrações mecânicas, na faixa de frequências entre 1 Hz e 80 Hz, quanto indiretamente, como ruído re-radiado/estrutural (ruído induzido pela interação entre a vibração mecânica de alguns elementos da edificação e o fluido no interior dos compartimentos (ar)), em uma faixa de frequências mais ampla, em geral entre 16 Hz e 250 Hz [6], [7].

A exposição humana a vibrações pode afetar a saúde, influenciar as atividades e causar desconforto [6], [7], dependendo da duração da exposição, da magnitude e do conteúdo em frequência da vibração, mas também de fatores subjetivos de natureza pessoal, social e econômica. Alguns dos efeitos na saúde referidos na bibliografia
como mais frequentes são perturbações do sono e, em casos mais severos, alterações cardíacas e psiquiátricas [5].

Como exemplo, cabe mencionar que na cidade de Toronto (Canadá) foi necessária uma intervenção profunda em um trecho de uma linha de metrô inaugurada em 2011, visto que o nível de vibração induzida nas habitações sobrejacentes era tão elevado que levou ao agravamento de problemas de saúde mental de alguns habitantes. Outros efeitos também comuns, e que afetam em grande medida o desempenho de atividades, são a interrupção da concentração e, em particular, a interferência com a fala (discurso verbal) e a comunicação [9]. Estudos realizados por Apud \& Brammer (1998) constataram que a exposição a vibrações de alta frequência com baixa amplitude, por longos períodos de tempo, afeta a capacidade de concentração, enquanto a exposição a vibrações de baixa frequência com amplitude elevada, por curtos períodos, pode causar danos musculares ou em órgãos internos. Com efeito, a continuidade, dia após dia, da exposição humana a vibrações induzidas pelo tráfego ferroviário constitui um problema de saúde pública.

Quanto ao funcionamento de equipamentos sensíveis no interior de edifícios, a faixa de frequências de interesse pode chegar a 200 Hz, embora as frequências dominantes sejam normalmente inferiores a 100 Hz. Cabe observar que os edifícios apresentam frequências naturais inferiores a 100 Hz (associadas aos modos de vibração dominantes), o que resulta em uma atenuação das vibrações para frequências superiores a este valor. Os níveis de vibração de interesse estão habitualmente compreendidos entre 0,001 mm/s e 10 mm/s, dependendo das características do equipamento [11], [12].

Gordon $(1991,1999)$ desenvolveu um critério para a avaliação do efeito das vibrações no funcionamento de equipamentos sensíveis, baseado em um conjunto de curvas genéricas, normalmente denominadas curvas VC (vibration criterion). As referidas curvas são definidas para diferentes classes de equipamentos e estabelecem limites para a velocidade de vibração em função da frequência. Esses limites para o funcionamento adequado de equipamentos sensíveis estão compreendidos entre 0,003 mm/s e 0,2 mm/s, dependendo do tipo de equipamento e, portanto, da classe em que se enquadra. Dado o seu uso frequente, este critério será apresentado com algum detalhe mais adiante neste capítulo.

Quanto aos possíveis danos em edifícios provocados por vibrações resultantes de tráfego ferroviário, cabe destacar que, caso ocorram, terão essencialmente um caráter não estrutural. Constata-se que estes danos apenas ocorrem na sequência de níveis
de vibração muito elevados ou de um número significativo de ciclos com magnitude elevada. Além disso, os níveis de vibração necessários para danificar um edifício são 10 a 100 vezes superiores aos associados à percepção humana, de modo que seriam intoleráveis para os seus ocupantes [6], [7].

Ainda no que se refere ao potencial de dano em edificações devido a vibrações originadas por tráfego ferroviário, Remington et al. (1987) abordaram a questão visando o estabelecimento de um limiar para o valor da velocidade de vibração a partir do qual podem ocorrer danos. Segundo estes autores, os valores de pico das velocidades críticas variam entre 3 mm/s e 20 mm/s nas fundações. Os níveis de vibração propostos como capazes de causar danos estruturais são significativamente mais elevados do que as vibrações geradas pelo tráfego ferroviário. No entanto, cabe observar que níveis de vibração muito mais baixos podem ser motivo de preocupação no caso de edifícios antigos e históricos, não só porque, por vezes, a precariedade das próprias edificações é acentuada, mas também por causa do valor patrimonial que importa preservar, como foi relatado já em 1987 por Ellis (1987) e posteriormente por Clemente \& Rinaldis (1998). Ainda a esse respeito, para reiterar a relevância da questão, cabe mencionar o amplo conjunto de estudos realizados recentemente com o objetivo de garantir que o Monumento aos Mártires do Outono do ano Xin-hai (Chengdu, China) não fosse danificado por efeito do tráfego ferroviário nas suas imediações. Esses estudos, de caráter numérico e experimental, reportados por Ma et al. (2011), identificaram uma velocidade crítica de circulação de cerca de 60 km/h, a partir da qual os níveis de vibração induzidos na edificação poderiam conduzir a algum tipo de dano.

Perante o exposto, pode afirmar-se que as vibrações induzidas no interior de edifícios pelo tráfego em áreas urbanas constituem um problema de engenharia relevante. Por conseguinte, este aspecto é seriamente levado em conta no planejamento e concepção de sistemas de transporte em áreas metropolitanas densamente povoadas. Embora a questão seja transversal a vários tipos de infraestruturas de transporte, como já referido, assume especial relevância no caso de tráfego ferroviário em túneis, uma vez que há um agravamento dos problemas dada a sua proximidade às edificações. Aliado a este fato, o expressivo aumento da população em áreas metropolitanas exige o desenvolvimento de sistemas de transporte subterrâneos novos e mais sustentáveis, colocando novos desafios à comunidade técnica e científica.

A análise do impacto ambiental das vibrações geradas pelo tráfego ferroviário em túneis surge assim como uma questão particularmente importante para o desenvolvi-
mento sustentável das cidades modernas. O primeiro passo para a minimização do impacto negativo causado por estas vibrações reside em uma melhor compreensão do problema, que apresenta certa complexidade. Com esse propósito, a comunidade técnica e científica dedicou esforços consideráveis a esse tema nos últimos anos, levando ao desenvolvimento de inúmeros estudos e modelos para a previsão das vibrações induzidas por infraestruturas de transporte ferroviário. Alguns desses estudos e modelos serão abordados neste capítulo por sua relevância e para mostrar a evolução dos trabalhos científicos realizados nessa área.

Assim, a seguir apresenta-se uma revisão dos aspectos básicos associados à problemática da geração e propagação de vibrações induzidas por tráfego ferroviário em túneis.

Quanto à organização do capítulo, inicia-se com uma descrição global dos principais mecanismos envolvidos no problema, desde a geração de vibrações até sua percepção no interior de edifícios. Neste contexto, salienta-se a importância de considerar a presença dos edifícios existentes no entorno da infraestrutura na estratégia de modelagem. Segue-se uma discussão acerca dos efeitos das vibrações sobre os habitantes dos edifícios e os equipamentos sensíveis, bem como do seu impacto nos próprios edifícios, com uma breve referência a alguns critérios e aspectos normativos aplicáveis neste âmbito. O capítulo termina com a identificação de um conjunto de medidas passíveis de serem aplicadas para a mitigação do problema.

### 2.2 Modelos de previsão

### 2.2.1 Generalidades

Nesta seção apresenta-se uma resenha dos trabalhos considerados relevantes no âmbito da previsão de vibrações induzidas por tráfego ferroviário em túneis, procurando-se evidenciar a evolução das metodologias e, simultaneamente, salientar as vantagens e limitações de cada uma.

O desenvolvimento de modelos e metodologias que permitam avaliar o impacto das vibrações geradas pela circulação do transporte ferroviário tem recebido, nas últimas décadas, grande atenção da comunidade técnica e científica. Uma resenha bibliográfica das diferentes metodologias de previsão de vibrações induzidas por tráfego ferroviário em túneis foi desenvolvida por Yang \& Hsu (2006). Segundo estes autores, diferentes metodologias vêm sendo propostas, alcançando diferentes níveis de precisão e complexidade. De modo geral, as diferentes metodologias podem ser
agrupadas em: i) metodologias empíricas; ii) metodologias semianalíticas; iii) metodologias numéricas; iv) metodologias híbridas.

Uma organização alternativa é proposta na ISO 14837-1 [6], que distingue as metodologias em três níveis, conforme o grau de precisão e acuidade associado. Os primeiros dois níveis são adequados a análises de caráter macroscópico, visando a identificação de zonas problemáticas no âmbito da avaliação de impacto ambiental e de análise. Por sua vez, abordagens mais detalhadas são alcançadas pelas metodologias de nível 3, que já permitem quantificar o problema, sendo por isso adequadas às fases de projeto e de análise detalhada.

Embora não seja possível estabelecer uma correspondência perfeita entre a organização proposta pela ISO 14837-1 [6] e a tipologia das metodologias de previsão, a imprecisão associada aos modelos empíricos implica que estes se enquadrem nos primeiros dois níveis previstos na referida norma, encontrando-se a modelagem numérica avançada no nível 3.

Como em outros domínios da engenharia, a formulação de metodologias empíricas tem como base a observação e o registro dos efeitos induzidos pelo problema em consideração e a posterior identificação de tendências que possam constituir orientações para a previsão do referido efeito em situações futuras similares. Vários têm sido os autores que têm refletido sobre este assunto, tendo sido propostas diferentes correlações empíricas para a previsão de vibrações induzidas por tráfego ferroviário, destacando-se aqui as referências [7], [20], [21], [22], [23]. Um aspecto intrínseco às formulações empíricas é o seu campo de aplicação, o qual é limitado pela semelhança do caso em estudo em relação aos cenários de referência que serviram à formulação das regras empíricas. Além disso, dado que as metodologias enquadradas nesta classe se orientam pela observação dos efeitos e não pela interpretação dos fenômenos, torna-se muito difícil a percepção da influência de aspectos específicos, os quais por vezes podem ser alvo de intervenção por parte do engenheiro, no problema como um todo. Contudo, apesar das limitações inerentes aos modelos empíricos, formulações mais desenvolvidas, como a metodologia proposta pela FRA (Federal Railroad Administration) [7] para a previsão de vibrações induzidas por tráfego de alta velocidade, constituem ferramentas poderosas e com elevado potencial prático. Porém, no caso de tráfego subterrâneo, a aplicação da metodologia em causa torna-se complexa já que exige a medição de uma função de transferência entre o fundo do túnel e o receptor. Como o túnel ainda não existe na fase de projeto, o referido documento sugere que
a mesma possa ser estabelecida através da aplicação de uma excitação em um furo à cota prevista para o fundo do futuro túnel.

Como forma de contornar algumas das limitações inerentes às metodologias empíricas, alguns autores vêm sugerindo o desenvolvimento de técnicas híbridas, ou seja, técnicas que combinam funções de transferência avaliadas de forma experimental com formulações analíticas e/ou numéricas para a reprodução dos efeitos que não são passíveis de avaliação experimental ou por correlação empírica. Exemplos destas formulações são apresentados nos estudos conduzidos por Lai et al. (2005), Verbraken et al. (2011) e Lombaert et al. (2014).

No campo das metodologias semianalíticas, a grande vantagem reside essencialmente no fato de serem metodologias mecanicistas, ou seja, metodologias nas quais há uma teorização dos fenômenos envolvidos, sem que haja necessidade de elevados recursos computacionais. O fato de os modelos recorrerem a soluções analíticas ou semianalíticas permite a realização de cálculos de forma bastante rápida, o que se torna muito vantajoso na realização de estudos de sensibilidade. O modelo PiP, proposto inicialmente por Forrest \& Hunt (2006) e posteriormente melhorado por Hussein \& Hunt (2007), Kuo et al. (2011) e, mais recentemente, por Razquin (2014), é exemplo disso. Contudo, o baixo custo computacional requerido por este tipo de formulações é alcançado com prejuízo da versatilidade, implicando simplificações que, regra geral, tornam a aplicação prática dos modelos extremamente limitada. Refira-se que o modelo semianalítico PiP foi concebido sob a hipótese de o túnel se encontrar inserido em um meio indefinido, o que, por definição, se afasta consideravelmente de qualquer cenário com interesse prático. Considerando esse fato, Hussein et al. (2014) propuseram muito recentemente uma melhoria desse modelo para poder contemplar, ainda que de forma simplificada e com perda de acuidade, a presença de uma fronteira livre.

Algumas das limitações dos modelos empíricos e semianalíticos elencados nos parágrafos anteriores podem ser superadas por meio de formulações numéricas, as quais permitem a elaboração de modelos com elevado grau de detalhe. Entre as diferentes formulações, especial destaque é dado aos métodos dos elementos finitos, dos elementos de contorno e das soluções fundamentais, o último ainda em fase incipiente de aplicação no presente contexto. Refira-se que vários têm sido os autores que têm proposto formulações numéricas como metodologias eficientes para lidar com a questão em estudo. Estes modelos revelam-se extremamente úteis para avaliar a influência de diferentes alternativas ou soluções de projeto em uma fase preliminar, para verificar
o comportamento das infraestruturas existentes sob novas solicitações ou para estudar a eficiência de medidas de mitigação das vibrações. Como a metodologia numérica é adotada nesta tese e merece maior detalhamento, nas seções seguintes é apresentada uma resenha das contribuições científicas mais relevantes na área.

Como anteriormente referido, a norma ISO 14837-1 [6] aborda a previsão de vibrações e ruídos provenientes de sistemas ferroviários, sugerindo, no caso de formulação mecanicista, a seguinte subdivisão do problema: 1) mecanismos de excitação; 2) interação dinâmica veículo-via; 3) interação dinâmica do sistema via-túnel-maciço; 4) propagação de ondas no maciço; 5) interação dinâmica solo-estrutura (edifício); e 6) vibrações e ruído re-radiado na estrutura. O trabalho desenvolvido no âmbito da presente tese abrange a quase totalidade dos problemas em causa, com exceção da questão do ruído re-radiado (desenvolvimento em fase inicial de abordagem no grupo de pesquisa do qual a autora participa), possibilitando assim uma previsão precisa das vibrações no interior das edificações devido às vibrações induzidas pelo tráfego ferroviário em túneis. Os diferentes problemas envolvidos são brevemente descritos a seguir, sendo em capítulos posteriores alvo de uma abordagem detalhada.

### 2.2.2 Mecanismos de excitação e interação veículo-via

As vibrações induzidas pelo tráfego ferroviário devem-se a vários mecanismos de excitação, os quais são sintetizados na norma ISO 14837-1 [6]. A geração de vibrações ocorre no contato roda-trilho, em que a ação exercida pela passagem do material rodante resulta da sobreposição de dois principais mecanismos de excitação: i) a excitação quase estática; ii) a excitação dinâmica.

A excitação quase estática é originada pelo movimento das cargas correspondentes à distribuição do peso estático do trem pelos diferentes eixos, podendo ser representada conceitualmente como um conjunto de forças móveis de magnitude constante. Este tipo de excitação não compreende a geração de forças de inércia no veículo e está associada a frequências relativamente baixas, dependentes da velocidade de circulação do trem e da sua geometria. Esta solicitação é relevante para a resposta na via e nas suas proximidades, e sua importância decresce rapidamente com o aumento da distância [32], [33], [34], [35].

Por outro lado, a excitação dinâmica decorre da interação dinâmica veículo-via, podendo dever-se a diversos fatores, sendo apontados como mais relevantes para a geração de forças de interação: as irregularidades geométricas da via e das rodas do veículo; as descontinuidades da via e das próprias rodas do trem, que geram a chamada excitação de impacto; e a excitação paramétrica resultante das variações de rigidez
experimentadas pelas rodas ao longo da via, devido ao caráter discreto do apoio dos trilhos (essa variação não ocorre em soluções com apoio contínuo, como nas vias com trilho embutido). As irregularidades aleatórias da superfície de contato roda--trilho provocam uma excitação forçada do sistema veículo-via e são talvez a mais importante fonte de vibração em redes de metrô [36]. As descontinuidades da via e das rodas, devido, por exemplo, aos aparelhos de mudança de via, aos cruzamentos e às mudanças de direção e, também, a defeitos adicionais como juntas dos trilhos, achatamentos nas rodas ou sua ovalização, podem ainda originar forças de impacto significativas no veículo e na via.

Ao contrário da excitação quase estática, a excitação dinâmica implica o desenvolvimento de um mecanismo de interação dinâmica veículo-via, originando forças de inércia nas massas do veículo, as quais, por sua vez, se traduzem em uma variação temporal das forças de interação. A magnitude e o conteúdo em frequência dessas forças dependem da velocidade de circulação, das características do mecanismo causador e das propriedades da via e do trem [35], [37]. A excitação dinâmica contribui de forma muito relevante para a geração de vibrações que se propagam pelo maciço de fundação, sendo a resposta do maciço a distâncias consideráveis da via fundamentalmente condicionada por esta componente da solicitação.

As abordagens mecanicistas do problema de interação veículo-via podem ser agrupadas, ainda que de forma geral, em dois grandes grupos conforme a técnica de resolução do problema: i) formulações no domínio do tempo; ii) formulações no domínio da frequência. As formulações no domínio do tempo são mais versáteis, permitindo a inclusão de comportamentos não lineares [38], ao passo que as formulações no domínio da frequência se revelam mais eficientes do ponto de vista computacional. Independentemente do tipo de formulação utilizada, o princípio básico consiste no cumprimento dos requisitos de equilíbrio de forças e de compatibilidade de deslocamento nos pontos de contato entre a roda e o trilho. Na previsão de vibrações induzidas pelo tráfego ferroviário e sua propagação pelo meio envolvente é amplamente utilizado o modelo de contato linear, em que se assume um contato perfeito entre o veículo e a via, sem considerar perdas de contato entre a roda e o trilho, razão pela qual, regra geral, o problema vem sendo abordado, por diversos autores, entre os quais a autora da presente tese, no domínio da frequência [39], [40], [41], [42], [43], [44].

Uma revisão ampla dos diversos métodos propostos para a análise do problema da interação veículo-via férrea, essencialmente para tráfego à superfície, pode ser
consultada, por exemplo, nas seguintes referências bibliográficas [33], [38], [45], [46], [47], [48], [49].

Considerando a questão da interação via-veículo para o cenário de tráfego ferroviário em túneis, a bibliografia costuma indicar que o fundo do túnel e o terreno envolvente são relativamente rígidos em comparação com a via férrea, o que permite uma abordagem desacoplada do problema, negligenciando-se a possível contribuição do meio subjacente à via para a sua flexibilidade dinâmica. Nessas circunstâncias, calculam-se as forças de interação dinâmica veículo-via com base em um modelo de via desacoplado, sendo estas posteriormente usadas em um modelo do sistema via-túnel-maciço para gerar os campos de vibração que se propagam pelo meio envolvente. Cabe observar que esta não é a formulação seguida no presente estudo, que considera o acoplamento entre a via e o fundo do túnel.

Como se verá em capítulo posterior, a modelagem da via férrea pode ser efetuada através de idealizações relativamente simples, baseadas, em muitos casos, no conceito de viga em apoio elástico contínuo e homogêneo [50], [51], [52], [53], como se ilustra na Figura 2.2a. Modelagens desse tipo, embora muito eficientes do ponto de vista computacional, não permitem considerar mecanismos de excitação oriundos de hete-rogeneidades no suporte da via férrea, como por exemplo, o apoio discreto do trilho (ver Figura 2.2b). Para representar esse efeito, denominado excitação paramétrica, cuja descrição detalhada é exposta em capítulo posterior, vários autores têm proposto modelos periódicos para a simulação do comportamento dinâmico da via férrea [49], [54], [55], [56], [57].

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-032_438_1750_1813_157.jpg)
Figura 2.2: Modelos simplificados de via: a) modelo de apoio contínuo; b) modelo de apoio discreto.

No que se refere à modelagem do trem, vários modelos de veículos têm sido desenvolvidos nos últimos anos. Esses modelos vão desde representações 3D muito complexas [58], [59], [60] com vários graus de liberdade, que permitem uma análise em profundidade da resposta dinâmica do veículo, sobretudo utilizadas quando se pretende estudar assuntos como a segurança da circulação, a resposta em curva ou o conforto dos passageiros, até representações mais simples em que o veículo é descrito por um
conjunto de corpos rígidos (a caixa do veículo, os bogies e as massas não suspensas, correspondentes às rodas e aos eixos), interligados por conjuntos mola-amortecedor, com os quais se pretende simular o comportamento mecânico das suspensões, de que é exemplo o modelo proposto por Zhai \& Cai (1997). Estes modelos têm revelado um desempenho adequado às finalidades do presente trabalho, como previamente estudado por outros autores [34], [41], [48].

### 2.2.3 Propagação de ondas elásticas e interação dinâmica do sistema via-túnel-maciço

### 2.2.3.1 Propagação de ondas elásticas

As vibrações geradas na interface roda-trilho propagam-se através do túnel e do maciço envolvente. A energia é irradiada para o solo, transmitindo-se também ao longo da via e do túnel. A compreensão do problema da propagação de vibrações pelo solo é fundamental para a modelagem de vibrações induzidas pelo tráfego ferroviário subterrâneo. A presente subseção tem como objetivo apresentar os conceitos básicos referentes à propagação de ondas em meios elásticos.

As ondas que se propagam em um maciço podem ser agrupadas da seguinte forma: ondas de corpo (ondas P ou de compressão e ondas S ou de cisalhamento), que se propagam no interior do maciço, e ondas superficiais, que se propagam junto à superfície do terreno. No interior de um meio indefinido, elástico, homogêneo e isotrópico é possível a propagação apenas de dois tipos de ondas: ondas P e ondas S, designadas por ondas de corpo, que se propagam de forma totalmente desacoplada. No caso de meios semi-infinitos, devido às condições de fronteira (superfície livre), ocorre acoplamento entre os dois tipos de ondas de corpo, isto é, pode ocorrer transformação de ondas P em ondas S e vice-versa. Nestas circunstâncias, da interação das ondas de corpo e da condição de tensões nulas ao longo da superfície livre, resultam ondas que apenas se propagam junto à superfície do terreno e que decaem exponencialmente com a profundidade. Estas ondas superficiais designam-se por ondas de Rayleigh [62], e são de grande importância para o estudo de vibrações induzidas por fonte superficial.

Em um maciço semi-infinito, homogêneo e isotrópico, propagam-se então três tipos de ondas: i) ondas P ou de compressão, ii) ondas S ou de cisalhamento; iii) ondas de Rayleigh. Estes três tipos de ondas têm configurações de vibração distintas e apresentam velocidades de propagação também diferentes. A aplicação de um impulso à superfície de um maciço e a observação da resposta em um ponto afastado do ponto de aplicação da carga, também à superfície, permitem verificar que a recepção de cada uma das ondas ocorre em instantes diferentes. As ondas P são as mais rápidas e,
portanto, as primeiras a chegar ao ponto de observação. A seguir, chegam as ondas S e, por último, as ondas de Rayleigh (ondas R), que têm uma velocidade de propagação ligeiramente inferior à das ondas S e apresentam maiores amplitudes.

As ondas P ou ondas de compressão, também designadas por ondas primárias, pertencem ao grupo das ondas de corpo, propagando-se por isso em qualquer direção do meio com uma velocidade de propagação aqui designada por $\mathrm{C}_{\mathrm{P}}$. O processo de propagação destas ondas implica o movimento de contração e dilatação do material, sendo as deformações induzidas puramente volumétricas, como se ilustra na Figura 2.3. São ondas longitudinais, em que o movimento das partículas induzido pela onda ocorre somente na direção de propagação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-034_412_987_901_548.jpg)
Figura 2.3: Movimento das partículas induzido pela propagação de ondas P [63].

As ondas S ou ondas de cisalhamento são também ondas de corpo, propagam-se em qualquer direção do meio mas, ao contrário do que se verifica nas ondas P, o processo de propagação das ondas S implica deformação a volume constante, como se mostra na Figura 2.4. Nesse caso, as partículas experimentam um movimento perpendicular à direção de propagação. A velocidade de propagação destas ondas é aqui designada por $\mathrm{C}_{\mathrm{s}}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-034_352_1217_1909_429.jpg)
Figura 2.4: Movimento das partículas induzido pela propagação de ondas S [63].

Considerando que o movimento das partículas durante a propagação de uma onda S pode apresentar componentes normal e paralela ao plano vertical onde se inscreve a direção de propagação da onda, é comum decompor as ondas S em ondas SV (propagação com movimento inscrito no plano) e ondas SH (propagação com movimento normal ao plano), como se representa na Figura 2.5.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-035_717_1496_119_284.jpg)
Figura 2.5: Componentes no plano e fora do plano do deslocamento induzido pela propagação de ondas S [63].

As velocidades de propagação das ondas P e ondas S, $\mathrm{C}_{\mathrm{P}}$ e $\mathrm{C}_{\mathrm{S}}$, são dadas pelas equações [2.1] e [2.2], respectivamente.

$$
\begin{gather*}
C_{P}=\sqrt{\frac{\lambda+2 \mu}{\rho}}  \tag{2.1}\\
C_{S}=\sqrt{\frac{\mu}{\rho}} \tag{2.2}
\end{gather*}
$$

Nessas expressões, $\rho$ é a massa específica do meio e $\lambda$ e $\mu$ são as constantes de elasticidade de Lamé, dependentes do módulo de elasticidade $(E)$ e do coeficiente de Poisson $(\nu)$, definidas por:

$$
\begin{align*}
\lambda & =\frac{\nu E}{(1+\nu)(1-2 \nu)}  \tag{2.3}\\
\mu & =\frac{E}{2(1+\nu)}=G \tag{2.4}
\end{align*}
$$

As velocidades de propagação das ondas longitudinais e de cisalhamento podem, portanto, ser relacionadas por uma expressão que depende apenas do coeficiente de Poisson:

$$
\begin{equation*}
\frac{C_{S}}{C_{P}}=\sqrt{\frac{1-2 \nu}{2-2 \nu}} \tag{2.5}
\end{equation*}
$$

No que se refere à dependência da velocidade de propagação de uma onda da frequência de excitação, a onda é denominada dispersiva quando essa dependência se verifica, e não dispersiva em caso contrário. Uma vez que a velocidade de propagação das ondas de corpo (ver [2.1] e [2.2]) depende apenas das propriedades elásticas do meio e
da sua massa específica, não se identificando qualquer relação, implícita ou explícita, entre a velocidade de propagação e a frequência de excitação, pode-se afirmar que a propagação de ondas de corpo em meios elásticos contínuos é não dispersiva.

As ondas de Rayleigh (ondas R), ao contrário das anteriormente apresentadas, apenas se propagam junto à superfície do meio. São ondas superficiais com caráter evanescente em profundidade: a amplitude dos deslocamentos decresce muito abruptamente, de modo que, para profundidades correspondentes a aproximadamente 1,5 vezes o comprimento de onda, a amplitude dos deslocamentos se torna negligenciável [63]. O campo de deformação induzido pelas ondas de Rayleigh caracteriza-se por componentes volumétrica e distorcional. O movimento das partículas durante a propagação de ondas de Rayleigh encontra-se esquematizado na Figura 2.6.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-036_367_1150_994_458.jpg)
Figura 2.6: Movimento das partículas induzido pela propagação de ondas R [63].

Neste caso, o movimento das partículas é descrito por trajetórias elípticas em planos normais à superfície e paralelos à direção de propagação da onda, sendo a componente vertical do deslocamento sempre superior à componente horizontal; ambas as componentes decaem exponencialmente em profundidade. Cabe ainda destacar que a profundidade de penetração da onda é inversamente proporcional à sua frequência angular, isto é, para ondas de alta frequência apenas as zonas superficiais do maciço são afetadas, ao passo que para frequências baixas são envolvidas zonas mais profundas do maciço.

As ondas R propagam-se com uma velocidade ligeiramente inferior à das ondas S, sendo possível relacionar estas duas velocidades através do coeficiente de Poisson. Uma solução aproximada é dada pela seguinte expressão [64], [65]:

$$
\begin{equation*}
C_{R} \approx \frac{0.862+1.14 \nu}{1+\nu} C_{S} \tag{2.6}
\end{equation*}
$$

Pode-se, assim, afirmar que as relações entre as velocidades de propagação dos diferentes tipos de ondas admissíveis em um maciço semi-infinito, homogêneo e isotrópico, dependem apenas do coeficiente de Poisson.

As ondas de Rayleigh apresentam caráter não dispersivo em maciços homogêneos semi-infinitos (ou seja, a velocidade de propagação da onda é independente da frequência de excitação), sendo, no entanto, dispersivas no caso de maciços estratificados [64], [65], [66].

Estudos teóricos desenvolvidos por Miller \& Pursey (1954, 1954), acerca da repartição da energia irradiada pelo movimento oscilatório vertical de um disco à superfície de um maciço semi-infinito pelos diferentes tipos de ondas anteriormente mencionados, demonstram que cerca de $67 \%$ do total da energia irradiada é transportado através de ondas de Rayleigh, enquanto apenas 26 \% e 7 \% da energia estão associados a ondas S e P, respectivamente. Esta constatação teórica evidencia a clara preponderância das ondas de Rayleigh na resposta observada em pontos localizados à superfície do maciço, quando a fonte de vibração está à superfície. Caso a fonte de vibração esteja localizada no interior do maciço, geram-se ondas P e ondas S, resultando as ondas de Rayleigh do acoplamento entre as ondas P e SV quando estas atingem a superfície livre do maciço. Nestas condições, a contribuição relativa da energia das ondas de Rayleigh é muito reduzida, a menos que a fonte de vibração se encontre próxima da superfície. Cabe observar que, nos casos em que a distância entre a fonte e a superfície livre é significativa, as ondas de corpo já se encontram muito atenuadas quando atingem a superfície, principalmente em problemas tridimensionais dada a forte participação dos mecanismos de amortecimento geométrico.

Quando uma onda se propaga em um meio elástico tridimensional ocorre uma diminuição progressiva da sua amplitude com o acréscimo da distância à fonte energética, mesmo nos casos em que a dissipação energética seja diminuta ou, em termos teóricos, nula. Este efeito é usualmente designado por amortecimento geométrico e resulta do espalhamento da energia transportada pela onda por um maior volume à medida que a distância à fonte aumenta. O amortecimento geométrico não está associado a qualquer transferência de energia para fora do sistema, mas sim ao seu espalhamento devido à propagação da onda. O grau de amortecimento geométrico depende da geometria da frente de onda, ou seja, da forma como a onda se espalha em uma, duas ou três dimensões. No caso das ondas de corpo, considerando a configuração da frente de onda e dado que a quantidade de energia presente na frente de onda é constante, independentemente da distância r à fonte, a amplitude dos deslocamentos induzidos no interior do maciço diminui na razão 1/r, ao passo que à superfície do maciço a atenuação é inversamente proporcional ao quadrado da distância, ou seja, os deslocamentos atenuam-se na razão de $1 / \mathrm{r}^{2}$. Quanto às ondas R, dada a configuração
da frente de onda, os deslocamentos induzidos sofrem uma atenuação descrita pela razão1/r ${ }^{0,5}$, ou seja, substancialmente inferior ao amortecimento geométrico inerente à propagação de ondas de corpo. Deste modo, os efeitos das ondas R em pontos localizados à superfície do maciço são perceptíveis a distâncias maiores, o que as torna de fundamental importância para os problemas de isolamento das fundações dos edifícios. Cabe, no entanto, observar que quando uma onda se propaga ocorre sempre alguma dissipação de energia, ou seja, parte da energia transportada pela onda sai do sistema; este fenômeno de dissipação energética é designado por amortecimento material, e será abordado mais à frente nesta seção.

No caso geral, como o de um maciço estratificado, além das ondas P, S e R outros tipos de ondas podem surgir, resultantes da interação das ondas de corpo com interfaces de estratos com propriedades distintas. Caso o estrato superficial apresente uma velocidade de propagação das ondas S inferior à verificada nos estratos subjacentes, é possível a geração de outro tipo de ondas superficiais, designadas por ondas Love (ondas L). Estas ondas resultam da interferência entre ondas SH, a superfície livre do maciço e a interface inferior do estrato superficial, ocorrendo assim concentração de energia ao longo da zona superficial do maciço. O movimento das partículas gerado por este tipo de onda ocorre na direção normal ao plano de propagação da onda, como se ilustra na Figura 2.7. A propagação de ondas L apenas provoca deformações de caráter distorcional, apresentando, à semelhança das ondas R, características evanescentes em profundidade (apenas se propagam na direção paralela à superfície do maciço). A velocidade de propagação destas ondas é dependente da frequência de excitação, uma vez que é necessário que o maciço seja estratificado para que possam ser geradas.

Em meios estratificados com características mecânicas constantes no interior de cada estrato individual pode ainda ocorrer acoplamento dos dois tipos de ondas de corpo nas interfaces entre os meios com propriedades distintas. Outro tipo de onda que pode ser gerado em maciços estratificados é o das chamadas ondas Stoneley, que se propagam na interface entre duas camadas.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-039_341_955_174_545.jpg)
Figura 2.7: Movimento das partículas induzido pela propagação de ondas L [63].

No cenário de tráfego ferroviário subterrâneo, as vibrações geradas na interface roda-trilho transmitem-se ao túnel e ao maciço circundante, permitindo que a energia se propague ao seu redor. As ondas geradas propagam-se em todas as direções. À medida que aumenta a distância à fonte, a amplitude de vibração é gradualmente atenuada por dois mecanismos: amortecimento geométrico e amortecimento material. O amortecimento material está associado à dissipação de energia que ocorre quando uma onda se propaga através do meio. Os fenômenos que levam à dissipação energética estão relacionados com mecanismos de comportamento não linear de natureza microscópica e com fenômenos de atrito entre partículas, que levam à transformação de parte da energia mecânica em energia térmica, dissipada sob a forma de calor [68]. No caso dos solos, os fenômenos de amortecimento material devem-se essencialmente ao atrito no contato entre partículas ou ao movimento relativo entre o esqueleto sólido e o fluido intersticial.

### 2.2.3.2 Técnicas de modelagem do sistema túnel-maciço geotécnico

Da subseção anterior depreende-se que a base teórica para a modelagem matemática da propagação de vibrações induzidas por tráfego encontra-se estabelecida e consolidada. Embora a propagação de vibrações em um sistema constituído pelo túnel e pelo maciço circundante seja mais complexa do que a propagação em um meio semi-infinito (devido às condições de fronteira mais complexas), a grande dificuldade na abordagem ao problema não resulta propriamente da complexidade matemática inerente, mas sim das limitações computacionais vigentes.

Com efeito, a interação dinâmica entre o túnel e o maciço envolvente é um problema tridimensional, em que, por um lado, a dimensão do meio é muito vasta e, por outro, o conteúdo em frequência de interesse para o problema é muito amplo. A combinação destes dois aspectos resulta em complexidade adicional na modelagem numérica, tornando os modelos tridimensionais puramente discretizados, como o Método dos Elementos Finitos (MEF) ou o Método das Diferenças Finitas (MDF), muitas vezes impraticáveis dada a necessidade de muitos milhões de graus de
liberdade para a obtenção de soluções com precisão aceitável. Ainda assim, deve ser assinalado que o avanço dos recursos computacionais tem incentivado a realização de alguns estudos tridimensionais baseados no MEF 3D, embora ainda com caráter preliminar [69], [70] ou, nos casos em que tal não se verifique, com tempos de cálculo inviáveis para uma aplicação rotineira [71]. Na Figura 2.8 ilustram-se as malhas de elementos finitos adotadas por Yaseri et al. (2014) e por Xu et al. (2015) para o desenvolvimento de análises tridimensionais baseadas no método dos elementos finitos. Cabe observar que, dada a dimensão adotada para os elementos representados na Figura 2.8, a precisão da solução ficará sempre limitada à faixa de frequências mais baixa.

Ainda no campo dos métodos puramente tridimensionais, o recurso ao Método dos Elementos de Contorno 3D permite uma redução substancial do número de graus de liberdade necessários à descrição do sistema túnel-maciço. Contudo, apesar da drástica redução do número de graus de liberdade em relação ao MEF 3D, o fato de as matrizes do MEC serem cheias faz com que a resolução do problema continue sendo extremamente exigente do ponto de vista computacional, como ficou evidente nos estudos desenvolvidos por Adam et al. (2000).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-040_685_1773_1423_149.jpg)
Figura 2.8: Modelagem tridimensional de vibrações induzidas por tráfego ferroviário em túneis por meio do MEF 3D: a) modelo proposto por Yaseri et al. (2014) (2014); b) modelo proposto por Xu et al. (2015) (2015).

Diante da natureza tridimensional do problema, por um lado, e das limitações computacionais, por outro, as abordagens mais recentes e eficientes têm combinado diferentes métodos numéricos e reduzido a ordem do problema por meio da aplicação de técnicas de transformação. A opção por tais alternativas tem como custo, regra geral, a limitação da análise ao domínio elástico e a imposição de restrições quanto à variação material ou geométrica na direção longitudinal do problema.

Como o sistema túnel-maciço pode ser considerado, regra geral, como invariante na direção longitudinal ou, no limite, como um sistema periódico, em que as condições geométricas se repetem periodicamente de modo indefinido, Clouteau et al. (2005) e posteriormente Gupta et al. (2007) propõem que a simulação do sistema túnel-maciço possa ser realizada através de um modelo periódico baseado no acoplamento MEF-MEC, o qual apenas requer a solução tridimensional para uma célula de referência, sendo posteriormente a resposta expandida para qualquer parte do domínio em análise através de uma solução baseada em transformadas de Floquet. Esse método tem como vantagem a utilização do MEC para simulação do maciço, evitando, assim, a necessidade de tratamento de fronteiras artificiais dado que o método é adequado à análise de meios não definidos, aproveitando também o MEF na simulação da geometria mais complexa, como é o caso do túnel.

Embora a adoção de modelos periódicos para a descrição do sistema tridimensional represente uma redução drástica do esforço computacional em comparação com os modelos 3D puros, o método em causa ainda representa um esforço muito significativo [75], razão pela qual tem pouca aplicação prática.

Alternativamente aos modelos periódicos, o uso de técnicas de modelagem 2.5D corresponde ao método preferencial quando o meio em análise se apresenta invariante e infinito na direção longitudinal (o último requisito pode já ser ultrapassado por meio de técnicas de processamento de sinais, como recentemente proposto por Coulier et al. (2014)). Esta técnica, na qual é aplicada uma transformada de Fourier relativa à direção espacial de desenvolvimento do túnel, permite uma redução drástica do esforço computacional requerido dado que apenas a seção transversal do problema requer discretização espacial, que pode ser realizada no contexto do MEF, do MEC, do MSF, entre outros.

As primeiras aplicações da técnica 2.5D no contexto da propagação de vibrações induzidas por tráfego ferroviário em túneis devem-se a Yang et al. (2007) através de uma abordagem baseada no MEF, em que as fronteiras artificiais eram tratadas por meio do método dos elementos infinitos ou através de fronteiras viscosas. Outros autores se seguiram com abordagens semelhantes, como Bian et al. (2007); Bian et al. (2012), tendo a autora também desenvolvido alguns estudos preliminares recorrendo à mesma técnica [42]. Contudo, uma das desvantagens apontadas ao método consiste na necessidade de implementação de metodologias locais para o tratamento das fronteiras artificiais de modo a evitar a reflexão espúria das ondas que atinjam o limite da malha discretizada. Como ilustrado por Alves Costa et al. (2010), a adoção do método
dos elementos infinitos ou de fronteiras viscosas no tratamento da fronteira artificial não é uma garantia de sucesso absoluto. Por esse motivo, alguns autores têm proposto a adoção de modelos acoplados 2.5D, onde a geometria complexa é simulada por meio do MEF 2.5D, enquanto o maciço circundante ao túnel é abordado através do MEC 2.5D [81]. Uma formulação inteiramente idêntica foi adotada por Alves Costa et al. (2012a) no estudo de problemas de vibrações induzidas por tráfego ferroviário superficial. Ainda a este respeito, cabe mencionar os estudos recentes desenvolvidos no grupo de pesquisa do qual a autora participa (em colaboração com a U. Coimbra) referentes ao acoplamento 2.5D MEF-MSF [82], [83]. Nessa abordagem, o maciço geotécnico é simulado através do MSF, o qual constitui um método sem malha com elevado potencial, pois evita algumas das instabilidades numéricas típicas do MEC.

Cabe ainda fazer um breve comentário sobre o modelo 2.5D proposto por Rieckh et al. (2012), baseado em uma abordagem 2.5D MEC pura, e sobre o modelo proposto por Muller (2007), o qual recorre ao MEF 2.5D para simulação da geometria complexa e ao método do integral transformado (MIT) para a simulação do meio circundante ao túnel.

Apesar das inegáveis virtudes conceituais inerentes aos métodos numéricos acoplados, os quais permitem aproveitar as potencialidades de cada método conforme o problema em estudo, a sua implementação numérica nem sempre é fácil, exigindo por vezes técnicas complexas de acoplamento e compatibilização dos métodos. Uma alternativa viável, adotada pela autora, consiste no uso do MEF 2.5D, sendo as fronteiras artificiais tratadas pelo método dos "perfect matched layers", também este formulado na versão 2.5D, o qual permite alcançar níveis muito elevados de precisão, como se verá em capítulos posteriores da presente tese [75], [86].

### 2.2.4 Interação dinâmica maciço-edificação

As vibrações geradas pelo tráfego ferroviário propagam-se através do meio envolvente, atingindo as fundações dos edifícios existentes nas imediações e causando vibração estrutural. Regra geral, a presença das edificações não interfere na geração de vibrações, a qual resulta da interação dinâmica veículo-via [87], [88]. Admitindo a validade desse pressuposto, é possível acoplar as formulações quase tridimensionais apresentadas na seção anterior a modelos estruturais de edifícios tridimensionais.

De modo geral, ao excitar a estrutura nas suas fundações, o campo de vibração incidente que se propaga pelo solo dá origem a um problema de interação dinâmica entre o solo e a estrutura (edifício). Deste modo, a avaliação da resposta do edifício
devido a um campo de onda incidente na fundação exige a resolução de um problema de interação dinâmica solo-estrutura com caráter tridimensional.

Diante do exposto em seções anteriores, facilmente se percebe que a previsão das vibrações induzidas no interior de edifícios devido ao tráfego ferroviário é um problema de grande importância. Apesar do reconhecimento da pertinência de considerar os edifícios situados nas imediações das infraestruturas ferroviárias nos modelos de previsão, o número de estudos em que sua presença é considerada é bastante limitado. Pyl et al. (2004a); Pyl et al. (2004b) apresentaram um dos primeiros estudos sobre o assunto, tendo adotado uma formulação da interação solo-estrutura baseada em uma abordagem 3D MEF-MEC, para simular as vibrações induzidas em edifícios devido ao tráfego rodoviário. Mais recentemente, Romero et al. (2013) apresentaram uma abordagem 3D MEF-MEC, formulada no domínio do tempo, para avaliar as vibrações em edifícios devido a tráfego ferroviário de superfície. Para o caso específico de vibrações induzidas por tráfego ferroviário em túneis, os estudos realizados são ainda mais escassos, cabendo mencionar um estudo recente apresentado por Hussein et al. (2013), de caráter bidimensional, acerca das vibrações induzidas por tráfego subterrâneo em um edifício com fundações por estacas, além de duas publicações recentes da autora da presente tese [88], [93].

Este é um dos aspectos explorados na tese, com a proposta e a aplicação de metodologias de interação e, por fim, validação experimental.

### 2.2.5 Ruído re-radiado em edifícios

Já se mencionou em seção anterior que as vibrações originadas por tráfego ferroviário em túneis podem ser percebidas no interior dos edifícios sob a forma de ruído re--radiado, também por vezes designado por ruído estrutural. Note-se que o ruído re-radiado resulta, uma vez mais, de um problema de interação dinâmica, agora entre os elementos estruturais (ou não) do edifício e o ar. Embora o problema não seja tratado na presente tese, cabe observar que sua resolução não apresenta dificuldade especial, pelo menos do ponto de vista conceitual. Na verdade, a propagação de uma pressão sonora em um campo acústico é descrita pela equação de Helmoltz, que pode ser resolvida por diferentes métodos numéricos, tais como o MEF, o MEC ou o MSF. Quanto ao acoplamento fluido-estrutura, este pode ser desenvolvido de forma integral, impondo compatibilidade de velocidades entre a direção normal aos elementos estruturais e o fluido (ar) e equilíbrio de tensões (pressões, já que se trata apenas de tensões normais) ao longo da interface.

Este problema ainda não se encontra devidamente abordado no contexto do tráfego ferroviário, sendo do conhecimento da autora apenas os trabalhos preliminares conduzidos por Fiala et al. (2006); Fiala et al. (2007), aos quais se soma um trabalho muito recente (2015) apresentado por Godinho et al. (2015), resultado de colaboração entre a U. Coimbra e a U. Porto.

### 2.3 Efeitos das vibrações. Breve referência a normas

### 2.3.1 Generalidades

As vibrações geradas pela circulação do tráfego ferroviário propagam-se através do maciço envolvente, podendo atingir os edifícios situados nas proximidades e provocar vibração estrutural. Depois que as vibrações chegam às fundações, estas propagam-se através da estrutura dando origem à vibração de outros elementos estruturais. Os efeitos das vibrações nos edifícios, nos seus ocupantes e em equipamentos sensíveis localizados no seu interior são discutidos nesta seção com referência a alguns critérios e aspectos normativos aplicáveis.

### 2.3.2 Efeito das vibrações sobre os ocupantes dos edifícios

Os efeitos das vibrações sobre os ocupantes de edifícios localizados nas proximidades de infraestruturas ferroviárias dependem de fatores como: a fonte de vibração, a distância entre a fonte e a edificação, as propriedades mecânicas do maciço de fundação e as características do próprio edifício.

Como já mencionado, a percepção humana das vibrações varia conforme as frequências de vibração a que o indivíduo se encontra sujeito. Os ocupantes dos edifícios percebem as vibrações diretamente, como vibrações mecânicas (para frequências entre 1-80 Hz), ou indiretamente, como ruído re-radiado (na faixa de frequências 16-250 Hz). A vibração estrutural causada pelo tráfego ferroviário, em geral na faixa de frequências 1-80 Hz, pode ter efeitos perniciosos nos habitantes do edifício, provocando incômodo, desconforto e perturbação nas suas atividades, resultando, muitas vezes, em uma significativa redução da sua qualidade de vida, bem como da eficiência no desempenho das suas atividades, podendo ainda, em casos mais extremos e raros, afetar a saúde, dando origem a problemas graves [6], [7].

Numerosos estudos têm sido realizados com o objetivo de avaliar corretamente a resposta dos seres humanos às vibrações e ao ruído re-radiado, nos quais se baseou o desenvolvimento de algumas normas, como: a norma ISO 2631-2 [97], a norma norueguesa NS 8176 [98], a norma alemã DIN 4150-2 [99], etc.

A resposta humana às vibrações depende de diversos fatores. Alguns desses fatores são característicos da própria vibração e passíveis de uma caracterização objetiva, tais como a amplitude, a duração e o conteúdo em frequência. Por outro lado, existem fatores subjetivos (essencialmente de natureza pessoal, social ou econômica), que levam a uma percepção das vibrações variável de indivíduo para indivíduo [97].

As muitas variáveis envolvidas na avaliação da resposta humana às vibrações sugerem que o processo tem caráter parcialmente subjetivo e será diferente de pessoa para pessoa ou de um grupo de indivíduos para outro. Assim, uma abordagem estatística do problema baseada nas curvas exposição-efeito surge como uma opção adequada [98], [100]. O estudo das relações exposição-efeito envolve a análise estatística dos diferentes graus de incômodo relatados pelos ocupantes dos edifícios quando sujeitos a determinados níveis de vibração, quantificando a porcentagem de pessoas enquadradas em cada um dos graus identificados, ou, dito de outro modo, expressando a porcentagem de pessoas que percebeu as vibrações de uma determinada maneira.

Exemplos dessas curvas exposição-efeito são as apresentadas na norma norueguesa NS 8176 [98] (ver Figura 2.9 ), em que a porcentagem de pessoas que se enquadram em cada um dos graus de incômodo é representada em função do nível de vibração. A quantificação da vibração nos edifícios é realizada com base em uma variável estatística definida como $\mathrm{v}_{\mathrm{w}, 95}$ ou $\mathrm{a}_{\mathrm{w}, 95}$ conforme seja relativa a velocidades ou acelerações, respectivamente. A forma como estas grandezas são determinadas não é descrita aqui, mas pode ser consultada nas referências [100] e [98]. De modo muito sucinto, cabe mencionar que a grandeza $\mathrm{v}_{\mathrm{w}, 95}$ corresponde ao valor estatístico da velocidade máxima e é determinada com base em registros de velocidades, devendo ser consideradas pelo menos 15 passagens individuais de trens. A partir dos registros temporais obtidos durante a passagem de um dado trem, determinam-se os espectros de frequência em bandas de terço de oitava, sendo os valores multiplicados por fatores de ponderação proporcionais à resposta humana em cada banda. Assumindo uma distribuição log-normal, o valor estatístico corresponde ao quantil de 95 \%, $\mathrm{v}_{\mathrm{w}, 95}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-046_670_1679_152_212.jpg)
Figura 2.9: Curvas exposição-efeito relativas ao grau de incômodo associado a vibrações em edifícios [adaptado de NS 8176 (2005) por Santos (2013)].

Na referida norma, são definidos, com base na análise das curvas exposição-efeito, limites para os valores de $v_{w, 95}$ e $a_{w, 95}$, conforme se apresenta no Quadro 2.1.

Quadro 2.1: Limites para $v_{w, 95}$ e $a_{w, 95}$ em função da classe de vibração [adaptado de NS 8176 (2005)].
| Classe | $v_{w, 95}(\mathrm{~mm} / \mathrm{s})$ | $a_{w, 95}\left(\mathbf{m m} / \mathbf{s}^{\mathbf{2}}\right)$ |
| :--- | :--- | :--- |
| A | 0,10 | 3,6 |
| B | 0,15 | 5,4 |
| C | 0,30 | 11 |
| D | 0,60 | 21 |


Esses limites são definidos com base em uma classificação dos edifícios em quatro classes (A,B,C e D) em função de suas exigências quanto às vibrações:

i) Classe A - corresponde a condições muito boas, em que as pessoas só excepcionalmente têm percepção das vibrações;
ii) Classe B - corresponde a condições relativamente boas, embora as pessoas possam ser incomodadas pelas vibrações;
iii) Classe C - corresponde aos limites recomendados para vibrações em novos edifícios habitacionais próximos de infraestruturas planejadas ou já existentes;
iv) Classe D - corresponde a condições mínimas que devem ser garantidas em edifícios habitacionais já existentes.

A verificação da admissibilidade ou não dos níveis de vibrações é realizada comparando o valor $v_{w, 95}$ ou $a_{w, 95}$ com o limite correspondente.

Cabe, no entanto, observar que a aplicação dos limites apresentados deve sempre considerar os diferentes contextos com a devida prudência, uma vez que a resposta
humana às vibrações é condicionada por diversos fatores subjetivos, de natureza social, cultural e econômica.

Por último, apresentam-se brevemente os principais aspectos de algumas normas aplicáveis nesse contexto. A norma ISO 2631 define procedimentos genéricos para a medição e avaliação de vibrações do corpo humano (ISO 2631-1 [102]) e, de uma forma mais específica, para a avaliação das vibrações que afetam o conforto de pessoas no interior de edifícios (ISO 2631-2 [97]). Contudo, não são apresentados limites que permitam determinar quais níveis de vibração são admissíveis. Em Portugal, encontra-se em vigor a NP-ISO 2631-1 [103], que corresponde à tradução do documento internacional. Cabe mencionar ainda as normas norueguesa NS 8176 [98] e alemã DIN 4150-2 [99], cujos princípios são em parte semelhantes aos das normas ISO, apresentando, no entanto, critérios e limites para avaliar a admissibilidade dos níveis de vibração.

### 2.3.3 Efeito das vibrações em equipamentos sensíveis

Para uma faixa de frequências que pode chegar a 200 Hz, as vibrações induzidas pelo tráfego ferroviário podem interferir no funcionamento normal de equipamentos sensíveis no interior de edifícios situados nas imediações da infraestrutura, podendo inclusive danificá-los ou comprometer seu funcionamento normal. Possíveis efeitos são a redução da precisão e da velocidade de leitura da escala ou mesmo a impossibilidade de efetuar essa leitura, o que impede seu funcionamento [104]. Assim, quando se trata de alguns equipamentos mais sensíveis, as vibrações podem tornar o seu uso impraticável. No caso de instrumentos de precisão, como equipamentos muito sensíveis utilizados em laboratórios de pesquisa e na indústria microeletrônica, nanotecnológica, médica e biofarmacêutica, como os microscópios eletrônicos, até mesmo níveis de vibração muito reduzidos, bastante inferiores ao limiar de percepção humana de vibrações, constituem motivo de grande preocupação. Na Figura 2.10 apresentam-se as imagens registradas por um microscópio eletrônico, com amplificação de 150 000, em condições normais e quando ocorre perturbação no seu funcionamento [104].

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-048_1163_1739_123_163.jpg)
Figura 2.10: Efeito das vibrações em instrumentos sensíveis: a) imagem normal; b) imagem com perturbação [104].

A norma ISO 10811 [11], [12] abrange as questões de medição, avaliação e classificação de vibrações em edifícios onde funcionem ou possam vir a funcionar equipamentos sensíveis. Habitualmente, os manuais com as recomendações do fabricante fornecem as informações necessárias acerca do nível máximo de vibração admissível no caso de equipamentos sensíveis. Por ser frequentemente usado nesse contexto, apresenta-se a seguir o critério desenvolvido por Gordon (1991, 1999). Este critério, desenvolvido para avaliar o efeito das vibrações no funcionamento de equipamentos sensíveis, baseia-se em um conjunto de curvas genéricas, denominadas curvas VC (vibration criterion), definidas para diferentes classes de equipamentos. Estas curvas são representadas de forma semelhante à recomendada na norma ISO 2631-2 [97], para os efeitos das vibrações sobre as pessoas que habitam os edifícios. A vibração é quantificada com base no valor RMS da velocidade, sendo as curvas definidas em função da frequência de vibração, sob a forma de um espectro de frequências em bandas de um terço de oitava. A Figura 2.11 mostra as referidas curvas, assim como as relativas ao conforto de pessoas em edifícios definidas na norma ISO.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-049_1898_1447_131_312.jpg)
Figura 2.11: Curvas genéricas VC para equipamentos sensíveis e curvas relativas ao conforto de pessoas em edifícios definidas na norma ISO (retirado de [14]).

As curvas VC são genéricas, uma vez que se aplicam a um conjunto de cinco classes (da VC-A à VC-E), abrangendo cada uma delas uma vasta faixa de equipamentos. Para que um local cumpra os requisitos de uma determinada classe de equipamentos, o espectro de velocidade medido (ou previsto) em bandas de um terço de oitava deve situar-se abaixo da curva definida como adequada para essa classe (ver Figura 2.11). As curvas foram estabelecidas de modo a serem válidas para o equipamento mais sensível de cada categoria.

O Quadro 2.2 apresenta uma descrição das características associadas às diferentes categorias de equipamentos e, portanto, do campo de aplicação de cada curva.

O critério que se acaba de descrever, como já mencionado, tem sido frequente-mente utilizado e tem-se revelado muito útil, sobretudo nas situações em que há pouca informação acerca dos equipamentos.

Quadro 2.2: Classes de equipamentos associadas às curvas VC e descrição dos critérios das curvas relativas ao conforto de pessoas em edifícios da norma ISO (adaptado de [14]).
| Curvas | Amplitude RMS $[\mu \mathrm{m} / \mathrm{s}]$ <br> (1) | Dimensão de detalhe <br> $\boldsymbol{[} \boldsymbol{\mu} \mathbf{m} \boldsymbol{]}^{(\mathbf{2})}$ | Descrição de uso |
| :--- | :--- | :--- | :--- |
| Espaços de trabalho sem exigências específicas | 800 | N/A | Vibrações claramente perceptíveis. Adequado para espaços de trabalho e áreas pouco sensíveis. |
| Escritórios (ISO) | 400 | N/A | Vibrações perceptíveis. Apropriado para escritórios e áreas pouco sensíveis. |
| Residências (ISO) | 200 | 75 | Vibrações muito pouco perceptíveis. Apropriado para zonas residenciais durante o período noturno na maioria das situações. Provavelmente adequado para equipamentos de informática e microscópios de baixa ampliação (20X). |
| Teatros / Salas de espetáculos / Hospitais (ISO) | 100 | 25 | Vibrações não perceptíveis. Apropriado para áreas sensíveis quanto ao sono. Adequado, na maioria dos casos, para microscópios até 100X e para outros equipamentos de baixa sensibilidade. |
| VC-A | 50 | 8 | Adequado para microscópios ópticos até 400X, microbalanças, balanças ópticas, alinhadores de projeção, etc. |
| VC-B | 25 | 3 | Apropriado para microscópios ópticos até 1000X, equipamentos de inspeção e litografia (incluindo processadores) até $3 \mu \mathrm{~m}$ de largura da linha |
| VC-C | 12,5 | 1 | Adequado para a maioria dos equipamentos de inspeção e litografia (incluindo microscópios eletrônicos) até $1 \mu \mathrm{~m}$ de dimensão de detalhe. |
| VC-D | 6 | 0,3 | Apropriado em muitos casos para a maioria dos equipamentos sensíveis, incluindo microscópios eletrônicos |


| Curvas | Amplitude RMS $[\mu \mathrm{m} / \mathrm{s}]$ <br> (1) | Dimensão de detalhe <br> $\boldsymbol{[} \boldsymbol{\mu} \mathbf{m} \boldsymbol{]}^{(2)}$ | Descrição de uso |
| :--- | :--- | :--- | :--- |
|  |  |  | (TEM's e SEM's) e sistemas de feixes de elétrons, trabalhando no limite das suas capacidades. |
| VC-E | 3 | 0,1 | Critério difícil de atingir em muitas situações. Presumido adequado para a generalidade das exigências dos equipamentos sensíveis, abrangendo sistemas de alvo (controle remoto, laser, etc) e outros sistemas que requerem uma estabilidade dinâmica extraordinária. |

> ${ }^{(1)}$ Medida em bandas de frequência de terço de oitava, no intervalo entre 8 Hz e 100 Hz.
> ${ }^{(2)}$ As dimensões de detalhe correspondem à largura da linha no caso de fabricação de sistemas microeletrônicos e ao tamanho das partículas no caso de pesquisa médica ou farmacêutica, etc. Os valores indicados levam em conta a observação de que os requisitos relativos às vibrações de muitos equipamentos dependem da dimensão de detalhe do processo.

### 2.3.4 Dano em edificações devido a vibrações induzidas por tráfego

O risco de danos em edifícios resulta necessariamente de níveis de vibração extremamente elevados ou de um número bastante considerável de ciclos com magnitude elevada, o que, de fato, apenas ocorre em condições pouco usuais de operação das infraestruturas ferroviárias [8]. Embora seja frequente a preocupação, por parte dos habitantes que sentem as vibrações originadas pelo tráfego ferroviário, com a possibilidade destas causarem danos ao edifício, geralmente tal receio não é justificado. De fato, uma a duas ordens de grandeza separam os níveis de vibração capazes de danificar os edifícios e os níveis associados à percepção humana, o que implica níveis de vibração intoleráveis para os habitantes das referidas edificações [6], [7]. Desta forma, e como já referido anteriormente, não se esperam danos estruturais em edifícios provocados por vibrações resultantes de tráfego ferroviário.

Os valores-limite para a velocidade de vibração indicados na norma DIN 4150-3 [105] (citado por [101]), definidos em função do tipo de estrutura e das frequências dominantes da vibração, corroboram a afirmação anterior, uma vez que se constata serem significativamente superiores aos associados às vibrações induzidas pelo tráfego ferroviário. Os limites propostos no referido documento foram estabelecidos empiricamente, sendo que a experiência mostrou que, caso sejam respeitados, não ocorrerão danos que afetem a funcionalidade do edifício.

A norma ISO 4866 [106] prescreve orientações para a medição de vibrações e avaliação dos seus efeitos em edifícios. De acordo com esta norma, a resposta dos edifícios às vibrações que lhes são transmitidas pelos maciços depende tanto das características do edifício e da sua fundação (sendo neste caso os aspectos fundamentais a considerar: o tipo de edifício e de fundações, as frequências naturais e o amortecimento do edifício, as dimensões em planta do edifício e o tipo de solo de fundação) como das características da excitação, a saber: tipo de excitação (determinística ou aleatória), duração de atuação da excitação (permanente ou transitória), faixas de frequências e amplitudes das vibrações. Quanto a orientações gerais relativas às propriedades dinâmicas de edifícios comuns, Jones (1994) refere que os modos de ressonância típicos dos edifícios como um todo, ou seja, como uma massa única apoiada na fundação, situam-se em torno de 4 Hz, ocorrendo a ressonância das lajes para frequências na faixa de 15-30 Hz e, no caso de paredes e janelas, para frequências acima de 40 Hz.

Esta diversidade de fatores envolvidos, à qual se deve acrescentar o estado de conservação dos próprios edifícios, justifica, em boa parte, o modo distinto e aparentemente errático como, muitas vezes, as vibrações que se propagam através do maciço se repercutem nos edifícios afetados.

Como se pode observar, a avaliação dos danos provocados pelas vibrações induzidas pelo tráfego ferroviário nos edifícios não é tarefa fácil, podendo, contudo, afirmar-se que, caso ocorram, terão essencialmente um caráter não estrutural.

Cabe, no entanto, observar que os limites para a velocidade de vibração apresentados em documentos normativos são, de um modo geral, obtidos empiricamente, não resultando de uma tentativa de compreensão do comportamento dinâmico das estruturas e da sua interação com o solo. Consequentemente, os limites apresentados correspondem a valores da velocidade de vibração para os quais não ocorrem danos, sendo recomendados estudos mais detalhados caso os limites propostos sejam ultrapassados, pois a ultrapassagem não significa necessariamente a ocorrência de qualquer dano. Edifícios antigos e históricos devem, contudo, ser objeto de estudos específicos, mais detalhados e cuidadosos, uma vez que podem apresentar maior sensibilidade a níveis de vibração mais baixos.

Reitera-se a ideia de que as vibrações originadas pela circulação de transportes ferroviários não resultam, na generalidade das situações, em um problema para a integridade estrutural dos edifícios, mas sobretudo em um problema de perturbação ambiental, em que o desconforto dos habitantes e o mau funcionamento de equipa-
mentos sensíveis são os principais motivos de preocupação e, portanto, os aspectos determinantes.

### 2.4 Medidas de mitigação

### 2.4.1 Generalidades

O impacto das vibrações nas estruturas pode traduzir-se, como abordado na seção anterior, em desconforto dos ocupantes, mau funcionamento de equipamentos sensíveis ou, em casos extremos, danos (estruturais ou não estruturais) nos edifícios. Desta forma, a identificação antecipada desses problemas ambientais é de grande importância, podendo levar à necessidade de definir medidas para a redução ou eliminação dos seus efeitos prejudiciais. Aliás, esse é um dos principais objetivos visados na concepção e desenvolvimento de modelos numéricos para a previsão de vibrações: permitir a tomada de decisões fundamentadas sobre a implementação de medidas de mitigação.

Vários métodos têm sido desenvolvidos para controlar o problema das vibrações induzidas pelo tráfego ferroviário subterrâneo, podendo ser encontrada uma revisão ampla de diferentes medidas em Thompson (2010). Regra geral, as medidas de mitigação podem ser agrupadas nas três categorias seguintes: i) medidas de mitigação na fonte; ii) medidas de mitigação no trajeto de propagação entre a fonte e o receptor; iii) medidas de mitigação no receptor (edifício). A seguir, apresentam-se algumas das medidas mais comumente usadas em cada uma das categorias.

### 2.4.2 Medidas de mitigação na fonte

A implementação de medidas de mitigação na fonte introduz alterações nas vibrações geradas, originando a redução da energia emitida para o terreno, o que se traduz em uma redução do campo de vibração incidente em qualquer edifício situado nas proximidades, permitindo assim que um grande número de edifícios se beneficie da medida. Existem vários métodos para efetuar a mitigação de vibrações na fonte, uns que se baseiam na introdução de elementos resilientes na via (isolamento da via), outros associados, por exemplo, a procedimentos de manutenção da via e do trem, a alterações nas suspensões dos veículos e ao reforço do terreno de fundação. É frequente recorrer à combinação de duas ou mais das diferentes medidas referidas, brevemente apresentadas a seguir.

O isolamento da via pode ser realizado através da introdução de elementos resilientes em diversos níveis da via, correspondendo a soluções distintas em termos de custo e de desempenho. A inserção de elementos elásticos tem como objetivo a
introdução de uma nova frequência ressonante na via, conduzindo assim à minimização da energia transferida ao terreno na faixa de frequências superior à frequência ressonante introduzida, como se ilustra esquematicamente na Figura 2.12. Contudo, a obtenção de sistemas eficazes em faixas de frequências muito baixas pode revelar-se, em muitos casos, extremamente difícil, dado que a introdução de elementos muito flexíveis conduz a deslocamentos da via nem sempre compatíveis com os requisitos de estabilidade e de redução do consumo energético. A solução mais adequada resulta de um compromisso entre a desejada redução dos níveis de vibração transmitidos e a garantia do comportamento desejado para a própria via [93], [109], [110], [111].

Passando do conceito à sua execução, detalham-se a seguir algumas das soluções mais usuais.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-054_745_1479_972_288.jpg)
Figura 2.12: Redução de vibrações através da introdução de elementos elásticos na via (retirado de [112]).

A intervenção pode consistir na introdução de elementos resilientes diretamente sob o trilho. No caso de uma via em laje com fixação direta, podem ser consideradas soluções de apoio contínuo do trilho em um elemento resiliente. A espessura da palmilha elástica é usualmente limitada para prevenir deformação excessiva, o que também limita o isolamento proporcionado. Desse modo, e dada a massa não muito elevada do trilho, as soluções com palmilha elástica são eficientes na faixa de frequências mais elevada, acima dos 60-80 Hz [108], [111], sendo esperada uma redução máxima da ordem de 4 dB na faixa de frequências até os 250 Hz [108]. Uma das desvantagens da utilização de palmilhas elásticas muito flexíveis deve-se ao fato de permitirem uma maior vibração do trilho, levando ao aumento do ruído irradiado pelo trilho.

O sistema de via com trilho embutido, que corresponde a uma solução com apoio contínuo dos trilhos, é também uma tecnologia que tem sido considerada quando
se trata da construção de novas linhas de metrô. Neste sistema, os trilhos já não se encontram apoiados nos dormentes de modo discreto, mas sim embutidos em toda a sua extensão em material elástico, como ilustrado na Figura 2.13. Este método proporciona um excelente isolamento contra o ruído e as vibrações. Por outro lado, sistemas resilientes de fixação dos trilhos também podem apresentar alguma eficiência do ponto de vista da mitigação de vibrações. Os recentes avanços nos sistemas de fixação, de que é exemplo o sistema Vanguard, têm mostrado resultados promissores. O sistema Vanguard, ilustrado na Figura 2.14, corresponde a um sistema de fixação em que é garantido não apenas o apoio vertical do trilho no dormente, mas também uma restrição rotacional. As potencialidades de tal sistema na mitigação de vibrações induzidas por tráfego ainda estão em fase exploratória.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-055_494_816_978_171.jpg)
Figura 2.13: Sistema de trilho embutido.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-055_544_856_958_1057.jpg)
Figura 2.14: Sistema de fixação Vanguard.

Em outro nível, podem ser colocadas palmilhas elásticas sob os dormentes, o que proporciona melhor desempenho em termos de isolamento. Na verdade, o aumento da massa sobre o elemento resiliente é sempre vantajoso pois permite reduzir a frequência de ressonância do sistema. A colocação de elementos resilientes debaixo dos dormentes permite assegurar a mitigação das vibrações em uma importante faixa de frequências, entre 31,5 Hz e 125 Hz [110], [111].

O sistema de via em laje flutuante, no caso de vias em laje, ou a introdução de mantas sob o lastro, em vias com lastro, são as soluções de isolamento que apresentam um melhor desempenho. O sistema de via em laje flutuante tornou-se uma técnica comum pela sua elevada eficácia no isolamento de vibrações devidas ao tráfego subterrâneo. As soluções de via em laje flutuante consistem em apoiar a laje de concreto em elementos com propriedades resilientes ou em molas metálicas (colocados entre a laje e o fundo do túnel). Os elementos resilientes são normalmente aplicados sob a forma de uma manta contínua ou sob a forma de apoios elásticos discretos. A laje de concreto pode ser contínua, quando executada in situ, ou descontínua, no caso de ser
construída com seções pré-fabricadas. A Figura 2.15 ilustra a instalação de uma laje flutuante.

Este é geralmente considerado o método mais eficiente para a mitigação de vibrações induzidas por tráfego ferroviário em túneis. O sistema de via em laje flutuante tem sido adotado em várias das linhas recentemente construídas que atravessam zonas mais problemáticas das cidades. Por exemplo, uma via em laje flutuante foi implementada na linha 4 do metrô de Beijing (Pequim), dada a sua proximidade ao Laboratório de Física da Universidade de Beijing. A eficiência desta medida de isolamento é discutida em detalhe em um capítulo posterior da presente tese, com a apresentação de um estudo paramétrico que considera diferentes soluções de via em laje flutuante.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-056_591_1764_964_152.jpg)
Figura 2.15: Instalação de um sistema de via em laje flutuante [49].

Em soluções de via com lastro, a solução análoga à via em laje flutuante é obtida pela introdução de mantas resilientes sob a camada de lastro. Esta solução é muito usada como medida de isolamento em tráfego à superfície e em alguns túneis ferroviários dotados de via com lastro, em que as referidas mantas são empregadas em zonas mais sensíveis, como por exemplo quando o túnel está mais próximo da superfície do terreno. Vias com lastro são encontradas em túneis ferroviários mais antigos, como é o caso, por exemplo, do metrô de Paris. Este sistema de isolamento dá origem a frequências de ressonância baixas a moderadas (na faixa entre 20 Hz e 50 Hz), permitindo uma elevada eficiência na mitigação de vibrações [110]. Segundo Alves Costa et al. (2012b), a eficiência da medida pode ser aumentada introduzindo a manta sob a camada de sublastro, visto que se consegue um aumento considerável da massa sobre o elemento resiliente e, consequentemente, uma diminuição da frequência ressonante introduzida.

A mitigação de vibrações na fonte pode também ser conseguida através de procedimentos normalmente associados à manutenção da via e do trem. Com efeito, a
degradação das superfícies dos trilhos e das rodas dos trens conduz a um aumento dos níveis de vibração gerados. Deste modo, a adoção de medidas que permitam evitar que esse aumento seja progressivo ao longo do período de funcionamento da infraestrutura é, sem dúvida, importante para a minimização de vibrações. Entre essas medidas estão a esmerilagem do trilho, de forma a eliminar ou atenuar as irregularidades que vão surgindo durante a operação, e também a retificação das rodas do trem, procurando regularizar o seu contorno circular, suavizar a superfície e eliminar zonas com achatamentos. Os procedimentos referidos, segundo Bahrekazemi (2004), são eficazes para as faixas de frequências mais elevadas, superiores a 100 Hz. Quanto a essa conclusão, cabe observar que o autor focou a sua análise em questões de desgaste ondulatório, ou seja, irregularidades de pequeno comprimento de onda. Caso a manutenção de via incida também nas irregularidades de maior comprimento de onda, então a medida pode ser eficaz em uma faixa de frequências muito inferior aos 100 Hz anteriormente referidos.

Modificações na concepção dos veículos, por exemplo, nas suspensões e nas massas não suspensas, podem também ser executadas para reduzir as vibrações. A diminuição da rigidez da suspensão dos veículos e, principalmente, a redução das massas não suspensas (rodas e eixos) permitem uma redução muito significativa das vibrações induzidas por tráfego ferroviário [37].

### 2.4.3 Medidas de mitigação no trajeto de propagação

A mitigação de vibrações induzidas pelo tráfego ferroviário pode também ser conseguida através da interrupção do trajeto de propagação entre a fonte (via férrea) e o receptor (edifícios), ou seja, impedindo que as vibrações alcancem o receptor a proteger. Essa interrupção pode ser realizada recorrendo à instalação de elementos que funcionam como obstáculos à propagação das ondas pelo meio envolvente, genericamente designados por barreiras, os quais podem permitir uma redução considerável dos níveis de vibração que atingem as edificações. Neste contexto, algumas das medidas mais comuns consistem na abertura de trincheiras, que podem ser preenchidas ou não, e na execução de cortinas de estacas [114], [115], [116], [117].

A implementação desse tipo de solução tem como objetivo controlar as vibrações intervindo na propagação das ondas pelo maciço, buscando-se, com a introdução das referidas barreiras, refletir, amortecer e dispersar as ondas incidentes, reduzindo deste modo a magnitude das vibrações e a dimensão da área afetada.

Cabe destacar que esses métodos são sobretudo aplicados à mitigação de vibrações induzidas por tráfego superficial, que constitui seu principal campo de aplicação.

Sua aplicabilidade e eficiência são muito limitadas no caso de tráfego em túneis. Com efeito, como as barreiras - trincheiras ou estacas - são executadas em profundidade a partir da superfície do terreno, pode presumir-se que irão funcionar bem como obstáculo à propagação das ondas junto à superfície do maciço, onde há uma clara predominância das ondas de Rayleigh. Estas ondas, como já referido em seção anterior, são de grande importância no caso das vibrações geradas por tráfego superficial, dado que transportam a maior parte da energia irradiada. Considerando que as ondas superficiais têm menor amortecimento geométrico, quando comparado com o das ondas de corpo, elas tornam-se perceptíveis a distâncias muito grandes, sendo, portanto, de grande relevância para os problemas de isolamento das fundações dos edifícios. Note-se, a propósito, que no caso de tráfego superficial as barreiras podem ser utilizadas como medida de isolamento ativo, quando localizadas junto à fonte, atuando na redução da energia das ondas propagantes, ou de isolamento passivo, quando localizadas junto à estrutura receptora, minimizando as vibrações que se transmitem ao edifício.

Um cenário de tráfego ferroviário subterrâneo corresponde a uma situação distinta da indicada no parágrafo anterior e altera as características do problema. Em primeiro lugar, todo o problema é condicionado pelo fato de a fonte de vibração estar localizada no interior do maciço, o que se traduz em diferenças significativas não só na geração de ondas, mas também no modo de propagação e recepção das ondas pelas fundações dos edifícios. Conforme anteriormente abordado, no interior do maciço geram-se ondas de corpo (ondas P e S), resultando as ondas de Rayleigh do acoplamento entre as ondas P e SV quando estas alcançam a superfície livre do maciço. Por conseguinte, a contribuição relativa da energia das ondas de Rayleigh é, nestas circunstâncias, claramente inferior, embora dependa da profundidade do túnel, ou seja, será tanto maior quanto menos profundo for o túnel.

Por outro lado, as ondas de corpo (ondas P e S) ganham relevância no presente contexto, dado que podem no seu trajeto atingir diretamente as fundações dos edifícios (ver Figura 2.16), e a importância desse aspecto depende da distância entre o edifício e a fonte e também da profundidade do túnel. Percebe-se assim que, nestas condições, a aplicabilidade das soluções anteriormente mencionadas fica condicionada e a sua eficácia comprometida. Deste modo, embora se possa afirmar que no caso de tráfego em túneis os métodos em causa podem ainda ser aplicados, cabe observar, no entanto, que, além de apenas ser admissível a colocação das referidas barreiras próximas do receptor (edifícios), estes elementos somente apresentam um desempenho eficiente
caso o edifício se encontre a uma distância significativa da fonte, onde aliás, conforme já mencionado, os efeitos das ondas de Rayleigh, que são menos atenuadas com o aumento da distância, predominam.

Assim, a concepção deste tipo de solução enfrenta um cenário de maior incerteza no que diz respeito à sua eficiência, dada a quantidade de fatores intervenientes no problema, como a profundidade do túnel e também a sua distância ao receptor, que influenciam o modo como as ondas se vão propagar e a forma como vão atingir o receptor (ver Figura 2.16), o que dificulta a previsão do desempenho de uma medida deste tipo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-059_739_1487_812_291.jpg)
Figura 2.16: Representação esquemática de solução de isolamento através de trincheira ou barreira vertical.

Observando a Figura 2.16, é possível perceber, como já mencionado, que a introdução das referidas barreiras só será eficiente caso haja um afastamento significativo do edifício em relação ao túnel, tanto maior quanto mais profundo for o túnel. Mesmo no caso de túneis mais superficiais, em que a energia transportada pelas ondas de Rayleigh é, em princípio, superior, é também necessário, para que a barreira possa atuar, que o edifício se encontre distante do túnel, sob pena de a barreira não cumprir a sua função.

Assim, no entendimento da autora, torna-se interessante o estudo de uma solução que corresponda a uma barreira horizontal posicionada na zona subjacente à edificação, como ilustrado na Figura 2.17, cuja rigidez em comparação com a do terreno natural induza uma reflexão forçada das ondas de corpo que a atinjam. A estratégia de implementação pode passar por uma solução combinada, em que os métodos de mitigação na fonte possam ser complementados com uma barreira horizontal, dependendo, como é evidente, das condições específicas do problema em análise.

O princípio de funcionamento de uma solução de mitigação como a ilustrada na Figura 2.17 é inteiramente semelhante ao das barreiras verticais rígidas: por um lado, a diferença de rigidez entre o material da barreira e o do terreno proporciona uma reflexão forçada da onda; por outro, a rigidez de flexão da barreira permite que esta se comporte como um meio que conduz a energia, evitando assim a sua propagação para o meio que se pretende proteger [114], [118]. A execução da solução, embora complexa, pode ser alcançada por meio de injeções ou, nos casos em que tal seja possível, por meio de jet-grounting.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-060_784_1483_757_294.jpg)
Figura 2.17: Representação esquemática da mitigação proporcionada por uma barreira horizontal.

Por último, cabe mencionar brevemente outros tipos de soluções que vêm sendo estudadas e apresentadas. Takemiya (2004) propôs um método que consiste em uma construção antivibrações, baseado na utilização de blocos de controle de vibrações, normalmente designados por WIB (Wave Impeding Blocks), e cujo objetivo é reduzir as vibrações ao redor da estrutura. O bloco de controle de vibrações é uma estrutura alveolar, em que os espaços estão preenchidos com um material resiliente. A ideia básica é que as ondas fiquem confinadas na estrutura alveolar e sejam amortecidas devido ao elevado amortecimento material dos elementos resilientes introduzidos. Soluções alternativas, tais como a colocação de blocos à superfície do terreno também vêm sendo pesquisadas como possibilidades na mitigação de vibrações associadas à propagação de ondas de Rayleigh [120], [121].

### 2.4.4 Medidas de mitigação nos edifícios

A mitigação de vibrações pode também ser efetuada no receptor (edifício). Essa atuação pode ser interessante sobretudo nos casos em que apenas seja afetado um edifício ou um pequeno conjunto de edifícios.

As soluções mais comuns para minimizar a vibração estrutural devido ao campo de vibração incidente baseiam-se no isolamento das fundações do edifício ou, alternativamente, de um compartimento, através de um sistema de apoios elásticos. A Figura 2.18 ilustra uma dessas aplicações, em que sistemas de isolamento são instalados nos pilares de um edifício.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-061_806_1492_814_289.jpg)
Figura 2.18: Sistema de isolamento no receptor por meio da instalação de apoios resilientes.

O isolamento do edifício é geralmente conseguido através da introdução de molas de aço ou suportes resilientes entre as fundações e o restante da estrutura do edifício [122]. Este sistema de isolamento é muitas vezes utilizado para isolar e proteger edifícios de vibrações transmitidas pelo maciço em áreas propensas a sismos (zonas sísmicas), podendo contudo também ser utilizado para mitigação de vibrações devidas a atividades humanas. Com este tipo de solução pretende-se projetar um sistema cuja frequência natural seja significativamente inferior à menor frequência de vibração a mitigar [113].

Como exemplo, cabe mencionar que o Hospital da Luz, recentemente construído em Lisboa, apresenta uma solução de mitigação deste tipo. A solução de isolamento implementada foi inicialmente concebida para o isolamento sísmico do edifício, mas também constitui uma medida de mitigação de vibrações induzidas por tráfego.

Talbot \& Hunt (2009) apresentam uma revisão dos estudos sobre isolamento das fundações do edifício, em que argumentam que os modelos simples, como sistemas
de massa-mola com um grau de liberdade, não fornecem uma indicação correta do desempenho do sistema de isolamento, dado que não levam em conta a flexibilidade do edifício e as características de propagação de ondas. Nesse trabalho abordam ainda as alterações no campo de vibrações do maciço devido ao isolamento das fundações do edifício, afirmando que a construção de um edifício sem esse isolamento diminui as vibrações no maciço devido ao aumento de seu efeito de inércia.

Os mesmos autores, Talbot \& Hunt (2001), estudaram a aplicação de soluções de isolamento das fundações do edifício, concluindo que os níveis de vibração nos edifícios são fortemente influenciados pela frequência natural do sistema de isolamento da fundação, ainda que o amortecimento do material usado no isolamento tenha um efeito reduzido no desempenho da medida. Alternativamente ao isolamento de base, também é possível a aplicação de uma medida de mitigação local, ou seja, isolando apenas uma parte do edifício, como por exemplo um compartimento específico (sala de concertos, estúdio de gravação, etc). Esta medida consiste na implementação de medidas de isolamento no compartimento em consideração, de modo a que este apresente um comportamento dinâmico distinto do restante do edifício. Na Figura 2.19 esquematizam-se soluções estruturais que podem ser implementadas no presente contexto. Cabe destacar o sistema ilustrado na Figura 2.19b, designado por "box-in--box", em que uma nova estrutura completa é construída no interior da existente, com elementos resilientes interpostos entre ambas. Este tipo de solução é particularmente eficiente na mitigação de ruído re-radiado.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-062_632_1750_1729_158.jpg)
Figura 2.19: Isolamento local: a) laje do compartimento; b) sistema "box-in-box".

Esta técnica é, portanto, adequada a situações em que os elevados níveis de vibração são problemáticos em zonas específicas do edifício, comprometendo, por exemplo, o funcionamento de equipamentos com localização específica ou a funcionalidade de compartimentos com exigências especiais. Duas grandes salas de concertos exempli-
ficam a aplicação desta técnica: o "Milton Court - Guildhall School of Music and Drama", em Londres, e o Fórum Internacional de Tóquio [125].

Cabe salientar que a adoção de soluções de isolamento no receptor exige prudência e deve sempre ser bem ponderada, uma vez que a alteração das condições de apoio do edifício conduz a uma modificação no seu comportamento modal. Também é fundamental garantir que a medida a implementar não compromete a estabilidade do próprio edifício, nem origina outros problemas, como por exemplo deslocamentos diferenciais elevados entre os diferentes elementos estruturais.

### 2.5 Considerações finais

Neste capítulo, apresentou-se um panorama do problema tratado ao longo desta tese. Após sua contextualização, em que se enfatizou e justificou a necessidade de pesquisa sobre o tema para a concepção de modelos integrados que permitam estimar, no interior de edifícios, as vibrações induzidas pelo tráfego ferroviário em túneis, fez-se uma resenha das diferentes tipologias de modelos de previsão que vêm sendo propostos ao longo das últimas duas décadas.

O levantamento bibliográfico realizado evidencia a atualidade do tema de pesquisa, existindo uma clara carência de modelos mecanicistas que permitam representar de forma fiel os principais aspectos do problema, sem, contudo, uma complexidade tão elevada que torne proibitiva sua aplicação prática. Esse é um dos objetivos perseguidos na presente tese.

Por último, apresentou-se uma revisão crítica das principais medidas de mitigação passíveis de serem aplicadas para a minimização dos níveis de vibração percebidos no interior de edifícios.

## 3 Modelagem da resposta dinâmica do sistema via-túnel-maciço

### 3.1 Contextualização

Como mencionado nos capítulos anteriores, a geração e a propagação de vibrações devidas ao tráfego em túneis constituem um problema complexo, em razão do grande número de fatores que influenciam a resposta do sistema, em particular: i) os mecanismos de geração da excitação dinâmica do trem; ii) a interação dinâmica entre o túnel e o maciço circundante; iii) a geometria e localização do túnel; iv) a heterogeneidade geométrica e material inerente às formações geotécnicas, etc.

Dada a complexidade do problema, grande parte dos estudos desenvolvidos até meados da década passada foi conduzida experimentalmente, medindo-se vibrações induzidas por tráfego e buscando-se estabelecer correlações empíricas que servissem como ferramentas de previsão [19]. Contudo, a diversidade de situações possíveis, dada a quantidade de parâmetros envolvidos no problema, torna extremamente difícil o desenvolvimento de modelos empíricos de previsão.

Mais recentemente, a tendência internacional aponta no sentido do desenvolvimento de metodologias semianalíticas e numéricas de previsão da resposta dinâmica induzida pelo tráfego em túneis. No campo dos modelos semianalíticos e analíticos, embora se reconheçam progressos bastante significativos [19], [28], a formulação de base deste tipo de modelos implica sempre restrições consideráveis nas geometrias admissíveis, afastando-se assim consideravelmente da realidade física. Consequentemente, dada a sua versatilidade e facilidade de aplicação a geometrias arbitrárias, os métodos numéricos se destacam. Porém, o caráter tridimensional dos problemas levanta consideráveis dificuldades computacionais, inerentes à grande dimensão dos domínios em consideração, tal como pode ser verificado nos recentes estudos realizados por Yaseri et al. (2014) e por Xu et al. (2015). Como tal, torna-se necessário e justificável o desenvolvimento de ferramentas numéricas, especialmente concebidas e/ou adaptadas, para a análise de estruturas com desenvolvimento infinito, como pode geralmente ser admitido para as infraestruturas ferroviárias [28], [42], [52], [74], [126].

Considerando as restrições referidas, a comunidade técnico-científica dedicou, ao longo da última década, um esforço considerável ao desenvolvimento de métodos numéricos e semianalíticos para a modelagem de estruturas com desenvolvimento infinito quando sujeitas a solicitações dinâmicas. A importância crescente deste
problema está relacionada, como já foi referido, com a atual expansão de infraestruturas de transporte modernas como, por exemplo, de transporte ferroviário de alta velocidade e linhas de metrô. Modelar estas estruturas é difícil, pela razão já apontada (caráter infinito da sua geometria) e igualmente por causa das cargas móveis a que são submetidas. No entanto, essas dificuldades têm sido satisfatoriamente superadas com hipóteses frequentemente utilizadas, em particular a de que o meio é periódico ou invariante ao longo da direção de desenvolvimento da estrutura, o que permite reduzir drasticamente o esforço de cálculo associado à solução numérica do problema tridimensional.

Os modelos periódicos para a simulação dinâmica de túneis têm sido amplamente aplicados por Gupta et al. (2007); Gupta et al. (2009); Gupta et al. (2010), utilizando um modelo numérico tridimensional híbrido, do tipo MEF-MEC, anteriormente desenvolvido por Clouteau et al. (2005). Esta abordagem utiliza o método dos elementos finitos (MEF) para a simulação de geometrias complexas, como é o caso de um túnel, recorrendo ao método dos elementos de contorno (MEC) para a simulação do meio indefinido, correspondente ao maciço geotécnico. Apesar da elevada precisão deste tipo de modelos, o esforço numérico inerente é ainda assim muito significativo, desencorajando a sua utilização em aplicações práticas.

Alternativamente, para estruturas longitudinalmente invariantes, uma abordagem 2.5D pode ser aplicada, sendo a solução tridimensional obtida através da discretização numérica da seção transversal combinada com a transformação de Fourier do domínio ao longo da direção longitudinal. Este método tem sido utilizado no estudo de vários casos de infraestruturas de transporte ferroviário, tanto à superfície como em túnel [34], [42], [80], [81], [129], [130]. Esta metodologia pode ser aplicada tanto a modelos baseados no método dos elementos finitos [80], [130], [131] como no método dos elementos de contorno [34], como ainda a modelos híbridos que tiram vantagem dos dois métodos [35], [81], [129], ou mesmo à combinação de métodos sem malha (tais como o Método das Soluções Fundamentais - MSF) com o MEF, como mostram, com resultados promissores, os estudos preliminares realizados por Amado Mendes et al. (2014). Dado o caráter indefinido do maciço de fundação, a formulação 2.5D MEC é particularmente adequada para a análise deste tipo de problemas, atendendo exatamente à condição de Sommerfeld [132], [133]. Contudo, o recurso ao MEC na simulação de geometrias complexas revela-se complexo, podendo reduzir parte da vantagem computacional inerente ao método. Por outro lado, a versatilidade do MEF torna-o atraente para modelar geometrias complexas, embora a simulação de
domínios indefinidos requeira procedimentos especiais, que nem sempre são precisos ou simples de implementar. Para superar as limitações de ambos os métodos, o recurso ao acoplamento MEF-MEC na abordagem 2.5D tem sido adotado por vários autores [35], [81], [110], [134].

Apesar das virtudes potenciais da abordagem 2.5D MEF-MEC, a sua aplicação requer procedimentos numéricos complexos [134] e, geralmente, a eficiência computacional tende a diminuir no caso de estruturas enterradas, dada a possível ocorrência de modos de vibração espúrios que exigem um tratamento especial [8]. Nesses casos, a opção por uma abordagem 2.5D MEF para todo o domínio de interesse é consideravelmente mais simples. A esse respeito, é de mencionar que a abordagem pelo MEF, por excelência adequada à simulação de geometrias complexas, pode incorporar facilmente a análise de fenômenos não lineares. Além disso, restrições complexas do problema, como o comportamento anisotrópico do solo, podem ser consideradas mais facilmente em uma abordagem pelo MEF do que em uma formulação pelo MEC [84], dado não ser necessário o conhecimento de funções de Green específicas para tal problema. Outras questões podem também ser referidas: por exemplo, geometrias complexas associadas a túneis duplos, tal como analisado por Kuo et al. (2011), podem ser simuladas por uma abordagem pelo MEF sem qualquer alteração particular das equações originais. Da mesma forma, as heterogeneidades dos materiais, que podem desempenhar um papel importante na previsão de vibrações induzidas pelo tráfego em túneis [135], [136], podem também ser facilmente introduzidas em uma abordagem pelo método dos elementos finitos.

Não obstante as vantagens da abordagem pelo MEF referidas, este método apresenta uma importante desvantagem que não pode ser negligenciada: a abordagem pelo MEF, especialmente adequada para a análise de meios confinados, requer a definição completa do domínio, o que cria dificuldades relevantes quando se trata da simulação de domínios ilimitados. Com efeito, um tópico de particular interesse é a formulação de procedimentos especiais para tratar os efeitos de fronteira, que são inerentes ao truncamento do domínio proveniente da discretização do meio através de elementos finitos. Nos problemas estáticos, a contribuição do terreno reflete-se em termos de rigidez, de modo que é possível truncar o domínio a uma distância suficientemente afastada da zona de interesse, onde a deformação é tão pequena que pode ser desprezada. Porém, no caso de análises dinâmicas, o modelo adotado para o maciço de fundação deve cumprir os requisitos de representar não apenas a rigidez dinâmica do solo mas também a condição de radiação de Sommerfeld [132], [137], a
qual postula a impossibilidade de a energia radiada regressar ao domínio de interesse no caso de um meio homogêneo isotrópico e (semi-)indefinido. Este requisito exige um tratamento especial das condições de fronteira, uma vez que a reflexão espúria das ondas quando atingem o limite da malha de elementos finitos não deve ocorrer. Para alcançar este objetivo várias estratégias têm sido propostas e aplicadas no contexto dos problemas de interação túnel-maciço de fundação.

Os diferentes métodos para tratamento das fronteiras artificiais, oriundas da limitação geométrica do domínio de análise quando se utiliza o MEF, podem ser agrupados de uma forma abrangente em procedimentos locais e procedimentos globais. Os procedimentos globais são, do ponto de vista conceitual, mais consistentes, sendo no entanto consideravelmente mais complexos e menos versáteis. Englobam-se nesta classe os métodos que atendem às equações de propagação de ondas e à condição de radiação de Sommerfeld de uma forma exata no contexto do MEF, sendo exemplos: o método dos elementos de contorno, o método das soluções fundamentais [83], [138], bem como o método dos elementos finitos de contorno escalados [69], [139], [140]. Quanto aos procedimentos locais, eles consistem em soluções aproximadas, baseadas na teoria da propagação de ondas e que procuram evitar a reflexão da onda através do tratamento da fronteira artificial propriamente dita. Embora a eficiência dessas metodologias dependa da dimensão do domínio discretizado em relação ao comprimento de onda gerado, a sua facilidade de aplicação, associada à boa compatibilidade com o formalismo do MEF, torna estas abordagens atrativas para aplicações práticas. Entre os vários procedimentos locais, referem-se aqui, pela sua importância, as fronteiras absorventes, o método dos elementos infinitos e os métodos das camadas absorventes. As fronteiras absorventes [141] são um dos procedimentos mais simples, que foi adotado por Bian et al. (2007) para o estudo dos movimentos do solo induzidos pelo tráfego ferroviário. O mesmo objetivo pode também ser alcançado pelo acoplamento de elementos infinitos 2.5D ao longo da fronteira artificial, como proposto por Yang \& Hung (2001); Yang \& Hung (2008) e aplicado por Lopes et al. (2010). Comparando as duas metodologias, Alves Costa et al. (2010) verificaram que a precisão obtida por esta última é bastante mais elevada que a da anterior, apesar da impossibilidade de garantir uma condição de absorção perfeita em ambas as abordagens. Como alternativa aos procedimentos mencionados, Bian et al. (2012) propuseram uma formulação 2.5D das fronteiras artificiais gradualmente amortecidas anteriormente apresentadas por Liu \& Jerry [142].

Ainda no contexto dos procedimentos locais, uma abordagem alternativa que tem ganhado destaque no âmbito de problemas que lidam com propagação de ondas corresponde ao método das camadas de absorção perfeita (Perfectly Matched Layers - PML's), designada por formulação PML. Nesta abordagem, a fronteira artificial é tratada através da substituição do domínio "infinito" por uma camada de dimensão finita, que corresponde à designada camada PML. Este meio atende a dois objetivos principais: garante que não há reflexão das ondas quando atingem a sua fronteira (com o domínio de interesse) e tem a capacidade de absorver as ondas que nela incidem [143]. A primeira menção à formulação PML deve-se a Bérenger [144], no âmbito do eletromagnetismo, sugerindo que a consideração das coordenadas do meio PML em um domínio complexo permitiria alcançar a condição de absorção perfeita. Posteriormente, surgiram aplicações a problemas elastodinâmicos, sobretudo devido ao trabalho desenvolvido por Chew \& Liu (1996) e, mais recentemente, por Basu \& Chopra [146], [147]. No entanto, apesar das virtudes potenciais do método, que pode suplantar os métodos anteriormente apresentados, a sua divulgação e aplicação à simulação de infraestruturas de transporte não está ainda muito difundida. Até o momento, são poucos os estudos em que tal técnica é usada, sendo de referir os estudos recentes realizados no âmbito do grupo de pesquisa onde se insere a autora, em particular os de Barbosa e Kausel [148] e de Lopes et al. (2013, 2012), bem como um trabalho desenvolvido na KU Leuven [149].

O objetivo do presente capítulo é mostrar o desenvolvimento e potencialidades de um modelo baseado na formulação 2.5D MEF-PML concebido pela autora para a simulação de problemas de interação túnel-maciço de fundação e de propagação de ondas pelo meio envolvente. O modelo em causa foi implementado na plataforma MatLab, com base em um modelo 2.5D MEF desenvolvido e implementado por Alves Costa et al. (2010); Alves Costa et al. (2010). Como o MEF, em sua origem, é um método indicado para a análise de meios circunscritos, o referido modelo foi adaptado pela autora, que implementou uma metodologia baseada na formulação 2.5D PML no modelo de cálculo anteriormente desenvolvido, procedendo deste modo ao tratamento do problema associado às fronteiras artificiais provenientes da limitação geométrica do meio.

Relativamente à organização do capítulo, inicia-se com uma sucinta exposição do método dos elementos finitos 2.5D, salientando os aspectos particulares que devem ser considerados para a simulação do sistema via-túnel-maciço. Seguindo um formalismo idêntico ao do MEF 2.5D, a formulação 2.5D PML é apresentada realçando as
semelhanças e diferenças em relação à abordagem formal do método dos elementos finitos.

Apresentada a metodologia, segue-se a validação do modelo por comparação com a solução analítica para um meio indefinido [151]. Posteriormente, a solução obtida para um túnel inserido em um meio indefinido é comparada com a solução fornecida através de um código semianalítico, denominado PiP (Pipe in Pipe), que foi desenvolvido por Hussein \& Hunt (2007). Por fim, são abordados cenários mais realistas, onde a superfície livre do maciço é considerada, sendo os resultados previstos pelo modelo confrontados com os fornecidos por técnicas de modelagem alternativas.

### 3.2 Modelo numérico 2.5D MEF-PML: conceitos e formulação

### 3.2.1 Generalidades. O conceito PML

Considere-se uma estrutura com uma seção transversal invariante na direção longitudinal, como se mostra na Figura 3.1. Nesse caso, adotando uma formulação 2.5D, todas as variáveis são transformadas para o domínio do número de onda $\left(k_{1}\right)$ por aplicação de uma transformada de Fourier relativa à coordenada longitudinal (direção $x)$, sendo por isso apenas necessária a discretização da seção transversal para se alcançar a solução 3D do problema. Assim sendo, o domínio de interesse é então discretizado através de elementos finitos 2.5D, sendo envolvido por uma camada de elementos PML 2.5D. O truncamento do domínio ocorre depois dos elementos PML. Assim, este artifício numérico tem a função de absorver, sem que ocorra reflexão espúria, as ondas que, com ângulo de incidência arbitrário, atinjam a fronteira entre os domínios descritos pelo MEF 2.5D e pelo método 2.5D PML.

A condição de absorção é satisfeita pela transformação das coordenadas dos nós dos elementos PML (no presente caso, y e z, uma vez que a coordenada x irá ser transformada para o domínio do número de onda) para o domínio complexo, o que induz um aumento artificial da atenuação da onda que se propaga ao longo dos elementos PML, como é evidenciado na Figura 3.2.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-071_793_1228_118_418.jpg)
Figura 3.1: Estrutura com desenvolvimento infinito e invariante em uma direção.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-071_773_968_1035_552.jpg)
Figura 3.2: Representação esquemática da atenuação das ondas no interior de uma camada PML.

Para esclarecer esse efeito, considere-se a propagação unidirecional de uma onda no sentido positivo do eixo x, tal como indicado na Figura 3.3. No domínio da frequência, o deslocamento segundo a direção z em qualquer ponto do domínio, e admitindo nulo o amortecimento, é então dado por:

$$
\begin{equation*}
u_{z}(x, \omega)=A(\omega) e^{-i k x} \tag{3.1}
\end{equation*}
$$

em que A corresponde à amplitude do deslocamento e k ao número de onda.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-071_157_1497_2423_285.jpg)
Figura 3.3: Representação esquemática da propagação de uma onda de cisalhamento em uma barra de desenvolvimento infinito.

Nas referidas condições, adotando amplitude A unitária, o campo de deslocamentos assume a configuração ilustrada na Figura 3.4.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-072_637_1745_285_161.jpg)
Figura 3.4: Deslocamentos $u_{z}(x, \omega)$ em uma barra indefinida com amortecimento nulo: a) parte real; b) parte imaginária; c) valor absoluto.

Suponha-se agora que o domínio de interesse corresponda apenas a valores negativos da coordenada espacial, com a transposição das coordenadas positivas para um domínio complexo de modo que:

$$
\begin{equation*}
x=\left\{\begin{array}{l}
x \text { para } x \leq 0 \\
x\left(1-a_{0} i\right) \text { para } x>0
\end{array}\right. \tag{3.2}
\end{equation*}
$$

em que $a_{0}$ corresponde a uma constante de transformação de coordenadas. Note--se que a parte real da coordenada se mantém fiel ao valor inicial, sendo apenas introduzida uma componente imaginária proporcional ao seu valor inicial.

Introduzindo as coordenadas definidas em [3.2] na função [3.1], facilmente se conclui que o campo de deslocamentos no semieixo positivo de x é artificialmente atenuado, como aliás se percebe por observação da Figura 3.5. Como se pode verificar, para valores negativos da coordenada geométrica (domínio de interesse) a função mantém-se inalterada, ao passo que se assiste a uma atenuação da amplitude no espaço positivo da coordenada.

Apesar da simplicidade do exemplo agora apresentado é este o efeito que se pretende alcançar com a introdução do PML, ou seja uma atenuação da amplitude da onda no interior desse mesmo domínio, sem ocorrência de alteração da solução original no domínio de interesse. O princípio deste método reside nas funções de mudança de referencial adotadas, uma vez que a camada PML deve atuar não apenas como um material absorvente, mas também como um material que garante a não reflexão das ondas na fronteira domínio de interesse/PML. Somente com o cumprimento desses dois requisitos é possível obter uma solução exata dentro do domínio de interesse.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-073_600_1743_124_162.jpg)
Figura 3.5: Deslocamentos $u_{z}(x, \omega)$ em uma barra indefinida com amortecimento nulo: a) parte real; b) parte imaginária; c) valor absoluto.

Nas seções seguintes é apresentada uma descrição do formalismo matemático inerente ao MEF 2.5D, inicialmente, e posteriormente o desenvolvimento 2.5D do PML em uma concepção semelhante à adotada para o método dos elementos finitos.

### 3.2.2 Formulação geral do MEF 2.5D

Com o objetivo de evitar custos extremamente elevados de computação, intrínsecos a uma simulação tridimensional integral, várias metodologias têm sido desenvolvidas no sentido de respeitar o caráter tridimensional do domínio, mas impondo algumas restrições. As estruturas tridimensionais com desenvolvimento infinito e propriedades invariáveis (geométricas e mecânicas) podem ser abordadas através de uma formulação 2.5D. Nestes casos, as principais propriedades da estrutura são representadas pela sua seção transversal, sendo, desta forma, a estrutura encarada como bidimensional. No entanto, o carregamento não é bidimensional, mas sim tridimensional, o que naturalmente exige a solução de um problema tridimensional. A principal ideia por trás da solução 2.5D é resolver o problema através de um método intermediário entre o bidimensional e o tridimensional. Tratando-se de um método baseado nos elementos finitos, apresenta como grande vantagem o recurso a técnicas transformadas que permitem uma drástica redução do número de graus de liberdade, já que apenas a seção transversal do problema necessita de ser discretizada por elementos finitos. Este método foi inicialmente proposto por Hwang \& Lysmer [152], no contexto do MEF, para o estudo de estruturas subterrâneas sob o efeito de ondas sísmicas. Subsequentemente, o método tem sido aplicado por alguns pesquisadores ao estudo de vibrações induzidas por tráfego ferroviário, tanto em cenários superficiais como em cenários subterrâneos. Neste âmbito, especial atenção deve ser dedicada às seguintes obras: [35], [85], [129], [131], [150], [153].

Assumindo-se que a resposta da estrutura é linear, a análise pode ser desenvolvida no domínio da frequência/número de onda, sendo aplicadas transformadas de Fourier em relação ao tempo e ao espaço na direção de desenvolvimento infinito da estrutura. As grandezas transformadas (ação e resposta) passam a ser função das imagens de Fourier da direção espacial, x, e do tempo, t, que são designadas, respectivamente, por número de onda e frequência angular e representadas por $k_{1} \mathrm{e} \omega$. Este procedimento implica que apenas duas das direções que caracterizam o meio tridimensional se mantenham no domínio não transformado, sendo por isso o plano definido por essas direções discretizado através de elementos finitos, tal como já ilustrado na Figura 3.1.

Seguindo as etapas habituais de um procedimento baseado no método dos elementos finitos, em particular nas formulações forte e fraca, a seguinte equação de equilíbrio pode ser estabelecida para qualquer infinitésimo de volume de um domínio tridimensional:

$$
\begin{equation*}
\int_{V} \delta \varepsilon \sigma d V+\int_{V} \delta u \rho \ddot{u} d V=\int_{S} \delta u p d S \tag{3.3}
\end{equation*}
$$

em que $\delta \varepsilon$ representa o campo de deformações virtuais, $\sigma$ representa o campo de tensões, $\delta u$ é o campo de deslocamentos virtuais, $u$ é o campo de deslocamentos, $\rho$ é a massa específica do meio e p representa o campo de pressões externas aplicadas na superfície S.

Para formular o método com o campo de deslocamentos como variável básica, é necessário introduzir a relação constitutiva e as relações entre deslocamentos e deformações. A primeira é estabelecida, em notação tensorial, através do tensor constitutivo $D_{i j k l}$, de modo que:

$$
\begin{equation*}
\sigma_{i j}=D_{i j k l} \varepsilon_{k l} \tag{3.4}
\end{equation*}
$$

sendo o tensor $D_{i j k l}$, para o caso de um meio linear homogêneo e isotrópico, função das constantes de Lamé.

A relação deslocamento-deformação é dada, em notação tensorial, por:

$$
\begin{equation*}
\varepsilon_{i j}=\frac{1}{2}\left(u_{i, j}+u_{j, i}\right) \tag{3.5}
\end{equation*}
$$

Ou, em notação matricial, por:

$$
\begin{equation*}
\{\varepsilon\}=[L]\{u\} \tag{3.6}
\end{equation*}
$$

em que $\{\varepsilon\}$ é o vetor que reúne as deformações, $\{u\}$ é o vetor que reúne as componentes do campo de deslocamentos e [L] é a matriz do operador diferencial,
cuja explicitação para o caso 2.5D será apresentada em uma etapa mais avançada da presente exposição.

Como se pode verificar, a relação de equilíbrio definida em [3.3] é estabelecida para um meio tridimensional em um espaço cartesiano. Tal como anteriormente referido, a gênese do método 2.5D consiste na transformação de todas as quantidades envolvidas para o domínio do número de onda $k_{1}$ (e também frequência), sendo por isso necessária a aplicação de uma transformada de Fourier relativamente à variável de desenvolvimento longitudinal do problema (direção x no presente caso). Nessas condições é então conveniente desenvolver os integrais de volume presentes na equação [3.3] e introduzir a seguinte relação prescrita pelo teorema integral de Parseval [154]:

$$
\begin{equation*}
\int \delta f(x) p(x) d x=\int \delta f\left(-k_{1}\right) p\left(k_{1}\right) d k_{1} \tag{3.7}
\end{equation*}
$$

Dado que a seção transversal do problema permanece no domínio não transformado (espaço y-z), esta é então discretizada em elementos finitos, sendo o campo de deslocamentos aproximado através de funções de forma e variáveis nodais, de modo que:

$$
\begin{equation*}
\{u\}=[N]\left\{u_{n}\right\} \tag{3.8}
\end{equation*}
$$

em que a matriz [N] é a matriz que reúne as funções de forma e $\left\{u_{n}\right\}$ é o vetor que reúne as diferentes componentes dos deslocamentos nodais. No presente modelo são utilizados elementos finitos isoparamétricos de 8 nós, cuja formulação é aqui omitida, podendo ser consultada em Alves Costa (2011) entre outros.

Introduzindo as relações [3.7] e [3.8] nos termos da equação [3.3], facilmente se conclui que, no domínio da frequência, o trabalho virtual realizado pelas forças internas e pelas forças de inércia no domínio transformado é dado, respectivamente, por:

$$
\begin{gather*}
\int_{V} \delta \varepsilon \sigma d V=\int_{k_{1}} \delta u_{n}^{T}\left(-k_{1}, \omega\right) \int_{Z} \int_{Y} B^{T}\left(-k_{1}\right) D B\left(k_{1}\right) d y d z u_{n}\left(k_{1}, \omega\right) d k_{1}  \tag{3.9}\\
\int_{V} \delta u \rho \ddot{u} d V=-\omega^{2} \int_{k_{1}} \delta u_{n}^{T}\left(-k_{1}, \omega\right) \int_{Z} \int_{Y} N^{T} \rho N d y d z u_{n}\left(k_{1}, \omega\right) d k_{1}[3 \tag{3.10}
\end{gather*}
$$

em que B representa a matriz das derivadas das funções de forma, sendo então dada por:

$$
\begin{equation*}
\left[B\left(k_{1}\right)\right]=\left[L\left(k_{1}\right)\right][N] \tag{3.11}
\end{equation*}
$$

A avaliação do operador diferencial [L] é efetuada por via seminumérica, ou seja, as derivadas no domínio não transformado são avaliadas por via numérica, ao passo que
as derivadas correspondentes ao número de onda são determinadas analiticamente, utilizando assim as propriedades de derivação da transformada de Fourier [155]. É exatamente por este motivo que alguns autores têm recentemente designado o método dos elementos finitos 2.5D como o método dos elementos finitos semianalítico [156]. Desse modo, o operador [L] é então dado por:

$$
\begin{equation*}
[L]=\left[\begin{array}{cccccc}
i k_{1} & 0 & 0 & \frac{\partial}{\partial y} & 0 & \frac{\partial}{\partial z} \\
0 & \frac{\partial}{\partial y} & 0 & i k_{1} & \frac{\partial}{\partial z} & 0 \\
0 & 0 & \frac{\partial}{\partial z} & 0 & \frac{\partial}{\partial y} & i k_{1}
\end{array}\right]^{T} \tag{3.12}
\end{equation*}
$$

O trabalho virtual realizado pelas ações externas é calculado utilizando o fato de a geometria apenas ser discretizada no plano ZY. Assim, considerando uma coordenada s, paralela ao lado do elemento onde é aplicada a ação, o trabalho virtual desenvolvido pelas ações externas é obtido através de:

$$
\begin{equation*}
\int_{S} \delta u p d S=\int_{k_{1}} \delta u_{n}^{T}\left(-k_{1}, \omega\right) p_{n}\left(k_{1}, \omega\right) d k_{1} \tag{3.13}
\end{equation*}
$$

em que o vetor $p_{n}$ reúne as forças nodais equivalentes resultantes da pressão p aplicada ao longo do contorno do elemento finito.

Dado que as equações [3.9], [3.10] e [3.13] são válidas para um qualquer deslocamento virtual, $\delta u_{n}\left(-k_{1}\right)$, então todos os integrais relativos a $k_{1}$ podem ser removidos o que permite alcançar a seguinte relação de equilíbrio para cada elemento finito:

$$
\left(\int_{z} \int_{y}\left[B\left(-k_{1}\right)\right]^{T}[D]\left[B\left(k_{1}\right)\right] d y d z-\omega^{2} \int_{z} \int_{y}[N]^{T} \rho[N] d y d z\right)\left\{u_{n}\left(k_{1}, \omega\right)\right\}=\{\nmid \beta \cdot([1 k 4], \omega)\}
$$

Adotando a nomenclatura habitual do método dos elementos finitos, podem ser definidas as matrizes de rigidez e massa, tal como indicado, respectivamente, nas equações [3.15] e [3.16]:

$$
\begin{gather*}
{[K]=\int_{Z} \int_{Y}\left[B\left(-k_{1}\right)\right]^{T}[D]\left[B\left(k_{1}\right)\right] d y d z}  \tag{3.15}\\
{[M]=\int_{Z} \int_{Y}[N]^{T} \rho[N] d y d z} \tag{3.16}
\end{gather*}
$$

Um aspecto ainda não abordado na presente descrição remete para a forma de inclusão de efeitos de amortecimento material no modelo. Como se sabe, os fenômenos de amortecimento material têm especial importância em problemas dinâmicos, sendo por isso necessária uma breve referência à sua forma de inclusão. Dado que o modelo
em causa é desenvolvido no domínio da frequência, os efeitos de amortecimento podem ser incorporados de forma simples por meio de grandezas complexas. No presente caso é adotado para a generalidade dos cenários um modelo de amortecimento histerético, o qual é incluído na análise através da consideração de propriedades de elasticidade complexas na matriz constitutiva [D] (ver equação [3.4]). Desse modo, os termos da referida matriz são dados pela combinação das constantes de Lamé complexas, $\lambda^{*}$ e $\mu^{*}$, as quais podem ser escritas da seguinte forma, em que $\beta$ representa o amortecimento histerético:

$$
\begin{align*}
& \lambda^{*}=\lambda(1+2 i \beta)  \tag{3.17}\\
& \mu^{*}=\mu(1+2 i \beta) \tag{3.18}
\end{align*}
$$

Remetendo novamente para a equação [3.14], a qual rege o equilíbrio do elemento finito 2.5D, é de salientar que a eficiência computacional pode ser muito melhorada dividindo a matriz de rigidez [K] (expressão [3.15]) em submatrizes, para que todos os termos dessas mesmas matrizes sejam independentes do número de onda. Com esse intuito considera-se a matriz [B] como a soma de duas matrizes, separando deste modo as derivadas numéricas das analíticas, do seguinte modo:

$$
\begin{equation*}
[B]=\left[B_{1}\right]+i k_{1}\left[B_{2}\right] \tag{3.19}
\end{equation*}
$$

Substituindo a equação [3.19] na equação [3.15] e reagrupando-a, é então possível reescrever a equação [3.14] da seguinte forma:

$$
\begin{equation*}
\left([K]_{1}+i k_{1}[K]_{2}+k_{1}^{2}[K]_{3}-\omega^{2}[M]\right)\left\{u_{n}\left(k_{1}, \omega\right)\right\}=\left\{p_{n}\left(k_{1}, \omega\right)\right\} \tag{3.20}
\end{equation*}
$$

em que as três matrizes de rigidez são dadas por:

$$
\begin{gather*}
{[K]_{1}=\int_{z} \int_{y}\left[B_{1}\right]^{T}[D]\left[B_{1}\right] d y d z}  \tag{3.21}\\
{[K]_{2}=\int_{z} \int_{y}\left[B_{1}\right]^{T}[D]\left[B_{2}\right] d y d z-\int_{z} \int_{y}\left[B_{2}\right]^{T}[D]\left[B_{1}\right] d y d z}  \tag{3.22}\\
{[K]_{3}=\int_{z} \int_{y}\left[B_{2}\right]^{T}[D]\left[B_{2}\right] d y d z} \tag{3.23}
\end{gather*}
$$

Os integrais das equações inerentes à avaliação das matrizes de rigidez ([3.21], [3.22] e [3.23]) e de massa ([3.16]) são calculados utilizando o procedimento clássico de integração bidimensional pelo método de Gauss no referencial local [157], [158], [159].

À semelhança de uma formulação clássica baseada no método dos elementos finitos, o sistema de equações global (equação [3.24]) é completamente definido após
a montagem das matrizes de rigidez e massa de cada elemento e a introdução das condições de fronteira de Neumann e de Dirichlet.

$$
\left([K]_{1}^{\text {global }}+i k_{1}[K]_{2}^{\text {global }}+k_{1}^{2}[K]_{3}^{\text {global }}-\omega^{2}[M]^{\text {global }}\right)\left\{u_{n}\left(k_{1}, \omega\right)\right\}=\left\{p_{n}\left(k_{1}\left[3 \omega^{2} \not\right]^{2}\right]\right.
$$

Dado que o sistema de equações [3.24] está formulado no domínio transformado, os resultados obtidos após a resolução deste sistema de equações encontram-se também no domínio transformado. A obtenção dos deslocamentos no domínio tridimensional não transformado exige portanto a aplicação de uma dupla transformada de Fourier inversa para converter a solução para o domínio espaço/tempo.

Cabe esclarecer que a formulação apresentada ao longo da presente seção se refere a elementos de volume, podendo contudo os mesmos princípios ser aplicados a outros tipos de elementos, tais como cascas ou barras. Em uma seção posterior do presente capítulo é realizada uma breve referência à inclusão de outros tipos de elementos especialmente adaptados para o estudo dinâmico de estruturas ferroviárias.

A grande vantagem do modelo aqui apresentado relativamente a modelos verdadeiramente tridimensionais reside na eficiência de cálculo. O recurso às transformadas de Fourier e respectivas propriedades permite uma redução significativa do número de graus de liberdade, o que implica uma minimização dos tempos de cálculo. Porém, se uma das grandes dificuldades inerentes à simulação de meios de grande desenvolvimento longitudinal, tais como túneis ferroviários, foi parcialmente superada através da redução do número de graus de liberdade inerente ao método 2.5 D , não poderá ser esquecida a limitação intrínseca do MEF quando o objeto de análise está relacionado com problemas de geodinâmica e respectiva simulação das fronteiras oriundas do truncamento do domínio (na seção transversal). Com efeito, o MEF é na sua gênese um método para o estudo de sistemas confinados, onde as condições de fronteira estejam totalmente definidas. Se, como já referido, em análises estáticas esta dificuldade é facilmente contornável através da consideração de fronteiras a distâncias suficientemente afastadas da zona de interesse do problema, o mesmo não ocorre na análise dinâmica, sendo fundamental a utilização de procedimentos especiais para o tratamento das fronteiras artificiais.

A autora do presente estudo desenvolveu e implementou uma forma de tratamento das fronteiras artificiais através de uma formulação 2.5D do método das camadas absorventes (PML's), a qual se aborda e descreve na seção seguinte.

### 3.2.3 Tratamento de fronteiras através da técnica PML - 2.5D

### 3.2.3.1 Conceito base

A abordagem pelo método dos elementos finitos não é a mais adequada para simular meios indefinidos, como é o caso de maciços geotécnicos. Na verdade, o caráter finito do domínio de interesse e a necessidade de definir as fronteiras que o delimitam implicam a violação da condição de radiação de Sommerfeld. Para ultrapassar essa limitação inerente ao próprio MEF, recorreu-se ao método das camadas absorventes, utilizando uma formulação 2.5D PML (Perfectly Matched Layers).

O princípio básico de uma formulação PML foi já descrito, ainda que de uma forma mais física do que matemática, no decorrer do presente capítulo. Na verdade esse princípio é relativamente simples, consistindo na introdução de uma camada ao redor da zona de interesse que permita a absorção da energia que é incidente, sem implicar qualquer reflexão tanto na fronteira que delimita o domínio discretizado como na interface entre o domínio de interesse e o domínio PML. Deste modo a construção da camada PML deverá obedecer a dois requisitos base: i) condição não refletiva; ii) condição de absorção ou de decaimento da resposta. A primeira condição é satisfeita através da continuação da solução, ou seja, mantendo-se a equação governante do problema e, por esse modo, evitando-se reflexões espúrias na fronteira entre os dois domínios em análise. Por outro lado, a condição de atenuação é garantida através da incorporação de uma função de decaimento na solução, sem que no entanto tenha implicação na lei constitutiva do material [143]. Como já anteriormente apresentado, a consideração de coordenadas complexas no domínio PML atende a ambos os aspectos [143], [146], [160]. Contudo, dado o caráter numérico de uma formulação discretizada, a introdução da componente imaginária das coordenadas deverá ser efetuada de forma suave, a fim de minimizar potenciais reflexões espúrias entre os próprios PML's.

Em síntese, a formulação PML aqui apresentada segue o formalismo inerente ao MEF 2.5D, com a particularidade de as coordenadas dos nós serem transferidas para um espaço complexo.

### 3.2.3.2 Formulação matemática 2.5D PML

Considerando o expresso na seção anterior, é então necessário proceder a uma mudança de referencial geométrico do domínio descrito pelo PML para o domínio complexo. Tal relação é dada pelas seguintes funções de mudança de referencial, apenas aplicáveis às direções y e z, uma vez que a direção x é transformada para o domínio do número de onda (ver Figura 3.1):

$$
\begin{align*}
& \tilde{y}=\int_{0}^{y} \lambda_{y}(y) d y  \tag{3.25}\\
& \tilde{z}=\int_{0}^{z} \lambda_{z}(z) d z \tag{3.26}
\end{align*}
$$

sendo $\lambda_{y}$ e $\lambda_{z}$ as funções de transformação nas direções $y$ e $z$, respectivamente.
No desenvolvimento de uma formulação do tipo elementos finitos, é também necessário o estabelecimento de relações entre as derivadas das coordenadas nodais nos dois espaços, o físico e o complexo. Tais relações podem ser alcançadas da seguinte forma:

$$
\begin{align*}
& \frac{\partial}{\partial \tilde{y}}=\frac{1}{\lambda_{y}(y)} \frac{\partial}{\partial y}  \tag{3.27}\\
& \frac{\partial}{\partial \tilde{z}}=\frac{1}{\lambda_{z}(z)} \frac{\partial}{\partial z} \tag{3.28}
\end{align*}
$$

Considerando que a solução no interior do domínio PML satisfaz a mesma equação diferencial que no domínio de interesse, pode então concluir-se que a equação [3.3], a qual reflete a aplicação do princípio dos trabalhos virtuais às equações de Navier, permanece válida no interior do domínio PML. Se a este fato se acrescentar ainda a descrição das condições de equilíbrio através de variáveis nodais, em que a variável primária corresponde ao campo de deslocamentos, então a abordagem 2.5D PML pode ser definida fazendo uso do procedimento anterior para o MEF 2.5D, desde que as relações de mudança de coordenadas para o espaço complexo sejam atendidas. Deste modo, considerando as equações [3.24] a [3.28] e fazendo uso do procedimento de Garlekin, as seguintes matrizes de rigidez, [K*] e de massa, [M*], podem ser estabelecidas para a região dos PML:

$$
\begin{equation*}
\left[K^{*}\right]=\int_{z} \int_{y}\left[B^{*}\left(-k_{1}\right)\right]^{T}[D]\left[B^{*}\left(k_{1}\right)\right] \lambda_{y}(y) \lambda_{z}(z) d y d z \tag{3.29}
\end{equation*}
$$

e

$$
\begin{equation*}
\left[M^{*}\right]=\int_{z} \int_{y}[N]^{T} \rho[N] \lambda_{y}(y) \lambda_{z}(z) d y d z \tag{3.30}
\end{equation*}
$$

A matriz [B*] resulta do produto do operador diferencial [L*] pela matriz [N], a qual reúne as funções de forma do elemento 2.5D PML. A fim de respeitar as relações anteriormente expressas entre coordenadas no espaço físico e no espaço complexo, o novo operador diferencial é agora dado por:

$$
\begin{equation*}
\left[L^{*}\right]=\left[\begin{array}{cccccc}
i k_{1} & 0 & 0 & \frac{1}{\lambda_{y}(y)} \frac{\partial}{\partial y} & 0 & \frac{1}{\lambda_{z}(z)} \frac{\partial}{\partial z} \\
0 & \frac{1}{\lambda_{y}(y)} \frac{\partial}{\partial y} & 0 & i k_{1} & \frac{1}{\lambda_{z}(z)} \frac{\partial}{\partial z} & 0 \\
0 & 0 & \frac{1}{\lambda_{z}(z)} \frac{\partial}{\partial z} & 0 & \frac{1}{\lambda_{y}(y)} \frac{\partial}{\partial y} & i k_{1}
\end{array}\right]^{T} \tag{3.31}
\end{equation*}
$$

Saliente-se que a região dos PML tem a capacidade de absorver a energia incidente em ambas as direções, em uma direção apenas, ou em nenhuma direção. Esta última situação corresponde a $\lambda_{y}=\lambda_{z}=1$. Com efeito, a introdução desta última relação nas matrizes de rigidez e massa indicadas pelas equações [3.29] e [3.30] faz com que essas matrizes se reduzam às equações [3.15] e [3.16], respectivamente.

Ainda relativamente à formulação dos elementos propriamente dita, cabe mencionar que Kausel e Barbosa [160] propuseram recentemente uma formulação alternativa para uma metodologia bidimensional de PML's, onde as matrizes são diretamente avaliadas no espaço complexo, evitando assim a integração das funções de mudança de referencial. Este método poderá apresentar algumas vantagens computacionais, embora possa ser um pouco menos flexível quanto à aplicação a elementos finitos com diferentes números de nós. Contudo, cabe mencionar que, tal como indicado pelos autores proponentes o resultado final é exatamente igual ao agora apresentado.

Cabe ainda fazer uma observação sobre a redução do esforço computacional: a decomposição da matriz de rigidez em submatrizes independentes de $k_{1}$, tal como indicado de [3.20] a [3.23], é também possível em uma formulação 2.5D PML. Porém, no presente caso essa formulação não é especialmente vantajosa, pois, como se verá na seguinte seção, as funções de mudança de referencial propostas são dependentes do número de onda $k_{1}$ e da frequência $\omega$.

Por último, cabe mencionar que o sistema global de equações é completamente definido após a montagem das matrizes de rigidez dinâmica, tanto dos elementos finitos como dos elementos PML, e a introdução das condições de fronteira de Neumann e de Dirichlet. Deste modo, o sistema de equações global poderá então ser escrito da seguinte forma:

$$
\begin{align*}
& \left(\left[K_{\mathrm{MEF}}^{\text {global }}\left(k_{1}\right)\right]+\left[K_{\mathrm{PML}}^{\text {global }}\left(k_{1}, \omega\right)\right]-\omega^{2}\left(\left[M_{\text {MEF }}^{\text {global }}\right]+\left[M_{\text {PML }}^{\text {global }}\left(k_{1}, \omega\right)\right]\right)\right)\left\{u_{n}\left(k_{1}, \omega\right)\right\}  \tag{3.32}\\
= & \left\{p_{n}\left(k_{1}, \omega\right)\right\}
\end{align*}
$$

Como é evidente, apenas as incógnitas nodais ( $u_{n}$ ou $p_{n}$ ) relativas aos nós pertencentes ao domínio de interesse apresentam significado físico, pois as soluções obtidas no interior do PML são, desejavelmente, atenuadas.

Os resultados obtidos após a resolução do sistema de equações encontram-se no domínio transformado, exigindo uma dupla transformada de Fourier inversa para converter a solução para o domínio do espaço/tempo.

### 3.2.3.3 Funções de mudança para o referencial complexo

Com base no exposto nas últimas duas seções, pode-se concluir que a incorporação de uma formulação 2.5D PML em uma aplicação numérica baseada no MEF 2.5D é bastante simples. O aspecto basilar de tal incorporação consiste na definição das funções de mudança de coordenadas nodais para o referencial complexo.

As referidas funções são derivadas através da continuidade da solução além do domínio de interesse, com o cuidado de garantir uma evolução suave da atenuação, para evitar reflexões espúrias no interior do domínio correspondente ao PML [143]. Os requisitos que tais funções devem satisfazer são cumpridos adotando funções com a seguinte configuração:

$$
\begin{align*}
& \lambda_{y}(y)=\frac{2 \pi}{a b s(k)} \frac{y}{H_{y}}-i \frac{k_{0}}{k}\left(\frac{y}{H_{y}}\right)^{2}  \tag{3.33}\\
& \lambda_{z}(z)=\frac{2 \pi}{a b s(k)} \frac{z}{H_{z}}-i \frac{k_{0}}{k}\left(\frac{z}{H_{z}}\right)^{2} \tag{3.34}
\end{align*}
$$

em que $k_{0}$ é uma constante de valor adequado (no presente estudo concluiu-se que um valor de $k_{0}=20$ origina bons resultados, tal como sugerido por Basu \& Chopra (2003) na definição de soluções PML para meios bidimensionais e tridimensionais ); $H_{y}$ e $H_{z}$ correspondem à espessura da camada absorvente nas direções y e z, respectivamente; k é o número de onda que corresponde ao comprimento de onda propagante ao longo da seção transversal do problema, o qual é dado por:

$$
\begin{equation*}
k=\sqrt{\left(\frac{\omega}{C_{s}}\right)^{2}-k_{1}^{2}} \tag{3.35}
\end{equation*}
$$

em que $C_{s}$ é a velocidade de propagação das ondas de cisalhamento no terreno.
Ao contrário de soluções propostas por outros autores, o modelo de funções de mudança de referencial apresenta parte real não unitária [143], [161], sendo a mesma função do número de onda propagante na seção transversal do problema. Desse modo, a parte real das funções de mudança de referencial é introduzida para permitir um ajustamento da malha, a fim de se obter uma espessura do domínio PML adequada ao comprimento de onda propagante [80]. Deste modo, no método proposto, a malha PML é sempre gerada com um metro de espessura e divide-se em cinco ou
seis subcamadas (segundo estudos desenvolvidos por Yang \& Hung [162] e posteriormente aferidos por Alves Costa et al. (2010), o número em causa corresponde ao valor mínimo de discretização compatível com a precisão dos resultados), sendo o seu caráter adaptativo conferido pelas funções de mudança de referencial. Efetivamente, a malha do domínio PML é adaptativa (estica ou encolhe) em função do número de onda, sendo este efeito conseguido através das funções de transformação. As funções de mudança de referencial propostas foram validadas comparando os resultados obtidos pelo modelo proposto com os fornecidos por soluções teóricas, como aliás se verá em seção posterior do presente capítulo.

Deve notar-se que, se o radicando da equação [3.35] for negativo, as funções de mudança de referencial não têm parte imaginária, isto é, a onda que se propaga ao longo da seção transversal do problema é evanescente e, consequentemente, as funções de mudança de referencial [3.33] e [3.34] são valores reais puros, ou, dito de outra forma, não há atenuação da onda, havendo contudo um ajustamento da malha a fim de melhor simular o caráter infinito do domínio.

### 3.3 Simulação de elementos particulares no contexto ferroviário

### 3.3.1 Generalidades

As técnicas de modelagem numérica apresentadas nas seções anteriores são especialmente adequadas à simulação de estruturas massivas, seja em condições de estado plano de tensão, impondo o número de onda $k_{1}$ nulo, ou em condições tridimensionais desde que o meio apresente desenvolvimento infinito na direção de desenvolvimento da estrutura. A este respeito cabe fazer uma breve referência à técnica de janela espacial muito recentemente apresentada por Coulier et al. (2014), a qual permite a inclusão, ainda que de forma aproximada, do caráter finito do meio em uma análise 2.5D. Assim sendo, os elementos anteriormente apresentados são especialmente indicados para a simulação do maciço geotécnico ou mesmo do revestimento do túnel, embora este também possa ser concretizado através do recurso a elementos laminares, como os elementos de casca. Porém, dado que o propósito de concepção do modelo numérico em causa e respectivos melhoramentos teve sempre em consideração a simulação de efeitos dinâmicos ferroviários, foi incorporado ao modelo um conjunto de elementos especialmente adaptados à simulação de estruturas ferroviárias.

### 3.3.2 Breve apresentação de tipologias de via férrea usadas em túneis

Antes de passar aos aspectos de modelagem propriamente ditos, convém apresentar brevemente algumas soluções de via férrea aplicadas em túneis e discutir depois como elas podem ser representadas pela ferramenta numérica utilizada.

Os sistemas de via férrea aplicáveis em túneis incluem-se em dois grandes grupos: i) via com lastro; ii) via sem lastro. Tal como o nome indica a grande diferença entre os dois sistemas reside na presença ou ausência da camada de lastro. Dados os requisitos e necessidades de manutenção da solução com lastro, a aplicação da mesma tem sido preterida em relação à solução sem lastro no desenvolvimento de novos projetos ferroviários (tanto no caso de sistemas de metrô como no caso de vias férreas convencionais ou de alta velocidade). Quanto à via sem lastro, por vezes também designada como via em laje (embora não sendo totalmente correta a designação, visto existirem soluções de via férrea sem lastro em que o suporte dos dormentes é garantido por uma camada de mistura betuminosa), vários sistemas têm sido desenvolvidos.

Seja qual for o sistema, a via é sempre constituída por trilhos, que garantem o guiamento do material rodante e a transmissão da carga aos elementos inferiores, estando a estes ligados através de palmilhas. As palmilhas são elementos resilientes que têm como função atenuar as cargas dinâmicas impostas pelo material rodante aos elementos inferiores da via férrea.

A grande diferença entre as diversas soluções de via sem lastro reside exatamente na configuração e/ou disposição dos elementos inferiores à posição do sistema trilho/palmilha. Cabe distinguir as soluções de trilho embutido, tal como ilustrado na Figura 3.6, a qual é corrente em sistemas de metrô leve. Neste tipo de solução o apoio do trilho é contínuo e não discreto na direção longitudinal. Alternativamente, existem diversas soluções em que o apoio do trilho é discreto, estando geralmente espaçado na direção longitudinal entre 0,50 m e 0,70 m. Exemplo desta situação é apresentado na Figura 3.7, onde se ilustra um esquema da via "STEDEF". Como se pode verificar existe uma fixação do trilho ao dormente, elemento discreto, o qual se encontra parcialmente embutido na laje estrutural. Os vários elementos estruturais são intercalados por elementos resilientes para a minimização de vibrações e cargas de impacto transmitidas aos elementos inferiores. Nos casos em que a laje de concreto armado que serve de suporte ao armamento da via (conjunto constituído pelos trilhos, palmilhas e dormentes) está apoiada em um elemento resiliente, seja este conferido por uma manta ou mesmo por molas metálicas, o sistema é designado por laje flutuante.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-085_474_1495_118_285.jpg)
Figura 3.6: Via com trilho embutido: a) representação esquemática, b) panorâmica de aplicação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-085_300_1232_710_419.jpg)
Figura 3.7: Via STEDEF: a) esquema estrutural; b) detalhe da fixação.

Relativamente à configuração geométrica da laje estrutural, esta pode ser contínua ou modular. A solução modular apresenta clara vantagem em termos de pré-fabricação e facilidade de manutenção. Um exemplo de solução modular pré-fabricada, o sistema OBB-PORR, é apresentado na Figura 3.8. Note-se que nesta solução pré-fabricada é dispensada a presença dos dormentes.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-085_667_1748_1517_159.jpg)
Figura 3.8: Solução de via em laje pré-fabricada OBB-PORR: a) representação esquemática; b) exemplo de aplicação em túnel.

### 3.3.3 Modelagem do sistema de via férrea

Feita esta breve introdução às várias soluções de via férrea, cabe agora comentar brevemente a técnica de modelagem adotada para cada elemento. Convém desde já apontar uma das grandes limitações da técnica 2.5D: a estrutura deve ser invariante, o que, por definição, significa que não pode ocorrer alteração das propriedades geométricas ou mecânicas da seção transversal mediante o seu posicionamento longitudinal.

Considerando as especificidades dos diferentes elementos e às restrições intrínsecas ao modelo em causa, recorreu-se às seguintes técnicas para os diferentes elementos:

i) laje da via férrea: o caráter 2.5D do modelo impossibilita a simulação exata de soluções modulares, dado o caráter não contínuo das mesmas. No caso de soluções contínuas, a simulação pode ser realizada através de elementos volumétricos 2.5 D , tal como para o revestimento do túnel. Cabe mencionar que o modelo em causa pode ser complementado com uma solução periódica para a via férrea, sendo a compatibilidade das duas soluções garantida pela relação intrínseca entre transformadas de Floquet e transformadas de Fourier [56], [163].
ii) Sistema trilho-palmilha: o caráter discreto do suporte do trilho pode ser, de forma simplificada, introduzido na modelagem 2.5D através da consideração de propriedades de rigidez e amortecimento das palmilhas linearizadas na direção longitudinal. Esta simplificação é razoável quando o domínio de interesse se confina a frequências inferiores a cerca de 500 Hz, tal como já constatado por diversos autores [164], [165]. Admitindo como razoável a simplificação anterior, a modelagem do sistema trilho-palmilha é efetuada através da incorporação no sistema de equações global de um elemento baseado em uma viga de Bernoulli em apoio elástico, a qual é formulada por:

$$
\begin{equation*}
\left(\left[K^{\text {carril }}\left(k_{1}, \omega\right)\right]-\omega^{2}\left[M^{\text {carril }}\right]\right)\left\{u_{n}\left(k_{1}, \omega\right)\right\}=\left\{p_{n}\left(k_{1}, \omega\right)\right\} \tag{3.36}
\end{equation*}
$$

em que $\left\{u_{n}\left(k_{1}, \omega\right)\right\}$ e $\left\{p_{n}\left(k_{1}, \omega\right)\right\}$ representam os vetores que reúnem os deslocamentos e forças do sistema, respectivamente.

Relativamente às matrizes $\left[K^{\text {carril }}\right]$ e $\left[M^{\text {carril }}\right]$, os seus termos são definidos da seguinte forma:

$$
\begin{gather*}
{\left[K^{\text {carril }}\left(k_{1}, \omega\right)\right]=\left[\begin{array}{cc}
k_{1}^{4} E I_{r}+k_{p}^{*} & -k_{p}^{*} \\
-k_{p}^{*} & k_{p}^{*}
\end{array}\right]}  \tag{3.37}\\
{\left[M^{\text {carril }}\right]=\left[\begin{array}{cc}
m_{r} & 0 \\
0 & 0
\end{array}\right]} \tag{3.38}
\end{gather*}
$$

em que $E I_{r}$ corresponde à rigidez de flexão do trilho, $m_{r}$ representa a massa por unidade de comprimento do trilho e $k_{p}^{*}$, a rigidez complexa da palmilha por unidade de comprimento.

A introdução do parâmetro de rigidez complexa visa a incorporação não só da rigidez conferida pela palmilha, mas também do respectivo amortecimento:

$$
\begin{equation*}
k_{p}^{*}=k_{p}+i \omega c_{p} \tag{3.39}
\end{equation*}
$$

em que $k_{p}$ e $c_{p}$ são respectivamente a rigidez e o amortecimento da palmilha por unidade de desenvolvimento longitudinal da via.
A inclusão do elemento de trilho no modelo de cálculo é efetuada através da montagem das matrizes indicadas em [3.37] e [3.38] na equação [3.32], a qual reflete o equilíbrio global do sistema.
iii) Dormentes: a modelagem 2.5D constitui uma limitação na incorporação de elementos discretos na direção longitudinal. Com efeito, a simulação detalhada da incorporação de dormentes e de outros elementos discretos exige o recurso a modelos numéricos de outra classe, tais como os modelos totalmente tridimensionais ou os modelos periódicos, acarretando as conhecidas desvantagens do ponto de vista computacional. Sem descurar as limitações inerentes, a incorporação do caráter não contínuo na direção longitudinal pode ser realizada, ainda que de forma simplificada, por alteração da lei constitutiva nos elementos finitos 2.5D anteriormente apresentados. A consideração de elementos com comportamento ortotrópico, tal como sugerido por Karlstrom \& Bostrom (2006) para elementos de casca, e posteriormente adaptado por Alves Costa et al. (2010) para elementos de volume, mostra uma boa concordância com o comportamento dinâmico observado para frequências não superiores a 250 Hz [150], sendo esta a metodologia preferencialmente adotada no presente estudo.
Outra alternativa também viável consiste em considerar de elementos de massa distribuída, os quais podem ser concebidos através da degeneração dos elementos adotados para a modelagem do trilho através da anulação do termo de rigidez de flexão.

### 3.4 Generalização do modelo para carregamentos móveis

A análise da resposta dinâmica induzida por ações de tráfego ferroviário requer o desenvolvimento de modelos que permitam atender a solicitações com posição espacial variável no tempo (cargas móveis), com magnitude constante ou também ela variável no tempo. Considerando as características do problema em estudo, apresenta-se a seguir uma extensão do método apresentado para contemplar situações de carregamentos móveis com velocidade constante.

A generalização do modelo 2.5 D para atender a ações com caráter móvel pode ser efetuada utilizando as propriedades das transformadas de Fourier. Esta formulação,
além de simples, atende ao caráter móvel do carregamento de um modo totalmente exato.

Considere-se então uma carga que se movimenta na direção x, com velocidade c, e que apresenta amplitude variável ao longo do tempo:

$$
\begin{equation*}
p(x, y, z, t)=p_{x}(x-c t) p_{y}(y) p_{z}(z) p_{t}(t) \tag{3.40}
\end{equation*}
$$

Transformando a variável espacial x para o domínio do número de onda,

$$
\begin{equation*}
p\left(k_{1}, y, z, t\right)=p_{x}\left(k_{1}\right) e^{-i k_{1} c t} p_{y}(y) p_{z}(z) p_{t}(t) \tag{3.41}
\end{equation*}
$$

e aplicando agora uma transformada de Fourier à variável temporal t, a expressão [3.41] reduz-se a:

$$
\begin{equation*}
p\left(k_{1}, y, z, \omega\right)=p_{x}\left(k_{1}\right) p_{y}(y) p_{z}(z) p_{t}\left(\omega=\Omega-k_{1} c\right) \tag{3.42}
\end{equation*}
$$

Deste modo, para a consideração de cargas móveis, basta proceder à substituição, nas equações anteriormente apresentadas, da frequência angular, $\omega$, por $\omega=\Omega-k_{1} c$, em que $\Omega$ é a frequência de oscilação da carga.

Note-se que a análise de um carregamento móvel no domínio do número de onda--frequência implica uma interdependência entre o número de onda $\left(k_{1}\right)$ e a frequência $(\omega)$. Essa interdependência deixa de existir quando a velocidade de circulação é nula, ou seja, no caso em que a solicitação ocupa uma posição geométrica fixa.

Diante do exposto, conclui-se que uma das vantagens do recurso a formulações no domínio do número de onda-frequência reside na facilidade com que os modelos podem ser adaptados para a análise de carregamentos móveis, com amplitude constante ou variável no tempo, não exigindo a adoção de nenhum esquema computacional complexo, nem incrementando o esforço de cálculo necessário.

Deve-se, contudo, atentar para o processo de inversão dos resultados da análise. Com efeito a propriedade de translação da transformada de Fourier, a qual permite estabelecer o carregamento móvel sem necessidade de qualquer alteração das equações de equilíbrio do sistema ou introdução de complexidade adicional, reflete-se, em termos práticos, em uma alteração do referencial fixo para o referencial móvel quando se aplica a transformação inversa. Do ponto de vista matemático, tal relação é estabelecida da seguinte forma:

$$
\begin{equation*}
f(x-c t, y, z, \Omega)=\frac{1}{2 \pi} \int_{-\infty}^{+\infty} f\left(k_{1}, y, z, \Omega-k_{1} c\right) e^{i k_{1}(x-c t)} d k_{1} e^{i \Omega t} \tag{3.43}
\end{equation*}
$$

Um outro aspecto que merece menção no presente contexto refere-se ao esforço computacional necessário para considerar carregamentos harmônicos com caráter
móvel. Com efeito, quando a solicitação apresenta posição geométrica fixa, isto é, no caso de solicitações harmônicas não móveis, a parte real da resposta é simétrica relativamente à origem do referencial $k_{1}$, enquanto a parte imaginária é antissimétrica, ou, dito de outra forma o valor para um dado $k_{1}$ negativo corresponde ao conjugado do valor obtido para o simétrico de $k_{1}$. Este fato de enorme importância do ponto de vista computacional, deixa de ser verificado quando o carregamento apresenta caráter móvel, sendo facilmente justificado tal fato considerando o efeito de Doppler inerente às características móveis da solicitação. Desse modo, a frequência de resposta deixa de ser igual à frequência de solicitação, sendo a mesma dependente do número de onda $k_{1}$, tanto mais que:

$$
\begin{equation*}
\omega=\Omega-k_{1} c \tag{3.44}
\end{equation*}
$$

### 3.5 Validação teórica

### 3.5.1 Considerações iniciais

A validação é uma etapa muito importante do desenvolvimento e da implementação de modelos numéricos.

A validação teórica dos modelos desenvolvidos é muito relevante, pois permite avaliar sua exatidão e identificar suas potencialidades. Desse modo, e atendendo à especial relevância do modelo proposto nas seções anteriores no âmbito da presente tese, é agora apresentado um conjunto de exemplos de validação alargado, com grau de complexidade crescente, indo desde exemplos simples de propagação unidirecional de ondas até exemplos mais complexos onde o processo de propagação de ondas desde o interior do túnel até à superfície do terreno é considerado.

### 3.5.2 Propagação unidirecional de ondas - problema 1 D

Um dos problemas mais simples do ponto de vista de propagação de ondas consiste na consideração do problema de propagação de ondas longitudinais em uma barra semi-infinita devido à aplicação de um impulso na extremidade livre da mesma.

Com base no referido cenário, considere-se então uma barra semi-infinita, cujo domínio de interesse se encontra confinado entre a superfície livre e a seção C, situada a 8 m da extremidade livre, tal como indicado na Figura 3.9a.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-090_609_1222_121_423.jpg)
Figura 3.9: Propagação unidirecional de ondas: a) barra semi-infinita; b) modelo MEF-PML; c) modelo sem tratamento de fronteira.

Na Figura 3.9b é apresentado o modelo MEF-PML, ao passo que a Figura 3.9c corresponde a um modelo MEF, no qual a fronteira do domínio de interesse não é devidamente tratada, sendo prescrita a restrição do deslocamento ao longo da mesma, embora esta tenha sido considerada a uma distância de 2 m do término do domínio de interesse (trecho A-C).

Na extremidade livre da barra é imposta uma ação axial transiente, com a configuração de um impulso de Ricker, cuja representação nos domínios do tempo e da frequência se encontra ilustrada nas Figura 3.10a e Figura 3.10b, respectivamente.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-090_633_1750_1523_156.jpg)
Figura 3.10: Impulso de Ricker adotado: a) representação no domínio do tempo; b) representação no domínio da frequência (conteúdo em frequência).

As propriedades mecânicas da barra estão devidamente indicadas na Figura 3.9. Com o objetivo de tratar um problema unidirecional, admitiu-se $k_{1}=0$, o que permite que o modelo 2.5D degenere em um modelo 2D. Uma vez que o coeficiente de Poisson é nulo, a deformação longitudinal da barra ocorre sem que acarrete qualquer variação da seção transversal, podendo assim tratar-se o problema como unidirecional. Deve-se observar que a solicitação em causa, bem como a geometria do problema, implicam
a geração de apenas ondas longitudinais. Contudo, cabe mencionar que as funções de transformação de referencial do PML (expressões [3.33] e [3.34]) estão definidas em função da velocidade de propagação de ondas de cisalhamento. Com efeito, existe aqui uma certa incongruência que convém esclarecer: em um problema tridimensional propagam-se diversos tipos de ondas, razão pela qual seria necessário tomar uma opção quanto à descrição matemática das referidas funções, devendo as mesmas garantir um adequado desempenho do PML, independentemente do tipo de onda em consideração. Como se verá a seguir, as funções anteriormente definidas atendem ao referido requisito, mesmo quando a onda em consideração não implica deformação por cisalhamento.

A Figura 3.11a compara a história temporal do deslocamento axial da seção B obtida através do modelo MEF (sem tratamento de fronteira) com a solução teórica avaliada através de um modelo baseado nas matrizes de Haskell-Thomson, o qual havia sido previamente validado por Alves Costa (2011). Como se constata, apenas se verifica concordância entre a solução numérica e a solução teórica no decorrer dos primeiros instantes da história temporal. Com efeito, a onda que atinge o limite discretizado é refletida, passando a ocorrer uma sequência de reflexões entre as seções A e D, sendo a atenuação de amplitude verificada determinada apenas pelo amortecimento material admitido no modelo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-091_812_1747_1587_156.jpg)
Figura 3.11: Registro temporal do deslocamento longitudinal na seção B obtido através dos diferentes modelos: a) modelo com fronteira não tratada; b) modelo MEF-PML.

É nítido o contraste entre o que foi descrito na seção anterior e os resultados apresentados na Figura 3.11b, que compara o modelo MEF-PML com a solução teórica. Com efeito, existe uma concordância perfeita entre solução teórica e a solução fornecida
pelo modelo MEF-PML, não sendo identificável qualquer perturbação na deformação axial na seção B devido a reflexões espúrias de onda.

A relevância do aspecto enfatizado no parágrafo anterior é ainda mais notória se a seção de controle passar a ser a seção C, isto é, a seção que delimita o domínio de interesse. Este aspecto é evidente na Figura 3.12, onde as histórias temporais da deformação axial na referida seção são ilustradas.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-092_821_1749_594_158.jpg)
Figura 3.12: Registro temporal do deslocamento longitudinal na seção C obtido através dos diferentes modelos: a) modelo com fronteira não tratada; b) modelo MEF-PML.

Como esperado, o modelo que prescindiu do tratamento das fronteiras artificiais não atende ao requisito de simulação de uma barra semi-infinita (ver Figura 3.12a). Porém, o grau de precisão da solução alcançada pelo modelo MEF-PML é excelente, mesmo correspondendo a seção C a uma seção limite entre o domínio de interesse e o domínio PML. Este aspecto reveste-se de elevada importância pois sugere que não é necessário ampliar o domínio de interesse, apresentando-se assim como uma vantagem do método MEF-PML em relação à conjugação dos métodos de elementos finitos e infinitos ou da consideração de fronteiras viscosas [42], [80].

Apesar do sucesso alcançado no presente exemplo de validação é conveniente referir que o modelo prima pela simplicidade, sendo apenas permitida a propagação de ondas longitudinais com direção totalmente definida (direção axial da barra). Por esse motivo, exemplos de maior complexidade são desenvolvidos nas subseções seguintes.

### 3.5.3 Resposta de um meio indefinido - modelagem 2.5D e 2D

Com o objetivo de testar a confiabilidade e a precisão do modelo implementado, um exemplo um pouco mais complexo que o anterior é aqui simulado, sendo os resultados comparados com a solução analítica explícita proposta por Tadeu \& Kausel (2000). A

Figura 3.13 mostra as características principais do problema, bem como a geometria da malha de elementos finitos 2.5D adotada. Para a análise numérica, utilizaram-se as condições de simetria e antissimetria do problema, impondo-se assim as condições de fronteira da malha de elementos finitos 2.5D indicadas na Figura 3.13b.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-093_954_1750_435_159.jpg)
Figura 3.13: Descrição do problema de validação: a) propriedades do meio indefinido; b) malha de elementos finitos 2.5D.

O domínio de interesse tem $3 \mathrm{~m} \times 3 \mathrm{~m}$ de seção transversal e é representado por elementos finitos 2.5D, sendo a largura de cada elemento $\mathrm{le}=0,3 \mathrm{~m}$. Por sua vez, ao longo do contorno exterior do referido domínio, ou seja, nas fronteiras artificiais, é aplicada uma camada de elementos PML com 1 m de espessura, sendo a sua dimensão ajustável em função do comprimento de onda que se propaga no plano YOZ. Cabe mencionar que o uso de uma malha de elementos finitos tão pequena para simular um meio indefinido foi intencional, buscando-se avaliar a capacidade do modelo de responder a solicitações em que o comprimento de onda gerado seja substancialmente superior à dimensão do domínio de interesse.

O meio indefinido é excitado por uma carga vertical que é harmônica em relação ao eixo longitudinal de coordenadas x, com número de onda $k_{1}$. No domínio espaço--frequência, a carga é dada por:

$$
\begin{equation*}
p_{j}(x, y, z, \omega)=\delta_{i j} \delta(y) \delta(z) \cos \left(k_{1} x\right) \tag{3.45}
\end{equation*}
$$

Uma vez que a carga é harmônica, os deslocamentos resultantes também são harmônicos:

$$
\begin{equation*}
u_{j}(x, y, z, \omega)=u_{j}\left(k_{1}, y, z, \omega\right) \cos \left(k_{1} x\right) \tag{3.46}
\end{equation*}
$$

As Figura 3.14 e Figura 3.15 mostram os deslocamentos verticais ao longo do eixo y para números de onda $k_{1}$ adimensionais, definidos como $\boldsymbol{k}_{1}=k_{1} \frac{C_{s}}{\omega}$, e para frequências de 10 Hz e 75 Hz, respectivamente.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-094_1670_1746_362_158.jpg)
Figura 3.14: Parte real e imaginária do deslocamento vertical $u_{z}(x, y, z, \omega)$ ao longo do eixo y do meio indefinido quando solicitado por uma carga vertical com uma frequência de excitação de 10 Hz e para os números de onda adimensionais: a) $\boldsymbol{k}_{1}=0.5$; b) $\boldsymbol{k}_{1}=1.0$; c) $\boldsymbol{k}_{1}=1.5$.

Analisando os resultados apresentados nas Figura 3.14 e Figura 3.15, pode-se concluir que a concordância entre as soluções numéricas e teóricas é excelente, independentemente do número de onda ou frequência. Deve ser salientado que, para $k_{1}$ superior a 1 apenas são originadas ondas evanescentes ao longo da seção transversal, tal como sugerido pela equação [3.35]. Dado o fato de o amortecimento material considerado ser muito reduzido, a componente imaginária da resposta é praticamente nula quando $k_{1}$ é superior à unidade, evidenciando o caráter evanescente da resposta. Este efeito
também é muito bem reproduzido pelo modelo numérico, verificando-se uma correspondência perfeita entre os resultados numéricos e teóricos.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-095_1587_1747_282_159.jpg)
Figura 3.15: Parte real e imaginária do deslocamento vertical $u_{z}(x, y, z, \omega)$ ao longo do eixo y do meio indefinido quando solicitado por uma carga vertical com uma frequência de excitação de 75 Hz e para os números de onda adimensionais: a) $\boldsymbol{k}_{1}=0.5$; b) $\boldsymbol{k}_{1}=1.0$; c) $\boldsymbol{k}_{1}=1.5$.

Um outro aspecto muito relevante que é evidenciado pelos resultados agora expostos, com especial destaque para a Figura 3.14a, está relacionado com a capacidade do modelo em reproduzir com precisão ondas propagantes, mesmo quando o seu comprimento de onda é substancialmente superior ao domínio de interesse. Com efeito, nas condições da Figura 3.14a, o comprimento da onda de cisalhamento propagante é de cerca de 14,5 m, correspondendo assim a cerca de 5 vezes a dimensão do domínio de interesse. A notória capacidade do modelo em reproduzir tal efeito deve-se à configuração das funções de mudança de referencial adotadas para o PML (expressões [3.33] e [3.34]). A introdução de uma componente real que é função do número de
onda propagante na seção transversal permite que o modelo adapte automaticamente a dimensão dos elementos PML, acomodando assim a capacidade de simulação de grandes comprimentos de onda.

Pretendendo alargar o procedimento de validação, uma análise 2D também foi realizada. Na verdade, impondo $k_{1}=0$, o problema 2.5D redunda em uma análise de deformação plana 2D. Para essa situação e assumindo o espaço indefinido com as propriedades indicadas na Figura 3.13 (a), assim como o modelo descrito na Figura 3.13b, considerou-se agora uma carga vertical transiente em correspondência com o impulso de Ricker ilustrado na Figura 3.10. O ponto de aplicação da ação corresponde à origem do referencial (ver Figura 3.13a).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-096_720_1752_897_155.jpg)
Figura 3.16: Deslocamentos verticais no domínio do tempo, devido à excitação induzida pelo impulso de Ricker: a) Ponto A; b) Ponto B.

A Figura 3.16 mostra a resposta, no domínio espaço-tempo, dos pontos A e B indicados na Figura 3.13b, que estão posicionados no limite do domínio de interesse. Sobrepostos aos resultados numéricos, apresentam-se os resultados teóricos (calculados através das funções de Green 2.5D propostas por Tadeu e Kausel). Mais uma vez, a concordância entre a solução numérica e a teórica é perfeita, não havendo nenhuma distinção entre os resultados obtidos, mesmo para pontos localizados ao longo da fronteira do domínio de interesse. Este fato evidencia uma vez mais a capacidade do modelo proposto, mesmo quando o ponto em análise pertence à interface MEF-PML. Este aspecto reveste-se de muita importância, pois permite aproveitar integralmente o domínio de interesse e dispensar a simulação de uma zona de sacrifício para a qual poderiam existir reservas quanto à qualidade dos resultados obtidos.

Ainda em torno do mesmo exemplo de validação, uma comparação de resultados mais abrangente é dada pela Figura 3.17, onde o campo de deslocamentos verticais
é descrito para alguns instantes temporais. Apenas o segundo quadrante da figura foi calculado pelo método numérico, sendo os resultados representados nos restantes quadrantes obtidos pela solução teórica proposta por Tadeu \& Kausel (2000). Como se pode verificar, a concordância de resultados é perfeita para qualquer um dos instantes considerados, não se constatando qualquer reflexão espúria nas fronteiras artificiais do problema.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-097_1596_1751_584_157.jpg)
Figura 3.17: Campo de deslocamentos verticais do meio indefinido devido à excitação induzida pelo impulso de Ricker para diferentes instantes temporais: a) $\mathrm{t}=0,214 \mathrm{~s}, \mathrm{~b}) \mathrm{t}=0,219 \mathrm{~s}, \mathrm{c}) \mathrm{t}=0,224 \mathrm{~s}$, e d) $\mathrm{t}=0,229 \mathrm{~s}$.

### 3.5.4 Simulação quase tridimensional do sistema túnel-maciço geotécnico

### 3.5.4.1 Generalidades

Apesar do indubitável interesse dos resultados apresentados nas seções anteriores, os quais realçam a precisão e potencialidade do modelo desenvolvido, não deve ser esquecido que o objetivo é o desenvolvimento de uma ferramenta numérica para a
análise da resposta dinâmica de túneis. Tendo presente tal objetivo, procedeu-se à identificação de alguns casos simples previamente identificados na bibliografia que pudessem servir de base de validação do modelo proposto. Dada a inexistência de soluções analíticas para cenários de elevada complexidade, como a resposta de um maciço geotécnico devido à aplicação de uma ação dinâmica no interior de um túnel, os exemplos de validação a seguir apresentados recorreram ao confronto da solução prevista pelo modelo proposto com soluções correspondentes avaliadas por metodologias totalmente distintas. Cabe mencionar ainda que o próprio modelo agora apresentado tem também servido de base para a validação de um outro modelo numérico, baseado no acoplamento 2.5D MSF-MEF [83] (método das soluções fundamentais -método dos elementos finitos) o qual está sendo desenvolvido por uma equipe conjunta da FCTUC e da FEUP, estando a autora do presente trabalho envolvida na referida equipe.

Considerando o objetivo agora proposto, são a seguir apresentados exemplos de validação para os seguintes cenários: i) túnel inserido em um meio indefinido; ii) túnel inserido em um meio semi-infinito; iii) túnel inserido em um meio semi-infinito e submetido a um carregamento móvel com configuração harmônica. Note-se que a simulação de meios semi-infinitos acarreta um novo nível de desafio, pois além da geração de ondas de corpo, a presença da fronteira livre implica a propagação de ondas superficiais.

### 3.5.4.2 Túnel inserido em um meio indefinido

Para o presente exemplo de validação foi selecionado um conjunto de resultados previamente apresentados em um estudo elaborado por Gupta et al. (2007). O caso analisado foi utilizado para a validação de um modelo numérico desenvolvido por esses autores, comparando para o efeito a solução numérica com os resultados semianalíticos fornecidos pelo modelo PiP (Pipe in Pipe) desenvolvido por Forrest \& Hunt (2006), o qual foi posteriormente aperfeiçoado por Hussein \& Hunt (2007). Especificamente, o estudo apresentado a seguir compara três metodologias distintas para a análise da resposta dinâmica de um túnel inserido em um meio indefinido: i) o modelo 2.5D MEF-PML agora proposto; ii) o modelo periódico MEF-MEC apresentado por Gupta et al. (2007) iii) o modelo semianalítico PiP, que é aqui assumido como a solução de referência.

A Figura 3.18 resume as propriedades do túnel e do meio indefinido envolvente. O túnel, com um raio interno de 2,75 m e um revestimento de concreto, com 0,25 m de espessura, é submetido a uma carga pontual vertical harmônica aplicada na sua base.

Os pontos de observação são definidos por coordenadas polares na seção transversal do problema e por coordenadas retangulares na direção ortogonal, como se segue: $\mathrm{x}=0 \mathrm{~m}, \mathrm{r}, \theta$. A carga é aplicada no ponto com coordenadas (0;2,75;0).

A malha de elementos finitos tem 10 m de largura e 40 m de altura, ou seja prolonga-se 20 m na direção z relativamente ao centro do túnel (note-se que os pontos A e C pertencem à interface entre o domínio dos elementos finitos e dos PML's). O domínio foi discretizado em elementos finitos 2.5D, sendo a largura de cada elemento inferior a 0,63 m, a fim de obter resultados precisos para frequências até 80 Hz. Para evitar reflexões espúrias de ondas que possam atingir as fronteiras artificiais do problema, uma camada de elementos PML com 1 m de espessura, compreendendo cinco camadas de elementos finitos 2.5D, foi acoplada ao longo das fronteiras artificiais.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-099_1010_1489_1049_289.jpg)
Figura 3.18: Túnel inserido em um meio indefinido: a) Descrição do problema; b) Malha de elementos finitos 2.5D.

A Figura 3.19 mostra a parte real da norma do campo de deslocamentos para o plano YOZ, ou seja, o plano que compreende a carga e os pontos de observação, para frequências distintas. Uma inspeção preliminar das figuras permite antecipar a boa qualidade dos resultados, não sendo percebida nenhuma perturbação dos campos de deslocamentos na proximidade das fronteiras do modelo.

Note-se que, apesar da representação bidimensional apresentada na Figura 3.19, os resultados correspondem a uma análise tridimensional. Com efeito, o problema
foi resolvido para sucessivos valores de $k_{1}$, sendo posteriormente invertido para o domínio do espaço.

Embora a análise da resposta esteja fora do âmbito do estudo proposto para a presente seção, a análise dos resultados da Figura 3.19 permite desde logo constatar que o aumento da frequência de excitação leva a uma concentração da deformação na região abaixo do túnel, diminuindo assim a energia que é transmitida para o meio acima do túnel. Este e outros aspectos são devidamente analisados em um capítulo posterior da presente tese.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-101_2001_1496_117_285.jpg)
Figura 3.19: Parte real do campo de deslocamentos ao longo do plano YOZ induzido por uma carga pontual harmônica, aplicada na base do túnel, com frequências distintas $\left(\times 10^{-11}\right)$ : a) 20 Hz; b) 40 Hz; c) 60 Hz; d) 80 Hz.

Retomando o objetivo de validação, a comparação entre os resultados proporcionados pelos diferentes modelos está patente na Figura 3.20, onde se ilustra o módulo da função de transferência do deslocamento vertical para cada um dos pontos de observação indicados na Figura 3.18a.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-102_1433_1753_120_159.jpg)
Figura 3.20: Função de transferência dos deslocamentos verticais em diferentes locais: a) Ponto A; b) Ponto B; c) Ponto C.

Como se constata, o modelo proposto alcança uma precisão muito boa. Na realidade, há uma concordância quase perfeita entre os resultados numéricos fornecidos pelo modelo proposto e os resultados obtidos usando o modelo PiP. Note-se que o modelo PiP é um modelo semianalítico baseado na teoria de propagação de ondas em tubos de parede espessa, permitindo obter uma solução exata nas presentes condições, ou seja, um túnel inserido em um espaço indefinido [126]. Porém, apesar das recentes alterações introduzidas no referido modelo, em particular quanto à possibilidade de simulação de túneis em meios semi-infinitos [167], não poderá deixar de ser referido que a solução não atende a todos os requisitos de compatibilidade e equilíbrio, pois apresenta um erro inerente à formulação, o qual é tanto mais significativo quanto mais superficial for o túnel [81]. Além disso, o modelo numérico proposto é muito versátil, permitindo simular geometrias complexas, que não podem ser representadas em um modelo semianalítico como o modelo PiP.

No que diz respeito à comparação com o modelo periódico MEF-MEC proposto por Gupta et al. (2007), é claro, a partir dos resultados expressos acima, que o modelo 2.5D MEF-PML pode superar sua precisão. De fato, a ondulação entre os picos com um passo de 20 Hz, que está presente na Figura 3.20a, é muito bem reproduzida no modelo proposto, não sendo tão perceptível na solução alcançada por Gupta et al. (2007). Uma breve observação relativamente a esta modulação: a sua configuração deve-se à interferência entre ondas de cisalhamento e ondas longitudinais, a qual leva a uma minimização da resposta para frequências concretas em função da localização do ponto receptor em relação à fonte de excitação dinâmica. Este aspecto é tratado com devido detalhe no capítulo posterior da presente tese.

Uma última nota relativa ao tempo de cálculo: embora o modelo proposto não consiga alcançar a eficiência de desempenho do modelo PiP (tanto mais que na versão do presente estudo a solução é obtida por via analítica), os resultados expressos na Figura 3.20 foram obtidos com um esforço computacional inferior a uma hora, o que corresponde a um valor substancialmente inferior ao necessário à aplicação do modelo periódico MEC-MEF proposto por Gupta et. al. [74]. Um dos aspectos que mais concorre para o alto desempenho da formulação proposta está relacionado com as capacidades de paralelização de cálculo oferecidas pela plataforma MatLab.

### 3.5.4.3 Túnel inserido em um meio semi-infinito

Apesar do interesse teórico do caso analisado na seção precedente, o modelo de túnel inserido em um meio indefinido representa a realidade de forma relativamente limitada. Com exceção de casos muito específicos, como o de túneis construídos a grande profundidade para os quais, regra geral, o problema de vibrações induzidas por tráfego não se coloca, são poucas as situações em que tal modelo pode ter utilidade prática. Situação inversa ocorre no caso de o meio no qual se insere o túnel corresponder a um semiespaço, o qual encontra paralelo nos maciços geotécnicos em que os efeitos de evolução em profundidade das propriedades geomecânicas não sejam muito notórios, pelo menos, ao longo do domínio abrangido pelo problema. Assim sendo, e dado que a presença de uma fronteira livre origina a propagação de ondas superficiais, o que por si só constitui um desafio adicional quanto à modelagem numérica, pode pois afirmar-se que a introdução de um exemplo de validação nesse domínio se reveste de elevado interesse.

Considerando os aspectos apresentados no parágrafo anterior, bem como a inexistência de solução analítica conhecida para tal cenário, seguiu-se a via de validação cruzada de dois modelos numéricos totalmente distintos: o modelo 2.5D MEF-PML
desenvolvido no âmbito da presente tese e um modelo 2.5D MEF-MSF, o qual resulta de um esforço de pesquisa conjunto entre o grupo de pesquisa em que a autora se insere e uma equipe da FCTUC [83].

Cabe fazer uma breve observação sobre a técnica de modelagem MEF-MSF. Na verdade trata-se de um método acoplado onde as geometrias irregulares são abordadas pelo método dos elementos finitos, ao passo que o meio regular, neste caso o solo circundante ao túnel, é simulado recorrendo ao método sem malha das soluções fundamentais, MSF. Este método permite descrever a resposta do meio através de soluções fundamentais (funções de Green), que são compatibilizadas nas fronteiras atendendo às condições de equilíbrio e continuidade do campo de deslocamentos. Relativamente ao método dos elementos de contorno, a vantagem do MSF reside na ausência de necessidade de integração dos campos de variável ao longo do elemento, o que resulta em uma diminuição do esforço computacional. Informação detalhada sobre a técnica MEF-MSF em simulações 2D pode ser encontrada em Godinho et al. (2013), ao passo que a versão 2.5D pode ser brevemente consultada em Amado Mendes et al. (2015), da qual a autora da presente tese é coautora.

A seção transversal do exemplo adotado para o presente estudo de validação é apresentada na Figura 3.21. As propriedades geométricas e mecânicas do túnel e do maciço envolvente encontram-se também indicadas na Figura 3.21. Um dado importante é que o túnel é bastante superficial, sendo o seu recobrimento de apenas 6 m, ou seja, idêntico ao diâmetro do mesmo. Para situações como esta, modelos mais eficientes do ponto de vista computacional, como o PiP, não permitem, regra geral, alcançar soluções com a precisão pretendida.

Como pontos de observação foram selecionados os pontos A, B, C, D, E e F, todos pertencentes à superfície livre do terreno e à seção transversal onde é aplicada a carga oscilante na soleira do túnel. Quanto à malha 2.5D MEF-PML, esta encontra--se representada na Figura 3.22, tendo sido desenvolvida atendendo às condições de simetria do problema. Cabe mencionar que a largura do domínio discretizado por elementos finitos, ou seja, o domínio de interesse apresenta exatamente 20 m, ou seja, o ponto F está inscrito na interface com os PML's. A dimensão dos elementos finitos foi definida considerando uma excitação com frequência máxima de 80 Hz. Quanto ao domínio PML, seguiu-se a regra habitual da definição de um domínio adaptativo com 1 m de espessura e discretizado em 5 camadas.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-105_655_1233_121_413.jpg)
Figura 3.21: Túnel inserido em um meio semi-infinito - descrição do problema.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-105_732_961_889_552.jpg)
Figura 3.22: Túnel inserido em um meio semi-infinito - malha de elementos finitos/PML's 2.5D.

Na Figura 3.23 são comparados os resultados referentes às funções de transferência de deslocamento vertical dos pontos de observação avaliados pelos dois métodos anteriormente referidos. Como se pode verificar a concordância é excelente, sendo apenas de notar um muito ligeiro desvio das duas soluções para frequências inferiores a 4 Hz. Além disso, e uma vez mais, o modelo 2.5D MEF-PML revela excelentes capacidades na simulação da resposta mesmo em pontos pertencentes ao limite do domínio de interesse, como é o caso do ponto F.

Como já anteriormente referido, os picos invertidos observados nas funções de transferência representadas na Figura 3.23 correspondem a interferências entre diferentes tipos de ondas. Se no caso anterior apenas ondas de corpo eram admissíveis (ondas P e ondas S), dado o caráter indefinido do maciço, o mesmo não ocorre para o caso presente, onde a propagação de ondas superficiais junto da superfície do terreno não só ocorre como tem grande relevância na resposta (as ondas superficiais são menos atenuadas por efeitos geométricos do que as ondas de corpo). Portanto, agora
os picos invertidos implicam a interferência entre ondas S, ondas P e ondas R. Dada a excelente concordância entre os resultados previstos pelos dois métodos, pode pois concluir-se que o método 2.5D MEF-PML apresenta elevada capacidade na simulação de efeitos de ondas superficiais e respectiva interferência com outros tipos de onda.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-106_1729_1752_435_157.jpg)
Figura 3.23: Funções de transferência de deslocamento vertical em diferentes pontos da superfície do terreno: a) Ponto A; b) Ponto B; c) Ponto C; d) Ponto D; e) Ponto E; f) Ponto F (linha contínua preta - 2.5D MEF-PML; círculos azuis - 2.5D MEF-MSF).

Outro aspecto que merece comentário é a redução do espaçamento em frequência entre os picos invertidos com o aumento da distância entre a fonte e o receptor.

As figuras a seguir permitem uma visão global mais clara da precisão do modelo proposto: Figura 3.24 e Figura 3.25, nas quais se ilustra a norma do campo de deslocamentos induzido na seção transversal onde se inscreve a ação para frequências de excitação de 20 Hz e 60 Hz, respectivamente. O lado esquerdo das figuras resulta da
aplicação do modelo 2.5D MEF-PML, ao passo que o lado direito resulta da aplicação do modelo 2.5D MEF-MSF. Deverá ser aqui realçado que para um exemplo como o aqui analisado, o esforço de cálculo implícito ao modelo 2.5D MEF-PML é substancialmente inferior ao verificado para o modelo 2.5D MEF-MSF. Esta vantagem computacional tende a diminuir com o aumento da distância fonte-receptor, onde a supremacia de modelos não discretizados, como o MSF, é indiscutível.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-107_1344_1760_586_155.jpg)
Figura 3.24: Campo de deslocamentos na seção transversal $\mathrm{x}=0 \mathrm{~m}$ devido à ação de uma carga pontual vertical unitária com frequência de 20 Hz: a) Parte real; b) Parte imaginária (amplitude da resposta em metros multiplicada por $10^{-11}$ ) [82].

Passando agora à análise dos resultados expostos nas Figura 3.24 e Figura 3.25, é notória a concordância entre os resultados previstos pelos dois modelos em causa, servindo o presente exemplo de validação cruzada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-108_1404_1764_114_150.jpg)
Figura 3.25: Campo de deslocamentos na seção transversal $\mathrm{x}=0 \mathrm{~m}$ devido à ação de uma carga pontual vertical unitária com frequência de 60 Hz: a) Parte real; b) Parte imaginária (amplitude da resposta em metros multiplicada por $10^{-11}$ ) [82].

### 3.5.4.4 Túnel inserido em um meio semi-infinito e submetido a carregamento móvel

Dado o âmbito da presente tese não poderia considerar-se o estudo de validação como completo sem que fosse efetuada uma análise do problema dinâmico suscitado por carregamentos móveis com amplitude harmônica. Desse modo, considere-se agora o sistema mecânico representado na Figura 3.21, mas supondo que a carga unitária aplicada na soleira do túnel se move na direção x com uma velocidade $\mathrm{c}=40 \mathrm{~m} / \mathrm{s}$. Além disso considere-se ainda que simultaneamente ao movimento, a carga oscila com uma frequência $\mathrm{f}=20 \mathrm{~Hz}$.

Visto que para as condições indicadas no parágrafo anterior não é conhecida solução analítica, recorreu-se uma vez mais à validação cruzada com base na confrontação entre os resultados previstos pelo modelo proposto e pelo modelo 2.5D MEF-MSF. Na Figura 3.26 e na Figura 3.27 é apresentada uma confrontação de resultados no domínio do número de onda. A Figura 3.26 refere-se ao valor da resposta nas dife-
rentes direções para o alinhamento no qual se inscreve o ponto A (ver Figura 3.21 ), ou seja $\left(k_{1}, y_{A}, z_{A}\right)$, sendo os resultados correspondentes mas agora referentes ao alinhamento que inclui o ponto F $\left(k_{1}, y_{F}, z_{F}\right)$ ilustrados na Figura 3.27. Como se constata, a concordância entre os resultados avaliados pelos dois métodos é perfeita, tanto para o alinhamento pertencente ao plano de simetria do problema como para o alinhamento pertencente ao limite do domínio de interesse.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-109_653_1746_590_157.jpg)
Figura 3.26: Funções de transferência de deslocamento para o alinhamento longitudinal onde se inscreve o ponto A (linha contínua preta - 2.5D MEF-PML; círculos azuis - 2.5D MEF-MSF): a) $u_{z}\left(k_{1}, y_{a}, z_{a}\right)$; b) $u_{x}\left(k_{1}, y_{a}, z_{a}\right)$; b) $u_{y}\left(k_{1}, y_{a}, z_{a}\right)$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-109_639_1748_1470_156.jpg)
Figura 3.27: Valor absoluto das funções de transferência de deslocamento para o alinhamento longitudinal onde se inscreve o ponto F (linha contínua preta - 2.5D MEF-PML; círculos azuis - 2.5D MEF-MSF): a) $u_{z}\left(k_{1}, y_{F}, z_{F}\right)$; b) $u_{x}\left(k_{1}, y_{F}, z_{F}\right)$; b) $u_{y}\left(k_{1}, y_{F}, z_{F}\right)$.

Dado que a concordância é perfeita no domínio transformado, consequentemente também o é no domínio não transformado. Na Figura 3.28 apresentam-se os resultados referentes à parte real e imaginária da amplitude da resposta ao longo do alinhamento longitudinal que inclui o ponto A, descrito através da coordenada móvel s=x-ct. Dadas as condições de simetria do problema, o deslocamento segundo a direção y é nulo ao longo do referido alinhamento, razão pela qual é aqui dispensada a sua representação.

Relativamente à resposta no domínio não transformado ao longo do alinhamento onde se inscreve o ponto F, esta encontra-se representada na Figura 3.29. Como se pode verificar, mesmo ao longo do alinhamento em causa, o qual corresponde a um limite do domínio de interesse, continua a verificar-se uma concordância absoluta entre os resultados fornecidos pelos dois métodos sob escrutínio.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-110_964_1485_511_291.jpg)
Figura 3.28: Componentes do deslocamento ao longo do alinhamento que inclui o ponto A (referencial móvel): a) parte real de $u_{z}\left(s, y_{A}, z_{A}\right)$;b) parte imaginária de $u_{z}\left(s, y_{A}, z_{A}\right)$; c) parte real de $u_{x}\left(s, y_{A}, z_{A}\right)$; d) parte imaginária de $u_{x}\left(s, y_{A}, z_{A}\right)$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-111_1414_1486_118_290.jpg)
Figura 3.29: Componentes do deslocamento ao longo do alinhamento que inclui o ponto F (referencial móvel): a) parte real de $u_{z}\left(s, y_{F}, z_{F}\right)$;b) parte imaginária de $u_{z}\left(s, y_{F}, z_{F}\right)$; c) parte real de $u_{x}\left(s, y_{F}, z_{F}\right)$; d) parte imaginária de $u_{x}\left(s, y_{F}, z_{F}\right)$; e) parte real de $u_{y}\left(s, y_{F}, z_{F}\right)$; f) parte imaginária de $u_{y}\left(s, y_{F}, z_{F}\right)$.

### 3.6 Considerações finais

Este capítulo foi dedicado à apresentação e validação de uma ferramenta de cálculo especialmente adaptada para a análise da resposta dinâmica de estruturas com desenvolvimento infinito. Embora a ferramenta tenha sido desenvolvida tendo como plataforma de base um modelo numérico previamente existente e baseado no método dos elementos finitos 2.5D, as melhorias implementadas no decorrer da presente tese, em particular a incorporação da técnica do método das camadas absorventes (PML) na versão 2.5D, permitiram alcançar um estágio mais elevado de sofisticação na modelagem numérica dos problemas em causa. Com efeito, as potenciais desvantagens inerentes à simulação de meios semi-infinitos pelo método dos elementos finitos 2.5D e ao tratamento das respectivas fronteiras locais pelo método das fronteiras absorventes ou pelo método dos elementos infinitos, as quais se encontram bem identificadas por Alves Costa et al. (2010), são suplantadas pela incorporação da técnica PML 2.5D,
principalmente considerando o caráter adaptativo da técnica, a qual permite um ajuste automático da malha em função da frequência de excitação.

Um outro aspecto relevante suscitado no presente capítulo está relacionado com o conjunto de exemplos de validação desenvolvidos, com grau crescente de complexidade, que além de constituírem uma contribuição na exposição das potencialidades do modelo, constituem também um conjunto de "benchmarks" que já têm sido utilizados para validação de modelos propostos por outros autores, em particular o modelo 2.5D MEF-MSF [83]. Por fim, cabe mencionar que, comparativamente com outros modelos, a ferramenta agora proposta apresenta um desempenho computacional notável.

## 4 Propagação de vibrações no sistema túnel-maciço: estudo paramétrico

### 4.1 Considerações iniciais

Após a validação do modelo numérico introduzido no Capítulo 3, cabe agora apresentar e desenvolver um estudo paramétrico cujo objetivo é contribuir para um melhor entendimento da influência das propriedades do solo e do túnel na propagação de vibrações induzidas por cargas dinâmicas aplicadas no interior do túnel. Reitera-se que o modelo anteriormente apresentado, e que agora vai ser amplamente explorado, constitui uma poderosa ferramenta para a tarefa que a autora propôs realizar. Com efeito, o modelo, ainda que complexo, é muito versátil e se devidamente integrado com outros submódulos permite considerar todas as subestruturas envolvidas, apresentando uma elevada eficiência computacional.

Uma das vantagens do desenvolvimento de ferramentas numéricas eficientes consiste na capacidade de realizar experimentação numérica, por meio dos chamados estudos paramétricos. Tais estudos permitem não só obter um melhor conhecimento sobre a influência relativa dos diferentes parâmetros envolvidos no sistema, como também avaliar a sensibilidade do sistema diante de variações dos mesmos. Em suma, os estudos paramétricos, se bem planejados, conduzidos e interpretados, podem contribuir eficazmente para um maior domínio (compreensão) do problema em estudo.

O problema que se aborda na presente tese apresenta elevado grau de complexidade, o que faz com que seja sempre difícil, senão impossível, estimar de forma exata a resposta do sistema em relação à ação imposta pelo tráfego ferroviário. Entre vários aspectos condicionantes, a incerteza dos valores das propriedades mecânicas dos materiais envolvidos constitui por si só uma causa de discordância entre as previsões numéricas e a realidade medida, sendo sugerido por Hunt e Hussein que facilmente se alcança uma diferença de mais de 10 dB [168] (note-se que uma diferença de 10 dB corresponde a 3,2 vezes). A realização de estudos paramétricos permite não só um melhor entendimento da física do problema como também a identificação dos parâmetros mais condicionantes, aos quais, obviamente, deverá ser prestada uma maior atenção.

O estudo paramétrico realizado pretende avaliar a influência de diversos parâmetros relacionados com as características do túnel e do maciço circundante no mecanismo de propagação de vibrações induzidas pela aplicação de uma ação dinâmica no "invert" do túnel. Dado que não constitui um cenário realista, ou pelo
menos plausível, a circulação de trens em túneis em que a velocidade de circulação ultrapasse a velocidade crítica, assunto que mereceria um estudo detalhado e que pode ser consultado em diferentes referências bibliográficas [52], [79], [150], considerou--se o efeito de propagação de vibrações induzidas por uma ação harmônica não móvel, de magnitude unitária, aplicada na soleira do túnel. Além disso, o estudo apresentado, como se verá a seguir, é baseado no conceito de função de transferência entre o ponto de solicitação e a resposta observada nos pontos de recepção. Assim sendo, a inclusão de carregamentos móveis teria como consequência a excitação de múltiplas frequências devido ao efeito de Doppler decorrente do fato de o ponto de observação ter posição espacial fixa. Dado que, para baixas velocidades de circulação em relação à velocidade de propagação de ondas elásticas no terreno, o efeito da velocidade perde preponderância, entendeu-se ser mais adequada a realização do presente estudo considerando ações não móveis, sendo posteriormente o estudo alargado em capítulos posteriores para cenários de solicitação móvel.

Dado o caráter do estudo a seguir apresentado pode afirmar-se que este é complementar dos estudos realizados por Gupta et al. (2009); Gupta \& Degrande (2010), Muller (2007), Rieckh et al. (2012) e Hung \& Yang (2010), mas agora procede-se a uma uniformização e generalização da análise que permitem retirar conclusões mais abrangentes.

### 4.2 Descrição do cenário de referência

A Figura 4.1 ilustra a geometria e as propriedades mecânicas adotadas para o cenário de referência.

O estudo proposto contempla um túnel pouco profundo envolvido por um maciço homogêneo e semi-infinito. A excitação dinâmica resulta da aplicação de uma carga vertical, de amplitude unitária (1 N), harmônica, com frequência variável, na base do túnel. A Figura 4.1 mostra a localização dos diversos pontos de observação considerados no interior e na superfície do maciço envolvente, bem como no próprio túnel (destacando-se, nesse caso, o ponto situado sob a carga aplicada). Os pontos de observação e o ponto de aplicação da ação encontram-se inscritos na mesma seção transversal (condição de carga parada). Contudo, o problema mantém-se tridimensional uma vez que é considerada uma carga pontual. A este respeito, cabe salientar a necessidade imperiosa de realização de análises tridimensionais, tal como constatado por Andersen \& Jones (2006). De fato, mesmo para estudos de sensibilidade, a análise bidimensional em estado plano de deformação revela-se inadequada, tanto mais que
o caráter pontual da ação impõe condições de radiação de energia substancialmente distintas das verificadas em condição bidimensional.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-115_615_1498_280_285.jpg)
Figura 4.1: Geometria e propriedades dos materiais adotados para o cenário de referência.

A consideração de pontos de observação localizados tanto na superfície do terreno como no interior do maciço visa estudar as diferenças no mecanismo de propagação devido à presença de fronteira livre (superfície do terreno). Além disso convém referir que, para efeitos práticos, a compreensão da resposta em zonas interiores do maciço é relevante quando se consideram edificações apoiadas em estacas e localizadas nas imediações de túneis ferroviários, assunto que aliás vem sendo objeto de pesquisa recente por Hussein et al. (2013, 2015, 2013)

Relativamente à simulação numérica, desenvolveu-se um modelo 2.5D MEF-PML utilizando as condições de simetria do problema em análise. O domínio de interesse foi considerado com uma largura de 20 m , de modo que o alinhamento vertical que inclui o ponto F indicado na Figura 4.1 corresponde à fronteira desse domínio. A dimensão dos elementos finitos foi definida para permitir analisar uma faixa de frequências até 80 Hz. Acoplada ao domínio de interesse, foi considerada uma fiada de 2.5D PML's com 1 metro de espessura, dividida em 6 subcamadas. A Figura 4.2 mostra a malha de elementos finitos adotada para o cenário de referência.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-116_736_964_116_551.jpg)
Figura 4.2: Malha de elementos finitos adotada para o cenário de referência.

Com base no cenário de referência descrito, foi desenvolvido um estudo paramétrico cujas principais conclusões são apresentadas nas seções seguintes. Em todas as análises apresentadas, a influência dos diferentes parâmetros é discutida em relação à resposta obtida para o cenário de referência descrito na presente seção.

### 4.3 Influência da cavidade e do túnel na resposta dinâmica do maciço

De modo a permitir uma melhor compreensão do comportamento dinâmico do sistema túnel-maciço, determinante para o problema em análise, inicia-se o estudo considerando três cenários distintos: o cenário de referência (Figura 4.1), um cenário em que, em vez do túnel, existe apenas uma cavidade no maciço, sendo o diâmetro da cavidade igual ao diâmetro interior do túnel, e, por último, um outro cenário que corresponde somente ao maciço homogêneo e semi-infinito. A ação é sempre aplicada no mesmo ponto e tem exatamente as mesmas características nos três cenários.

Pretende-se assim, comparando os três cenários descritos, avaliar a influência na resposta da existência de uma cavidade no maciço, bem como da existência de um túnel nesse mesmo maciço, situação que traduz o cenário de referência. Os três cenários encontram-se esquematicamente ilustrados na Figura 4.3. A análise efetuada além de permitir discutir a influência da presença da cavidade e seu revestimento, tem também como objetivo avaliar em que medida a utilização de um simples modelo de um semiespaço submetido a uma ação dinâmica no seu interior (modelo representado na Figura 4.3c) aproxima a solução de propagação de vibrações oriundas de um túnel inserido em um maciço semi-infinito. Note-se que esta questão tem interesse prático, pois poderia justificar a opção de dispensar a simulação 2.5D MEF-PML, ainda que na fase de estudo preliminar, bastando recorrer-se a uma formulação de funções de

Green 2.5D para meios semi-infinitos, tal como a proposta por Tadeu et al. (2001), com evidente vantagem do ponto de vista computacional.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-117_598_1750_283_161.jpg)
Figura 4.3: Cenários em estudo: a) túnel inserido no maciço; b) cavidade no interior do maciço; c) maciço semi-infinito.

A Figura 4.4 ilustra os deslocamentos verticais dos pontos de observação situados à superfície do maciço em função da frequência de excitação e para os três cenários considerados. Note-se que, por uma questão de facilidade de visualização, os resultados são apresentados em decibéis, de modo que:

$$
\begin{equation*}
u_{\mathrm{dB}}=20 \log _{10}\left(\frac{u}{u_{0}}\right) \text { em que } u_{0}=1 m \tag{4.1}
\end{equation*}
$$

Considerando uma amplitude de carga de 1 N, os valores dos deslocamentos que adiante se discutem situam-se entre os -180 dB e os -260 dB, sendo que uma variação de 20 dB corresponde a uma diferença de uma ordem de grandeza.

Uma primeira observação da Figura 4.4 deixa claro que a resposta dinâmica à superfície é complexa, caracterizando-se por um comportamento ondulante, o qual resulta da interferência de ondas de compressão, de cisalhamento e de Rayleigh. O maciço envolvente permite a radiação de energia, sendo o passo da frequência (espaçamento dos picos invertidos exibidos) do padrão de interferência dependente da distância do ponto de observação à fonte, bem como da velocidade de propagação das ondas de compressão e de cisalhamento no maciço. Este efeito, previamente identificado por Gupta et al. (2009), é fortemente influenciado pela presença do túnel ou cavidade, dado que este elemento introduz uma perturbação no campo de propagação de vibrações em relação ao que ocorre no caso de o meio ser contínuo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-118_1855_1744_121_161.jpg)
Figura 4.4: Amplitude do deslocamento vertical em diferentes locais para três cenários distintos: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Na Figura 4.4 verifica-se que, de um modo geral, os maiores deslocamentos ocorrem para o cenário de maciço contínuo, correspondendo, em contrapartida, os menores deslocamentos à situação do maciço com túnel.

No caso da abertura de uma cavidade no maciço, observa-se uma diminuição significativa no valor dos deslocamentos verticais quando comparados com os obtidos para o caso do maciço. De fato, a cavidade existente no interior do maciço provoca uma alteração no caminho de transmissão de vibrações entre a fonte e o receptor. Assim, a redução registrada nos níveis de vibração pode, em parte, ser justificada pela interrupção que a abertura da cavidade representa no percurso de transmissão
de vibrações entre a fonte e os pontos de observação. Como não poderia deixar de ser, o referido efeito é mais evidente nos pontos mais próximos do alinhamento do túnel, tendendo a diminuir com o aumento da distância fonte-receptor, o que, aliás, é evidente na Figura 4.5 onde se apresenta o mapa de deslocamentos da seção onde se encontram inscritos o receptor e a fonte para a frequência de excitação de 60 Hz.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-119_1756_1755_510_156.jpg)
Figura 4.5: Campo de deslocamentos da seção de aplicação da carga com frequência de 60 Hz (lado direito - parte real; lado esquerdo - parte imaginária): a) túnel; b) cavidade; c) maciço.

Deve ainda ter-se presente o fato de a abertura da cavidade se traduzir não só por uma perturbação geométrica do maciço mas também por uma alteração das suas propriedades de rigidez dinâmica, quer em termos de massa, quer em termos de rigidez.

Ainda relativamente à Figura 4.4 constata-se que há uma tendência, comum aos três cenários, para uma diminuição da amplitude dos deslocamentos com o aumento
da frequência de excitação, sendo essa redução mais significativa para os pontos mais afastados. Este comportamento está relacionado com o efeito do amortecimento que é mais evidente com o aumento da frequência (devido ao amortecimento material) e da distância entre a fonte e o receptor.

A presença do túnel, que é um elemento com rigidez elevada, introduz uma alteração drástica no processo de transferência das vibrações ao maciço, que de um caráter pontual passa a ter um caráter mais disperso. Essa alteração é bem visível na Figura 4.5. Em relação à situação sem revestimento, pelo menos para as condições consideradas, mais do que uma redução dos deslocamentos, o que ocorre é uma alteração do seu padrão em função da frequência de excitação.

A Figura 4.6 mostra os deslocamentos verticais dos pontos de observação situados no alinhamento do eixo horizontal da seção transversal do túnel em função da frequência de excitação e para os três cenários considerados.

Da análise da Figura 4.6 conclui-se que a resposta, perante os três cenários, nos diversos pontos considerados no alinhamento do eixo horizontal do túnel, é análoga, registrando-se os maiores deslocamentos para o caso do maciço semi-infinito, os menores para o cenário do maciço com túnel, ocupando uma posição intermediária os valores dos deslocamentos correspondentes ao caso do maciço com cavidade no interior. A interpretação dos resultados obtidos segue de perto a justificação já apresentada anteriormente para os pontos localizados à superfície, embora o impacto da interferência das ondas de Rayleigh seja agora menor. Com efeito, dada a direção de aplicação da carga, assim como a localização dos pontos em causa, a resposta em termos de deslocamento vertical é condicionada, em boa medida, pela propagação de ondas de cisalhamento no maciço. Note-se a aproximação dos resultados entre si à medida que a distância fonte-receptor aumenta, o que é justificado pela perda de relevância dos efeitos de fronteira locais, induzidos pela presença do túnel e/ou cavidade, na resposta global do sistema.

Complementando o parágrafo anterior, cabe ressaltar que a resposta mais próxima do túnel (ponto K) não segue o mesmo padrão, observando-se aí que a abertura faz diminuir de forma muito relevante os deslocamentos verticais. Ou seja, a cavidade altera o percurso de propagação, ficando a zona onde se situa o ponto K como que protegida das vibrações.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-121_1852_1749_121_159.jpg)
Figura 4.6: Amplitude do deslocamento vertical, ao longo do alinhamento do túnel, para os três cenários distintos: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

Passando à análise da resposta em pontos inscritos no plano de simetria, considere-se a Figura 4.7 que apresenta os deslocamentos verticais, para os três cenários considerados, de pontos de observação situados nesse eixo, em particular os pontos I, situado no ponto de aplicação da carga, H, situado no teto do túnel, G, localizado no interior do maciço, 3 m acima do túnel, e A localizado à superfície.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-122_1257_1751_120_160.jpg)
Figura 4.7: Amplitude do deslocamento vertical em diferentes locais para três cenários distintos: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

Uma primeira análise da Figura 4.7 sugere a divisão dos resultados em dois grupos principais: i) resposta dinâmica do ponto de aplicação da carga (Figura 4.7a); ii) resposta dinâmica dos restantes pontos considerados no eixo de simetria (Figura 4.7b, c, d). No caso deste último grupo, verifica-se que o comportamento é semelhante, de um modo geral, ao dos outros pontos do maciço até aqui analisados, ou seja, os deslocamentos são superiores para o maciço e na generalidade inferiores para o caso do túnel, especialmente para frequências de excitação inferiores a cerca de 40 Hz, com exceção do ponto H onde os deslocamentos para o cenário com cavidade chegam a atingir os valores mais baixos. Note-se que o limite apontado de aproximadamente 40 Hz para uma inversão comportamental está intimamente ligado com o comprimento de onda propagado e sua relação com o diâmetro do túnel e/ou cavidade. Com efeito, para frequências de excitação inferiores a 40 Hz, o comprimento das ondas de cisalhamento é superior ao diâmetro do túnel.

Relativamente à resposta dinâmica observada no ponto H, uma reflexão mais profunda deve ser realizada. No ponto H, situado no teto do túnel, a resposta é condicionada pelo caminho de propagação e respectiva perturbação. No caso do maciço
semi-infinito, a propagação de vibração da fonte para o receptor ocorre de forma direta, justificando a maior amplitude de deslocamento observada quando comparada com os resultados previstos nos restantes cenários. Por outro lado, é notória a influência da rigidez do túnel quando comparados os resultados obtidos para este cenário com os resultados correspondentes à consideração do maciço com uma cavidade. Com efeito, exceto por uma ligeira diferença para frequências inferiores a cerca de 18 Hz, a presença do revestimento do túnel induz uma resposta dinâmica mais elevada. Este fato poderá ser justificado pela rigidez de flexão do túnel na direção longitudinal que propicia uma propagação de energia no sentido ascendente com maior facilidade.

Atentando agora na resposta dinâmica do ponto de aplicação da carga verifica-se que a tendência geral da amplitude do deslocamento vertical é idêntica para os três cenários considerados. Os menores níveis de vibração correspondem à situação do maciço com túnel, como esperado, dada a elevada rigidez propiciada pelo revestimento do túnel. Em contrapartida, os deslocamentos mais elevados ocorrem para o maciço com cavidade, o que está relacionado com o fato de a excitação ser aplicada em uma superfície livre quando é considerada a presença da cavidade diferentemente do que ocorre quando o cenário em estudo implica o maciço semi-infinito.

Da comparação entre os três cenários concluiu-se que, à exceção do ponto de aplicação da carga, cuja análise se acabou de efetuar, a maior amplitude de deslocamentos é observada para o caso do maciço semi-infinito, a menor para o cenário do maciço com túnel, ocupando uma posição intermediária os valores dos deslocamentos no caso do maciço com cavidade. Em algumas situações e para algumas frequências as diferenças entre o caso em que se considera a presença do túnel e o caso em que se supõe o maciço semi-infinito são muito importantes. Pode então afirmar-se que, dentro dos limites da faixa de frequências considerada e das características deformacionais e geométricas dos elementos constituintes do sistema, a presença do túnel afeta de forma decisiva o fenômeno de propagação de vibrações no terreno.

### 4.4 Influência da profundidade do túnel

Do ponto de vista da resposta dinâmica induzida na superfície do solo, é de todo evidente que a profundidade do túnel é um aspecto importante que deve ser abordado na análise do presente problema. Nesse sentido, foram consideradas duas profundidades adicionais, $\mathrm{H}=12 \mathrm{~m}$ e $\mathrm{H}=15 \mathrm{~m}$, além do cenário de referência, onde $\mathrm{H}=9 \mathrm{~m}$ (ver Figura 4.1).

A Figura 4.8 mostra o deslocamento vertical induzido nos pontos de referência localizados à superfície do maciço e para os três cenários distintos em análise.

Uma visão geral da Figura 4.8 permite concluir que a tendência da resposta dinâmica da superfície do solo é bastante complexa. Diversos aspectos contribuem para essa complexidade, em particular a interação ao longo da superfície livre entre as ondas de compressão, de cisalhamento e de Rayleigh, sendo consequência dessa interação o comportamento ondulante exibido e os picos invertidos (abaixamentos) presentes nas curvas. O passo da frequência desses picos invertidos varia em função da profundidade do túnel porque a sua ocorrência é dependente da distância entre a fonte e o receptor.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-124_1924_1747_738_160.jpg)
Figura 4.8: Amplitude do deslocamento vertical para profundidades distintas do túnel em diferentes pontos de observação: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

No entanto, apesar da complexidade da tendência, é indiscutível que quanto mais profundo é o túnel menores são os níveis de vibração. Na verdade, este efeito é bastante evidente para os pontos mais próximos do alinhamento do túnel, como pode ser visto nas Figura 4.8a e b, ou para os pontos localizados longe do alinhamento do túnel ( Figura 4.8 (e), f). No último caso, o efeito é mais pronunciado para as frequências superiores a 20 Hz. Este efeito de atenuação em função da profundidade do túnel pode ser atribuído a duas causas principais: i) ao amortecimento, dado que a distância da fonte ao receptor aumenta com a profundidade do túnel, logo aumenta também a contribuição do amortecimento; ii) à diminuição da faixa de frequências para as quais a excitação gera ondas de Rayleigh. Se a primeira causa tem maior reflexo nos pontos mais próximos do túnel, tanto que é exatamente nesses pontos que a distância entre a fonte e o receptor é mais influenciada pela profundidade do túnel, a segunda causa justifica em boa parte a conclusão referente aos pontos de observação mais afastados. A esse respeito, Gupta et al. (2009) mostrou que o conteúdo de frequência das ondas de Rayleigh é confinado a uma faixa de frequências até $\mathrm{C}_{\mathrm{R}} / \mathrm{d}$, em que d é a profundidade da fonte e $\mathrm{C}_{\mathrm{R}}$ é a velocidade das ondas de Rayleigh. Assim, o aumento da profundidade do túnel conduz a uma redução da faixa de frequências onde a contribuição das ondas de Rayleigh é importante. Note-se que enquanto para $\mathrm{H}=9,0 \mathrm{~m}$ a frequência de corte das ondas de Rayleigh corresponde a aproximadamente 20 Hz-30 Hz, para o cenário do túnel mais profundo a respectiva frequência de corte encontrar-se-á nos 13 a 20 Hz.

Um outro aspecto interessante que é possível observar na Figura 4.8 está relacionado com as frequências para as quais ocorrem os valores mínimos da resposta em função da profundidade do túnel. Com efeito, quanto maior é a profundidade do túnel menor é a frequência para a qual se verifica tal efeito, sendo a diferença de frequência de ocorrência menor na faixa das baixas frequências quando comparada com a faixa de frequências mais elevadas. Ainda relativamente a este aspecto é notória a diminuição da referida diferença com o aumento da distância do ponto de observação, o que, aliás, é evidente na Figura 4.8f.

A Figura 4.9 ilustra a amplitude do deslocamento vertical induzido nos pontos de referência localizados ao longo do alinhamento do eixo horizontal do túnel para os três cenários distintos em análise.

Da análise da Figura 4.9 pode concluir-se que a resposta dinâmica dos pontos situados no interior do maciço, no alinhamento do eixo horizontal do túnel, bem como do ponto lateral do túnel, é claramente pouco influenciada pela variação da profundidade
do túnel. Note-se que, no caso dos pontos em análise, o aumento da profundidade do túnel não se traduz em um aumento da distância da fonte ao receptor, mantendo-se esta constante. Esta constatação vem reforçar assim as conclusões retiradas anteriormente para os pontos situados à superfície do maciço. Todavia, convém ainda constatar que a proximidade de resultados oriundos das diferentes análises é ainda mais notória para frequências superiores a cerca de 40 Hz, principalmente para os pontos de observação mais próximos da fonte de excitação. Este efeito poderá ser justificado pelo fato de a proximidade da superfície livre surtir maior influência na resposta do maciço para comprimentos de onda mais elevados (e consequentemente frequências de excitação mais reduzidas). Com o aumento da frequência de excitação, a interferência da superfície livre torna-se desprezível, principalmente na região adjacente ao túnel.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-127_1891_1749_121_160.jpg)
Figura 4.9: Amplitude do deslocamento vertical em diferentes locais para profundidades do túnel distintas: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

A conclusão alcançada no parágrafo anterior reveste-se de indubitável interesse prático, pois nos casos em que o objetivo da análise envolva a avaliação da resposta dinâmica nos pontos em causa, como por exemplo na avaliação do campo de vibração incidente na ponta de uma estaca adjacente ao túnel (situações que têm recebido especial atenção recentemente, como aliás demonstrado pelas publicações recentes de Hussein et al. (2013, 2015, 2013) e Harmad et al. (2014)), a análise pode então ser efetuada considerando o túnel inserido em um espaço indefinido, dado que as condições impostas pela superfície livre não são preponderantes na resposta dinâmica.

A esse respeito cabe mencionar que modelagens numéricas baseadas em soluções analíticas, tais como o modelo PiP proposto por Hussein \& Hunt (2007, 2009), ou baseadas no acoplamento 2.5D MSF-MEF, tal como recentemente proposto por Amado Mendes et al. (2014), são consideravelmente menos exigentes do ponto de vista computacional do que o método aqui aplicado.

Passando à análise da resposta em outros pontos do maciço, a Figura 4.10 apresenta o deslocamento vertical induzido nos pontos de referência localizados no eixo de simetria do túnel, em particular no ponto I situado sob a carga aplicada, no ponto H situado no teto do túnel, no ponto G localizado no interior do maciço e 3 m acima do túnel e no ponto A localizado à superfície; para os três cenários distintos em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-128_1246_1746_896_159.jpg)
Figura 4.10: Amplitude do deslocamento vertical em diferentes locais para profundidades do túnel distintas: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

Uma primeira análise dos resultados refletidos na Figura 4.10 permite constatar que a profundidade do túnel é um parâmetro pouco influente na resposta induzida nos pontos de observação pertencentes ao revestimento, enquanto sua influência nos pontos do maciço considerados é tanto mais significativa quanto maior é a distância emissor-receptor. De fato, no caso do ponto G, localizado 3 m acima do túnel, o aumento da profundidade do túnel não leva a um aumento da distância da fonte ao receptor, que se mantém constante, o que já não acontece no caso do ponto localizado
à superfície, justificando-se assim em parte a visível atenuação dos níveis de vibração em função da profundidade do túnel (Figura 4.10d). Apesar do anteriormente referido, cabe ainda comentar que a resposta dinâmica do túnel, refletida através do nível de vibração induzido no teto, é pouco influenciada pela espessura de recobrimento caso a faixa de frequências em estudo se situe acima dos 40 Hz. Este resultado é coerente com a análise previamente realizada para a resposta dinâmica observada na parede do túnel (Figura 4.9a), o que realça a observação de a resposta para frequências elevadas, ou seja, que induzam a propagação de ondas com comprimento de onda inferior ao diâmetro do túnel, ser pouco afetada pela espessura de recobrimento. Como é evidente, tal conclusão só é válida em um contexto correspondente a um dado valor mínimo da espessura de recobrimento.

Analisando agora com maior detalhe a resposta dinâmica do ponto localizado sob a carga aplicada, verifica-se que a profundidade do túnel tem um efeito negligenciável. Como se pode observar na Figura 4.10a, apenas ligeiras diferenças podem ser observadas nos resultados obtidos, sobretudo se a atenção se encontrar direcionada para os túneis mais profundos. Esta conclusão é bastante importante do ponto de vista da problemática de vibrações induzidas pelo tráfego ferroviário. De fato, as cargas dinâmicas geradas durante a passagem do trem são dependentes do comportamento dinâmico da base da via [34], [35]. Assim, uma vez que a resposta dinâmica do túnel parece ser muito semelhante, principalmente se a espessura de solo acima do túnel for superior a 1,5 vezes o seu diâmetro, o problema da interação dinâmica entre o trem e o resto do sistema (via-túnel-maciço) deve ser independente da profundidade do túnel. Deste modo, as cargas/forças dinâmicas de interação geradas pelo tráfego ferroviário em um túnel com uma certa profundidade podem ser usadas como fonte de excitação (dado de entrada) para o estudo das vibrações geradas em um túnel com uma profundidade diferente. Este aspecto será devidamente analisado em um capítulo posterior da presente tese.

### 4.5 Influência da espessura do revestimento do túnel

A espessura do revestimento do túnel é um dos parâmetros que afetam o comportamento dinâmico do túnel no plano, bem como a sua rigidez à flexão na direção longitudinal e, por conseguinte, o mecanismo de interação túnel-maciço. Com o objetivo de investigar o efeito deste parâmetro no comportamento dinâmico global do sistema, são considerados dois novos cenários, com as seguintes espessuras do revestimento: $\mathrm{d}=0,5 \mathrm{~m}$ e $\mathrm{d}=0,7 \mathrm{~m}$. O raio exterior do túnel assume-se constante sendo o seu valor apresentado na Figura 4.1. Embora os valores assumidos para a espessura
do revestimento possam parecer exagerados quando comparados com o diâmetro do túnel, do ponto de vista teórico, é importante considerar um contraste elevado dos valores a fim de realçar a influência deste parâmetro.

A Figura 4.11 ilustra os deslocamentos verticais dos pontos de observação situados à superfície do maciço em função da frequência de excitação e para os três cenários considerados.

Uma primeira observação da Figura 4.11 sugere a divisão dos resultados em dois grupos principais: i) resposta dinâmica para distâncias até 8 m (Figura 4.11 a, b, c); ii) resposta dinâmica para distâncias superiores a 8 m (Figura 4.11 d, e, f). No caso do primeiro grupo, verifica-se que o aumento da rigidez do túnel através do aumento da espessura do seu revestimento não afeta substancialmente os deslocamentos verticais à superfície do maciço. Contudo, nas Figura 4.11b e c, observa-se que o primeiro pico invertido se desloca para frequências mais elevadas com o aumento da rigidez do túnel. Este efeito pode dever-se ao aumento das frequências próprias dos modos de flexão do túnel livre no plano, induzido pelo aumento da espessura do seu revestimento. Atentando agora na resposta dinâmica para distâncias superiores a 8 m, a tendência geral aponta para a redução dos deslocamentos verticais à superfície com o aumento da espessura do revestimento, principalmente para frequências superiores a aproximadamente 35 Hz. Este efeito, mais notório com o aumento da distância fonte--receptor deve-se em grande medida ao aumento da rigidez de flexão longitudinal do túnel, o que, por sua vez permite uma maior degradação da carga aplicada e consequente minimização da resposta. Como é evidente, este efeito será mais notório para comprimentos de onda mais curtos, ou seja, frequências mais elevadas.

Um outro aspecto curioso, e muito enfatizado nas Figura 4.11 d, e, f, está relacionado com o aumento da frequência de ocorrência dos picos invertidos acompanhando a evolução da espessura do revestimento, o que denota bem a influência da rigidez do túnel no mecanismo de interação túnel-maciço. Com efeito, o aumento de espessura do revestimento conduz a um acréscimo das frequências naturais do túnel, tanto no plano como na direção longitudinal, conduzindo a um aumento das frequências em que tal efeito se verifica.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-131_1862_1746_120_160.jpg)
Figura 4.11: Amplitude do deslocamento vertical em diferentes locais para espessuras do revestimento do túnel distintas: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Diante do exposto, pode pois concluir-se que o aumento da rigidez do revestimento do túnel pode ser encarado como uma medida de mitigação para a redução das vibrações induzidas pelo tráfego, quando a distância entre a fonte e o receptor é superior a 1,5 vezes o diâmetro do túnel, sendo pouco eficaz para distâncias menores do que a referida. Esta conclusão deve ser enquadrada no âmbito meramente teórico do presente contexto, pois do ponto de vista da engenharia prática, soluções de mitigação mais versáteis e menos dispendiosas podem ser aplicadas, o que, aliás, é enfatizado em um capítulo posterior da presente tese.

Passando agora à análise da resposta dinâmica ao longo do alinhamento horizontal do túnel, observe-se a Figura 4.12 onde se apresenta a amplitude do deslocamento vertical, para diferentes frequências de excitação, nos pontos de observação inscritos ao longo do referido alinhamento.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-132_1918_1748_434_158.jpg)
Figura 4.12: Amplitude do deslocamento vertical em diferentes locais para espessuras do revestimento do túnel distintas: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

Da análise da Figura 4.12 pode concluir-se que a resposta dinâmica do ponto lateral do túnel (Figura 4.12a) é pouco influenciada pelo aumento da rigidez do túnel alcançada através do aumento da espessura do seu revestimento. Já no que diz respeito
aos restantes pontos considerados, situados no interior do maciço (no alinhamento do eixo horizontal do túnel), é visível uma tendência generalizada para a redução dos deslocamentos verticais com o aumento da espessura do revestimento do túnel. Este efeito é mais evidente para os pontos localizados a distâncias a partir de 8 m (Figura 4.12c, d, e, f). Esta constatação vem reforçar assim a ideia de que o aumento da rigidez do revestimento do túnel pode ser visto como uma medida de atenuação das vibrações induzidas pelo tráfego no maciço circundante, já que tem clara influência no mecanismo de propagação de vibrações.

A Figura 4.13 apresenta os deslocamentos verticais dos pontos de observação situados no eixo de simetria do túnel, em particular do ponto I situado sob a carga aplicada, do ponto H situado no teto do túnel, do ponto G localizado no interior do maciço e 3 m acima do túnel e do ponto A localizado à superfície; para os três cenários considerados.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-133_1240_1748_1124_162.jpg)
Figura 4.13: Amplitude do deslocamento vertical em diferentes locais para espessuras do revestimento do túnel distintas: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

Uma primeira análise da Figura 4.13 sugere a divisão dos resultados em dois grupos principais: i) resposta dinâmica dos pontos pertencentes ao túnel (Figura 4.13a, b); ii) resposta dinâmica dos pontos localizados no maciço (Figura 4.13c, d). No caso deste último grupo, verifica-se que o aumento da rigidez do túnel através do aumento da
espessura do seu revestimento não afeta significativamente os deslocamentos verticais no eixo de simetria do túnel, exceto nas faixas de frequência localizadas em torno dos picos invertidos. Com efeito, a variação da espessura do revestimento influencia o mecanismo de interação túnel-maciço, sobretudo em faixas de frequência bem delimitadas, afetadas pelas características dinâmicas do próprio túnel. Por sua vez, no caso dos pontos pertencentes ao túnel, é evidente a influência da espessura do revestimento do túnel nos valores dos deslocamentos verticais. Conclusão semelhante, embora com um estudo menos abrangente em termos de faixa de frequências, foi também alcançada por Yang et al. (2007).

Atentando então na resposta dinâmica do próprio túnel, constata-se que para os pontos do túnel em análise, a tendência geral da amplitude do deslocamento vertical é semelhante para os três cenários considerados. Contudo, o aumento da espessura do revestimento conduz a uma redução da amplitude dos deslocamentos, sendo essa redução considerável no caso do ponto do túnel onde a carga é aplicada. Assim, contrariamente ao observado na última subseção, a espessura do revestimento do túnel é um parâmetro que pode desempenhar um papel não negligenciável no mecanismo de interação trem-via-túnel. Contudo, a conclusão anterior requer uma justificativa adicional para evitar a sua generalização abusiva. Com efeito o aumento da espessura do revestimento conduz a um aumento da rigidez do suporte da via que poderá ter reflexo no mecanismo de geração de vibrações induzidas pelo tráfego ferroviário, tanto mais que o referido mecanismo resulta da interação dinâmica entre o veículo e o sistema remanescente (via-túnel-maciço). Porém a magnitude de tal influência é dependente das propriedades resilientes da via. Como se exporá nas seções seguintes, a via férrea pode incluir materiais resilientes que visam aumentar a sua flexibilidade. Em tal cenário, caso os materiais resilientes aplicados na via conduzam a uma flexibilidade razoável da via, a pertinência da observação anterior diminui, pois a maior contribuição para a flexibilidade será garantida pela via férrea em si e não pelo seu suporte.

### 4.6 Influência da geometria do túnel

A geometria do túnel é um parâmetro que depende, em boa parte, do processo construtivo utilizado para a construção do túnel. Algumas das configurações geométricas mais comuns no caso de túneis são seções transversais circulares, ovoides, em forma de ferradura ou retangulares. Túneis circulares resultam, por regra, de processos de escavação com o uso de tuneladora, sendo a sua geometria condicionada pela geometria do próprio equipamento. Embora as geometrias ovoides ou em ferradura
possam ser materializadas através de diferentes processos construtivos, regra geral, tais seções resultam da construção através do método NATM, no qual a seção do túnel é escavada por avanços sucessivos de diferentes zonas da seção transversal. Por fim, as seções retangulares são geralmente concebidas quando o método construtivo implica a escavação prévia em trincheira, construção do elemento estrutural e posterior aterro. Neste último caso os túneis são geralmente designados por "cut \& culvert", ou seja, escavação e posterior aterro.

Relativamente às técnicas construtivas convém referir que qualquer uma das três tem sido amplamente utilizada na construção de túneis ferroviários, em particular na construção de redes de metrô. A título de exemplo cabe mencionar que túneis integrados em sistemas de metrô modernos, como o Metro do Porto ou linhas recentes do Metro de Brasília, constituem exemplos de construção de túneis através de tuneladoras. Contudo, túneis em redes de metrô mais antigas, como a rede de metrô de Londres, ou mesmo túneis recentes da rede de metrô de Lisboa foram construídos pela técnica NATM. No que se refere à técnica "cut \& culvert", cabe referir a sua aplicação generalizada em diferentes linhas de metrô, com especial destaque para as linhas mais antigas do metrô de Lisboa.

Como esperado, a geometria do túnel é também um dos parâmetros que afetam o comportamento dinâmico do túnel e, consequentemente, o mecanismo de interação túnel-maciço. Com efeito a geometria da seção transversal tem claro impacto na dinâmica transversal do túnel (no plano), bem como no comportamento dinâmico na direção longitudinal, tanto mais que a rigidez de flexão nessa mesma direção é muito dependente da geometria adotada. Com o objetivo de estudar o efeito da geometria do túnel nos mecanismos de propagação de vibrações, são considerados dois cenários: o cenário de referência, que corresponde a um túnel circular, com um raio exterior de 3,0 m, sendo a espessura do revestimento 0,3 m, e um novo cenário, um túnel quadrado com uma largura exterior de 6,0 m e espessura do revestimento igual a 0,3 m, como se ilustra na Figura 4.14. A espessura de recobrimento do túnel foi mantida constante nos dois cenários, tomando o valor de 6,0 m, embora se reconheça que o valor tende a ser um pouco elevado para o cenário de um túnel construído pela técnica de "cut \& culvert".

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-136_684_1510_113_270.jpg)
Figura 4.14: Geometria dos túneis adotados na análise: a) túnel circular; b) túnel quadrado.

Relativamente às características geométricas dos dois túneis em consideração, cabe mencionar que o momento de inércia do túnel circular em relação aos eixos centrais principais de inércia é de $21,88 \mathrm{~m}^{4}$, enquanto o momento de inércia do túnel de seção transversal quadrada, relativamente aos mesmos eixos (no presente caso eixo vertical e horizontal), é de $37,14 \mathrm{~m}^{4}$, tendo portanto este último maior rigidez de flexão na direção longitudinal.

Quanto à localização dos pontos de observação, considerem-se as distâncias representadas esquematicamente na Figura 4.1.

Passando à análise de resultados, a Figura 4.15 ilustra a amplitude dos deslocamentos verticais dos pontos de observação situados à superfície do maciço em função da frequência de excitação e para os dois cenários considerados.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-137_1854_1751_119_157.jpg)
Figura 4.15: Amplitude do deslocamento vertical em diferentes locais para configurações geométricas do túnel distintas: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Ao observar a Figura 4.15, verifica-se que a resposta, para as duas configurações geométricas, difere sobretudo para as frequências mais elevadas, apresentando o túnel quadrado, regra geral, deslocamentos menores. Note-se que o efeito da geometria do túnel é mais evidente para o caso do ponto mais próximo do alinhamento do túnel, como se pode visualizar na Figura 4.15a, atenuando-se um pouco esse efeito à medida que a distância receptor-emissor aumenta (Figura 4.15b, c, d). No caso dos pontos localizados mais longe do alinhamento do túnel (Figura 4.15e, f) o efeito é mais pronunciado para frequências superiores a 35 Hz.

Nas Figura 4.15b, Figura 4.15c e Figura 4.15d, observa-se que o primeiro pico invertido se desloca para frequências mais elevadas no caso do túnel de seção transversal quadrada, este fato pode dever-se ao aumento das frequências próprias dos modos de flexão no plano do túnel livre, dada a maior rigidez da seção quadrada quando comparada com a seção circular.

Um outro aspecto muito relevante está relacionado com o fato de a resposta para baixas frequências de excitação ser pouco influenciada pela geometria do túnel. Com efeito, nessa faixa de frequências, os comprimentos de onda gerados são de dimensão substancialmente superior à dimensão do próprio túnel e, como tal, a resposta dinâmica observada é essencialmente dependente das propriedades dinâmicas e geometria do maciço envolvente, embora a presença do túnel afete o resultado, essencialmente por um efeito praticamente estático de degradação da ação. Assim, a geometria do túnel condiciona a resposta à superfície do maciço em função da proximidade do túnel e sobretudo para o caso de frequências elevadas.

A Figura 4.16 mostra os deslocamentos verticais dos pontos de observação situados no alinhamento do eixo horizontal do túnel em função da frequência de excitação e para os dois cenários considerados.

Da análise da Figura 4.16 constata-se que a resposta dinâmica do ponto lateral do túnel (Figura 4.16a) é, na faixa das baixas frequências, similar nos dois cenários em estudo. O referido comportamento é, regra geral, também visível nos restantes pontos de observação. Contudo, deve-se ressaltar que o efeito da geometria do túnel é claramente mais notório nos pontos localizados mais próximos do túnel, diminuindo progressivamente à medida que o ponto de observação dele se afasta, como se pode visualizar nas Figura 4.16e e Figura 4.16f. Note-se que para distâncias elevadas (Figura 4.16e, f) a geometria do túnel torna-se menos relevante e a resposta em ambos os casos converge para valores semelhantes. Fica assim reforçada a ideia de que a configuração geométrica do túnel condiciona a resposta particularmente nas proximidades do túnel e para frequências de excitação elevadas.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-139_1850_1752_118_157.jpg)
Figura 4.16: Amplitude do deslocamento vertical em diferentes locais para configurações geométricas do túnel distintas: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

A Figura 4.17 apresenta os deslocamentos verticais dos pontos de observação situados no eixo de simetria do túnel, em particular do ponto I situado sob a carga aplicada, do ponto H situado no teto do túnel, do ponto G localizado 3 m acima do túnel e do ponto A localizado à superfície; para os dois cenários considerados.

Observando a Figura 4.17 verifica-se que a resposta dinâmica do ponto do túnel onde a carga é aplicada (Figura 4.17a) é influenciada pela configuração geométrica do túnel, embora a tendência geral da amplitude do deslocamento vertical seja seme-lhante para os dois cenários considerados (note-se que a amplitude dos deslocamentos
está avaliada em decibéis). Com efeito, a flexibilidade do ponto de aplicação da carga é maior no caso da seção quadrada, dado o efeito de flexão transversal da laje inferior do túnel. Curiosamente, tal efeito tende a diminuir com o aumento da frequência de excitação, corroborando a conclusão anterior, ou seja uma preponderância do efeito "quase estático" induzido pela rigidez de flexão da laje. Contudo, será lícito afirmar que a geometria do túnel é um parâmetro que poderá ter interferência significativa no mecanismo de interação trem-via-túnel. Entretanto, deve-se considerar, como aliás já anteriormente explicitado, que a presença da via férrea e respectivos elementos resilientes tenderá a mitigar tal efeito.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-140_1237_1754_816_157.jpg)
Figura 4.17: Amplitude do deslocamento vertical em diferentes locais para configurações geométricas do túnel distintas: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

Por sua vez, no caso do ponto situado no teto do túnel (Figura 4.17b), bem como no caso dos pontos do maciço considerados (Figura 4.17c, d), é evidente a influência da geometria do túnel nos valores dos deslocamentos verticais. Nestes casos a resposta é substancialmente diferente na faixa de frequências acima dos 20 Hz. Para frequências abaixo desse valor a geometria do túnel tem uma influência reduzida na resposta observada, tanto mais que os efeitos locais, tais como a diferença de rigidez introduzida pela laje, diminuem com o aumento da distância fonte-receptor. No presente caso, o efeito preponderante é mais global prendendo-se com a rigidez à flexão longitudinal,
cujo efeito na resposta se torna tanto mais pronunciado quanto menor é o comprimento de onda propagado.

Cabe mencionar ainda que a redução da amplitude dos deslocamentos nos pontos localizados diretamente acima do túnel, no caso da seção transversal quadrada, se deve à base plana da seção, a qual permite que a energia se propague na direção inferior, o que, aliás, se encontra bem patente na Figura 4.18, onde se ilustra o mapa de cores da amplitude do deslocamento na seção onde se encontram inscritos os pontos de observação para a frequência de excitação de 40 Hz.

Do estudo aqui apresentado conclui-se que a previsão rigorosa da resposta dinâmica nas proximidades do túnel requer a correta consideração da geometria do túnel, embora tal efeito tenda a diminuir quando os pontos de observação se encontram a distâncias consideráveis em relação ao túnel.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-141_1202_1750_1055_159.jpg)
Figura 4.18: Campo de deslocamentos na seção de aplicação da ação para uma frequência de excitação de 40 Hz (lado direito - parte real; lado esquerdo - parte imaginária): a) túnel circular; b) túnel quadrado.

### 4.7 Influência do invert

A instalação de via férrea no interior de um túnel circular requer a construção de uma plataforma plana, a qual é muitas vezes garantida através da construção de um invert, ou seja, pelo preenchimento da parte inferior do túnel. Como é evidente, a existência
do invert aumenta a rigidez da seção transversal do túnel, assim como a rigidez de flexão longitudinal, sendo portanto um parâmetro que afeta o comportamento dinâmico do túnel e, por conseguinte, o mecanismo de interação túnel-maciço. Além disso, não deverá ser descurado o fato de a presença do invert acarretar um aumento significativo da massa do túnel, a qual por sua vez tem reflexo no comportamento dinâmico do sistema.

Considerando o exposto e pretendendo-se avaliar qual o efeito da adição de um invert ao túnel nos mecanismos de propagação de vibrações, são considerados dois cenários: o cenário de referência, que corresponde a um túnel sem invert (onde apenas a parede do túnel é considerada) e um novo cenário, onde ao túnel anterior é adicionado um invert, em um material com as mesmas características do revestimento do túnel e cuja massa é cerca de 5000 kg/m de desenvolvimento longitudinal, tal como ilustrado na Figura 4.19.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-142_645_1500_1119_280.jpg)
Figura 4.19: Configuração geométrica do túnel: a) túnel sem invert; b) túnel com invert.

Da mesma forma que nos estudos anteriormente apresentados, foram considerados os pontos de observação indicados na Figura 4.1.

Passando à análise de resultados, a Figura 4.20 mostra os deslocamentos verticais dos pontos de observação situados à superfície do maciço em função da frequência de excitação e para os dois cenários considerados.

Analisando a Figura 4.20 verifica-se que a resposta dos diferentes cenários difere sobretudo para a faixa de frequências mais elevada, apresentando o túnel com invert, de um modo geral, deslocamentos menores. No caso das baixas frequências, não há uma alteração muito significativa nos níveis de vibração registrados quando se insere o invert. Note-se que os comprimentos de onda gerados, nessa faixa de frequências, são muito maiores do que a dimensão quer do invert quer do próprio túnel, sendo portanto a resposta sobretudo influenciada pelas características dinâmicas do maciço
envolvente, muito embora a presença do invert afete o resultado pelo seu efeito praticamente estático de degradação da ação e de rigidez à flexão quer na direção transversal quer na direção longitudinal, como aliás já referido anteriormente.

Nas Figura 4.20 b, c e d, observa-se que o primeiro pico invertido ocorre para frequências mais elevadas no caso do túnel com invert, este fato pode estar relacionado com o aumento das frequências próprias dos modos de flexão do túnel com invert no plano transversal, uma vez que a presença desse elemento acarreta um aumento da rigidez da seção transversal do sistema.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-143_1851_1745_742_161.jpg)
Figura 4.20: Amplitude do deslocamento vertical em diferentes locais para o caso do túnel com invert e sem invert: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Atentando ainda na Figura 4.20, constata-se que, para as frequências mais altas, há uma redução nos níveis de vibração à superfície do maciço quando o invert é incorporado no túnel. Esta constatação pode ser justificada pelo fato de o invert do túnel atrair uma grande parte da energia de vibração, que se propagará para baixo, permitindo deste modo que a energia irradie para longe da superfície e levando portanto a uma redução dos níveis de vibração à superfície do maciço. Esse efeito é parcialmente identificável na Figura 4.21, onde se ilustra, para os dois casos em análise, o campo de deslocamentos identificado na seção onde se encontra inscrita a ação, esta última com uma frequência de excitação de 40 Hz.

As conclusões agora apresentadas sugerem que a inclusão de material na parte inferior do túnel pode ser considerada como uma medida possível para minimizar as vibrações que se propagam pelo maciço em direção à superfície. A eficiência de tal medida é sobretudo notória na faixa de frequências mais elevada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-144_1168_1747_1127_160.jpg)
Figura 4.21: Campo de deslocamentos na seção transversal onde se encontra a ação para uma frequência de excitação de 40 Hz (lado esquerdo-parte real; lado direito-parte imaginária): a) túnel sem invert; b) túnel com invert.

A Figura 4.22 ilustra a evolução do deslocamento vertical induzido nos pontos de referência localizados no alinhamento do eixo horizontal do túnel em função da frequência de excitação e para as duas situações em análise.

Observando a Figura 4.22, verifica-se que a inserção do invert provoca uma diminuição no valor dos deslocamentos para as frequências mais elevadas, mantendo-se a resposta praticamente inalterada até cerca dos 30 Hz. No caso do ponto lateral do túnel (Figura 4.22a) a resposta dinâmica é muito pouco influenciada pela existência do invert, verificando-se uma evolução em relação à frequência de excitação em tudo idêntica. No que se refere aos restantes pontos em análise, constata-se que, para baixas frequências, a influência na resposta é muito reduzida, acentuando-se as diferenças para frequências mais elevadas. É contudo bem visível que o efeito do invert é mais notório nos pontos localizados mais próximos do túnel, diminuindo gradualmente à medida que aumenta o afastamento do ponto de observação. Este fato é evidente na Figura 4.22f, onde a diferença nos resultados previstos pelas duas análises é praticamente insignificante, mesmo para a faixa de frequências acima dos 60 Hz.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-146_1860_1754_120_157.jpg)
Figura 4.22: Amplitude do deslocamento vertical em diferentes locais para o caso do túnel com invert e sem invert: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

Conclui-se, deste modo, que a presença do invert condiciona a resposta particularmente nas proximidades do túnel e para frequências elevadas, induzindo uma redução nos níveis de vibração nos pontos localizados no interior do maciço, no alinhamento do eixo horizontal do túnel. A justificação para esta redução é em tudo análoga à já apresentada para os pontos situados à superfície. Segue-se a Figura 4.23, que apresenta os deslocamentos verticais dos pontos de observação situados no eixo de simetria do túnel, em particular do ponto I situado sob a carga aplicada, do ponto H situado no teto do túnel, do ponto G localizado 3 m acima do túnel e do ponto A localizado à superfície, para os dois casos em estudo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-147_1230_1745_121_161.jpg)
Figura 4.23: Amplitude do deslocamento vertical em diferentes locais para o caso do túnel com invert e sem invert: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

Visualizando a Figura 4.23 constata-se, uma vez mais, que a introdução do invert leva a uma diminuição da amplitude dos deslocamentos, quer nos pontos pertencentes ao túnel, quer nos pontos localizados no maciço. Atentando então na resposta dinâmica do ponto de aplicação da carga (ponto situado na base do túnel), verifica-se que, embora a tendência geral da resposta seja semelhante para os dois cenários considerados, a adição do invert conduziu a uma redução muito considerável da amplitude dos deslocamentos (Figura 4.23a). Este efeito, já de si esperado, é explicado pelo aumento da rigidez do túnel, em particular da rigidez de flexão longitudinal, induzida pela incorporação do invert. Diante do exposto, pode-se sugerir que o invert é um parâmetro que pode ter uma influência significativa no mecanismo de interação trem-via-túnel. É contudo de referir, conforme já foi explicitado previamente, que a existência da via e de seus respectivos materiais resilientes tenderá a minimizar a relevância deste efeito.

No que diz respeito ao ponto situado no teto do túnel (Figura 4.23b), bem como aos pontos do maciço considerados (Figura 4.23c, d), é bem visível a influência do invert nos valores dos deslocamentos verticais na faixa de frequências acima dos 18 Hz, sendo pouco notória a influência para frequências abaixo desse valor. Estas
observações corroboram, na generalidade, as já apresentadas anteriormente para os restantes pontos de observação, em que se constatou que a resposta diferia sobretudo para as frequências mais elevadas, sendo a influência do invert na resposta muito reduzida para baixas frequências.

Como esperado, verifica-se uma redução na amplitude dos deslocamentos nos pontos localizados diretamente acima do túnel quando é considerada a presença do invert. Este fato deve-se, como já foi referido, ao fato de o invert atrair uma grande parte da energia de vibração, permitindo que essa energia se propague na direção inferior e originando assim uma redução dos níveis de vibração nas zonas do maciço localizadas acima do túnel.

### 4.8 Influência da rigidez do solo

O problema das vibrações induzidas no interior de túneis é bastante complexo, envolvendo não só as propriedades mecânicas do túnel mas também as propriedades do maciço, como, por exemplo, a sua rigidez, estratificação e amortecimento. Com o objetivo de investigar a influência da rigidez do solo no comportamento dinâmico global do sistema, apresenta-se a seguir um estudo paramétrico onde são considerados dois cenários: i) o cenário de referência, a que corresponde um módulo de cisalhamento de $118,75 \mathrm{MPa}$; ii) um novo cenário em que o módulo de cisalhamento é o dobro, ou seja, de 237,5 MPa. Neste último cenário $\mathrm{C}_{\mathrm{s}}$ e $\mathrm{C}_{\mathrm{p}}$ tomam os valores de 350 m/s e 655 m/s, respectivamente. À semelhança dos casos anteriores, são considerados os pontos de observação representados na Figura 4.1.

A Figura 4.24 mostra os deslocamentos verticais dos pontos de observação situados à superfície do maciço em função da frequência de excitação e para os dois cenários considerados.

Dos resultados expostos na Figura 4.24 constata-se que, de um modo geral, o aumento do módulo de cisalhamento está associado a uma diminuição dos níveis de vibração. Este efeito seria por si só esperado, dado o aumento de rigidez do sistema. Contudo, atentando na Figura 4.24, verifica-se, para os pontos mais afastados do alinhamento do túnel e para frequências elevadas, que a esperada redução dos níveis de vibração devido ao aumento do módulo de cisalhamento não ocorre. Este efeito, aparentemente controverso, é justificado por uma menor atenuação da amplitude de vibração com o aumento de rigidez do solo. Como se verá na seção seguinte, a atenuação dos níveis de vibração devido ao amortecimento geométrico é independente da frequência, porém, já o efeito do amortecimento material é mais evidente com a diminuição do comprimento de onda propagante e com o aumento da distância entre
a fonte e o receptor. Desse modo, dado que o comprimento de onda para uma dada frequência de excitação é tanto maior quanto maior é a rigidez do meio, verifica-se que o cenário correspondente ao maciço mais rígido acarreta uma menor atenuação de vibração. Desse modo é notório que, para distâncias mais elevadas, a alteração da rigidez dinâmica do sistema é compensada pela menor atenuação dos níveis de vibração.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-149_1891_1745_585_160.jpg)
Figura 4.24: Amplitude do deslocamento vertical em diferentes locais para valores do módulo de cisalhamento do solo distintos: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Como anteriormente referido, a resposta dinâmica à superfície caracteriza-se por um comportamento ondulante, o qual é atribuído à interferência de ondas de corpo,
de cisalhamento e de Rayleigh. O intervalo de frequência entre os picos invertidos exibidos na resposta está relacionado com a velocidade de propagação das ondas no maciço, tornando-se mais acentuado com o aumento do módulo de cisalhamento do maciço.

A Figura 4.25 ilustra o deslocamento vertical induzido nos pontos de referência localizados no alinhamento do eixo horizontal do túnel para os dois cenários em consideração.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-150_1861_1748_668_158.jpg)
Figura 4.25: Amplitude do deslocamento vertical em diferentes locais para valores do módulo de cisalhamento do solo distintos: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

Visualizando a Figura 4.25, observa-se uma vez mais que o aumento do módulo de cisalhamento provoca uma diminuição no valor dos deslocamentos. No caso do ponto lateral do túnel a redução é menor (Figura 4.25a), sendo mais significativa para os restantes pontos considerados no alinhamento do eixo horizontal do túnel. É de notar que no caso do ponto lateral do túnel, a resposta é claramente condicionada pela dinâmica do próprio túnel e, por conseguinte, a influência da alteração do módulo de cisalhamento do solo na resposta é claramente menor. No que diz respeito aos restantes pontos considerados, situados no interior do maciço, constata-se que o efeito do módulo de cisalhamento do solo é mais notório nos pontos situados mais próximos do túnel, verificando-se uma certa convergência dos níveis de vibração quando aumenta o afastamento.

Relativamente ao último aspecto mencionado, cabe mencionar que a convergência da resposta, especialmente na faixa de frequências mais elevada, não é tão notória como no caso dos pontos de observação localizados à superfície do maciço (ver Figura 4.24). Com efeito, no caso dos pontos de observação localizados à superfície verificava-se mesmo uma inversão de tendência entre os dois cenários em estudo. Com efeito, a resposta à superfície do terreno é em boa parte condicionada pela propagação de ondas de Rayleigh, ao passo que no interior do maciço, a resposta é caracterizada essencialmente pela propagação de ondas de corpo. Como se verá na seção seguinte, o amortecimento geométrico associado à propagação de ondas de corpo é muito mais acentuado do que no caso de ondas de superfície. Assim sendo, o efeito relativo do amortecimento material, o qual é dependente do comprimento de onda propagante (e consequentemente da rigidez do meio), é menos notório no caso de pontos de observação localizados no interior do maciço.

A Figura 4.26 apresenta os deslocamentos verticais dos pontos de observação situados no eixo de simetria do túnel, em particular do ponto I situado sob a carga aplicada, do ponto H situado no teto do túnel, do ponto G localizado 3 m acima do túnel e do ponto A localizado à superfície, para os dois cenários considerados.

Observando a Figura 4.26 constata-se, novamente, que o aumento do módulo de cisalhamento leva, de um modo geral, a uma diminuição da amplitude dos deslocamentos. Contudo, verifica-se que para o caso do ponto de aplicação da carga (ponto situado na base do túnel) a influência do módulo de cisalhamento do solo é muito reduzida, praticamente desprezável (Figura 4.26a). Já no caso do ponto situado no teto do túnel essa influência é mais visível, sendo também evidente nos restantes pontos considerados.

Analisando agora mais em detalhe a resposta dinâmica do ponto localizado sob a carga aplicada, verifica-se que o módulo de cisalhamento do solo teve um efeito praticamente negligenciável, pelo menos para a faixa de valores em estudo. Como se pode visualizar na Figura 4.26a, apenas ligeiras diferenças podem ser observadas nos resultados apresentados. Essa conclusão é importante do ponto de vista das vibrações induzidas pelo tráfego ferroviário. As cargas dinâmicas geradas durante a passagem do trem são dependentes do comportamento dinâmico da base da via [34], [35]. Contudo, uma vez que a resposta dinâmica do túnel parece ser muito semelhante, as conclusões aqui apresentadas permitem sugerir que o módulo de cisalhamento do solo tem uma pequena influência no mecanismo de interação dinâmica trem-via, pelo menos para a faixa de variação de parâmetros considerada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-152_1258_1748_967_158.jpg)
Figura 4.26: Amplitude do deslocamento vertical em diferentes locais para valores do módulo de cisalhamento do solo distintos: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

### 4.9 Influência do amortecimento material do solo

O maciço circundante ao túnel permite que a energia se propague em seu redor, sendo a amplitude de vibração atenuada em função da distância através de mecanismos de amortecimento. Embora a designação de amortecimento seja geralmente atribuída de forma indiscriminada aos mecanismos de atenuação de vibração, cabe distinguir de
forma clara os dois mecanismos distintos: o amortecimento geométrico e o amortecimento material. Este último parâmetro, de difícil quantificação in situ, merece uma atenção especial dada a sua relevância na redução da amplitude das vibrações com o aumento da distância fonte-receptor. Para ilustrar a influência do amortecimento material do solo, apresenta-se agora um estudo paramétrico. Além do cenário de referência onde $\xi=0,04$, são analisadas duas outras situações com coeficientes de amortecimento de 0,02 e 0,06.

Quanto ao amortecimento geométrico cabe mencionar que não corresponde a uma perda de energia do sistema, mas sim ao seu espalhamento devido à propagação da onda. Desse modo é apenas dependente da geometria da frente de onda e, consequentemente do tipo de onda, e da distância do ponto de observação à fonte de geração. Como é evidente, a geometria da frente de onda depende ainda da dimensionalidade do problema, ou seja, da forma como a energia se espalha em uma, duas, ou três dimensões. O tipo de solicitações envolvidas no presente estudo acarreta tridimensionalidade do problema, embora a rigidez de flexão do túnel na direção longitudinal implique que, para um carregamento pontual, a frente de onda seja bastante distinta da geometria axissimétrica. Contudo, estudos desenvolvidos por Auersch \& Said (2010), apontam que a lei de atenuação no caso de solicitações no interior de túneis de metrô segue a tendência da equação de Lamb (1904):

$$
\begin{equation*}
\frac{u}{u_{1}}=\left(\frac{r_{1}}{r}\right)^{m} \tag{4.2}
\end{equation*}
$$

em que u é a amplitude do deslocamento verificado em um ponto à distância r da fonte; u ${ }_{1}$ é a amplitude do deslocamento homólogo em um ponto localizado à distância $\mathrm{r}_{1}$ da fonte; e m é a constante de atenuação. No Quadro 4.1 sintetizam-se os valores da constante m para diferentes tipos de onda, de solicitação e de localização do receptor. Convém contudo esclarecer que as constantes presentes no referido quadro são apenas válidas para solicitações não móveis aplicadas a maciços semi-infinitos.

Quadro 4.1: Coeficientes de amortecimento geométrico
| Tipo de onda | Fonte | Localização do ponto de observação | $m$ |
| :--- | :--- | :--- | :--- |
| De corpo | Carga pontual | Superfície | 2 |
|  |  | Interior do maciço | 1 |
|  | Carga linear com desenvolvimento infinito | Superfície | 1 |
| Superfície | Carga pontual | Superfície | 0,5 |
|  | Carga linear | Superfície | 0 |


Estudos recentes realizados por Auersch \& Said (2010), com base em medições experimentais, apontam no sentido de que o expoente m para o caso de uma solicitação móvel no interior de um túnel de metrô deverá tomar um valor próximo de 0,5 caso o receptor se encontre à superfície do maciço e a uma distância superior a 10 m. Note-se que no estudo dos referidos autores não é apresentada uma distinção entre os diferentes tipos de onda nem sobre a tipologia do carregamento. Este último aspecto será relevante dado que carregamentos móveis oriundos de várias cargas (condicionadas pela geometria do trem) deverão corresponder a solicitações intermediárias entre a carga linear e a carga pontual.

No presente estudo apenas se abordará a influência do amortecimento material, dado que o amortecimento geométrico não é mais do que uma característica intrínseca à configuração própria do sistema. O amortecimento material está associado a uma efetiva dissipação de energia. O seu efeito é tanto mais evidente quanto mais elevada for a frequência de excitação (menor comprimento de onda) e a distância entre a fonte e o receptor. Este efeito é evidente na Figura 4.27, onde estão representadas as amplitudes dos deslocamentos verticais dos pontos situados à superfície do maciço em função da frequência de excitação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-155_1859_1753_119_157.jpg)
Figura 4.27: Amplitude do deslocamento vertical em diferentes locais para valores do amortecimento material do solo distintos: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Ao observar a Figura 4.27, podem-se fazer algumas considerações: i) como esperado, o aumento do amortecimento está associado a uma diminuição dos níveis de vibração; ii) o efeito do amortecimento é tanto mais notório quanto maior for a frequência de excitação, independentemente da distância fonte-receptor; iii) o efeito de redução na amplitude devido ao amortecimento material é bastante relevante quando a distância fonte-receptor é elevada (ver Figura 4.27f). Estes efeitos justificam-se pela dependência do efeito do amortecimento em relação ao número de ciclos de vibração a que o material foi submetido. Para frequências mais elevadas, ou seja, comprimentos de onda menores, pode alcançar-se uma redução considerável dos níveis de vibração
quando a distância fonte-receptor implica um número significativo de ciclos a que o material fica sujeito.

A Figura 4.28 ilustra o deslocamento vertical induzido nos pontos de referência localizados no alinhamento do eixo horizontal do túnel para os três valores do coeficiente de amortecimento em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-156_1889_1747_514_161.jpg)
Figura 4.28: Amplitude do deslocamento vertical em diferentes locais para valores do amortecimento material do solo distintos: a) ponto J; b) ponto K; c) ponto L; d) ponto M; e) ponto N; f) ponto O.

Da análise da Figura 4.28 pode concluir-se que o amortecimento material do solo teve um efeito negligenciável na resposta dinâmica do ponto lateral do túnel (Figura 4.28a), o que já seria esperado dada a proximidade entre o receptor e a fonte de excitação. No
que diz respeito aos restantes pontos considerados, situados no interior do maciço, constata-se, uma vez mais, que o aumento do amortecimento conduz a uma diminuição dos níveis de vibração, sendo esse efeito de redução tanto mais significativo quanto maior for a frequência de excitação e mais elevada for a distância entre a fonte e o receptor. Estas observações são em tudo idênticas às apresentadas para os pontos situados à superfície, e justificam-se de igual modo.

Segue-se a Figura 4.29 que apresenta os deslocamentos verticais dos pontos de observação situados no eixo de simetria do túnel, em particular do ponto I situado sob a carga aplicada, do ponto H situado no teto do túnel, do ponto G localizado 3 m acima do túnel e do ponto A localizado à superfície; para os três cenários considerados.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-157_1237_1748_895_159.jpg)
Figura 4.29: Amplitude do deslocamento vertical em diferentes locais para valores do amortecimento material do solo distintos: a) ponto I; b) ponto H; c) ponto G; d) ponto A.

Visualizando a Figura 4.29 constata-se que a influência do amortecimento do solo é muito reduzida, praticamente desprezável, no caso dos pontos pertencentes ao túnel, sendo para os pontos do maciço considerados tanto mais evidente quanto maior é a frequência de excitação (ou seja, menor é o comprimento de onda) e quanto mais nos afastamos do túnel (Figura 4.29c, d). Estas considerações corroboram as já anteriormente apresentadas nesta subseção.

No que respeita à influência do amortecimento do solo sobre a resposta dinâmica do próprio túnel, cujos resultados estão representados nas Figura 4.29a e b, conclui-se que o amortecimento material é um parâmetro mais ou menos negligenciável para a avaliação dos deslocamentos do próprio túnel. Embora não tenha sido analisado no presente trabalho, as conclusões aqui encontradas permitem sugerir que o amortecimento material tem uma pequena influência no mecanismo de interação dinâmica trem-via, não sendo por isso apreciável o seu efeito no processo de geração de vibrações, contrariamente ao que ocorre no processo de propagação.

### 4.10 Influência das propriedades da via férrea

### 4.10.1 Considerações iniciais

Os estudos apresentados nas seções anteriores versaram sobre a influência das propriedades do túnel e do maciço circundante nos mecanismos de propagação de vibrações originadas pela aplicação de uma ação vertical na soleira do túnel. Apesar do indubitável interesse dos estudos apresentados, não se pode deixar de mencionar sua relativa distância de um cenário ferroviário real, dada a ausência da estrutura da via férrea. Procurando cobrir, ainda que de forma parcial, tal lacuna, cabe aqui apresentar um pequeno estudo paramétrico que examina a influência de algumas propriedades da via férrea nos mecanismos de propagação de vibrações, em particular das propriedades dos elementos resilientes da via férrea.

Como já referido em um capítulo anterior, existem diferentes tipologias de vias férreas, sendo uma classificação corrente a sua divisão em dois grandes grupos conforme a presença ou ausência de lastro: i) vias com lastro; ii) vias sem lastro. Embora ambas as tipologias sejam correntemente aplicadas em túneis, a opção por via sem lastro, em particular do tipo em laje de concreto armado, tem ganhado terreno em aplicações ferroviárias em túneis, dada a menor necessidade de operações de manutenção para garantir a operacionalidade da infraestrutura.

O presente estudo versa apenas sobre via sem lastro, tendo-se admitido a configuração de base ilustrada na Figura 4.30. A solicitação é constituída por uma ação de resultante unitária, igualmente repartida pelos dois trilhos, e com frequência variável (ver Figura 4.30). Como se pode verificar, trata-se de uma solução de via em laje contínua, constituída por trilhos do tipo UIC60, os quais se apoiam em uma laje de concreto armado, com 2,5 m de largura, rigidez de flexão longitudinal de $1,62 \times 10^{8}$ $\mathrm{N} / \mathrm{m}^{2}$ e com uma massa por metro de desenvolvimento longitudinal de 2800 kg/m. O apoio dos trilhos na laje é feito através de palmilhas, consideradas de forma simpli-
ficada como um apoio contínuo com as seguintes propriedades: $\mathrm{k}=2,5 \times 10^{8} \mathrm{~N} / \mathrm{m}^{2}$ e $\mathrm{c}=6 \times 10^{4} \mathrm{Ns} / \mathrm{m}^{2}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-159_514_961_283_550.jpg)
Figura 4.30: Representação esquemática da configuração adotada para a via férrea.

Como se pode visualizar na Figura 4.30, considera-se ainda a presença de uma manta resiliente entre a laje e a soleira do túnel como medida de isolamento, a qual permitirá uma atenuação das vibrações que são transmitidas pela via férrea ao invert do túnel. A eficiência de tal medida é devidamente discutida na seção subsequente, assim como em um capítulo posterior da presente tese onde é apresentado um estudo integrado que contempla a interação veículo-via e a propagação de vibrações no interior de edifícios próximos do túnel.

### 4.10.2 A influência da rigidez da manta resiliente

### 4.10.2.1 Descrição geral

Entre as várias medidas de mitigação de vibrações admissíveis, a alteração das condições de elasticidade da via férrea, em particular através da incorporação de elementos resilientes constitui uma das soluções com elevada potencialidade prática, o que se deve, em particular, ao fato de a mitigação ocorrer na fonte, ou seja, sem que haja necessidade de intervenção em infraestruturas vizinhas à via férrea.

Independentemente da tipologia da solução de isolamento, a mitigação através da alteração das condições de resiliência da via férrea consiste na colocação de elementos flexíveis sob corpos com uma certa massa, para introduzir uma nova frequência natural no sistema. Em consequência, é esperado que para frequências de excitação consideravelmente superiores à frequência de ressonância induzida pela presença do elemento resiliente, ocorra atenuação da energia que é transmitida da via férrea ao seu suporte.

Tal como já analisado por vários autores [44], [93], [110], [112], [163], [174], [175], a interpretação física do problema em causa pode ser feita por analogia com o comportamento dinâmico de um sistema massa-mola, em que a massa é garantida
pelo elemento sobrejacente ao elemento resiliente e a rigidez é a deste, dado que se assume que este é consideravelmente mais flexível do que o meio que lhe serve de suporte (Figura 4.31b). Este último aspecto reveste-se de particular importância, pois caso o suporte do elemento resiliente não ofereça as condições de rigidez adequadas, a eficiência da medida de mitigação é severamente afetada [111], [174], [176]. Considerando as simplificações enunciadas, a frequência natural do sistema massa-mola, admitindo reduzido o amortecimento material, é então dada aproximadamente por:

$$
\begin{equation*}
f_{n} \approx \frac{1}{2 \pi} \sqrt{\frac{k}{m}} \tag{4.3}
\end{equation*}
$$

em que k é a rigidez do elemento resiliente e m a massa sobrejacente, ambos por unidade de desenvolvimento longitudinal da via férrea.

Considerando o modelo simplificado em causa, é pois esperado que quando a frequência de excitação suscite um fator de amplificação dinâmica inferior a 1, ou seja, quando a frequência de excitação seja superior à frequência de corte do sistema, $\mathrm{f}_{\text {cut }}$, a qual pode ser estimada pela expressão [4.4], ocorra uma redução da energia que efetivamente é transmitida aos elementos subjacentes ao elemento resiliente. Tal comportamento está esquematicamente ilustrado na Figura 4.31 (a), onde é possível observar que para frequências de excitação inferiores à frequência de corte ocorre amplificação da ação transmitida ao suporte do elemento resiliente.

$$
\begin{equation*}
f_{\text {cut }} \approx \sqrt{2} f_{n} \tag{4.4}
\end{equation*}
$$

Da análise das expressões [4.3], [4.4] e da Figura 4.31, facilmente se conclui que o cenário ideal corresponde à minimização do valor da frequência de corte, a qual pode ser garantida através da colocação de elementos resilientes muito flexíveis sob elementos de massa elevada. Considerando as condicionantes enunciadas, e ao fato de a elasticidade dos elementos ter um limite físico mínimo, sob pena de os deslocamentos quase estáticos da via serem excessivamente elevados, surge como solução razoável a laje flutuante, em que sob a peça de concreto (a qual garante uma massa apreciável) colocam-se uma manta de material polimérico (Figura 4.32a) ou mesmo molas metálicas (Figura 4.32b), para a mitigação de vibrações induzidas por tráfego em túneis.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-161_655_1493_119_285.jpg)
Figura 4.31: Atenuação da força transmitida ao suporte através da introdução de elementos resilientes: a) curva de atenuação; b) modelo físico simplificado.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-161_1180_1756_941_155.jpg)
Figura 4.32: Sistemas de laje flutuante: a) elementos resilientes poliméricos; b) sistema de suporte por molas.

Independentemente da configuração do sistema de laje flutuante, a sua eficiência é claramente condicionada pela rigidez do elemento resiliente. No presente estudo optou-se pela análise de uma solução de isolamento com mantas resilientes, tendo-se considerado as variantes de propriedades indicadas no Quadro 4.2.

Considerando as propriedades da via enunciadas, é esperado que o comportamento do sistema seja caracterizado pelas frequências naturais e de corte indicadas no Quadro 4.3. Note-se que na análise efetuada, que conduziu aos valores explicitados
no quadro, foi negligenciada a dinâmica do sistema túnel-maciço, ou seja, no cálculo das frequências notáveis indicadas apenas se considerou o comportamento dinâmico da via.

Quadro 4.2: Propriedades das mantas de isolamento
| Cenário | Rigidez por unidade de comprimento longitudinal k ( $\mathrm{N} / \mathrm{m}^{2}$ ) | Amortecimento viscoso por unidade de comprimento longitudinal c $\left.\boldsymbol{(} \mathbf{N s} \boldsymbol{/} \mathbf{m}^{\mathbf{2}}\right)$ |
| :--- | :--- | :--- |
| Manta flexível | 0,04×10 ${ }^{9}$ | $5,5 \times 10^{4}$ |
| Manta intermediária | $0,153 \times 10^{9}$ | $5,5 \times 10^{4}$ |
| Manta rígida | $0,283 \times 10^{9}$ | $5,5 \times 10^{4}$ |
| Não isolado | $\infty$ | 0 |


Quadro 4.3: Frequências naturais e de corte dos cenários isolados
| Cenário | $\mathbf{f}_{\mathbf{n}} \boldsymbol{(} \mathbf{H z} \boldsymbol{)}$ | $\mathbf{f}_{\mathbf{c u t}} \boldsymbol{(} \mathbf{H z} \boldsymbol{)}$ |
| :--- | :--- | :--- |
| Manta flexível | 18,6 | 26,3 |
| Manta intermediária | 36,4 | 51,5 |
| Manta rígida | 49,5 | 70,1 |


### 4.10.2.2 Resposta dinâmica do sistema via-maciço

Como esperado, o comportamento dinâmico da via férrea é claramente condicionado pelas características do sistema de isolamento. A Figura 4.33 ilustra a amplitude do deslocamento vertical do trilho e da laje da via férrea, nas posições longitudinais correspondentes à seção transversal onde se encontra inscrita a ação, em função da frequência de excitação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-162_608_1748_1958_160.jpg)
Figura 4.33: Amplitude do deslocamento vertical da via para diferentes soluções de manta resiliente em função da frequência de excitação: a) trilho; b) laje.

A Figura 4.33 permite uma clara identificação do aumento da flexibilidade da via induzido pela presença da manta resiliente. Esse efeito é responsável pelas diferenças encontradas na resposta dos vários sistemas para a faixa de frequências mais reduzida. Por outro lado, a presença do material resiliente subjacente à massa da laje permite a ocorrência de um fenômeno ressonante, o que explica os picos identificados para os cenários de isolamento, os quais ocorrem para frequências de excitação muito próximas das frequências naturais indicadas no Quadro 4.3. As pequenas diferenças entre os valores observados na Figura 4.33 e os indicados no referido quadro devem-se a dois fatores que deslocam as frequências naturais do sistema para valores mais reduzidos: i) a existência de amortecimento material; ii) o fato de o suporte da via férrea não ser infinitamente rígido.

Do ponto de vista da engenharia prática, os resultados agora ilustrados mostram claramente que os deslocamentos dos elementos da via sobrejacentes à manta resiliente tendem a aumentar com a diminuição de rigidez deste elemento, o que pode ser interpretado como um efeito pernicioso da medida de mitigação, tanto mais que deslocamentos elevados do trilho podem comprometer a própria estabilidade do veículo. Porém, a presença dos elementos resilientes implica uma considerável redução da energia que é transmitida da via para o restante sistema, efeito esse bem patente na Figura 4.34a, onde se ilustra a evolução do deslocamento vertical do ponto central do invert (pertencente à seção onde se encontra inscrita a ação aplicada aos trilhos) em função da frequência de excitação. Comparando os resultados dos cenários isolados com o não isolado, é possível identificar três zonas distintas conforme a frequência de excitação: i) para frequências próximas de zero, ou seja em condições quase estáticas, a presença do isolamento é negligenciável; ii) para frequências entre cerca de 10 Hz (ou frequências um pouco mais elevadas nos casos de manta mais rígida) e a frequência de corte, ocorre uma amplificação clara dos deslocamentos devido à presença da manta resiliente, atingindo o valor máximo na frequência natural; iii) para frequências acima da frequência de corte, o efeito atenuador da medida de isolamento é notório, sendo tanto mais acentuado quanto mais flexível for a manta resiliente.

Uma outra forma de representar os resultados, porventura, mais interessante do ponto de vista de engenharia é através do conceito de insertion loss. O insertion loss (IL) reflete a redução da vibração causada pela introdução da medida de mitigação, sendo definido por:

$$
\begin{equation*}
\mathrm{IL}=20 \log _{10}\left(\frac{u_{\text {ñã isolado }}}{u_{\text {isolado }}}\right) \tag{4.5}
\end{equation*}
$$

A Figura 4.34b ilustra as curvas de IL no ponto central do invert para as diferentes soluções de mitigação. Valores negativos de IL correspondem à amplificação da resposta, ao passo que os valores positivos representam atenuação da mesma.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-164_612_1747_357_158.jpg)
Figura 4.34: Resposta dinâmica do ponto central do invert em função da frequência de excitação para os diferentes cenários: a) Amplitude do deslocamento vertical; b) Insertion loss do deslocamento vertical.

O conceito de IL tem sido amplamente aplicado na avaliação da eficiência de medidas de mitigação. Contudo, este indicador apresenta algumas limitações, em particular o fato de ser claramente dependente da posição do ponto em análise, não constituindo um indicador global do desempenho da medida de mitigação. Auersch (2012) propôs um indicador alternativo, que foi posteriormente também adotado por Alves Costa et al. (2012b), o qual designaram por fator de transferência de carga. O fator de transferência de carga, $\mathrm{F}_{\mathrm{r}}$, traduz a razão, em função da frequência, entre a amplitude da carga aplicada nos trilhos (1 N no presente cenário, equitativamente distribuído pelos dois trilhos) e a amplitude da força normal $\left(\mathrm{F}_{\mathrm{t}}\right)$ transmitida pela via ao seu suporte (invert no presente caso):

$$
\begin{equation*}
F_{r}(f)=\frac{F_{t}(f)}{1} \tag{4.6}
\end{equation*}
$$

O valor $\mathrm{F}_{\mathrm{t}}$ resulta da integração das tensões normais entre a via e o invert ao longo da sua largura (2b) e para todo o desenvolvimento longitudinal da mesma, o que se traduz por:

$$
\begin{equation*}
F_{t}(f)=\operatorname{abs}\left(\int_{-b}^{b} \int_{-\infty}^{+\infty} \sigma_{z}(x, y, z=\text { constante }) \mathrm{d} x \mathrm{~d} y\right) \tag{4.7}
\end{equation*}
$$

Em uma formulação 2.5D, a expressão anterior pode tomar a seguinte configuração atendendo às propriedades da transformada de Fourier:

$$
\begin{equation*}
F_{t}\left(f, k_{1}=0\right)=\operatorname{abs}\left(\int_{-b}^{b} \sigma_{z}\left(k_{1}=0, y, z=\text { constante }\right) \mathrm{d} y\right) \tag{4.8}
\end{equation*}
$$

Ou seja, a amplitude da força total transmitida pode ser avaliada através de uma análise em estado plano de deformação, já que $\mathrm{k}_{1}=0$. Este indicador, além de ser fácil de avaliar, permite uma análise muito mais global do desempenho da medida de mitigação já que avalia a força global (ou energia global) que é transmitida pela via ao seu suporte. Como anteriormente discutido por Alves Costa et al. (2012b), nos casos em que o caráter móvel da ação é tido em consideração, a análise dos fatores de transferência de carga mostra-se muito mais útil do que a análise das curvas IL relativas a pontos, dado o caráter global do primeiro indicador em relação ao segundo.

A Figura 4.35a apresenta a evolução das curvas de transferência de carga para os diferentes cenários em estudo, sendo as curvas IL relativas à mesma grandeza apresentadas na Figura 4.35b. Os resultados expostos na Figura 4.35a revelam que para o cenário não isolado, a amplitude da força transmitida ao invert permanece praticamente inalterada ao longo da faixa de frequências e com o valor unitário. De fato, exceto por pequenas perturbações induzidas pela dinâmica do trilho e pela rigidez dinâmica do suporte (dado que a dinâmica do sistema túnel-maciço é tida em conta na análise), a força que é aplicada nos trilhos é transmitida ao invert do túnel sem que sofra alteração significativa. Porém, cenário totalmente distinto é verificado para os casos em que são adotadas medidas de mitigação: observa-se um acréscimo muito significativo da força global transmitida quando a frequência de excitação é próxima da frequência natural do sistema isolado, seguido por um decréscimo muito acentuado da razão $\mathrm{F}_{\mathrm{r}}$ para frequências de excitação superiores à frequência de corte. Esse mesmo efeito é também possível visualizar na Figura 4.35b, onde se apresenta o IL do fator de transferência de carga. Como se pode verificar, ocorre uma grande atenuação, podendo alcançar valores superiores a 20 dB, na faixa de frequências mais elevada quando são adotadas mantas de rigidez reduzida.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-166_716_1750_122_154.jpg)
Figura 4.35: Transmissão de carga da via ao túnel para diferentes soluções de isolamento: a) curvas do fator de transferência de carga; b) curvas de IL do fator de transferência de carga.

Como se verá a seguir, as curvas IL relativas a deslocamentos no maciço geotécnico seguem de perto a configuração das curvas apresentadas na Figura 4.35b, com a vantagem de as últimas poderem ser avaliadas através de uma análise bidimensional, o que constitui um procedimento alternativo para a quantificação da eficiência de medidas de mitigação na fonte [110], [174].

### 4.10.2.3 Resposta dinâmica à superfície do maciço

Considerando os resultados anteriormente apresentados, em particular as considerações sobre a transmissão de energia da via para o túnel, é de todo esperado que se assista a uma redução dos níveis de vibração percebidos nos pontos de observação do maciço devido à instalação das medidas de mitigação. Esse mesmo efeito pode então ser observado na Figura 4.36, onde se ilustram as curvas de transferência de deslocamento vertical dos pontos de observação localizados à superfície do maciço (ver Figura 4.1).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-167_1819_1748_118_158.jpg)
Figura 4.36: Amplitude do deslocamento vertical em diferentes locais para diferentes valores de rigidez da manta resiliente: a) ponto A; b) ponto B; c) ponto C; d) ponto D; e) ponto E; f) ponto F.

Como se pode verificar, a atenuação da resposta dinâmica é tanto mais acentuada quanto maior a frequência de excitação e menor a frequência natural do sistema de isolamento. Como esperado, a atenuação da resposta na faixa de frequências acima da frequência de corte é acompanhada pela amplificação da resposta na faixa de frequências vizinha da frequência natural do sistema de isolamento. No caso da opção pela manta mais rígida, dado que a frequência de corte é próxima dos 70 Hz, esta solução revela-se muito pouco interessante para a faixa de frequências em análise.

De modo a permitir uma análise mais simples da eficiência das diferentes soluções, apresentam-se na Figura 4.37 as curvas IL do deslocamento vertical dos diferentes
pontos em consideração e para as diferentes soluções de mitigação. Sobrepostas às referidas curvas encontram-se as curvas IL da razão de transferência de força. Como se pode verificar existe uma coincidência quase perfeita entre as curvas IL dos deslocamentos dos diferentes pontos, independentemente da medida de mitigação adotada. Esta constatação, válida para o presente estudo, deve ser atendida com cautela, pois não é extensível, pelo menos de forma direta, aos casos de carregamentos móveis suscitados por tráfego ferroviário. Nessas situações, como aliás discutido por Barbosa et al. (2015) e Alves Costa et al.[110], [177] e também discutido em um capítulo posterior da presente tese, o valor de IL é claramente dependente da posição, constituindo, no entanto, o IL da razão de transferência de força uma aproximação global às curvas IL de deslocamento (ou velocidade) dos diferentes pontos.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-168_621_1752_968_155.jpg)
Figura 4.37: Curvas de IL para os diferentes pontos e soluções de mitigação: a) manta flexível; b) manta intermediária; c) manta rígida.

No presente estudo, comprova-se igualmente que os IL relativos às razões de transferência de carga se ajustam aos dos deslocamentos verticais correspondentes.

### 4.10.3 A influência do amortecimento da manta resiliente

Na subseção anterior foi enfatizada a relevância da rigidez da manta resiliente na eficiência da solução de mitigação das vibrações transmitidas ao sistema túnel-maciço. Na verdade, o parâmetro mais influente não é propriamente a rigidez da manta, mas sim a frequência natural da solução de isolamento, a qual pode ser alterada por meio de mudanças na rigidez da manta ou na massa sobrejacente. Dado que o aumento da massa acarreta custos muito elevados, a atuação do engenheiro fica limitada à escolha das propriedades da manta resiliente.

Além da rigidez da manta resiliente, um outro parâmetro que pode ser alvo de intervenção corresponde ao amortecimento. Convém desde já esclarecer que do ponto de vista prático o amortecimento de materiais poliméricos é de difícil quantificação,
sendo claramente dependente do nível de carga e da frequência de excitação [108]. Contudo, ainda que apenas do ponto de vista conceitual, é oportuno esclarecer a influência deste parâmetro no processo de transmissão de vibrações da via ao túnel. No presente estudo selecionou-se a manta de rigidez intermediária e consideraram-se duas análises adicionais em relação à anteriormente efetuada: i) amortecimento elevado, o valor do parâmetro de amortecimento foi multiplicado por 5; ii) amortecimento reduzido, o valor do parâmetro de amortecimento foi dividido por 5. Embora a faixa de variação assumida possa ser considerada exagerada, a sua seleção foi intencional para realçar os potenciais efeitos do parâmetro de amortecimento.

Na seção anterior identificou-se o fator de transmissão de carga como um indicador global do desempenho da medida de mitigação, por isso se inicia a presente exposição exatamente pela análise da influência do amortecimento nesse parâmetro, cuja evolução em relação à frequência se ilustra na Figura 4.38a. Como se pode verificar, a influência do amortecimento é especialmente notória na faixa de frequências em torno da frequência natural do sistema de isolamento, sendo diminuta a relevância desse parâmetro para frequências de excitação fora dessa faixa. Apesar da afirmação anterior, a inspeção da Figura 4.38b permite constatar que o aumento do amortecimento tem como efeito contraproducente uma pequena perda de eficiência de mitigação na faixa de frequências mais elevada. Contudo, essa perda de eficiência é acompanhada por uma redução muito significativa da amplificação dinâmica ocorrente na faixa de frequências em torno da frequência natural do sistema. Como já constatado pela autora do presente trabalho [44], [88], [93], [175], os efeitos da amplificação em torno da frequência natural do sistema de isolamento podem condicionar a eficiência global da medida de mitigação quando o objetivo da sua implementação se centra na mitigação de vibrações no interior de edifícios. Nesse caso, a utilização de mantas resilientes compostas por materiais de elevado amortecimento pode contornar, pelo menos em parte, aqueles efeitos negativos.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-170_719_1746_121_158.jpg)
Figura 4.38: Transmissão de carga da via ao túnel para diferentes valores de amortecimento da manta resiliente: a) curvas do fator de transferência de carga; b) curvas de IL do fator de transferência de carga.

Considerando os resultados expostos na Figura 4.39, a resposta dinâmica observada nos diferentes pontos de observação segue uma tendência previsível, caracterizada pela diminuição da amplitude de deslocamento na faixa de frequências próximas da frequência natural do sistema de isolamento com o aumento do amortecimento deste. Esse efeito encontra-se bem patente na Figura 4.39a, onde se ilustra o deslocamento vertical do trilho na seção de referência. Outro aspecto interessante está relacionado com a percepção da ocorrência de efeitos ressonantes associados a modos de ordem superior quando o amortecimento da manta é reduzido. De fato, tais efeitos estão relacionados com modos de flexão da laje da via, os quais não poderiam ser observados na razão de transferência de carga (Figura 4.38), dado que o caráter global do indicador suprime esses efeitos locais. Contudo, os efeitos ressonantes devidos à flexão longitudinal da via deixam de se fazer sentir quando o ponto de observação se encontra no invert do túnel, como se pode observar na Figura 4.39b.

Quanto à resposta dinâmica em pontos de observação localizados no maciço geotécnico, a tendência observada se aproxima da verificada para o fator de transferência de carga, verificando-se que o efeito de alteração do amortecimento da manta apenas se faz sentir na faixa de frequências em torno da frequência natural do sistema de isolamento e observando-se um aumento da amplificação dinâmica nessa faixa em correspondência com a diminuição do amortecimento. A título ilustrativo desse efeito, são apresentadas na Figura 4.40 as curvas de deslocamento versus frequência para os pontos de observação A e F (ambos pertencentes à superfície do terreno - ver Figura 4.1).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-171_597_1752_121_157.jpg)
Figura 4.39: Deslocamento da via para diferentes valores do amortecimento da manta: a) trilho; b) ponto central do invert.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-171_586_1750_897_154.jpg)
Figura 4.40: Deslocamento de dois pontos à superfície do terreno para diferentes valores do amortecimento da manta: a) ponto A; b) ponto F.

### 4.10.4 Breve nota sobre a influência da massa da laje

Do exposto nas seções anteriores, fica bem evidente que a eficiência da solução de laje flutuante como forma de mitigação de vibrações é controlada pela frequência natural induzida pela introdução do material resiliente sob a laje de concreto. Desse modo, a mesma frequência natural (e por conseguinte, a mesma frequência de corte) pode ser alcançada por duas vias: i) manipulando a rigidez do elemento resiliente; ii) manipulando a massa dos elementos sobrejacentes à manta resiliente. Se do ponto de vista meramente conceitual, a mesma eficiência pode ser alcançada por qualquer uma das vias descritas, o mesmo não é válido, ou pelo menos dificilmente alcançável, em um problema concreto de engenharia.

Como se viu anteriormente, a eficiência da solução de mitigação é tanto maior quanto menor for a frequência de corte. Contudo, frequências de corte reduzidas com elementos resilientes de elevada rigidez apenas podem ser alcançadas através de um aumento proporcional da massa da laje da via férrea. Ora, uma duplicação da massa da via férrea implica uma duplicação da altura da laje, o que não é compatível com os
requisitos técnicos e econômicos associados à generalidade dos projetos. Uma breve referência deverá ser feita aos sistemas de isolamento através da inclusão de molas metálicas sob a laje de concreto, como aliás ilustrado na Figura 4.32b, onde é possível a instalação de soluções flutuantes de elevado valor de massa.

Embora não seja apresentada uma análise detalhada sobre a influência da massa da laje, a consequência da alteração da massa da laje segue uma tendência inversa à da alteração da rigidez da manta resiliente, ou seja, um aumento da massa da laje resulta em uma diminuição das frequências natural e de corte do sistema flutuante. Cabe ainda mencionar que o aumento de massa do elemento estrutural (laje) implica um aumento da sua rigidez de flexão, o que permitirá alcançar também um efeito benéfico resultante de uma melhor distribuição da carga transmitida pela laje à soleira do túnel.

### 4.10.5 Breve nota sobre a influência das propriedades das palmilhas

As palmilhas intercaladas entre o trilho e seu suporte têm a função de atenuar a ação imposta pelo trilho aos elementos estruturais subjacentes, tais como a laje de concreto ou os dormentes.

Dado o fato de a massa do trilho ser bastante reduzida, a influência das propriedades da palmilha no comportamento dinâmico do sistema, apenas se faz sentir de forma notória na faixa de frequências afetada pela frequência natural correspondente à ressonância do trilho sobre as palmilhas. Ora, como ilustrado por Alves Costa (2011), exceto pelas diferenças da resposta quase estática (maior ou menor flexibilidade do trilho), a influência das propriedades do trilho apenas se faz sentir na faixa de frequências superior a 150 Hz, limite esse fornecido por sistemas com palmilhas muito flexíveis. Com efeito, na generalidade dos casos, a frequência ressonante do trilho sobre as palmilhas verifica-se acima dos 200 Hz, ou seja fora do âmbito do problema em análise.

Apesar da reflexão anterior, cabe mencionar a elevada relevância evidenciada pelas propriedades mecânicas das palmilhas na minimização de vários efeitos perniciosos, tais como a corrugação do trilho ou a geração de ruído de contato roda-trilho [108]. Contudo, dado que o foco da presente tese se centra na faixa de frequências até 80 Hz, as propriedades da palmilha não se revelam condicionantes, principalmente quando a atenção é focalizada na análise das vibrações percebidas no maciço envolvente ao túnel. Por esse motivo não é realizado aqui um estudo detalhado sobre a temática, remetendo-se o leitor aos trabalhos recentes de Koroma (2013); Koroma et al. (2014),

Thompson (2010) e Alves Costa (2011), onde estudos detalhados sobre a temática são apresentados.

### 4.11 Conclusões

Com o objetivo de destacar as potencialidades da abordagem proposta no capítulo anterior, apresentou-se um estudo paramétrico, onde se avaliou a influência de diversos parâmetros relacionados com o túnel, com a via férrea e com o maciço geotécnico, nas vibrações induzidas no sistema (via-)túnel-maciço.

O estudo paramétrico realizado compreendeu a interação dinâmica entre um túnel e o meio semi-infinito onde este está integrado, tendo sido investigada a influência de seis variáveis (profundidade do túnel, espessura do revestimento do túnel, geometria do túnel, invert do túnel, rigidez do solo e amortecimento material do solo) nos deslocamentos verticais induzidos, devido à aplicação de uma carga vertical harmônica, não móvel, no interior do túnel. Além disso, apresentou-se ainda um estudo autônomo dedicado à análise da influência das propriedades de sistemas de via férrea em laje.

A complexidade fenomenológica inerente ao problema estudado obrigou a um estudo sistemático, onde a influência de cada variável foi avaliada de forma isolada. Resultam do presente estudo as conclusões que a seguir se sintetizam:

i) A interação dinâmica túnel-maciço é um problema complexo que exige modelagem criteriosa. As funções de transferência do sistema túnel-maciço são substancialmente distintas das obtidas para um meio semi-infinito, o que inviabiliza a possibilidade de recurso a um modelo simplificado onde a presença do túnel não seja atendida;
ii) Verifica-se, em termos gerais, uma diminuição dos níveis de vibração vertical à superfície do terreno com o aumento da profundidade do túnel. Contudo, a variação da profundidade do túnel resulta em uma alteração das frequências para as quais ocorrem os picos invertidos resultantes da interferência entre os diferentes tipos de ondas intervenientes no problema. A influência da profundidade do túnel na resposta à superfície do terreno é mais evidente nos pontos sobrejacentes ao túnel, sendo menos notória nos pontos mais afastados, tanto mais que a distância fonte-receptor é, para pontos distantes na direção transversal, apenas ligeiramente afetada pela profundidade do túnel;
Considerando os cenários estudados, verificou-se que a profundidade do túnel tem pouca influência na resposta dinâmica do mesmo, bem como na resposta de pontos localizados no interior do maciço e na mesma elevação do eixo do túnel;

iii) O aumento da espessura do revestimento do túnel circular conduz a uma diminuição da resposta dinâmica do mesmo, resultado do aumento de rigidez do sistema. Relativamente à resposta em pontos localizados à superfície do terreno, o aumento da espessura do revestimento implica uma diminuição da resposta, embora essa diminuição seja evidente apenas para distâncias (relativamente ao plano de simetria do túnel) superiores a cerca de 1,5 vezes o diâmetro do túnel;
iv) A presença do invert do túnel leva a que uma maior porcentagem da energia seja conduzida no sentido descendente. Assim, a consideração do invert implica uma diminuição apreciável da resposta dinâmica observada à superfície do terreno, principalmente na faixa de frequências mais elevada. Note-se que na faixa de frequências mais baixa, os comprimentos de onda gerados são muito maiores do que a dimensão quer do invert quer do próprio túnel, sendo portanto a resposta sobretudo influenciada pelas características dinâmicas do maciço envolvente;
v) A geometria do túnel é um parâmetro influente na resposta, sobretudo, para pontos de observação localizados nas proximidades do túnel e na faixa de frequências mais elevada (no caso de pontos localizados à superfície do terreno). Com efeito, a geometria do túnel condiciona a forma como a energia é transmitida ao terreno, podendo ou não propiciar uma maior canalização da energia no sentido descendente.
vi) Relativamente à rigidez do maciço geotécnico, o seu impacto na resposta dinâmica do sistema é por demais evidente. Com efeito, em termos globais, assiste-se, para pontos localizados à superfície do maciço, a uma diminuição da resposta dinâmica com o aumento da rigidez do maciço. Este efeito tende a diminuir, ainda que parcialmente, para a faixa de frequências mais elevada, com o aumento da distância fonte-receptor. Na verdade, se por um lado a diminuição de rigidez do maciço conduz a um aumento dos deslocamentos verticais, o fato de se gerarem ondas com menor comprimento de onda propicia uma maior dissipação energética dada a presença do amortecimento material. A conjugação desses dois efeitos resulta em uma possível inversão da tendência geral enunciada;
vii) Quanto ao amortecimento material do solo, verifica-se, como seria esperado, uma diminuição da amplitude da resposta com o aumento do amortecimento. Esse efeito é tanto mais notório quanto maior for a distância fonte-receptor e quanto mais elevada for a frequência de excitação. O amortecimento material

do solo não resulta em diferenças apreciáveis na resposta dinâmica observada em pontos pertencentes ao túnel;
viii) No que se refere às características da via férrea, conclui-se que a adoção de um sistema de laje flutuante permite uma atenuação notória das vibrações associadas a frequências superiores à frequência de corte do sistema. Essa atenuação é acompanhada por um aumento dos níveis de vibração na faixa de frequências em torno da frequência natural do sistema flutuante. Como esperado, os maiores níveis de eficiência na redução de vibrações são alcançados para sistemas com frequências naturais baixas, os quais exigem a introdução de mantas resilientes de baixa rigidez. Relativamente ao amortecimento dos elementos resilientes, constata-se que é um parâmetro influente na resposta dinâmica para frequências próximas da frequência natural do sistema.

O estudo que agora termina foi crucial para compreender melhor o complexo comportamento dinâmico do sistema via-túnel-maciço. Essa compreensão foi decisiva para a definição de estudos mais abrangentes como os apresentados no Capítulo 6.

## 5 Modelagem da interação veículo-via e maciço-edificação

### 5.1 Considerações gerais

Como já mencionado, a sustentabilidade ambiental das infraestruturas ferroviárias em áreas urbanas impõe restrições específicas às vibrações geradas pelo tráfego ferroviário em túneis. Minimizar os incômodos e outros efeitos sobre os habitantes das edificações constitui um desafio para a comunidade científica e técnica. Nos últimos anos, esforços consideráveis foram dedicados a esse objetivo, resultando em diversos estudos e modelos de previsão das vibrações induzidas por infraestruturas ferroviárias. Várias publicações discutem as técnicas de modelagem numérica do problema; como exemplos, citam-se os trabalhos a seguir, que apresentam uma revisão das técnicas mais atuais [34], [35], [48], [63], [86].

A problemática da geração e propagação de vibrações devido ao tráfego em túneis, esquematicamente ilustrada na Figura 5.1, é complexa. A complexidade do problema é, em parte, atribuível ao vasto campo de análise envolvido, que compreende não só a geração de vibrações no interior do túnel, como também a sua propagação pelo maciço e interação com os edifícios existentes nas proximidades. No entanto, outros fatores contribuem igualmente para essa complexidade: a circulação do trem no interior do túnel (fonte de vibração) implica a interação dinâmica entre o veículo e a via (problema tridimensional). A energia transmitida pelo trem à via é, sequencialmente, transmitida ao túnel e ao maciço circundante (problema de interação dinâmica entre a via, o túnel e o maciço, já abordado em capítulos precedentes), dando origem à propagação de ondas no interior desse mesmo maciço, sob a forma de ondas de corpo ou ondas de superfície, quando estas alcançam a superfície livre do terreno. Por sua vez, as ondas excitam as edificações existentes nas imediações, propagando-se através da estrutura e dando origem a vibrações, sendo a vibração das lajes de pavimento facilmente percebida pelos ocupantes. Tem-se, assim, um outro problema de interação dinâmica, agora entre o solo e a estrutura (edifício). A resposta do edifício ocorre, em geral, sob a forma de vibrações, na faixa de frequências 1-80 Hz, ou sob a forma de ruído estrutural, em uma faixa de frequências mais ampla, em geral entre os 16 Hz e os 250 Hz [6].

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-178_847_1227_120_419.jpg)
Figura 5.1: Problemática da geração e propagação de vibrações devido ao tráfego em túneis, desde a fonte até o receptor (edifício) (adaptado de [24]).

Diante do exposto, o principal desafio consiste em simular numericamente o problema de forma simples e eficiente, sem simplificações excessivas e considerando seus principais fatores determinantes. Busca-se, assim, desenvolver ferramentas que permitam prever, evitar e/ou mitigar os efeitos prejudiciais mencionados anteriormente.

Um modelo completo e geral para a simulação das vibrações induzidas por tráfego ferroviário deve contemplar as três vertentes do problema acima mencionadas, a saber: a fonte de vibração e os mecanismos de excitação que lhe estão associados, a propagação das vibrações geradas através do meio envolvente, desde a fonte até o receptor, e a resposta dinâmica da estrutura (edifício/receptor), atendendo ao papel que a própria estrutura desempenha nos níveis de vibração percebidos no interior do edifício.

No Capítulo 3 abordou-se a modelagem da resposta dinâmica do sistema via--túnel-maciço. Foi apresentado um modelo que considera a interação dinâmica entre a via férrea, o túnel e o maciço de fundação. Cabe agora tratar do desenvolvimento/ adaptação e da implementação de modelos que contemplem a interação dinâmica entre o material rodante e a via férrea e entre o maciço de fundação e a edificação.

De fato, um modelo abrangente para a previsão das vibrações induzidas por tráfego ferroviário em túneis não pode estar limitado à simulação da propagação. Na verdade, a fonte (trem) e o receptor (edifício) são componentes fundamentais que não podem ser negligenciados. Em relação à fonte, um dos mecanismos mais importantes de geração de vibrações decorre das irregularidades da via, que induzem forças de inércia no material rodante, dando origem a um problema de interação dinâmica entre
o trem e a via. No presente trabalho, a solução do problema de interação veículo-via é alcançada através de uma formulação que contempla a compatibilidade dos deslocamentos e o equilíbrio de forças nos pontos de contato entre os dois domínios. O material rodante é simulado por um modelo bidimensional de corpos rígidos, e as irregularidades geométricas da via são consideradas a fonte de interação dinâmica.

Contrariamente à grande maioria dos estudos acerca de vibrações induzidas por tráfego em túneis, no estudo aqui apresentado, o receptor, ou seja, um edifício situado nas imediações do túnel e que está acoplado ao terreno natural, é também considerado na estratégia de modelagem. De fato, o número de estudos relativos a vibrações induzidas por tráfego que consideram a presença da edificação é restrito, apesar do reconhecimento da importância de sua consideração. Desse modo, a contribuição deste capítulo consiste no desenvolvimento de uma metodologia relativamente simples que permita levar em consideração a abrangência global do problema de uma forma integrada através de técnicas de subestruturação [88], [93]. Embora o modelo de interação solo-estrutura proposto apenas contemple edificações com fundações superficiais, o modelo pode ser facilmente generalizado para casos de fundações profundas, ainda que com algum grau de simplificação, como proposto por Hussein et al. (2013, 2015).

Este capítulo tem, portanto, como objetivo apresentar uma estratégia numérica que permita simular o problema de forma suficientemente simples e eficiente, considerando seus principais fatores determinantes. A proposta constitui um modelo global e versátil, capaz de atender adequadamente a situações práticas.

Quanto à organização deste capítulo, inicia-se com a exposição da estratégia utilizada para a modelagem numérica do problema das vibrações induzidas pelo tráfego ferroviário em túneis, desde a fonte até o receptor. A seguir apresenta-se uma descrição de cada uma das partes do modelo, com exceção do meio de propagação (já descrito em capítulos anteriores), abordando os principais pressupostos e particularidades dos modelos adotados para cada um dos meios, bem como a sua formulação.

Após a apresentação dos vários módulos e do modo de articulação entre eles, é apresentado um exemplo de aplicação visando ilustrar de forma preliminar as potencialidades do modelo. O exemplo em causa resulta de uma publicação prévia da autora no ISEV2013 - International Symposium on Environmental Vibrations [43], agraciada com a distinção "Best Paper Award".

O capítulo termina com um resumo das principais conclusões do estudo desenvolvido, abrindo perspectivas aos capítulos subsequentes nos quais serão apresentados estudos de aplicação intensiva da ferramenta numérica agora proposta.

### 5.2 Estratégia de modelagem: modelo global subestruturado

O modelo numérico que agora se apresenta é modular, baseando-se em uma estratégia de subestruturação, ou seja, separando as várias partes do problema global. Essa formulação permite atingir elevados níveis de eficiência computacional e é sobretudo vantajosa para a realização de estudos paramétricos, uma vez que, em certos casos, permite que apenas partes do problema precisem ser reanalisadas, evitando a repetição de alguns passos intermediários de computação.

O fluxograma representado na Figura 5.2 mostra as principais partes do modelo numérico, ilustrando esquematicamente o modo de articulação entre os vários módulos, bem como as principais etapas envolvidas na solução. A estratégia de modelagem contempla três partes distintas (o trem/veículo, o sistema via-túnel-maciço e o edifício), correspondendo a cada uma delas uma técnica de simulação diferente, atendendo às especificidades do domínio em causa. Os três subsistemas são acoplados através de uma formulação de compatibilidade, a qual conduz à solução para o problema.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-180_961_1228_1474_420.jpg)
Figura 5.2: Fluxograma representativo da interação entre os vários módulos do modelo de cálculo proposto.

Nas seções seguintes é descrita cada uma das partes do modelo (com exceção do sistema via-túnel-maciço).

### 5.3 Interação trem-via

### 5.3.1 Mecanismos de excitação

O conhecimento e a compreensão dos mecanismos associados à geração de vibrações devido ao tráfego ferroviário constituem a base essencial para uma análise mecanicista dos problemas em estudo e são determinantes para a previsão das vibrações transmitidas através do maciço de fundação e para a avaliação dos efeitos nos edifícios situados nas proximidades da infraestrutura.

Cabe mencionar que apenas as ações induzidas pelo material rodante são objeto de estudo na presente tese, não sendo tratadas ações de qualquer outra origem. As ações induzidas pelo material rodante traduzem-se por forças verticais, longitudinais e transversais que, devido ao seu caráter dinâmico, constituem os mecanismos de excitação da via [6]. Apesar do caráter geral das forças resultantes da circulação ferroviária, apenas as forças verticais são aqui contempladas, dado que são as mais relevantes nos casos de circulação em plena via com alinhamento reto.

A geração de vibrações no sistema via-túnel-maciço pode ser devida a diferentes mecanismos, os quais, no contexto da análise de vibrações induzidas por tráfego, são geralmente divididos entre mecanismos de excitação quase estática e de excitação dinâmica [33].

A excitação quase estática deve-se ao movimento das cargas correspondentes ao peso próprio do trem por eixo. Este tipo de excitação apresenta magnitude constante ao longo do tempo e o caráter dinâmico da resposta é apenas devido ao caráter móvel da solicitação, o qual induz uma variação temporal dos campos de tensão e deformação experimentados em um ponto fixo do domínio [34], [63]. Contudo, dado que os campos de deformação acompanham o movimento das cargas, o deslocamento vertical das massas do veículo é constante, ou seja, não se geram forças de inércia no mesmo. O efeito da solicitação quase estática é evidente nas proximidades da zona de aplicação da ação, contribuindo esta excitação significativamente para a resposta na faixa das frequências relativamente baixas, dependendo apenas da velocidade de circulação e da geometria do veículo. Como se compreende, a ação quase estática é um dado do problema, sendo as forças de interação veículo-via previamente conhecidas.

Em contraponto com a excitação quase estática, a excitação dinâmica resulta da geração de forças de inércia no veículo, constituindo-se assim um problema de interação veículo-via. Este mecanismo de excitação pode ter diferentes causas, sendo as mais habitualmente apontadas como geradoras de forças de interação: i) as irregularidades geométricas da via e das rodas do material rodante; ii) as descontinuidades
da via e das próprias rodas do trem; iii) as variações de rigidez da via ao longo da direção longitudinal.

As irregularidades aleatórias da superfície de contato da roda com o trilho causam uma excitação forçada do sistema veículo-via e são talvez a mais significativa fonte de vibração em redes metropolitanas [36]. As irregularidades geométricas dos trilhos e das rodas podem dar origem a uma ampla faixa de frequências de excitação, dependendo dos comprimentos de onda presentes no perfil de irregularidades. Tipicamente, nas irregularidades geométricas verticais dos trilhos, maiores amplitudes correspondem a maiores comprimentos de onda. A amplitude tende a diminuir com a diminuição do comprimento de onda [168].

A medição e caracterização das irregularidades das rodas e dos trilhos têm sido objeto de vários estudos, tais como os realizados por Dings \& Dittrich (1996), Cordier \& Fodiman (2000), Diehl \& Holm (2006), Verheijen (2006). Esses estudos pretendem uniformizar os procedimentos de medição das irregularidades. Os dados obtidos por esses procedimentos permitem caracterizar as irregularidades e podem ser utilizados como dados de entrada nos modelos de previsão de vibrações e ruído induzidos por tráfego ferroviário. A esse respeito, deve-se mencionar o trabalho muito recente efetuado no âmbito do projeto RIVAS [183], o qual visou, entre outros aspectos, a uniformização dos procedimentos mencionados.

Os fatores associados às descontinuidades da via e das rodas são muitas vezes designados por excitação de impacto e devem-se, por exemplo, à existência de aparelhos de mudança de via, às mudanças de direção, a cruzamentos e, também, a defeitos adicionais das rodas e dos trilhos, tais como juntas dos trilhos ou achatamentos nas rodas. Estas descontinuidades ou deficiências podem originar forças significativas na via-férrea e no trem, causando também desconforto aos passageiros, embora tenham um caráter muito mais discreto ao longo da infraestrutura ferroviária do que as irregularidades aleatórias acima mencionadas.

Em sistemas periódicos, como é o caso de vias férreas em que o suporte do trilho tem caráter discreto, a rigidez da via varia com a posição que a roda do veículo ocupa, causando deste modo excitação dinâmica do veículo e da via. Este mecanismo é conhecido como excitação paramétrica, e deve-se à diferença de deformabilidade da via conforme esta é solicitada sobre os apoios do trilho ou entre estes, dando assim origem a uma excitação harmônica dependente da distância entre apoios de trilho, daí ser designada como paramétrica, pois depende de um parâmetro geométrico da via. Em geral esta excitação não apresenta uma relevância significativa [49], [63].

Contudo, estudos numéricos, desenvolvidos por Gupta et al. [57] em torno de sistemas de laje flutuante descontínua, mostram que a descontinuidade paramétrica da via decorrente do sistema modular pode conduzir a alterações no mecanismo de interação veículo-via em comparação com o associado à laje contínua, na qual não ocorrem efeitos paramétricos. Os mesmos autores referem ainda que essas alterações são muito dependentes das propriedades do próprio veículo e que, em geral, apenas se fazem sentir notavelmente para frequências inferiores a 10 Hz.

O conteúdo em frequência e a magnitude das forças de interação dinâmica veículo--via são claramente dependentes da velocidade de circulação e das características dinâmicas do veículo e da infraestrutura ferroviária. É ainda de referir que, embora a componente quase estática da ação exercida pelo trem seja, em geral, de magnitude bastante superior à componente dinâmica, a contribuição desta última para a geração de vibrações que se propagam pelo maciço de fundação é muito relevante, sobrepondo-se à primeira. Recorde-se que a excitação quase estática só dá origem à propagação propriamente dita de ondas caso a velocidade de circulação do veículo seja superior à velocidade de propagação de ondas de cisalhamento no maciço onde se encontra embebido o túnel (situação supersônica ou supersísmica). Esse cenário, interessante do ponto de vista conceitual, foi evidenciado por diversos autores [130], [184] mas não tem reflexo prático dado o fato de a velocidade de circulação ser, em geral, substancialmente inferior à velocidade de propagação de ondas S no maciço circundante ao túnel.

Atendendo a que as irregularidades geométricas da via são apontadas como um dos principais fatores para o desenvolvimento das forças de interação, considere-se a representação esquemática ilustrada na Figura 5.3. O material rodante, à medida que se desloca em uma via geometricamente imperfeita, experimenta um deslocamento vertical que varia no tempo. Admitindo que o perfil de irregularidades da via tem uma configuração harmônica, com um comprimento de onda L, e que o veículo circula a uma velocidade constante c, a excitação das massas do veículo, caracterizada pela frequência $\mathrm{f}=\mathrm{c} / \mathrm{L}$, é uma excitação forçada com caráter estacionário, caso se admita que o sistema é invariante. Claro é que a amplitude e fase das forças de inércia geradas no veículo dependem das propriedades dinâmicas do mesmo e da via férrea, uma vez que os dois sistemas se encontram acoplados. Uma analogia semelhante pode ser aplicada ao caso das imperfeições geométricas das rodas do veículo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-184_480_697_118_684.jpg)
Figura 5.3: Representação esquemática de um veículo deslocando-se em uma via com uma imperfeição geométrica harmônica.

Tendo presente o fato de as maiores amplitudes de irregularidade estarem associadas aos maiores comprimentos de onda, conclui-se que para uma frequência de excitação fixa ocorre um aumento da força de interação veículo-via em função da velocidade de circulação. Como se verá a seguir, as propriedades dinâmicas do veículo têm um papel preponderante na magnitude das referidas forças.

### 5.3.2 Modelagem da interação dinâmica veículo-via

### 5.3.2.1 Aspectos conceituais

Para calcular as forças de interação dinâmica, é muito importante - pode-se mesmo afirmar que é imperativo - considerar a interação dinâmica entre o veículo e a via férrea [34], [41], [79]. Refira-se que, em contraposição, para o cálculo das forças de interação no caso de tráfego rodoviário, o reflexo da rigidez do suporte (estrada nesse caso) nas forças de interação é desprezável devido à elevada rigidez do mesmo quando comparada com a rigidez do pneu e do sistema de suspensão do veículo [185], [186].

Uma pesquisa bibliográfica abrangente acerca das metodologias propostas para o estudo da interação veículo-via férrea, com ênfase para o cenário de tráfego na superfície, pode ser consultada em diversas referências bibliográficas [33], [38], [45], [46], [47], [48], [49]. O problema da interação dinâmica veículo-via requer o conhecimento das propriedades dinâmicas do veículo, da infraestrutura ferroviária e das condições de contato entre a roda e o trilho.

O estado da arte quanto à modelagem de vibrações induzidas por tráfego ferroviário em túneis assume que o invert do túnel e o solo circundante são relativamente rígidos em comparação com a via férrea, o que possibilita uma abordagem subestruturada em que a contribuição do meio subjacente à via para a flexibilidade dinâmica da própria via não é considerada. Nesse caso as forças de interação dinâmica veículo-via são determinadas a partir de um modelo de via desacoplado e subsequentemente aplicadas em um modelo do sistema via-túnel-maciço para a geração dos campos de
vibração que se propagam pelo maciço. Neste enquadramento, a resposta dinâmica do sistema veículo-via pode ser avaliada através de diferentes metodologias numéricas, quer de vertente analítica quer de vertente numérica. Diferentes tipos de via, como por exemplo, via com lastro, via em laje ou soluções de laje flutuante podem ser considerados para o cálculo da resposta dinâmica da via. Porém, no presente trabalho não se entendeu ser necessário introduzir tal nível de simplificação, razão pela qual o sistema via-túnel-maciço é considerado de forma integrada, como aliás já apresentado nos capítulos precedentes da presente tese.

Quanto à modelagem do veículo, diversas técnicas têm sido propostas, que vão desde modelos 3D complexos [58], [59], [60] com vários graus de liberdade, principalmente utilizados para o estudo de questões relacionadas com a segurança da circulação, a resposta em curva ou a análise do conforto dos passageiros, até modelos simples bidimensionais baseados em corpos rígidos acoplados por sistemas de molas e amortecedores, como proposto por Zhai \& Cai (1997), entre outros, o qual aliás se ilustra na Figura 5.4. Para os objetivos do presente estudo, é amplamente aceito que os modelos relativamente simples são capazes de reproduzir os principais aspectos que afetam o mecanismo de interação veículo-via, como previamente discutido por outros autores [34], [41], [48].

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-185_615_1225_1506_423.jpg)
Figura 5.4: Modelo de veículo plano (2D) proposto por Zhai \& Cai (1997) e adotado no presente estudo.

Tal como esquematicamente ilustrado na Figura 5.4, o sistema estrutural do veículo é frequentemente dividido em três partes: i) a massa não suspensa (rodas e eixos); ii) a massa semissuspensa (bogies); iii) a massa suspensa (caixa do veículo). A ligação entre as massas é garantida pelas suspensões. Como é sabido, nos trens de passageiros, os requisitos de conforto são muito elevados. Essa exigência faz com que os sistemas de suspensão do veículo isolem as massas suspensas (caixas) e as massas semissuspensas (bogies) para frequências superiores a poucos Hertz. Atendendo a esse fato,
vários pesquisadores sugerem o uso de modelos simplificados do veículo, em que somente as massas não suspensas, e por vezes também as massas semissuspensas, são simuladas [34], [41], [48], [128]. Lombaert et al. (2006); Lombaert \& Degrande (2009) sugere que, para o estudo da geração de vibrações pelo tráfego ferroviário, a modelagem do trem seja simplificada, considerando apenas as massas não suspensas. A mesma estratégia de modelagem do trem é também seguida por Gupta et al. (2009); Gupta et al. (2010) no estudo de vibrações induzidas por tráfego ferroviário em túneis. Estudos realizados no grupo de pesquisa em que a autora se insere sugerem que a modelagem do veículo contemple também as massas semissuspensas, dado o fato de a suspensão primária permitir algum amortecimento em torno da frequência de ressonância associada ao movimento dos eixos sobre a via [41]. Sem invalidar essa afirmação, um muito recente estudo realizado por Aires et al. [37], no qual foram realizadas algumas centenas de simulações, permite constatar que de fato o aspecto do veículo mais relevante para a problemática de geração de vibrações é a massa não suspensa.

Relativamente às condições de contato entre o veículo e a via, diferentes tipos podem ser assumidos. Para a previsão de vibrações que se propagam pelo maciço, o modelo de contato linear é largamente utilizado, assumindo-se um contato perfeito entre o veículo e a via, ou seja, não há separação entre a roda e o trilho. Condições de contato complexas que implicam efeitos não lineares, como a separação entre a roda e o trilho, devem ser consideradas em casos severos de corrugação dos trilhos, perante imperfeições graves da superfície de rolamento dos trilhos, em casos de muito brusca variação de rigidez do suporte do trilho na direção longitudinal, nas chamadas zonas de transição, e/ou nos casos em que ocorram variações importantes das cargas dinâmicas.

O modelo de interação veículo-via adotado no presente trabalho, que será sucintamente apresentado a seguir, foi desenvolvido e implementado na plataforma MatLab por Alves Costa (2011), e tem sido utilizado em diversos estudos referentes à problemática de vibrações induzidas por tráfego. O referido modelo funciona como um módulo de cálculo que é conjugado com os outros módulos do modelo de cálculo proposto, conforme esquematicamente ilustrado na Figura 5.2, tendo como finalidade apenas a determinação das forças de interação dinâmica veículo-via.

Atentando na Figura 5.2, apresenta-se uma descrição sucinta do modo de articulação entre o modelo de interação veículo-via e o restante meio:

- O módulo referente à modelagem do sistema via-túnel-maciço é utilizado para obter a resposta dinâmica da via férrea, aqui designada por receptância da via para uma ação vertical móvel. Do ponto de vista numérico a receptância da via não é mais do que a flexibilidade dinâmica da mesma, cujo cálculo é efetuado considerando a aplicação de uma carga senoidal (móvel ou não) com amplitude unitária na cabeça do trilho e registrando-se os valores da amplitude dos deslocamentos obtidos no trilho.
- A informação relativa à receptância da via é então utilizada no modelo de interação veículo-via, que atende aos mecanismos de excitação, determinando--se deste modo as forças de interação dinâmica entre os dois meios, ou seja, entre o material rodante e a via. Tratando-se de um modelo numérico formulado com base em conceitos de subestruturação, determinadas as forças de interação veículo-via(-túnel-maciço) os dois meios estruturais podem ser totalmente desacoplados e analisados individualmente.
- As forças de interação dinâmica veículo-via são posteriormente utilizadas no modelo do sistema via-túnel-maciço para gerar os campos de vibração que são percebidos em qualquer ponto do meio, bem como nos edifícios presentes nas imediações da via férrea.

Como já mencionado, o funcionamento modular do algoritmo é extremamente vantajoso para os estudos de sensibilidade, pois permite reanalisar apenas partes do problema, sem repetir a análise do problema completo.

Centrando agora a atenção no modelo adotado, cabe referir que tanto o modelo estrutural do veículo, como o modelo que reflete a sua interação com a via férrea, apresentam um conjunto de simplificações que a seguir se enumeram:

- Cabe esclarecer que se assume um problema linear, sem considerar perdas de contato entre a roda e o trilho ou elementos com comportamento não linear. A introdução desta simplificação resulta na possibilidade de resolver o problema no domínio da frequência. Refira-se, contudo, a existência de modelos de interação que permitem a inclusão de comportamento não linear quer do veículo (em particular nas suspensões), quer das condições de contato veículo-via [38], [45], [188]. No entanto, a elevada exigência computacional associada à resolução do problema de interação dinâmica no domínio do tempo remete a utilização desse tipo de modelos apenas para casos específicos em que a consideração de não linearidade seja imperativa.

- Apenas é considerada a interação na direção vertical, sendo negligenciados quaisquer efeitos na direção longitudinal ou transversal, bem como os efeitos associados à rotação do veículo em torno do eixo longitudinal;
- É considerado um modelo 2D para o veículo, constituído por corpos rígidos ligados através de conjuntos mola-amortecedor (suspensões), em coerência com a representação esquemática ilustrada na Figura 5.4.
- A fonte de excitação é devida às irregularidades aleatórias da via férrea, cujo perfil pode ser descrito através da decomposição em um conjunto de funções senoidais;

Na seção seguinte é apresentada de forma sucinta a formulação matemática inerente ao problema de interação veículo-via. A formulação apresentada tem caráter geral e pode ser diretamente aplicada a um modelo estrutural do veículo mais complexo do que o agora considerado.

### 5.3.2.2 Formulação matemática generalizada

Avançando para a formulação matemática do problema da interação dinâmica veículo-via, considere-se a ação exercida pela passagem do material rodante, que resulta da sobreposição de dois mecanismos de excitação: i) a excitação quase estática, associada ao peso do trem por eixo; ii) a excitação dinâmica, devido à ocorrência de interação dinâmica entre o veículo e a via. Como é evidente, a consideração do mecanismo quase estático é simples, pois não ocorre nenhum fenômeno de interação dinâmica entre o material rodante e a via férrea. Mais precisamente, a força de interação é previamente conhecida e corresponde à ação gravitacional. Porém, como anteriormente discutido, a mesma conclusão não pode ser generalizada para o caso da excitação dinâmica. Nesse caso, a solução do problema de interação veículo-via é, neste estudo, alcançada através de uma formulação de compatibilidade, respeitando as condições de compatibilidade de deslocamentos e equilíbrio de forças nos pontos de contato entre os dois domínios.

O mecanismo de interação dinâmica roda-trilho pode, conforme já abordado, ser atribuído a diversos fatores, sendo os mais relevantes os que envolvem as irregularidades geométricas da via férrea na direção vertical (defeitos de nivelamento longitudinal) e as imperfeições das próprias rodas do veículo. Este último aspecto pode ser considerado de um modo em tudo semelhante ao adotado para as irregularidades da via, bastando para isso substituir as imperfeições da roda por imperfeições geométricas equivalentes da superfície de rolamento do trilho [189], [190], [191].

Atendendo ao exposto considere-se um exemplo simples de uma via férrea que apresenta uma imperfeição geométrica descrita por $\Delta \mathrm{u}(\mathrm{x})$, tal como se ilustra na Figura 5.5. Admita-se ainda que um veículo percorre à velocidade c toda a extensão da via, com desenvolvimento infinito, ocupando cada um dos seus eixos a posição geométrica $\mathrm{x}=\mathrm{a}_{\mathrm{i}}$ no instante $\mathrm{t}=0 \mathrm{~s}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-189_615_1754_512_157.jpg)
Figura 5.5: Veículo deslocando-se ao longo da via férrea com irregularidade geométrica.

Neste contexto, a compatibilidade de deslocamentos entre o trem e a via tem de ser garantida para qualquer instante temporal e, admitindo a linearidade do sistema, é estabelecida através da seguinte equação para os vários pontos de contato veículo-via:

$$
\begin{equation*}
u_{r, i}=u_{c}\left(x=c t+a_{i}\right)+\Delta u\left(x=c t+a_{i}\right) \tag{5.1}
\end{equation*}
$$

em que $\mathrm{u}_{\mathrm{r}, \mathrm{i}}$ representa o deslocamento vertical do ponto de contato i do veículo; u é o deslocamento vertical da via na mesma localização, ou seja, nesse ponto de contato veículo-via; $\Delta \mathrm{u}$ corresponde à irregularidade geométrica da via identificada pelo ponto de contato i do veículo, no instante temporal t; $\mathrm{a}_{\mathrm{i}}$ é a posição geométrica do ponto de contato i no instante $\mathrm{t}=0 \mathrm{~s}$; c representa a velocidade de circulação do veículo. Note-se que o trem tem vários pontos de contato com a via, tantos quantos o número de eixos do veículo.

A equação [5.1] traduz a condição de compatibilidade em condições de contato perfeito. Contudo o contato roda-trilho é deformável, podendo ser traduzido de forma simplificada através de uma condição de contato hertziano linearizado, tal como proposto por Vale (2010), Thompson (2010) e Esveld (2001), entre outros. Atendendo a este efeito, ocorre um incremento de deformação no contato, passando a condição de compatibilidade a ser dada por:

$$
\begin{equation*}
u_{r, i}=u_{c}\left(x=c t+a_{i}\right)+\Delta u\left(x=c t+a_{i}\right)+\frac{N_{i}(t)}{k_{H}} \tag{5.2}
\end{equation*}
$$

em que $\mathrm{k}_{\mathrm{H}}$ é a rigidez Hertziana de contato e $\mathrm{N}_{\mathrm{i}}$ é a força de interação dinâmica desenvolvida no ponto de contato i do veículo.

Quanto à rigidez de contato, cabe observar que ela é claramente não linear e depende da ação transmitida pela roda ao trilho e da geometria dos dois meios em contato. Nesse caso, tal problema não seria passível de solução no domínio da frequência. Contudo, dado que a ação correspondente ao peso próprio do veículo é substancialmente superior à ação dinâmica, esta rigidez é então avaliada através de uma formulação linearizada. Informação detalhada sobre este aspecto pode ser consultada em Vale (2010).

Independentemente de se considerar a componente de deformação de contato, cabe mencionar que a condição de contato roda-trilho é especialmente relevante em duas situações: quando possa ocorrer perda de contato, caso em que a análise não pode ser efetuada no domínio da frequência; e nos estudos de emissão de ruído, caracterizados por vibração de alta frequência. Como se pode verificar ambas as situações estão fora do âmbito da presente tese, razão pela qual a consideração da equação [5.1] na descrição da condição de compatibilidade em vez da equação [5.2] redunda em diferenças negligenciáveis para efeitos da análise de vibrações.

As condições de compatibilidade de deslocamentos anteriormente apresentadas em um referencial espaço-tempo podem ser escritas apenas em função da variável temporal caso se admita um referencial móvel que acompanha o movimento do veículo. Assim sendo, e admitindo que o perfil de irregularidades pode ser decomposto em um conjunto de senoides de comprimento de onda $\lambda_{i}$, a frequência de excitação do trem associada a cada uma dessas senoides será dada por:

$$
\begin{equation*}
\Omega_{i}=\frac{2 \pi}{\lambda_{i}} c \tag{5.3}
\end{equation*}
$$

Nesse caso, o problema de interação veículo-via pode ser descrito no domínio da frequência, sendo o perfil de irregularidades entendido como a irregularidade percebida pelo ponto de contato do veículo ao longo do seu percurso. Atendendo a uma formulação matricial que contemple os vários pontos de contato veículo-trilho, as forças de interação são avaliadas da seguinte forma:

$$
\begin{equation*}
\{N(\Omega)\}=-\left([F]+\left[F^{H}\right]+[A]\right)^{-1}\{\Delta u(\Omega)\} \tag{5.4}
\end{equation*}
$$

em que $\{N(\Omega)\}$ é o vetor das forças de interação associadas a cada eixo do trem; [F] representa a matriz de receptância do veículo nos pontos de contato com a via, também designada por matriz de flexibilidade condensada do veículo; $\left[\mathrm{F}^{\mathrm{H}}\right]$ é a matriz
de flexibilidade de contato; [A] corresponde à matriz de receptância da via, ou matriz de flexibilidade dinâmica da via; $\{\Delta u(\Omega)\}$ é o vetor de irregularidades em corres-pondência com cada eixo do trem.

Uma vez que a matriz [A] representa a resposta dinâmica da via, os seus termos são determinados através do modelo via-túnel-maciço, possibilitando estabelecer a seguinte relação entre os deslocamentos da via nos pontos de contato e as forças de interação dinâmica:

$$
\begin{equation*}
\left\{u_{c}(x=c t+a, \Omega)\right\}=[A(\Omega)]\{N(\Omega)\} \tag{5.5}
\end{equation*}
$$

em que o vetor $\left\{u_{c}(x=c t+a, \Omega)\right\}$ colige os deslocamentos verticais do trilho, nos pontos de contato roda-trilho, devido às forças de interação trem-via.

Como se compreende, a existência de vários pontos de contato trem-trilho implica a necessidade de atender à contribuição das diferentes forças de interação para o deslocamento de qualquer ponto de contato roda-trilho.

Assim, a matriz [A] é uma matriz cheia, cujos termos são dados por:

$$
\begin{equation*}
A_{\mathrm{ij}}(\Omega)=\frac{1}{2 \pi} \int_{-\infty}^{+\infty} u_{c}^{G}\left(k_{1}, \omega=\Omega-k_{1} c\right) \cdot e^{i\left(a_{i}-a_{j}\right) k_{1}} d k_{1} \tag{5.6}
\end{equation*}
$$

em que $u_{c}^{G}$ é o deslocamento vertical do trilho, no domínio transformado, face a uma ação unitária que se move com a velocidade c e oscila em torno da frequência $\Omega ; \mathrm{k}_{1}$ é o número de onda (imagem de Fourier da coordenada x). Relativamente às variáveis $\mathrm{a}_{\mathrm{i}}$ e $\mathrm{a}_{\mathrm{j}}$, estas correspondem à posição dos eixos i e j do trem para o instante temporal $\mathrm{t}=0 \mathrm{~s}$.

A matriz $\left[\mathrm{F}^{\mathrm{H}}\right]$ considera a deformação de contato roda-trilho e é uma matriz diagonal cujos termos dependem da rigidez de contato por eixo do trem, sendo definidos por $1 / \mathrm{k}_{\mathrm{H}}$.

Da análise da equação [5.4], facilmente se conclui que a contribuição da dinâmica do veículo para o desenvolvimento das forças de interação está apenas associada à matriz [F], a qual é avaliada através da condensação das matrizes de massa e rigidez do veículo aos pontos em contato com a via. Assim sendo, esta matriz estabelece a seguinte relação entre o deslocamento dos pontos de contato e a força de interação:

$$
\begin{equation*}
\left\{u_{r}(\Omega)\right\}=-[F(\Omega)]\{N(\Omega)\} \tag{5.7}
\end{equation*}
$$

em que o vetor $\left\{u_{r}(\Omega)\right\}$ compreende os deslocamentos verticais de todos os eixos do veículo (ou trem).

Como se compreende, esta matriz será tanto mais complexa quanto mais elaborado for o modelo adotado para o veículo/trem. Caso o modelo de trem surja da associação de vários modelos de veículo similares ao ilustrado na Figura 5.4, isto é, sem que
se verifique qualquer ligação estrutural entre veículos, então a matriz [F] é uma matriz em banda. De qualquer modo, note-se que tal não significa que as forças de interação desenvolvidas em um dado eixo de um dado veículo não sejam afetadas pela resposta dinâmica em outro eixo de outro veículo. Com efeito, os vários veículos estão acoplados através do trilho, sendo tal efeito de acoplamento estabelecido através da matriz [A] anteriormente explanada.

Ainda relativamente à matriz [F], cabe aqui referir que sua formulação, para as condições ilustradas na Figura 5.4, não é apresentada aqui e pode ser consultada nas seguintes referências bibliográficas: [61], [63], [193]. Refira-se ainda que o procedimento proposto é totalmente generalizável, podendo ser incluído o comportamento dinâmico de veículos através de modelos com a complexidade pretendida, bastando para isso obter a matriz [F] correspondente, a qual pode ser avaliada através de qualquer outro modelo de cálculo, ou mesmo através de software comercial.

Por fim, quanto ao vetor de irregularidades, compete aqui fazer algumas observações adicionais. Tal como anteriormente referido, o perfil de irregularidades é decomposto em um conjunto de funções senoidais, caracterizadas por uma amplitude, comprimento de onda e ângulo de fase. Se for considerado um perfil de irregularidades harmônico, a irregularidade percebida por cada eixo no instante $\mathrm{t}=0 \mathrm{~s}$ pode ser reunida no vetor $\{\Delta u(\Omega)\}$ do seguinte modo:

$$
\begin{equation*}
\{\Delta u(\Omega)\}=\delta u\{b(\Omega)\} \tag{5.8}
\end{equation*}
$$

Em que δu é a amplitude complexa (pois o ângulo de fase pode não ser nulo) e os termos do vetor $\{b(\Omega)\}$ são dados por:

$$
\begin{equation*}
b(\Omega)_{i}=e^{i \frac{\Omega}{c} a_{i}}=e^{i \frac{2 \pi}{\lambda} a_{i}} \tag{5.9}
\end{equation*}
$$

Ou seja, os termos $b(\Omega)_{i}$ traduzem a posição relativa do eixo no perfil de irregularidades.

Posto isto, as forças de interação dinâmica são então avaliadas através da equação [5.4], e são utilizadas no modelo de propagação (modelo via-túnel-maciço) para a obtenção da resposta dinâmica em qualquer ponto desse domínio. Na seção seguinte aborda-se como é efetuada tal operação.

### 5.3.2.3 Geração artificial de perfis de irregularidades aleatórias da via férrea

Na seção anterior foi apresentado o perfil de irregularidades da via férrea como fonte potenciadora do mecanismo de interação veículo-via. Desse modo é inevitável fazer-se uma breve referência ao modo como podem ser obtidos tais perfis de irregularidades.

Como o desnivelamento longitudinal da via férrea é uma grandeza geométrica, ele pode ser obtido por medição direta do perfil de irregularidades em determinado local. Existem diversas técnicas e equipamentos para essa medição, cuja escolha depende fortemente dos comprimentos de onda de interesse para o problema. Como discutido na seção anterior, para uma mesma velocidade de circulação, irregularidades de maior comprimento de onda provocam excitação na faixa de baixas frequências; ocorre o oposto à medida que o comprimento de onda diminui. Embora a medição esteja fora do escopo deste trabalho, cabe mencionar os trabalhos recentes do projeto europeu RIVAS sobre a uniformização das técnicas de medição de irregularidades.

Como alternativa à medição, os perfis de irregularidades podem ser gerados artificialmente, considerando um processo estocástico que é caracterizável através de funções de densidade espectral de potência (PSD). Com base na medição de diversos perfis de irregularidades, diferentes propostas têm sido apresentadas para estas funções, as quais geralmente traduzem situações tipificadas de diferentes níveis de qualidade da via férrea. A este respeito merecem referência as propostas da FRA (Federal Railroad Administration), as propostas da SNCF (Administração Ferroviária da França), entre outras. Uma descrição detalhada destas diferentes propostas pode ser encontrada em outros trabalhos desenvolvidos no grupo de pesquisa em que a autora se insere, em particular em Alves Costa (2011) e Vale (2010), razão pela qual não serão aqui detalhadas. Contudo, apresenta-se a proposta de Braun \& Hellenbroich (1991), dado que a mesma é utilizada em estudos subsequentes. Segundo estes autores, a função de densidade espectral de potência de um perfil de irregularidades é dada por:

$$
\begin{equation*}
S\left(k_{x}\right)=S\left(k_{x, 0}\right)\left(\frac{k_{x}}{k_{x, 0}}\right)^{-w} \tag{5.10}
\end{equation*}
$$

em que $\mathrm{k}_{\mathrm{x}}$ é o número de onda, $\mathrm{k}_{\mathrm{x}, 0}$ e w são constantes que tomam, em geral, os valores de 1 rad/m e 3,5, respectivamente. As diferentes possibilidades para o nível de qualidade da via férrea são incluídas na expressão através de $\mathrm{S}\left(\mathrm{k}_{\mathrm{x}, 0}\right)$, tomando como valores de referência $5 \times 10^{-7} \mathrm{~m}^{3} / \mathrm{rad}$ para vias de má qualidade e $1 \times 10^{-9} \mathrm{~m}^{3} / \mathrm{rad}$ para vias de qualidade elevada.

O perfil artificial de irregularidades é então gerado a partir da curva PSD, pela sobreposição de efeitos de um processo estocástico. Suponha-se que a curva PSD está então definida para uma faixa de números de onda $\mathrm{k}_{\mathrm{x}}$ coerente com a faixa de frequências de interesse para o problema em estudo (essas frequências dependem
da velocidade de circulação; ver equação [5.3]). Essa faixa é então dividida em n intervalos de dimensão $\Delta k_{x}$ e centrados em $\mathrm{k}_{\mathrm{x}, \mathrm{i}}$. O perfil de irregularidades é então gerado através da sobreposição de um conjunto de funções cosseno, introduzindo um ângulo de fase aleatório $\theta_{i}$ :

$$
\begin{equation*}
\Delta u(x)=\sum_{i=1}^{n} \alpha_{i} \cos \left(k_{x, i} x-\theta_{i}\right) \tag{5.11}
\end{equation*}
$$

Em notação complexa, a equação anterior pode ser escrita como:

$$
\begin{equation*}
\Delta u(x)=\sum_{i=1}^{n} \alpha_{i} e^{i k_{x, i} x} e^{-i \theta_{i}} \tag{5.12}
\end{equation*}
$$

Ou, para garantir coerência com o anteriormente mencionado:

$$
\begin{equation*}
\Delta u(x)=\sum_{i=1}^{n} \delta u_{i} e^{i k_{i} x} \tag{5.13}
\end{equation*}
$$

em que

$$
\begin{equation*}
\delta u_{i}=\alpha_{i} e^{-i \theta_{i}} \tag{5.14}
\end{equation*}
$$

Quanto ao parâmetro $\alpha_{i}$, amplitude dos diversos harmônicos do perfil artificial, este é avaliado através da raiz quadrada da área definida pela curva PSD e pelo intervalo de $\Delta k_{x}$, logo:

$$
\begin{equation*}
\alpha_{i}=\sqrt{2 S\left(k_{x, i}\right) \Delta k_{x}} \tag{5.15}
\end{equation*}
$$

Como se pode verificar, o procedimento também pode ser aplicado com curvas PSD diferentes da representada pela expressão [5.10].

### 5.3.3 Resposta dinâmica em um ponto genérico do domínio

Na seção anterior foi explicado como se resolve o problema de interação trem-via, obtendo-se as forças de interação dinâmica. Essas forças devem ser combinadas com as forças estáticas resultantes do peso próprio dos veículos.

Conhecidas então as forças de interação trem-via, os dois sistemas estruturais são tratados de forma desacoplada, o que é claramente vantajoso em termos computacionais. A resposta em qualquer ponto do domínio é obtida através da sobreposição de efeitos das ações dinâmicas, induzidas pelos diferentes harmônicos necessários para a representação do perfil de irregularidades, adicionados à excitação quase estática, cujas forças de interação são conhecidas previamente. Essa sobreposição de efeitos utiliza a linearidade do sistema e o conceito de função de Green e pode ser expressa da seguinte forma:

$$
\left.u(x-c t, y, z, t)=\sum_{j=1}^{N} \frac{1}{2 \pi} \int_{-\infty}^{+\infty} u_{j}^{G}\left(k_{1}, y, z, \Omega_{j}-k_{1} c\right) P_{j}\left(k_{1}, \Omega_{j}\right) e^{i k_{1}(x-c t)} d k_{\Phi} e^{i} \widehat{\theta}_{j}\right]^{t}
$$

em que u(x,y,z,t) representa o deslocamento em uma direção genérica de qualquer ponto do domínio, $u_{j}^{G}$ é a função de Green no domínio transformado do deslocamento na direção considerada face à solicitação vertical unitária que se movimenta com velocidade c ao longo do trilho e com frequência de oscilação $\Omega_{j}$. Note-se que estas funções de Green resultam de uma ação em tudo idêntica à utilizada para o cálculo da matriz [A] (ver equação [5.6]). Desse modo, durante o cálculo da matriz [A], pode também ser obtida a resposta em qualquer outro ponto do domínio, o que minimiza consideravelmente o esforço computacional. Note-se que, por analogia, a equação [5.16] não faz mais do que proceder a um "ajuste de escala" da resposta obtida para uma carga unitária, atendendo ao fato de agora o carregamento ser constituído por várias forças, de magnitude não unitária e com defasagem (a função de carga $\mathrm{P}\left(\mathrm{k}_{1}, \Omega\right)$ é uma entidade complexa).

Relativamente à função de carga $\mathrm{P}\left(\mathrm{k}_{1}, \Omega\right)$, para carregamentos de múltiplas cargas, esta é dada por:

$$
\begin{equation*}
P_{j}\left(k_{1}, \Omega_{j}\right)=\sum_{i=1}^{n} N_{i}\left(\Omega_{j}\right) e^{-i a_{i} k_{1}} \tag{5.17}
\end{equation*}
$$

Note-se que no caso do carregamento quase estático, ou seja $\Omega=0$, o procedimento agora proposto também é válido, bastando para isso considerar essa mesma restrição na equação [5.16] e considerar o peso aplicado por cada eixo do trem na equação [5.17].

### 5.4 Interação solo-estrutura adjacente

### 5.4.1 Considerações gerais

A formulação de um modelo global para a análise de vibrações induzidas por tráfego ferroviário em túneis que contemple não só a problemática da sua geração e propagação, mas também a própria recepção no edifício, constitui um objetivo perseguido pela comunidade técnica e científica. Ainda que os primeiros passos em torno desta temática tenham ocorrido em meados da década passada, impulsionados pelos grupos de pesquisa da KU LEUVEN [195] e da École Central de Paris [196], as dificuldades computacionais associadas a um problema tridimensional de grande dimensão limitaram o desenvolvimento da temática nos anos seguintes. Cabe, contudo, mencionar os estudos preliminares conduzidos por Fiala et al. (2007); Fiala et al. (2008) que
versaram sobre a previsão e mitigação de vibrações e de ruído re-radiado no interior de edificações próximas de infraestruturas ferroviárias.

Como referido acima, a principal dificuldade inerente ao desenvolvimento de um modelo global para a previsão de vibrações no interior de edifícios devido a tráfego não reside propriamente na inexistência de fundamentos teóricos para resolver o problema, mas em limitações computacionais. Essa dificuldade permanece na simulação numérica de domínios de grandes dimensões [198]. Na verdade, os recentes avanços da capacidade de cálculo computacional têm permitido o desenvolvimento de modelos puramente tridimensionais [91], os quais permitem lidar com o problema de forma simples e exata, mas que exigem elevado esforço computacional, ficando muitas vezes limitados a aplicações apenas acadêmicas.

Considerando as limitações anteriormente mencionadas e a ampliação das capacidades computacionais, nos últimos tempos têm ocorrido avanços no desenvolvimento de modelos globais de previsão de vibrações induzidas por tráfego (modelos que incluam a interação dinâmica entre os diferentes subdomínios) que possam ser eficientes do ponto de vista computacional, sem violar os principais pressupostos do problema, em particular a sua tridimensionalidade. Os desenvolvimentos mais recentes [92], [170], [171], dos quais também participa o grupo de pesquisa da FEUP, consistem na utilização de técnicas de subestruturação, nas quais se procede ao acoplamento entre modelos com características físicas distintas. A vantagem inerente a tal metodologia reside na possibilidade de seleção do método mais adequado à simulação de cada um dos domínios.

O modelo a seguir proposto, de caráter geral, foi desenvolvido atendendo aos seguintes pressupostos/condições:

- O modelo da edificação deve ser tridimensional e recorrer à técnica dos elementos finitos;
- A modelagem do edifício pode ser efetuada em qualquer código desde que seja possível acessar as matrizes globais de rigidez e de massa da estrutura;
- A presença da edificação não afeta a fonte de geração de vibrações, ou seja, a interação entre o veículo e a via férrea.

Saliente-se que o sistema túnel-maciço é simulado recorrendo a uma formulação 2.5D, ao passo que o edifício é modelado através de uma formulação 3D. De fato, a modelagem 2.5D do sistema integral maciço-edifício seria muito restritiva já que o edifício teria de se estender infinitamente na direção paralela ao túnel, situação essa que apresenta pouca correspondência com a realidade.

### 5.4.2 Formulação do modelo

Com o intuito de facilitar a exposição (mas sem qualquer perda de generalidade), considere-se o sistema com um grau de liberdade, mostrado na Figura 5.6a, como representativo de uma estrutura submetida a um campo de vibração incidente, que se propaga pelo solo e que a excita na sua fundação.

A excitação da estrutura dá lugar a um problema de interação solo-estrutura, tal como representado na Figura 5.6b, em que o deslocamento do ponto F, que representa a fundação da estrutura, depende não só do campo de onda incidente, mas também das características dinâmicas da estrutura e da consequente força de interação gerada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-197_637_1494_813_284.jpg)
Figura 5.6: Sistema estrutural com um grau de liberdade solicitado por um campo de vibração incidente na sua base: a) representação esquemática; b) problema de interação solo estrutura.

Atendendo ao campo de vibração incidente na fundação, correspondente a um deslocamento vertical harmônico com amplitude $u_{0}(\omega)$, e ao incremento de deslocamento $\Delta u(\omega)$ induzido pela força de interação $F_{\text {int }}(\omega)$, é possível definir o deslocamento da fundação $u_{F}(\omega)$ do seguinte modo:

$$
\begin{equation*}
u_{F}(\omega)=u_{0}(\omega)+\Delta u(\omega) \tag{5.18}
\end{equation*}
$$

Note-se que apenas o incremento $\Delta u(\omega)$ é originado pelo problema de interação solo-estrutura, o qual se relaciona com a força de interação através da flexibilidade dinâmica do maciço de fundação, $H(\omega)$. Dadas as condições de compatibilidade inerentes ao problema elástico e linear, o deslocamento do ponto F terá de ser obrigatoriamente igual ao do ponto de fundação e, como tal:

$$
\begin{equation*}
\Delta u(\omega)=H(\omega) \times F_{\text {int }}(\omega) \tag{5.10}
\end{equation*}
$$

Passando agora à análise do equilíbrio da estrutura, é possível estabelecer a seguinte condição entre deslocamento dos graus de liberdade, u, e forças exteriores atuantes, f:

$$
\begin{equation*}
\left([K]-\omega^{2}[M]\right)\{u\}=\{f\} \tag{5.20}
\end{equation*}
$$

em que [K] corresponde à matriz de rigidez e [M] à matriz de massa.
Atendendo à simplicidade do sistema estrutural, no qual apenas são admitidos dois graus de liberdade, correspondentes ao deslocamento vertical da fundação (ponto F) e da massa (ponto m), e em que apenas a força de interação $\mathrm{F}_{\text {int }}$ é considerada como força exterior, o equilíbrio do sistema pode então ser escrito por:

$$
\begin{equation*}
\left[\begin{array}{cc}
k-\omega^{2} m & -k \\
-k & k
\end{array}\right]\left[\begin{array}{l}
u_{m} \\
u_{F}
\end{array}\right]=\left[\begin{array}{c}
0 \\
-F_{\text {int }}
\end{array}\right] \tag{5.21}
\end{equation*}
$$

Em que k e m correspondem, respectivamente, à rigidez da mola e à massa do sistema representado na Figura 5.6. O sinal negativo introduzido no vetor das forças exteriores visa atender ao fato de a força de interação exercida pelo maciço na estrutura ter sentido oposto ao da força exercida pela estrutura sobre o maciço.

Como já ilustrado nas expressões [5.18] e [5.19], tanto o deslocamento do ponto F como a força de interação podem ser escritos em função do incremento de deslocamento. Introduzindo tais relações na equação [5.21], facilmente se chega à seguinte condição de equilíbrio:

$$
\begin{equation*}
\left[\begin{array}{cc}
k-\omega^{2} m & -k \\
-k & k
\end{array}\right]\left[\begin{array}{c}
u_{m} \\
u_{0}+\Delta u
\end{array}\right]=\left[\begin{array}{c}
0 \\
-H^{-1} \Delta u
\end{array}\right] \tag{5.22}
\end{equation*}
$$

Dado que o campo de deslocamento incidente, $u_{0}$, é um dado e não uma incógnita, é vantajoso reescrever a equação [5.22] da seguinte forma:

$$
\begin{equation*}
\left[\begin{array}{cc}
k-\omega^{2} m & -k \\
-k & k
\end{array}\right]\left[\begin{array}{c}
u_{m} \\
\Delta u
\end{array}\right]+\left[\begin{array}{cc}
k-\omega^{2} m & -k \\
-k & k
\end{array}\right]\left[\begin{array}{c}
0 \\
u_{0}
\end{array}\right]=-\left[\begin{array}{cc}
0 & 0 \\
0 & H^{-1}
\end{array}\right]\left[\begin{array}{c}
0 \\
\Delta u
\end{array}\right] \tag{5.23}
\end{equation*}
$$

Reorganizando o sistema de equações em causa chega-se a:

$$
\begin{equation*}
\left[\begin{array}{cc}
k-\omega^{2} m & -k \\
-k & k+H^{-1}
\end{array}\right]\left[\begin{array}{l}
u_{m} \\
\Delta u
\end{array}\right]=-\left[\begin{array}{cc}
k-\omega^{2} m & -k \\
-k & k
\end{array}\right]\left[\begin{array}{c}
0 \\
u_{0}
\end{array}\right] \tag{5.24}
\end{equation*}
$$

As incógnitas desse sistema são o deslocamento da massa, $u_{m}$, e o incremento de deslocamento da fundação, $\Delta u$. Como está bem patente, o equilíbrio do sistema é resolvido no domínio da frequência. Caso se pretenda avaliar a resposta no domínio do tempo será então necessária a aplicação de uma transformada inversa de Fourier.

Após resolvido o sistema de equações, é possível determinar a força de interação (ver equação [5.19]) e avaliar o novo campo de vibração gerado pela aplicação dessa força ao terreno.

No modelo numérico global desenvolvido generalizou-se o modelo que acabou de se descrever para um sistema com múltiplos graus de liberdade (ver 5.4.4).

### 5.4.3 Validação do modelo

O processo de desenvolvimento de uma metodologia numérica não pode ser dado como concluído sem a respectiva validação e verificação. Este pressuposto metodológico acompanhou a autora da presente tese em todas as fases do desenvolvimento da metodologia numérica global.

A validação do procedimento de acoplamento entre os dois modelos, o do meio de propagação e o do receptor, baseou-se em uma validação cruzada de duas metodologias distintas para obtenção da resposta no receptor. Para isso foi desenvolvido um modelo numérico integral, no qual o receptor e o meio de propagação são descritos por um sistema de equações global, e um modelo subestruturado, tal como proposto na metodologia anteriormente descrita, em que o meio de propagação e o receptor são considerados de forma independente e posteriormente acoplados, atendendo às condições de equilíbrio e compatibilidade.

Recorde-se que o objetivo final consiste na análise de vibrações no interior de uma estrutura tridimensional devido a um campo de vibração incidente. Como foi enfatizado, essa modelagem não é passível de ser efetuada de um modo integral através do modelo 2.5 D , dado o fato de o receptor não apresentar caráter infinito e invariante na direção de desenvolvimento da estrutura. Porém, o modelo 2.5 D permite a realização de uma análise bidimensional em estado plano de deformação (bastando para isso impor que o número de onda $\mathrm{k}_{1}$ seja igual a zero), sendo assim justificado o recurso a um modelo bidimensional para a presente validação. Convém contudo esclarecer que a adoção de tal pressuposto não diminui em nada a abrangência e campo de validade do presente estudo.

O exemplo de validação selecionado encontra-se representado na Figura 5.7. Trata-se de um exemplo bidimensional, em que a excitação é propiciada por uma ação dinâmica vertical, condizente com o impulso de Ricker representado na Figura 5.8, a qual é imposta em um ponto da superfície de um espaço semi-infinito que dista 15 m do receptor representado por um oscilador com as características indicadas na Figura 5.7. Foram então definidos os seguintes modelos:

i) Modelo global, construído com base no MEF-PML 2.5D, onde o acoplamento do receptor ao terreno é garantido diretamente no sistema de equações global;
ii) Modelo subestruturado, onde o mecanismo de propagação é definido pelo modelo MEF-PML 2.5D, o qual não incluiu o oscilador. Neste modelo, o acoplamento é garantido através da metodologia proposta na seção anterior.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-200_585_1223_114_421.jpg)
Figura 5.7: Exemplo de validação: geometria e características gerais.

A Figura 5.9 compara a história temporal do deslocamento vertical da massa do oscilador obtida através dos dois métodos. Como se pode verificar há uma correspondência perfeita entre os resultados previstos por ambas as metodologias. A observação da figura permite ainda constatar que a resposta é fortemente dominada por uma componente em frequência de aproximadamente 20 Hz, que corresponde à frequência natural do oscilador.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-200_620_1752_1283_153.jpg)
Figura 5.8: Impulso de Ricker utilizado como excitação: a) Registro temporal; b) Conteúdo em frequência.

Considerando agora o ponto de ligação ao restante meio, a Figura 5.10 ilustra a história temporal de deslocamentos verticais obtidos por ambas as estratégias de modelagem, verificando-se, uma vez mais, uma perfeita concordância entre os resultados.

A resposta obtida pelo modelo subestruturado resulta da conjugação do campo de deslocamentos incidente, calculado previamente, com o campo de deslocamentos incremental, resultante da resolução do problema de interação dinâmica. Dado que as duas contribuições para a deformação global são avaliadas em momentos distintos do cálculo, a sua individualização é representada na Figura 5.11.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-201_699_851_118_158.jpg)
Figura 5.9: Registro temporal do deslocamento vertical da massa do oscilador.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-201_712_847_118_1058.jpg)
Figura 5.10: Registro temporal do deslocamento vertical do ponto de conexão do oscilador ao restante meio.

Da observação da Figura 5.11 é possível constatar que o caráter oscilante da resposta após a passagem da onda (campo incidente) se deve ao mecanismo de interação solo--estrutura. Ou seja, as características dinâmicas do sistema acoplado estrutura-maciço de fundação dão origem a uma força de interação que, por sua vez, origina vibrações que se propagam no terreno. Deve ser salientado que o campo incidente é totalmente independente das características dinâmicas da estrutura, sendo apenas influenciado pelas características do meio de propagação e da fonte de excitação (no presente caso pelo impulso de Ricker aplicado a 15 m de distância do oscilador).

Ainda para o mesmo ponto de observação, a análise do conteúdo em frequência da resposta total e respectivas contribuições, ilustrada na Figura 5.12, permite verificar que a resposta total apresenta uma contribuição relevante próxima dos 20 Hz, que obviamente não está presente no campo de deslocamento incidente, porque essa contribuição se deve ao campo de deslocamento incremental, o qual é dominado pela frequência natural da estrutura. Ou, explicado de outra forma, o conteúdo da força de interação impressa pela estrutura ao terreno tem preponderância em torno dos 20 Hz. Este efeito está bem patente na Figura 5.13 onde se ilustra o registro temporal e o conteúdo em frequência da força de interação. A avaliação da presente força é efetuada, no modelo subestruturado, de forma bastante simples, bastando para isso multiplicar o incremento de deslocamento pela rigidez dinâmica da fundação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-202_712_853_119_155.jpg)
Figura 5.11: Decomposição do deslocamento no ponto de interação nas componentes incidente e incremental.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-202_700_848_118_1060.jpg)
Figura 5.12: Conteúdo em frequência do deslocamento vertical no ponto de interação estrutura-solo.

Observando a Figura 5.13a e atendendo ao campo de deslocamento incidente no ponto de interação ilustrado na Figura 5.11, é possível constatar que o pico da força de interação ocorre durante a passagem da onda incidente, passando a apresentar uma oscilação harmônica amortecida até que ocorra a estabilização da massa do oscilador. Analisando o conteúdo em frequência da força de interação, ilustrado na Figura 5.13b, é notório o predomínio da resposta em torno das frequências de aproximadamente 20 Hz e de 40 Hz. O primeiro pico está relacionado com a frequência natural da estrutura, ao passo que o segundo se deve ao conteúdo em frequência do campo incidente, o que aliás pode ser confirmado pela consulta da Figura 5.12.

Face às observações agora apresentadas, é então evidente que a força de interação solo-estrutura e, consequentemente, o campo de deslocamentos incremental dependem não só das propriedades dinâmicas da estrutura, mas também das características da excitação da mesma (no presente caso campo de deslocamentos incidente), em particular quanto ao conteúdo em frequência.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-203_637_1739_124_163.jpg)
Figura 5.13: Força de interação solo-estrutura: a) registro temporal; b) conteúdo em frequência.

### 5.4.4 Generalização do modelo

Nas seções anteriores foi apresentada a formulação do modelo e respectiva validação conceitual através de um exemplo simples, baseado no acoplamento dinâmico entre um oscilador com um grau de liberdade e o restante meio. Contudo, para tornar o modelo adequado à aplicação prática, ele deve ser generalizado para representar melhor os problemas reais envolvendo vibrações no interior de edifícios devido a tráfego ferroviário em túneis.

Procurando conferir um maior grau de generalização ao modelo, considere-se a estrutura de uma edificação com n graus de liberdade, dos quais os graus de liberdade b não apresentam ligação ao exterior ao passo que os graus de liberdade f se encontram conectados ao meio restante, ou seja, são graus de liberdade de fundação do edifício. Deste modo, reordenando os diferentes graus de liberdade, o equilíbrio dinâmico da estrutura pode ser descrito pela equação [5.25], a qual resulta apenas da generalização da equação [5.21] anteriormente apresentada.

$$
\begin{equation*}
\left[\begin{array}{cc}
{\left[K_{b b}\right]} & {\left[K_{b f}\right]^{T}} \\
{\left[K_{b f}\right]} & {\left[K_{f f}\right]}
\end{array}\right]\left[\begin{array}{l}
\left\{u_{b}\right\} \\
\left\{u_{f}\right\}
\end{array}\right]=\left[\begin{array}{c}
0 \\
-\left\{F_{\mathrm{int}}\right\}
\end{array}\right] \tag{5.25}
\end{equation*}
$$

Em que as matrizes $\left[K_{i j}\right]$ são matrizes de rigidez dinâmica, $\left\{u_{b}\right\}$ é o vetor de deslocamento dos graus de liberdade da estrutura que não apresentam ligação ao exterior e $\left\{u_{f}\right\}$ é o vetor de deslocamento dos graus de liberdade ligados ao exterior. O vetor das forças exteriores é nulo para o caso dos graus de liberdade sem contato com o exterior e é composto pelas forças de interação solo-estrutura nos restantes casos. Note-se que na presente formulação considera-se que as forças exteriores atuantes resultam apenas da interação solo-estrutura.

Atendendo à decomposição do deslocamento dos graus de liberdade em contato com o solo em uma componente incidente e em uma componente incremental (ver equação [5.18]), o sistema de equações [5.25] pode então ser manipulado de forma a dar origem a:

$$
\begin{equation*}
\left[\begin{array}{cc}
{\left[K_{b b}\right]} & {\left[K_{b f}\right]^{T}} \\
{\left[K_{b f}\right]} & {\left[K_{f f}\right]}
\end{array}\right]\left[\begin{array}{c}
\left\{u_{b}\right\} \\
\left\{\Delta u_{f}\right\}
\end{array}\right]+\left[\begin{array}{cc}
{\left[K_{b b}\right]} & {\left[K_{b f}\right]^{T}} \\
{\left[K_{b f}\right]} & {\left[K_{f f}\right]}
\end{array}\right]\left[\begin{array}{c}
\{0\} \\
\left\{u_{0, f}\right\}
\end{array}\right]=\left[\begin{array}{c}
0 \\
-\left\{F_{\mathrm{int}}\right\}
\end{array}\right] \tag{.26]}
\end{equation*}
$$

Em que $\left\{\Delta u_{f}\right\}$ representa o vetor dos incrementos de deslocamento devidos à interação solo-estrutura e $\left\{u_{0, f}\right\}$ corresponde ao vetor do campo incidente.

Por sua vez, o vetor das forças de interação é relacionável com o vetor dos incrementos de deslocamento através da matriz de impedância do solo, [H], o que por semelhança com a equação [5.19], resulta em:

$$
\begin{equation*}
\left\{F_{\text {int }}\right\}=[H]^{-1}\left\{\Delta u_{f}\right\} \tag{5.27}
\end{equation*}
$$

Incorporando esta última relação no sistema de equações descrito em [5.26], facilmente se conclui que:

$$
\begin{equation*}
\left[\begin{array}{cc}
{\left[K_{b b}\right]} & {\left[K_{b f}\right]^{T}} \\
{\left[K_{b f}\right]} & {\left[K_{f f}\right]+[H]^{-1}}
\end{array}\right]\left[\begin{array}{c}
\left\{u_{b}\right\} \\
\left\{\Delta u_{f}\right\}
\end{array}\right]=-\left[\begin{array}{cc}
{\left[K_{b b}\right]} & {\left[K_{b f}\right]^{T}} \\
{\left[K_{b f}\right]} & {\left[K_{f f}\right]}
\end{array}\right]\left[\begin{array}{c}
\{0\} \\
\left\{u_{0, f}\right\}
\end{array}\right] \tag{5.28}
\end{equation*}
$$

Em que a matriz presente no primeiro membro corresponde à matriz de rigidez dinâmica global do sistema estrutura-maciço de fundação, ao passo que a matriz ocorrente no segundo membro corresponde à matriz de rigidez dinâmica da estrutura.

O sistema de equações apresentado na expressão [5.28] é totalmente genérico. A matriz de rigidez dinâmica da estrutura pode ser calculada por qualquer programa de análise estrutural e utilizada como dado de entrada no modelo de acoplamento implementado na plataforma Matlab. A resolução desse sistema, formulado no domínio da frequência, requer apenas o campo de deslocamento incidente, obtido pelo modelo 2.5D MEF-PML (capítulo 3) em conjunto com o modelo de interação veículo-via apresentado neste capítulo, a impedância do sistema de fundação e a matriz de rigidez dinâmica da estrutura.

### 5.4.5 Metodologias para avaliação da impedância da fundação

### 5.4.5.1 Considerações gerais

Como visto anteriormente, a resolução do problema de interação dinâmica solo-estrutura requer considerar a contribuição do solo, não apenas em termos de rigidez, mas também em termos de amortecimento (por efeito de radiação de energia) e de
inércia. A combinação destes efeitos, designada usualmente por impedância ou flexibilidade dinâmica, pode ser avaliada através de diferentes metodologias numéricas e/ ou analíticas.

Cabe ressaltar que no presente trabalho apenas se consideram estruturas com fundações superficiais, mas o procedimento de interação solo-estrutura pode ser generalizado para casos de fundações profundas, ainda que com um certo grau de simplificação, como aliás ilustrado no recente estudo apresentado por Hussein et al. (2015), o qual resultou de uma colaboração entre as Universidades do Porto, Cambridge e Southampton.

No exemplo de validação anteriormente apresentado a impedância foi avaliada através do cálculo, para cada frequência considerada, do deslocamento induzido no ponto de aplicação de uma carga unitária. Esta estratégia poderia também ser adotada para o caso da estrutura de um edifício, a qual contempla, no caso geral, várias fundações para os elementos estruturais. Contudo, essa abordagem seria bastante demorada do ponto de vista computacional. Por isso, convém desenvolver abordagens alternativas que atendam à dicotomia clássica em problemas de modelagem numérica: a abordagem deve por um lado garantir a precisão da solução, mas por outro deve ser relativamente expedita e de fácil aplicação para que sua adoção em casos reais não se torne inviável.

Atendendo à questão anteriormente descrita foram então desenvolvidas duas abordagens distintas para a avaliação da impedância da fundação: i) uma abordagem mais completa, baseada no método dos elementos de contorno, ii) uma abordagem mais simples baseada em modelos de massas concentradas. Em ambas as abordagens foram admitidas as seguintes simplificações:

i) O contato solo-estrutura é garantido por uma fundação superficial diretamente apoiada na superfície do terreno;
ii) Considera-se que a presença do túnel ferroviário ou de qualquer outra infraestrutura enterrada não afeta substancialmente a impedância do sistema de fundação.

Quanto à segunda simplificação, cabe mencionar que ela resulta apenas de uma tentativa de economizar esforço computacional, podendo ser contornada através do cálculo de funções fundamentais (funções de Green) obtidas por via numérica através do método MEF-PML 2.5D anteriormente apresentado.

### 5.4.5.2 Cálculo da impedância através do MEC 3D

Equações de equilíbrio do contorno
Esta seção não tem como objetivo descrever exaustivamente o método dos elementos de contorno. Recomenda-se que o leitor consulte algumas das seguintes obras de referência sobre a temática: [132], [199], [200], [201]. No entanto, dado que a metodologia seguida se insere neste método numérico, procurar-se-á dar uma visão global do método atendendo à sua aplicação ao caso concreto de cálculo da matriz de impedância do sistema de fundação.

Considere-se então para o presente efeito, um meio semi-infinito submetido a uma pressão uniformemente distribuída ao longo da área $\Sigma$. A fronteira do problema é então definida pela superfície submetida a pressões $\Sigma$, pela superfície livre $\Gamma_{1}$ e pela superfície imaginária $\Gamma_{\mathrm{R}}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-206_630_699_1067_682.jpg)
Figura 5.14: Meio semi-infinito submetido a uma carga distribuída em uma zona da sua superfície (adaptado de Alves Costa (2011)).

Aplicando as equações integrais de contorno (equações que regem o problema de contorno) às condições definidas na Figura 5.14, o campo de deslocamentos em um ponto arbitrário com coordenadas x induzido pela aplicação de pressões na superfície $\Sigma$ é então determinado da seguinte forma:

$$
\begin{align*}
u_{j}(\boldsymbol{x}, \omega) & =\int_{\Sigma} u_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) p_{i}^{\Sigma}(\boldsymbol{y}, \omega) \mathrm{d} \Sigma-\int_{\Sigma} p_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) u_{i}^{\Sigma}(\boldsymbol{y}, \omega) \mathrm{d} \Sigma \\
& +\int_{\Gamma_{1}} u_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) p_{i}^{\Gamma_{1}}(\boldsymbol{y}, \omega) \mathrm{d} \Gamma_{1}-\int_{\Gamma_{1}} p_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) u_{i}^{\Gamma_{1}}(\boldsymbol{y}, \omega) \mathrm{d} \Gamma_{1}  \tag{5.22}\\
& +\int_{\Gamma_{R}} u_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) p_{i}^{\Gamma_{R}}(\boldsymbol{y}, \omega) \mathrm{d} \Gamma_{R}-\int_{\Gamma_{R}} p_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) u_{i}^{\Gamma_{R}}(\boldsymbol{y}, \omega) \mathrm{d} \Gamma_{R}
\end{align*}
$$

Onde $u_{i j}^{G}$ corresponde ao tensor das funções de Green de deslocamento, $p_{i j}^{G}$ é o tensor das funções de Green de tensão, $\mathrm{p}_{\mathrm{i}}$ são as pressões aplicadas nas fronteiras e $\mathrm{u}_{\mathrm{i}}$ são os deslocamentos no contorno do problema.

Sabendo que apenas são aplicadas pressões na superfície $\Sigma$, estando esta inscrita na superfície livre do maciço, e que a integração ao longo da fronteira $\Gamma_{\mathrm{R}}$ tende a zero à medida que R tende para infinito, para que a condição de Sommerfeld seja satisfeita, então a expressão anterior pode ser simplificada da seguinte forma:

$$
\begin{equation*}
u_{j}(\boldsymbol{x}, \omega)=\int_{\Sigma} \boldsymbol{u}_{j i}^{G}(\boldsymbol{x}, \boldsymbol{y}, \omega) \boldsymbol{p}_{i}(\boldsymbol{y}, \omega) \mathrm{d} \Sigma \tag{5.30}
\end{equation*}
$$

A expressão [5.30] remete diretamente ao significado físico do problema, ou seja, permite o cálculo do deslocamento em qualquer ponto do maciço (ponto de coordenadas x), devido à aplicação de uma pressão no contorno $\Sigma$. As incógnitas do problema podem ser então determinadas aplicando o procedimento do método dos elementos de contorno, no qual se procede à discretização das variáveis de campo ao longo da fronteira $\Sigma$ [202], [203], [204], [205]. Como se verá a seguir, no presente trabalho procedeu-se à generalização tridimensional de um procedimento para avaliação dos termos matriciais do método.

Considere-se agora que a área $\Sigma$ é delimitada pelas dimensões $\Delta \mathrm{x}$ e $\Delta \mathrm{y}$, e que se pretende obter a resposta em um ponto $\mathrm{x}=\left(\mathrm{x}_{1}, \mathrm{y}_{1}, \mathrm{z}_{1}\right)$.

Aplicando a identidade de Somigliana (equação [5.30]) ao problema, o campo de deslocamentos no ponto genérico x é então dado por:

$$
\begin{equation*}
u_{j}\left(x_{1}, y_{1}, z_{1}, \omega\right)=\int_{\Sigma} u_{\mathrm{ji}}^{G}\left(x_{1}, y_{1}, z_{1}, x, y, z=0, \omega\right) p_{i}(x, y, z=0, \omega) d \Sigma \tag{$5.31]$}
\end{equation*}
$$

Dada a constância do problema no plano horizontal, a resposta depende apenas das distâncias relativas entre x e y e não do valor absoluto das coordenadas, pelo que:

$$
\begin{equation*}
u_{j}\left(x_{1}, y_{1}, z_{1}, \omega\right)=\int_{\Sigma} u_{\mathrm{ji}}^{G}\left(x_{1}-x, y_{1}-y, z_{1}, \omega\right) p_{i}(x, y, z=0, \omega) d \Sigma \tag{5.32}
\end{equation*}
$$

Procedendo à decomposição da integral de superfície nas duas direções ortogonais, facilmente se chega a:

$$
u_{j}\left(x_{1}, y_{1}, z_{1}, \omega\right)=\int_{y_{n}-\frac{\Delta y}{2}}^{y_{n}+\frac{\Delta y}{2}} \int_{x_{n}-\frac{\Delta x}{2}}^{x_{n}+\frac{\Delta x}{2}} u_{j i}^{G}\left(x_{1}-x, y_{1}-y, z_{1}, \omega\right) p_{i}(x, y, z=0,(5) \operatorname{ls} 3 d y
$$

em que $\mathrm{x}_{\mathrm{n}}$ e $\mathrm{y}_{\mathrm{n}}$ correspondem às coordenadas do ponto central da área solicitada $\Sigma$.

Considere-se agora uma dupla transformação de Fourier relativa às variáveis $\mathrm{x}_{1}$ e y 1 e atenda-se à propriedade de translação da transformada. Nesse caso a igualdade anterior poderá ser descrita por:

$$
\begin{equation*}
u_{j}\left(k_{1}, k_{2}, z_{1}, \omega\right)=\int_{y_{n}-\frac{\Delta y}{2}}^{y_{n}+\frac{\Delta y}{2}} \int_{x_{n}-\frac{\Delta x}{2}}^{x_{n}+\frac{\Delta x}{2}} u_{j i}^{G}\left(k_{1}, k_{2}, z_{1}, \omega\right) p_{i}(x, y, z=0, \omega) e^{-i k_{1} x} e^{-k} \tag{52y4}
\end{equation*}
$$

pelo que, atendendo ao fato de a variável $\mathrm{p}_{\mathrm{i}}$ apenas tomar valores não nulos no interior dos intervalos de integração indicados, a equação [5.34] pode ser manipulada para dar origem a:

$$
\begin{equation*}
u_{j}\left(k_{1}, k_{2}, z_{1}, \omega\right)=u_{\mathrm{ji}}^{G}\left(k_{1}, k_{2}, z_{1}, \omega\right) p_{i}\left(k_{1}, k_{2}, z=0, \omega\right) \tag{5.35}
\end{equation*}
$$

A expressão [5.35] reflete assim a identidade de Somigliana no domínio transformado, a qual, após operação de transformação inversa relativa aos números de onda, dá origem à expressão [5.31]. A vantagem da resolução do problema no domínio do número de onda-frequência deve-se à facilidade de obtenção das funções de Green de deslocamento neste domínio. Nesse cenário, as funções de Green podem ser facilmente avaliadas para meios estratificados recorrendo a metodologias tais como as matrizes de rigidez [206], as matrizes de transferência de Haskell-Thomson [207] ou através do método dos estratos finos [148], [208].

Definição da impedância de um sistema de fundações
Remetendo novamente para a identidade estabelecida pelas expressões [5.31] e [5.35], considere-se agora que a pressão exterior aplicada na fronteira é uniforme. Nesse caso, a definição matemática de tal condição de contorno é dada por:

$$
\begin{equation*}
p(x, y, 0, \omega)=\frac{P(\omega)}{\Delta x \Delta y} H\left(\frac{\Delta y}{2}-\left|y-y_{n}\right|\right) H\left(\frac{\Delta x}{2}-\left|x-x_{n}\right|\right) \tag{5.36}
\end{equation*}
$$

onde H é a função de Heaviside (toma valor unitário quando o argumento é positivo e valor nulo nos demais casos), $P(\omega)$ é a resultante da pressão uniformemente distribuída na superfície com dimensões $\Delta \mathrm{x}$ e $\Delta \mathrm{y}$.

A dupla transformada de Fourier (relativa às dimensões x e y) da expressão [5.36] possui solução analítica. Desse modo, a expressão matemática no domínio transformado da pressão aplicada no contorno é dada por:

$$
\begin{equation*}
p\left(k_{1}, k_{2}, 0, \omega\right)=4 \frac{P(\omega)}{\Delta x \Delta y} \frac{\operatorname{sen}\left(k_{1} \frac{\Delta x}{2}\right)}{k_{1}} \frac{\operatorname{sen}\left(k_{2} \frac{\Delta y}{2}\right)}{k_{2}} e^{-i k_{1} x_{n}} e^{-i k_{2} y_{n}} \tag{5.37}
\end{equation*}
$$

Incorporando a expressão [5.37] em [5.35] e atendendo a que o objetivo final passa por obter a resposta em um ponto genérico de coordenadas $\left(\mathrm{x}_{\mathrm{j}}, \mathrm{y}_{\mathrm{j}}, \mathrm{z}_{\mathrm{j}}\right)$ no domínio do espaço-
-frequência (recorrendo a uma operação de dupla transformação inversa de Fourier) obtém-se:

$$
\begin{gather*}
u_{j}\left(x_{j}, y_{j}, z_{j}, \omega\right)=\frac{P(\omega)}{\pi^{2} \Delta x \Delta y} \int_{-\infty}^{+\infty} \int_{-\infty}^{+\infty} u_{j i}^{G}\left(k_{1}, k_{2}, z_{1}, \omega\right) \\
\frac{\operatorname{sen}\left(k_{1} \frac{\Delta x}{2}\right)}{k_{1}} \frac{\operatorname{sen}\left(k_{2} \frac{\Delta y}{2}\right)}{k_{2}} e^{i k_{1}\left(x_{j}-x_{n}\right)} e^{i k_{2}\left(y_{j}-y_{n}\right)} d k_{2} d k_{1} \tag{5.38}
\end{gather*}
$$

Atendendo ao problema particular que se pretende solucionar, considere-se a representação esquemática ilustrada na Figura 5.15, a qual representa a discretização da superfície do maciço para avaliação da impedância de duas fundações superficiais. Como, em geral, os elementos de fundação são considerados rígidos, a distribuição de pressões ao longo da superfície de contato entre o elemento estrutural e o terreno não é conhecida a priori, sendo efetivamente bastante distinta da distribuição uniforme. Esse fato pode ser atendido através da discretização da superfície da sapata em pequenas porções, no interior das quais se admite uma distribuição uniforme de pressão. Como é evidente, quanto mais refinada for a discretização da superfície, maior é o rigor da solução alcançada.

Considerando a representação ilustrada na Figura 5.15, compreende-se que as diferentes sapatas não correspondem a elementos isolados, existindo acoplamento entre si através do maciço de fundação. Na presente formulação este aspecto é devidamente considerado, podendo estabelecer-se uma relação direta entre os deslocamentos nos pontos de colocação e a resultante das pressões aplicadas em cada subelemento da fundação. Essa relação pode então ser escrita através da generalização da igualdade [5.38], resultando em:

$$
\begin{equation*}
\left\{u\left(x_{i}, y_{i}, 0, \omega\right)\right\}_{\mathrm{pc}}=\left[G\left(x_{i}-x_{n}, y_{i}-y_{n}, 0, \omega\right)\right]\{P(\omega)\}_{n} \tag{5.39}
\end{equation*}
$$

Sendo a matriz [G] dada por:

$$
\begin{align*}
& {\left[G\left(x_{i}-x_{n}, y_{i}-y_{n}, 0, \omega\right)\right]=\frac{1}{\pi^{2}} \int_{-\infty}^{+\infty} \int_{-\infty}^{+\infty} u_{j i}^{G}\left(k_{1}, k_{2}, z_{1}, \omega\right)} \\
& \frac{\operatorname{sen}\left(k_{1} \frac{\Delta x}{2}\right)}{\Delta x k_{1}} \frac{\operatorname{sen}\left(k_{2} \frac{\Delta y}{2}\right)}{\Delta y k_{2}} e^{i k_{1}\left(x_{i}-x_{n}\right)} e^{i k_{2}\left(y_{i}-y_{n}\right)} d k_{2} d k_{1} \tag{5.40}
\end{align*}
$$

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-210_437_966_116_550.jpg)
Figura 5.15: Discretização da superfície de um meio semi-infinito para atender à presença de duas fundações superficiais.

Dado que a matriz [G] estabelece uma relação direta entre os deslocamentos em pontos de colocação e a resultante da ação aplicada em cada subelemento, o seu significado físico é em tudo idêntico ao definido para a matriz [H] definida na expressão [5.27]. No entanto, tal cenário implicaria que o número de graus de liberdade da estrutura (edifício) em contato com o terreno de fundação fosse igual ao número de graus de liberdade dos pontos de colocação considerados na discretização da superfície de contato sapata-terreno. Não existe qualquer impedimento conceitual à concretização deste requisito. Porém tal fato oneraria o esforço computacional, já que seria necessário discretizar em elementos finitos a própria sapata, a qual, em geral, apresenta um comportamento muito rígido.

No caso de se considerarem os elementos de fundação como corpos rígidos, o número de graus de liberdade fica reduzido a 6, em correspondência com 3 componentes de deslocamento nas direções cartesianas acompanhadas de 3 componentes rotacionais em torno dos mesmos eixos. Nesse caso, a solicitação genérica pode também ela ser decomposta em 3 componentes de força acompanhadas de 3 componentes de momento, tal como se ilustra na Figura 5.16.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-210_357_1223_1962_421.jpg)
Figura 5.16: Graus de liberdade de uma sapata rígida: a) deslocamentos e rotações; b) forças e momentos (adaptado de Andersen \& Clausen (2008)).

Admitindo as sapatas como corpos rígidos, considere-se que os deslocamentos e rotações das diferentes fundações são coligidos no vetor $\{u(\omega)\}_{r}$, ao passo que as forças e momentos se reúnem no vetor $\{P(\omega)\}_{r}$. A seguinte relação pode então ser estabelecida entre os dois vetores:

$$
\begin{equation*}
\{u(\omega)\}_{r}=[H(\omega)]\{P(\omega)\}_{r} \tag{5.41}
\end{equation*}
$$

em que a matriz $[H(\omega)]$ é a impedância do sistema de fundações, sendo uma matriz quadrada de dimensão 6nx6n, em que n é o número de fundações considerado. Note--se que devido à continuidade do meio propiciada pelo solo de fundação, a matriz $[H(\omega)]$ é uma matriz cheia, a qual redunda em uma matriz em banda caso tal efeito seja negligenciado.

Por sua vez, a matriz $[H(\omega)]$ é determinada tendo em conta a matriz $[\mathrm{G}]$ (ver expressão [5.40]), bem como as restrições impostas pelo comportamento de corpo rígido de cada uma das fundações individuais. Este último efeito é traduzido pela matriz [R], a qual permite a condensação da matriz [G] de tal modo que:

$$
\begin{equation*}
[H(\omega)]_{6 n \times 6 n}^{-1}=[R]_{6 n \times 3 m} \times[G(\omega)]_{3 m \times 3 m}^{-1} \times[R]_{6 n \times 3 m}^{T} \tag{5.42}
\end{equation*}
$$

em que n é o número de fundações e m é o número de pontos de colocação (ou de subelementos) que são considerados na discretização da superfície de contato entre o sistema de fundações e o solo.

A relação [5.42] está expressa em função da inversa da matriz [H] dado que é a rigidez dinâmica do sistema de fundações que é considerada no formalismo de incorporação da interação solo-estrutura (ver equação [5.28]).

No que se refere à matriz de condensação, matriz [R], compete referir que a mesma depende apenas do número de subelementos em que foi dividida a superfície de contato de cada fundação e da distância entre os pontos de colocação e os baricentros de cada fundação. Note-se que esta matriz tem apenas como função garantir a compatibilidade de deslocamentos imposta pela condição de corpo rígido. Sua dedução, embora simples, não é apresentada aqui, podendo ser consultada em obras de referência tais como Andersen, L. [201], Wolf, J.P. [210], [211], entre outras.

Breve nota sobre o aumento da eficiência computacional
A solução agora apresentada pode acarretar um custo computacional significativo. Porém, esse esforço pode ser consideravelmente reduzido atendendo a alguns aspectos, em particular:

- A discretização da interface fundações-solo deverá ser efetuada considerando todos os subelementos com a mesma dimensão. Nesse caso, é fácil tirar partido das relações de reciprocidade das funções de Green, o que permite uma redução muito significativa do esforço computacional;
- O tensor das funções de Green pode ser calculado em um sistema de coordenadas cilíndrico e posteriormente transformado para um sistema cartesiano $\left(\mathrm{k}_{1}, \mathrm{k}_{2}\right)$.

Nesse caso o cálculo do tensor terá de ser efetuado apenas ao longo de um eixo $\left(\mathrm{k}_{\mathrm{r}}\right)$. Informação sobre este aspecto pode ser consultada em Sheng et al. (1999)
- No caso de fundações de um mesmo edifício apresentarem distância muito significativa, poderá ser negligenciado, entre essas fundações, o efeito de acoplamento propiciado pelo solo de fundação.

Alternativamente ao processo proposto, no qual a discretização da interface fundação-solo é definida através de uma malha quadrangular, é possível reduzir o esforço computacional através da consideração de pequenas superfícies de geometria circular. Nesse caso, a dupla integração presente em [5.40] é substituída por uma integração simples, em concordância com a transformada inversa de Hankel. Informação detalhada sobre este procedimento é apresentada por Andersen \& Clausen (2008).

### 5.4.5.3 Cálculo da impedância através de modelos discretos condensados

Breve descrição do conceito
Como ilustrado na seção anterior, o problema de interação dinâmica solo-estrutura pode ser tratado e avaliado por meio de modelos numéricos de elevada complexidade, tais como o MEF, o MEC, o MSF, ou, preferencialmente, dadas as particularidades dos diferentes sistemas, através da combinação dos diferentes métodos. Esses métodos apresentam elevada precisão e versatilidade. Podem ser aplicados a diferentes condições geométricas e materiais e incorporar heterogeneidades materiais ou geométricas no maciço de fundação. Contudo, mesmo considerando as simplificações inerentes à solução apresentada na seção anterior, o custo computacional acarretado por tais modelos é significativo, o que por vezes torna difícil a sua aplicação em um contexto prático. Ainda a este respeito, compete referir que em muitos problemas referentes à interação dinâmica solo-estrutura, o objeto de interesse não é propriamente a resposta detalhada do elemento estrutural que se encontra em contato com o solo, mas sim a implicação que os efeitos de interação possam ter em um outro elemento [213]. Ora, nesses casos, e atendendo aos diferentes parâmetros que condicionam a resposta do elemento de interesse, é suficiente, pelo menos para efeitos práticos, que os aspectos essenciais dos efeitos de interação solo-estrutura sejam atendidos em detrimento do rigor absoluto da solução.

Considerando os fatos mencionados, em diversas situações a interação dinâmica solo-estrutura pode ser representada por modelos discretos condensados (tradução livre da autora de "lumped-parameter model"), que permitem um grande ganho de eficiência computacional, embora com perda de precisão da solução.

Entende-se por modelo discreto condensado um sistema físico simples constituído por poucos graus de liberdade, o qual procura de alguma forma representar o comportamento dinâmico do terreno de fundação. A ideia básica desses modelos consiste em representar um problema complexo (impedância do sistema de fundações, por exemplo), através de um sistema mecânico simples constituído por um pequeno conjunto de elementos discretos, sejam estes molas, massas concentradas ou amortecedores. Andersen, L. [214] oferece uma visão geral interessante da analogia do problema através da Figura 5.17.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-213_696_1492_740_286.jpg)
Figura 5.17: Representação esquemática da analogia dos modelos discretos condensados: a) situação real; b) modelo detalhado; c) modelo simplificado considerando os efeitos de interação solo-estrutura através de um modelo discreto condensado (adaptado de [214]).

Suponha-se que o objetivo da análise da estrutura representada na Figura 5.17 se centra na resposta dinâmica da torre. Como é evidente, a análise pode ser conduzida através de um modelo complexo como o representado na Figura 5.17b, onde toda a geometria da torre é atendida, bem como a interação dinâmica entre a fundação e o solo subjacente, sendo este estratificado. Alternativamente, a análise dinâmica pode ser desenvolvida de modo mais econômico, considerando uma formulação de elementos finitos de barra para simular o comportamento da torre, incorporando os efeitos de interação solo-estrutura através da consideração de uma mola e de um amortecedor. Como é evidente, o modelo representativo da dinâmica do solo de fundação agora considerado é bastante limitado, considerando desprezível qualquer efeito inercial no solo de fundação. No entanto, não deixa de ser uma aproximação ao problema real, tal como também o é o modelo de Winkler utilizado para analisar a resposta de vigas em apoio elástico. Este último caso corresponde também ele a um modelo discreto condensado, no qual se supõe que o comportamento do solo seja representado por um conjunto de molas.

Como os modelos discretos condensados aproximam soluções complexas por meio de modelos físicos simples, existem diferentes tipos de modelos, sendo o leitor interessado nesses modelos convidado a consultar a seguinte bibliografia: [211], [214], [215], [216], [217], [218], [219].

Modelos discretos condensados: modelo simples e modelo cauda de macaco Como anteriormente referido existem vários tipos de modelos que se enquadram na presente classe. Independentemente da tipologia do modelo, o objetivo final consiste, em geral, em obter para cada fundação isolada, tida como rígida e sem massa, uma matriz que relacione os graus de liberdade com as forças atuantes, com base na analogia da sapata como um corpo rígido (ver Figura 5.16). Desse modo, a relação deslocamento-força é, em geral, estabelecida em termos de rigidez dinâmica sendo por isso, para uma sapata isolada, dada por:

$$
\begin{equation*}
\{P(\omega)\}_{\text {sapata }}=\left[K_{\text {dyn }}(\omega)\right]_{\text {sapata }} \times\{u(\omega)\}_{\text {sapata }} \tag{5.43}
\end{equation*}
$$

Em que o vetor $\{u(\omega)\}$ corresponde a:

$$
\begin{equation*}
\{u(\omega)\}_{\text {sapata }}=\left\{u_{x}, u_{y}, u_{z}, \theta_{x}, \theta_{y}, \theta_{z}\right\} \tag{5.44}
\end{equation*}
$$

Ao passo que o vetor das forças atuantes está organizado da seguinte forma:

$$
\begin{equation*}
\{P(\omega)\}_{\mathrm{sapata}}=\left\{P_{x}, P_{y}, P_{z}, M_{x}, M_{y}, M_{z}\right\} \tag{5.45}
\end{equation*}
$$

De um modo genérico, a matriz de rigidez dinâmica da fundação é uma matriz cheia, existindo acoplamento entre as diferentes componentes do movimento. Contudo, considerando que a fundação é superficial e que o momento de inércia da fundação relativamente aos seus eixos principais de inércia tem valor invariante (caso de sapatas circulares ou quadradas), então alguns dos termos de acoplamento desaparecem dando origem a uma matriz com a seguinte configuração:

$$
\begin{equation*}
\left[K_{\text {dyn }}(\omega)\right]_{\text {sapata }}=\left[\begin{array}{cccccc}
K_{\mathrm{hh}} & 0 & 0 & 0 & -K_{\mathrm{xh}} & 0 \\
0 & K_{\mathrm{hh}} & 0 & K_{\mathrm{xh}} & 0 & 0 \\
0 & 0 & K_{\mathrm{vv}} & 0 & 0 & 0 \\
0 & K_{\mathrm{xh}} & 0 & K_{\mathrm{xx}} & 0 & 0 \\
-K_{\mathrm{xh}} & 0 & 0 & 0 & K_{\mathrm{xx}} & 0 \\
0 & 0 & 0 & 0 & 0 & K_{\mathrm{zz}}
\end{array}\right] \tag{5.46}
\end{equation*}
$$

Note-se que devido às restrições anteriormente impostas os termos de rigidez de translação no plano horizontal são iguais nas duas direções, bem como os termos de rotação em torno dos eixos inscritos na superfície do maciço. O sinal negativo
que surge em alguns termos de acoplamento resulta apenas da convenção de eixos adotada.

Relativamente aos termos de acoplamento de rotação-translação, cabe referir que no contexto dos estudos elaborados pela autora não se revelaram condicionantes, tal como discutido por Andersen \& Clausen (2008), embora outros autores apontem no sentido contrário [219] caso a fundação esteja embebida no terreno. Assim sendo, no presente contexto, admitiu-se o efeito desacoplado desses movimentos, o que permite substituir a matriz anteriormente apresentada por uma matriz diagonal.

No caso de uma solicitação estática, os termos da matriz de rigidez dinâmica são, naturalmente, grandezas reais e independentes da frequência. No entanto, face a uma solicitação dinâmica, os efeitos inerciais desenvolvidos no maciço levam a que se verifique dependência dos termos face à frequência de oscilação. Além disso, como o maciço geotécnico é usualmente considerado como um meio semi-infinito, os efeitos de amortecimento (seja por radiação ou amortecimento material no próprio solo) levam a que as grandezas em causa resultem em entidades complexas.

A formulação mais simples de um modelo discreto condensado passa pela representação da impedância do terreno através de um sistema constituído por três coeficientes, tal como ilustrado na Figura 5.18. Os parâmetros ilustrados na Figura 5.18 têm o seguinte significado: K representa a rigidez estática, M uma massa fictícia e C um coeficiente de amortecimento viscoso, também este sem correspondência com uma grandeza física. Note-se que os parâmetros M e C têm apenas como finalidade permitir um ajuste da impedância da fundação em função da frequência de excitação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-215_352_963_1820_553.jpg)
Figura 5.18: Modelo discreto condensado simples: a) realidade física; b) formulação esquemática do modelo (adaptado de [219]).

Segundo Wolf (1994), para uma fundação circular, C e M são dados respectivamente por:

$$
\begin{align*}
C & =\frac{r_{0}}{C_{s}} \gamma K  \tag{5.47}\\
M & =\frac{r_{0}^{2}}{C_{s}^{2}} \mu K \tag{5.44}
\end{align*}
$$

Em que $\gamma$ e $\mu$ são coeficientes adimensionais, K é a rigidez estática, $\mathrm{C}_{\mathrm{s}}$ é a velocidade de propagação das ondas de cisalhamento no solo de fundação e $\mathrm{r}_{0}$ é o raio equivalente da fundação. No Quadro 5.1 são apresentados valores para os coeficientes adimensionais e para os coeficientes de rigidez estática atendendo ao cenário de fundação circular.

Quadro 5.1: Parâmetros do modelo discreto condensado simples.
| Movimento | $K$ | $\gamma$ | $\mu$ |
| :--- | :--- | :--- | :--- |
| Horizontal | $\frac{8 G_{s} r_{0}}{2-\nu}$ | 0,58 | 0,095 |
| Vertical | $\frac{4 G_{s} r_{0}}{2-\nu}$ | 0,85 | 0,27 |
| Rotacional | $\frac{8 G_{s} r_{0}^{3}}{3(1-\nu)}$ | 0,30 | 0,24 |
| Torsional | $\frac{16 G_{s} r_{0}^{3}}{3}$ | 0 | 0,045 |


Nota: $\mathrm{G}_{\mathrm{s}}$ corresponde ao módulo de cisalhamento do solo e $\nu$ ao coeficiente de Poisson do solo.
No caso de fundações não circulares, estas podem ser assemelhadas a fundações circulares, bastando para isso considerar um valor de raio equivalente, o qual será distinto conforme o movimento em análise corresponda a translação ou a rotação.

Atendendo aos parâmetros agora indicados, os termos de rigidez dinâmica indicados na matriz [5.46] podem então ser formulados do seguinte modo:

$$
\begin{equation*}
Z_{j j}(\omega)=K_{j j}-\omega^{2} M_{j j}+i \omega C_{j j} \tag{5.49}
\end{equation*}
$$

Dado que os termos de massa e amortecimento estão formulados em função da rigidez (ver expressões [5.47] e [5.48]), então, após alguma manipulação matemática é possível reproduzir a rigidez dinâmica por:

$$
\begin{equation*}
Z_{j j}(\omega)=K_{j j}\left[k_{j j}\left(a_{0}(\omega)\right)+i a_{0}(\omega) c_{j j}\left(a_{0}(\omega)\right)\right] \tag{5.50}
\end{equation*}
$$

Em que $\mathrm{a}_{0}$ corresponde à frequência adimensional, dada por:

$$
\begin{equation*}
a_{0}(\omega)=\frac{\omega r_{0}}{C_{s}} \tag{5.51}
\end{equation*}
$$

Comparando as expressões [5.50] e [5.49], facilmente se conclui que os termos de coeficientes de rigidez e amortecimento (k e c), são dados, respectivamente, por:

$$
\begin{gather*}
k_{j j}\left(a_{0}\right)=1-\mu_{j j} a_{0}^{2}  \tag{5.52}\\
c_{j j}\left(a_{0}\right)=\gamma_{j j} \tag{5.53}
\end{gather*}
$$

Como se pode notar, neste modelo simples, o termo de amortecimento é uma constante, o que leva a uma representação pobre dos efeitos de amortecimento por radiação [201], [213]. A este respeito, compete aqui referir que os termos de amortecimento contemplados no modelo discreto agora proposto têm apenas como objetivo representar os efeitos de amortecimento por radiação, negligenciando os efeitos de dissipação energética no solo, ou seja o amortecimento material. No entanto, a expressão [5.50] pode ser adaptada para atender a tais efeitos, dando, nesse caso, origem à seguinte representação matemática da rigidez dinâmica, na qual $\beta$ representa o amortecimento histerético do solo:

$$
\begin{equation*}
Z(\omega)=K\left[k\left(a_{0}(\omega)\right)+i a_{0}(\omega)\left(c\left(a_{0}(\omega)\right)+\frac{2 \beta}{a_{0}(\omega)} k\left(a_{0}(\omega)\right)\right)\right] \tag{5.54}
\end{equation*}
$$

Como anteriormente referido, o modelo agora apresentado prima pela sua simplicidade, a qual tem como efeito pernicioso a perda de qualidade da solução com o aumento da frequência de excitação. Com o objetivo de contornar essas limitações do modelo, diversas melhorias têm sido propostas dentro da filosofia dos modelos discretos condensados. Dentro das diferentes propostas, e fazendo um balanço entre simplicidade e precisão, destaca-se o modelo de cauda de macaco (tradução livre da autora de "monkey-tail model"), o qual adiciona um grau de liberdade interno ao próprio modelo discreto condensado, tal como se observa na Figura 5.19.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-217_395_1227_1599_421.jpg)
Figura 5.19: Modelo cauda de macaco: a) realidade física; b) formulação esquemática do modelo (adaptado de [219]).

Partindo da representação esquemática ilustrada na Figura 5.19, constata-se que o modelo agora considerado é representado pela rigidez estática do solo de fundação acompanhada de quatro parâmetros de ajuste: $\mathrm{M}_{0}, \mathrm{M}_{1}, \mathrm{C}_{0}$ e $\mathrm{C}_{1}$. Tal como no modelo anterior, estes parâmetros de ajuste são formulados em função da rigidez estática do solo de fundação, sendo dados por:

$$
\begin{equation*}
C_{0}=\frac{r_{0}}{C_{s}} \gamma_{0} K \tag{5.55}
\end{equation*}
$$

$$
\begin{align*}
M_{0} & =\frac{r_{0}^{2}}{C_{s}^{2}} \mu_{0} K  \tag{5.56}\\
C_{1} & =\frac{r_{0}}{C_{s}} \gamma_{1} K  \tag{5.57}\\
M_{1} & =\frac{r_{0}^{2}}{C_{s}^{2}} \mu_{1} K \tag{5.58}
\end{align*}
$$

Em que $\gamma_{0}, \gamma_{1}, \mu_{0}$ e $\mu_{1}$ são as constantes de ajuste indicadas no Quadro 5.2, as quais agora passam a ser dependentes do coeficiente de Poisson do solo de fundação, $\nu$, tal como sugerido por Wolf (1994).

Quadro 5.2: Parâmetros do modelo condensado do tipo cauda de macaco.
| Movimento | $\gamma_{0}$ | $\gamma_{1}$ | $\mu_{0}$ | $\mu_{1}$ |
| :--- | :--- | :--- | :--- | :--- |
| Horizontal | $0,78-0,4 \nu$ | - | - | - |
| Vertical | 0,8 | $0,34-4,3 \nu^{4}$ | 0 se $\nu<\frac{1}{3}$ $0,9\left(\nu-\frac{1}{3}\right) \text { se } \nu>\frac{1}{3}$ | $0,4-4 \nu^{4}$ |
| Rotacional | - | $0,42-0,3 \nu^{2}$ | 0 | $0,34-0,2 \nu^{2}$ |
| Torsional | 0,017 | 0,291 | $0,16\left(\nu-\frac{1}{3}\right)$ | 0,171 |


Como é notório no Quadro 5.2, para alguns tipos de movimento não são conhecidos valores dos coeficientes adimensionais. Contudo, dada a total independência dos termos que constituem a matriz [5.46], uma alternativa passa por adotar o modelo discreto condensado simples anteriormente apresentado para esses casos em que não é possível a aplicação do modelo de cauda de macaco. Aliás, como se mostrará em um capítulo posterior, foi essa a estratégia adotada pela autora do presente trabalho.

Formulando o modelo no domínio da frequência, os termos de rigidez dinâmica contemplados na matriz [5.46] podem então ser avaliados seguindo um formato em tudo igual ao apresentado na expressão [5.54], sendo que a única diferença reside na formulação dos termos de rigidez e amortecimento, k e c, os quais são agora dados por:

$$
\begin{gather*}
k_{j j}\left(a_{0}(\omega)\right)=1-\frac{\mu_{1, j j} a_{0}(\omega)^{2}}{1+\frac{\mu_{1, j j}^{2}}{\gamma_{1, j j}^{2}} a_{0}(\omega)^{2}}-\mu_{0} a_{0}(\omega)^{2}  \tag{5.59}\\
c_{j j}\left(a_{0}(\omega)\right)=\frac{\mu_{1, j j}}{\gamma_{1, j j}} \frac{\mu_{1} a_{0}(\omega)^{2}}{1+\frac{\mu_{1, j j}^{2}}{\gamma_{1, j j}^{2}} a_{0}(\omega)^{2}}+\gamma_{0, j j} \tag{5.60}
\end{gather*}
$$

Comparando as expressões agora apresentadas com as homólogas apresentadas para o modelo discreto condensado simples, observa-se que sua complexidade é substancialmente superior e que o termo de amortecimento passa a ser dependente da frequência, contornando assim uma das deficiências encontradas nos modelos mais simples. No entanto, deve-se enfatizar que os modelos em causa apenas procuram ajustar a solução teórica da impedância da fundação para um cenário simples correspondente a uma fundação superficial fundada em um meio homogêneo semi-infinito.

Um estudo comparativo da qualidade da solução obtida por estes dois modelos foi realizado por Ibsen \& Liingaard (2006), o qual se reproduz parcialmente na Figura 5.20. Na referida figura, os resultados obtidos por cada um dos modelos anteriormente apresentados são confrontados com a solução teórica proposta por Valetsos e Tang [220].

Como se pode verificar, a qualidade da solução obtida pelo modelo cauda de macaco é indubitavelmente superior à obtida pelo modelo simples. O aumento de qualidade da solução é especialmente notório com o aumento da frequência de excitação. Esse fato deve-se à inclusão de um grau de liberdade adicional no modelo de cauda de macaco, o qual permite uma melhor reprodução dos efeitos de amortecimento geométrico.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-219_671_1742_1514_159.jpg)
Figura 5.20: Rigidez dinâmica vertical de uma fundação circular: a) módulo da rigidez dinâmica normalizado; b) ângulo de fase.

### 5.5 Exemplo de aplicação

### 5.5.1 Descrição geral

Como nas etapas anteriores deste trabalho, a presente seção tem como objetivo apresentar um estudo desenvolvido com o intuito de ilustrar as potencialidades do modelo de cálculo proposto nas seções anteriores.

O exemplo de aplicação corresponde a um caso simples, mas com características de generalidade suficientes para permitir ilustrar os principais aspectos do procedimento explanado anteriormente. No capítulo posterior será evidenciada a capacidade do modelo desenvolvido para lidar com cenários mais complexos.

Conforme ilustrado na Figura 5.21, considera-se a presença de um túnel ferroviário superficial embebido em um meio homogêneo e semi-infinito com as propriedades indicadas na figura. O túnel, de geometria circular, apresenta um diâmetro de 6,0 m, sendo a espessura do revestimento interior em concreto de 0,3 m. As propriedades mecânicas do revestimento do túnel e do invert são também indicadas na Figura 5.21.

Atendendo à simetria geométrica e mecânica do sistema, apenas metade do domínio foi simulada, como se pode observar na Figura 5.22, onde se mostra a malha de elementos finitos e PML's adotada para a simulação da seção transversal.

Quanto à via, assume-se que é constituída por uma laje contínua em concreto com 0,3 m de espessura e 2,5 m de largura, com rigidez à flexão longitudinal de $1,62 \times 10^{8}$ $\mathrm{N} / \mathrm{m}^{2}$ e massa por unidade de comprimento de $2800 \mathrm{~kg} / \mathrm{m}$. A via em laje está apoiada sobre uma manta resiliente, muito rígida, com uma rigidez de $2 \times 10^{9} \mathrm{~N} / \mathrm{m}^{3}$ e um amortecimento viscoso de $2,25 \times 10^{4} \mathrm{Ns} / \mathrm{m}^{3}$. Os trilhos, materializados com perfis UIC 60, estão continuamente apoiados em palmilhas elásticas com uma rigidez de $2,5 \times 10^{8}$ $\mathrm{N} / \mathrm{m}^{2}$ e um coeficiente de amortecimento de $6 \times 10^{4} \mathrm{Ns} / \mathrm{m}^{2}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-220_821_1492_1589_289.jpg)
Figura 5.21: Geometria e propriedades do exemplo de aplicação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-221_802_969_115_550.jpg)
Figura 5.22: Malha de elementos finitos (2.5D MEF-PML) adotada para modelar a seção transversal do sistema túnel maciço.

Admite-se ainda a presença, na vizinhança do túnel, de um pequeno edifício de dois pavimentos, com a geometria ilustrada na Figura 5.23. O edifício está fundado em sapatas quadradas com uma área de $2 \times 2 \mathrm{~m}^{2}$. O alinhamento dos pilares do edifício mais afastados encontra-se a 20 m de distância do plano de simetria da seção transversal do túnel, sendo ainda de referir que os pontos centrais das lajes do edifício têm a coordenada $\mathrm{x}=0 \mathrm{~m}$. Quanto aos elementos estruturais, admitiu-se que todos os pilares têm seção quadrada, com 0,25 m de dimensão, que as vigas têm dimensão de $0,25 \times 0,50 \mathrm{~m}^{2}$ e que as lajes têm $0,25 \mathrm{~m}$ de espessura.

Considerou-se ainda que todos os elementos são materializados em concreto, com um módulo de deformabilidade de 30 GPa.

Relativamente ao amortecimento do edifício, foi adotado o modelo de Rayleigh, tendo sido os fatores de amortecimento ajustados para garantir um coeficiente de amortecimento de cerca de 2 \% na faixa de frequências entre os 5 e os 80 Hz.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-222_902_964_119_549.jpg)
Figura 5.23: Geometria do edifício.

Quanto ao material rodante, considerou-se a passagem do trem Alfa-Pendular à velocidade de 40 m/s (144 km/h). Por simplicidade, apenas se considerou, além da distribuição do peso pelos diferentes eixos do trem, a contribuição da massa não suspensa na avaliação da ação dinâmica veículo-via. Desse modo, admitiu-se uma carga por eixo de 132 kN e uma massa não suspensa de 1650 kg. A Figura 5.24 permite visualizar a geometria do trem Alfa-Pendular.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-222_305_1487_1608_289.jpg)
Figura 5.24: Geometria do trem Alfa-Pendular.

Quanto ao perfil de irregularidades, gerou-se um perfil aleatório com comprimentos de onda compreendidos entre 28 m e 0,55 m, com base na equação de densidade espectral de potência (PSD) anteriormente apresentada (ver equação [5.10]). Na geração em causa tomou-se o valor de $1 \times 10^{-8} \mathrm{~m}^{3} / \mathrm{rad}$ para o parâmetro $\mathrm{S}\left(\mathrm{k}_{\mathrm{x}, 0}\right)$.

### 5.5.2 Resposta dinâmica da via férrea

A Figura 5.25 apresenta a velocidade vertical de vibração do trilho, na posição $\mathrm{x}=0 \mathrm{~m}$, durante a passagem do trem Alfa-Pendular à velocidade de 40 m/s sobre a via férrea com o perfil de irregularidades atrás definido. Considerou-se que no instante $\mathrm{t}=0 \mathrm{~s}$ o último eixo do trem ocupa a posição geométrica definida por $\mathrm{x}=0 \mathrm{~m}$. Tanto no registro temporal como na representação no domínio da frequência encontram-se sobrepostos
os resultados provenientes do cálculo considerando a excitação total (mecanismos quase estático e dinâmico) e os resultados oriundos de um cálculo em que apenas se atende à excitação quase estática.

Como se pode verificar, a passagem de cada um dos eixos do trem é claramente perceptível no registro temporal, o qual exibe uma resposta praticamente uniforme para todos os eixos (Figura 5.25a). Por outro lado, a consideração apenas da excitação quase estática conduz a valores de pico da velocidade vertical muito semelhantes aos obtidos considerando a excitação total, concluindo-se portanto que o primeiro mecanismo é determinante para a resposta dos elementos da via férrea. Esse fato também se encontra bem patente no registro no domínio da frequência (Figura 5.25b), onde se pode constatar que o maior conteúdo em frequência da resposta ocorre no intervalo 0-40 Hz, faixa de frequências dominada pelo mecanismo de excitação quase estático. Para frequências superiores a 60 Hz, o mecanismo de excitação dinâmica tem preponderância sobre o quase estático, embora a energia associada a esta faixa de frequências seja diminuta face à faixa de frequências mais baixa.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-223_707_1749_1276_157.jpg)
Figura 5.25: Velocidade vertical do trilho: a) registro temporal; b) conteúdo em frequência.

### 5.5.3 Resposta dinâmica do campo livre induzida pela passagem do trem

Se o conhecimento do comportamento dinâmico da via férrea face à passagem do trem é um aspecto importante no âmbito da Engenharia Ferroviária, não menos relevante é a avaliação das vibrações que se propagam pelo maciço de fundação e se transmitem aos edifícios presentes nas imediações da infraestrutura ferroviária.

Nesta seção analisam-se as vibrações induzidas pelo tráfego ferroviário nas proximidades da via férrea, admitindo que não existe qualquer edificação (condição de campo livre). Para o efeito consideram-se dois pontos de observação localizados na superfície do terreno e pertencentes à seção transversal definida por $\mathrm{x}=0 \mathrm{~m}$, encon-
trando-se o ponto E inscrito no plano de simetria do túnel e o ponto F a 20 m desse mesmo plano.

A resposta dinâmica do campo livre é obtida através do conhecimento das funções de transferência do sistema via-túnel-maciço (assunto abordado no Capítulo 3) e das forças de interação dinâmica resultantes do problema de interação veículo-via.

A Figura 5.26 mostra o registro temporal da velocidade vertical nos dois pontos de observação considerados.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-224_727_1750_675_154.jpg)
Figura 5.26: Velocidade vertical dos pontos localizados na superfície do terreno (condição de campo livre): a) Ponto E; b) Ponto F.

Uma visão geral dos resultados permite concluir que o aumento da distância do ponto de observação em relação ao túnel é acompanhado por uma redução na velocidade de resposta na direção vertical. Esta atenuação da amplitude da velocidade vertical com o acréscimo da distância à fonte de excitação era esperada e deve-se aos mecanismos de amortecimento, tanto geométrico como material. Embora não seja aqui ilustrado, este efeito é mais pronunciado para o conteúdo de frequências mais elevado do que para a faixa de frequências baixas; isso se deve ao amortecimento material, já que a componente geométrica do amortecimento é independente da frequência de excitação. Este aspecto será devidamente detalhado em um capítulo posterior da presente tese.

Comparando a configuração dos registros temporais representados na Figura 5.26 com o registro referente ao ponto de observação localizado na via (Figura 5.25a), há dois aspectos que merecem comentário: i) nos pontos localizados na vizinhança da via a passagem dos eixos do trem deixa de ser identificada; este efeito deve-se essencialmente à inversão de predominância dos mecanismos, ou seja, a resposta dinâmica nos pontos localizados na superfície do terreno é condicionada, principalmente, pelo mecanismo de excitação dinâmica, sendo a contribuição do mecanismo
de excitação quase estático diminuta e confinada à faixa de frequências mais baixa; ii) os registros temporais em pontos na proximidade da via são mais longos, fazendo-se sentir a vibração livre do maciço após a passagem do último eixo do trem pela seção de referência.

De fato, um aspecto interessante dos registros temporais apresentados (Figura 5.26) diz respeito à sua duração. Com efeito, o aumento da distância entre a fonte e o receptor é acompanhado por um aumento da duração do evento, sendo o efeito da passagem do trem perceptível mesmo antes do primeiro eixo do trem atingir a seção transversal onde se insere o ponto de observação.

### 5.5.4 Resposta dinâmica do edifício

A resposta dinâmica do edifício é avaliada considerando a resposta dinâmica do campo livre "fictício" nos pontos correspondentes à localização das fundações do edifício, a impedância do solo de fundação e as características dinâmicas da própria estrutura. A resposta dinâmica na superfície do maciço, na condição de campo livre, devido à passagem do trem é obtida através da abordagem ilustrada na seção anterior. Por sua vez, a impedância do solo de fundação é avaliada usando as matrizes de transferência e o método dos elementos de contorno anteriormente apresentado. Admite-se que a presença do edifício não afeta a fonte de geração de vibração, ou, dito de outra forma, que a presença do edifício não tem implicação no problema de interação dinâmica veículo-via. Atendendo aos pressupostos e simplificações enunciados e justificados, a resposta dinâmica do edifício induzida pela passagem do trem é obtida através da aplicação da metodologia subestruturada explanada na Seção 5.4 do presente capítulo.

Na análise efetuada a seguir consideram-se como pontos de observação, os pontos centrais das lajes e a sapata indicada pela letra A na Figura 5.21. A abordagem incide sobretudo na resposta dinâmica do edifício na direção vertical, embora se teçam algumas considerações quanto à resposta na direção horizontal.

As propriedades dinâmicas do edifício influenciam a resposta dinâmica do sistema, incluindo a própria resposta do terreno, como aliás foi devidamente discutido em seção anterior do presente capítulo. Como é evidente esse efeito é mais pronunciado junto às fundações, diminuindo com o aumento da distância relativamente à edificação, razão pela qual se admite que a presença do edifício não afeta a fonte de geração de vibrações. Contudo, tal efeito existe, pois, caso tal não ocorresse, a resposta do campo livre no ponto correspondente ao centro de uma sapata teria de ser, obrigatoriamente, igual à resposta dinâmica da própria sapata. Na verdade, tal fato não se verifica,
podendo ser facilmente percebido pela inspeção da Figura 5.27 onde o conteúdo em frequência da velocidade de resposta na direção vertical da fundação A é comparado com a velocidade vertical avaliada na mesma localização mas admitindo a condição de campo livre.

Analisando a Figura 5.27 verifica-se que para frequências até os 17 Hz a velocidade vertical registrada para a fundação é praticamente igual à velocidade vertical do campo livre. Em termos práticos, esta constatação significa que a presença do edifício pode ser negligenciada para frequências até esse valor, dado que as suas características dinâmicas não alteram a resposta do sistema. Note-se no entanto que, para frequências mais elevadas, a estrutura funciona como um "filtro", sendo responsável por uma atenuação da resposta dinâmica quando comparada com a resposta em campo livre.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-226_579_702_970_683.jpg)
Figura 5.27: Conteúdo em frequência da velocidade vertical experimentada na fundação A, e nessa mesma localização em condição de campo livre.

A Figura 5.28 mostra o registro temporal da velocidade vertical nos três pontos de observação considerados no presente estudo. Atentando agora na resposta dinâmica dos pontos localizados no centro das lajes do edifício, cabe um primeiro comentário: os valores de pico da velocidade vertical nesses pontos são superiores aos obtidos na fundação do edifício. Observa-se igualmente uma amplificação da resposta, e por conseguinte dos valores de pico da velocidade vertical, à medida que aumenta a altura do pavimento do edifício. Refira-se ainda que a observação do registro temporal permite antecipar a ocorrência de uma alteração do conteúdo de frequências dominantes na resposta em função do ponto de observação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-227_1137_1487_119_289.jpg)
Figura 5.28: Registro temporal das velocidades verticais experimentadas nos três pontos de observação: a) fundação A; b) ponto central da laje do 1º pavimento; c) ponto central da laje do 2º pavimento.

Na Figura 5.29 a velocidade vertical dos diferentes pontos de observação é representada no domínio da frequência. A partir da análise do conteúdo em frequência da resposta dinâmica dos pontos inscritos nas lajes do edifício, é possível constatar a ocorrência de uma alteração significativa das frequências dominantes quando o registro é comparado com o observado na fundação. Com efeito, a resposta no primeiro e segundo pavimentos é dominada pelas frequências próximas de 18 Hz e 17 Hz, respectivamente. A predominância dessas frequências na resposta é justificada pelo comportamento dinâmico do edifício considerado. Procedendo a uma análise dos modos de vibração da estrutura do edifício e das frequências naturais que lhes estão associadas, considerando para o efeito que o deslocamento nas suas fundações se encontra impedido, verifica-se que os 6º e 7º modos implicam o movimento vertical das lajes e estão associados a frequências naturais de 17,54 Hz e 19,16 Hz.

As configurações destes modos de vibração da estrutura encontram-se ilustradas na Figura 5.30. Como seria esperado, a consideração da flexibilidade dinâmica da fundação implica um ligeiro desvio das frequências naturais para valores mais baixos; acrescente-se que é também esperado um efeito de amortecimento devido à radiação de energia pelo maciço de fundação (este aspecto, o qual merece uma reflexão
profunda, é alvo de um estudo detalhado no Capítulo 6). Portanto, a amplificação da resposta dinâmica em torno das frequências mencionadas anteriormente é explicada pelas características dinâmicas do edifício.

Comparando agora os resultados, em termos de velocidade vertical, da fundação do edifício com os obtidos para as lajes é ainda possível observar que, neste último caso, há uma atenuação do conteúdo em frequência da resposta, para frequências acima dos 25 Hz, o que é também uma consequência da justificação expressa acima.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-228_723_1755_664_155.jpg)
Figura 5.29: Comparação do conteúdo em frequência da velocidade vertical experimentada nos pontos de observação dos pavimentos face ao registro homólogo na fundação A: a) Pavimento 1; b) Pavimento 2.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-228_534_1503_1605_282.jpg)
Figura 5.30: Configuração dos modos de vibração do edifício que envolvem o movimento vertical das lajes: a) modo $6(\mathrm{f}=17,54 \mathrm{~Hz})$; b) modo $7(\mathrm{f}=19,16 \mathrm{~Hz})$.

Quanto à resposta dinâmica do edifício na direção horizontal, assunto que será objeto de estudo mais detalhado em capítulo posterior, refira-se, apesar de os resultados não serem aqui apresentados, que ocorre uma significativa redução da resposta nas lajes para frequências superiores a 6,5 Hz, o que resulta em uma diminuição do valor de pico da velocidade horizontal das lajes. Este efeito deve-se ao fato de os modos de vibração da estrutura que envolvem o movimento horizontal das lajes estarem associados a frequências naturais de valor mais baixo (inferiores a 5 Hz).

Face aos resultados obtidos pode afirmar-se que as propriedades dinâmicas da estrutura desempenham um importante papel na sua resposta face a excitações decorrentes do tráfego ferroviário.

### 5.5.5 Breves conclusões

O estudo apresentado teve como objetivo mostrar, de forma simples, as potencialidades do modelo de cálculo desenvolvido. Apesar da simplicidade do exemplo, as capacidades do modelo ficaram bem evidenciadas, uma vez que ele permite a análise integrada do problema desde a fonte até o receptor. Além disso, obtiveram-se algumas conclusões importantes que serviram de inspiração para os estudos realizados nos capítulos subsequentes, em particular:

i) Quanto à resposta do sistema via-túnel-maciço, concluiu-se que a resposta dinâmica da via férrea, na faixa de frequências de interesse, é praticamente dominada pelo mecanismo de excitação quase estático; por sua vez, a resposta dinâmica em pontos da superfície do maciço é condicionada, principalmente, pelo mecanismo de excitação dinâmica, registrando-se uma atenuação das vibrações à medida que aumenta a distância à fonte.
ii) Relativamente à resposta do edifício induzida pela passagem do trem, apesar da simplicidade da geometria adotada para o edifício que serviu de base ao estudo realizado, a análise efetuada permitiu concluir que as características dinâmicas da estrutura têm uma influência relevante na amplificação ou redução das vibrações que alcançam as suas fundações.

### 5.6 Considerações finais

No presente capítulo foi apresentada uma abordagem global para a simulação de vibrações induzidas por tráfego ferroviário em túneis. A metodologia proposta compreende a simulação da geração de vibrações, do mecanismo de propagação e do próprio receptor. Dada a complexidade da problemática em causa foi seguida uma estratégia de subestruturação do problema, usando técnicas distintas conforme as especificidades de cada uma das partes do domínio. Refira-se que o acoplamento entre o maciço e a estrutura adjacente é um dos aspectos fundamentais do modelo proposto.

O modelo proposto constitui deste modo uma ferramenta útil no apoio ao projeto de medidas de mitigação de vibrações induzidas pelo tráfego ferroviário em túneis. Através da realização de estudos paramétricos é possível discernir a influência dos diversos parâmetros intervenientes no problema e avaliar a eficiência de medidas de
mitigação nas vibrações percebidas no interior de edifícios, aspecto esse que será abordado no capítulo seguinte desta tese.

## 6 Estudo numérico integrado: desde a fonte até o receptor

### 6.1 Considerações iniciais

Nos capítulos precedentes apresentou-se um modelo abrangente que permite a simulação eficiente das vibrações induzidas pelo tráfego ferroviário desde a fonte (trem) até o receptor (edifício). O procedimento numérico adotado contempla as três vertentes do problema: a geração de vibrações, resultante da interação dinâmica veículo-via, a propagação das vibrações geradas através do meio envolvente, desde a fonte até o receptor, e a resposta dinâmica da estrutura, atendendo à interação dinâmica solo-estrutura. O modelo numérico é modular, adotando-se uma estratégia de subestruturação, correspondendo a cada parte do problema uma técnica de simulação diferente, conforme as especificidades do domínio em causa. Este tipo de formulação permite atingir elevados níveis de eficiência computacional, sendo extremamente vantajoso para a realização de estudos paramétricos, dado que possibilita que apenas parcelas do problema tenham de ser reanalisadas e não o problema na globalidade.

O modelo proposto para a previsão das vibrações induzidas por tráfego ferroviário em túneis constitui assim uma ferramenta muito útil para a concepção de novas infraestruturas, para uma melhor interpretação dos fenômenos em causa através de estudos paramétricos e, não menos importante, para a avaliação da eficiência de medidas de mitigação de vibrações induzidas por tráfego ferroviário subterrâneo.

No presente capítulo, com base na ferramenta numérica proposta, é desenvolvido um estudo integrado que contempla a interação veículo-via, a propagação de vibrações pelo meio envolvente e a recepção de vibrações no interior de edifícios próximos do túnel. Embora no capítulo precedente já se tenha apresentado um exemplo simples de tal aplicação, o estudo agora apresentado reveste-se de maior profundidade versando não só sobre a interpretação fenomenológica do problema mas também sobre a análise de engenharia das potencialidades de algumas medidas de mitigação passíveis de serem aplicadas em contexto realista.

Quanto à estrutura do estudo apresentado a seguir, começa-se por analisar o cenário base do estudo, com o qual se pretende, além de ilustrar as potencialidades do modelo de cálculo proposto nos capítulos anteriores, contribuir para um melhor entendimento do problema na sua globalidade. Assim sendo, não só a problemática da geração e propagação de vibrações induzidas pelo tráfego ferroviário no túnel é analisada, como também as consequências no interior de edificações vizinhas à
infraestrutura ferroviária, em particular em termos de vibrações induzidas em alguns pontos de observação. Deverá ser aqui enfatizado que a integração do acoplamento edifício-maciço de fundação constitui um dos aspectos fundamentais para uma simulação precisa do problema em questão.

Após a abordagem inicial do capítulo, com caráter mais interpretativo da fenomenologia fundamental, avança-se para um estudo com uma vertente mais técnica, visando a avaliação da eficiência de medidas de mitigação passíveis de serem aplicadas com o objetivo de minimizar as vibrações percebidas no interior de edifícios e decorrentes do tráfego no túnel. Como já discutido parcialmente no Capítulo 4, entre as várias medidas de mitigação de vibrações admissíveis, a introdução de elementos resilientes na via férrea, como é o caso das soluções de laje flutuante, constitui uma ação corretiva comum com elevada potencialidade prática, em boa parte decorrente do fato de a mitigação ocorrer na fonte, sem que seja necessário intervir em infraestruturas vizinhas à via férrea [123]. Na verdade, a presença desses elementos introduz uma frequência de corte na via, com uma atenuação das vibrações correspondentes à faixa de frequências mais elevada [44], [174], [175], [221], [222]. No entanto, este efeito de atenuação do conteúdo de frequência mais elevado é acompanhado por um aumento dos níveis de vibração na faixa de frequências mais baixas, que são muito relevantes para a análise das vibrações nos edifícios, pois podem coincidir com as faixas de frequência de ressonância dos seus elementos estruturais [110]. Embora este aspecto tenha sido objeto de estudo em diversos trabalhos de pesquisa [57], [110], [221], a generalidade dos estudos não teve em conta o comportamento dinâmico do edifício, portanto, as conclusões foram inferidas a partir da análise das vibrações no campo livre, não sendo esse o caso do presente estudo. Deste modo, o estudo desenvolvido tem como finalidade contribuir para uma melhor compreensão da eficiência dos sistemas de via em laje flutuante para a mitigação de vibrações em edifícios próximos de túneis ferroviários. No estudo elaborado, analisam-se diferentes sistemas de lajes flutuantes, sendo comparada a sua eficácia. Além disso, são convenientemente discutidos diversos aspectos relacionados com a concepção deste tipo de soluções de mitigação de vibrações.

Atendendo ainda às conclusões alcançadas no Capítulo 4, sentiu-se a necessidade de elaborar um estudo integrado que permitisse melhor discernir a influência da rigidez do maciço de fundação no comportamento do sistema. Com efeito, os estudos preliminares desenvolvidos no referido capítulo evidenciam que este é um dos parâmetros que mais influi no processo de propagação de vibrações em redor do túnel.

No entanto, quando a presença do edifício é tomada em consideração, é previsível que a rigidez do solo afete também o mecanismo de interação solo-estrutura. Assim, no presente capítulo, é desenvolvido um estudo paramétrico para avaliar a influência da rigidez do solo, não só no mecanismo de propagação de vibrações, mas também no mecanismo de interação solo-estrutura (edifício) e consequentemente nos níveis de vibração percebidos no interior dos edifícios existentes nas imediações da infraestrutura ferroviária.

O capítulo termina com um resumo das principais conclusões do estudo desenvolvido, tecendo-se algumas considerações finais.

### 6.2 Caso de estudo base

### 6.2.1 Descrição do cenário de referência

A presente seção tem como objetivo apresentar um estudo base desenvolvido com o intuito de permitir uma melhor compreensão global do problema das vibrações induzidas por tráfego ferroviário em túneis, consistindo por isso em um estudo integrado desde a fonte até o receptor (edifício).

Como ilustrado na Figura 6.1, considera-se a presença de um túnel ferroviário superficial embebido em um maciço geotécnico, tido como homogêneo e semi-infinito, com as propriedades indicadas na figura. O túnel, de geometria circular, apresenta um diâmetro de 6,0 m, sendo a espessura do revestimento interior em concreto de 0,3 m. As propriedades mecânicas do revestimento do túnel e do invert são também indicadas na Figura 6.1.

Tendo em conta a simetria geométrica e mecânica do sistema, apenas metade do domínio foi simulada, como se pode visualizar na Figura 6.2, que apresenta a malha de elementos finitos e PML's adotada para a simulação da seção transversal.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-234_823_1494_117_286.jpg)
Figura 6.1: Geometria e propriedades do cenário de referência.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-234_1016_1230_1057_416.jpg)
Figura 6.2: Malha de elementos finitos (2.5D MEF-PML ) adotada para modelar a seção transversal do sistema túnel maciço.

Admite-se uma solução de via em laje flutuante, considerando-se a presença de uma manta resiliente entre a laje e a soleira do túnel como medida de isolamento. A manta resiliente apresenta uma rigidez por metro de desenvolvimento longitudinal de $0.153 \times 10^{9} \mathrm{~N} / \mathrm{m}^{2}$ e um amortecimento viscoso de $5.5 \times 10^{4} \mathrm{Ns} / \mathrm{m}^{2}$. Atendendo às propriedades da via e com base nas expressões [4.3] e [4.4] apresentadas no Capítulo 4, prevê-se que o comportamento do sistema de laje flutuante seja caracterizado por uma frequência natural de 36,4 Hz, à qual corresponde uma frequência de corte de

51,5 Hz. Deste modo, é esperado que para frequências de excitação superiores à frequência de corte do sistema ocorra uma atenuação da energia que é transmitida pela via férrea ao invert do túnel. Salienta-se que as frequências naturais e de corte foram estimadas por via simplificada, na qual se negligenciou quer a contribuição da flexibilidade do invert do túnel (e restante meio) quer o amortecimento da própria manta.

Quanto às restantes propriedades da via férrea, em particular características da laje, das palmilhas elásticas e dos trilhos, assumiram-se os valores indicados na descrição do estudo preliminar apresentado no capítulo anterior.

Considera-se ainda a presença, nas proximidades do túnel, de um edifício de dois pavimentos, com a geometria ilustrada na Figura 6.3. O edifício está fundado em sapatas quadradas com uma área de $2 \times 2 \mathrm{~m}^{2}$. O alinhamento longitudinal dos pilares do edifício mais afastados encontra-se a 20 m de distância do plano de simetria da seção transversal do túnel. Quanto aos elementos estruturais, admitiu-se que todos os pilares têm seção quadrada de 0,30 m de lado, que as vigas têm dimensão de $0,30 \times 0,60 \mathrm{~m}^{2}$ e que as lajes têm 0,25 m de espessura. Admitiu-se ainda que todos os elementos são materializados em concreto, condizente com um módulo de deformabilidade de 30 GPa. Para facilitar a leitura, no Quadro 6.1 sintetizam-se as principais propriedades dos elementos estruturais do edifício.

Atendendo ao referencial ilustrado na Figura 6.1, são as seguintes as coordenadas dos pontos centrais das diferentes sapatas: A(-5;16;0); B(-5;20;0); C(0;16;0); D(0;20;0); E(5;16;0); F(5;20;0).

Para atender a outras massas permanentes que se possam instalar no edifício, considerou-se uma massa uniformemente distribuída nas lajes de $300 \mathrm{~kg} / \mathrm{m}^{2}$.

Relativamente ao amortecimento do edifício, foi adotado o modelo de Rayleigh, tendo-se ajustado os fatores de amortecimento para garantir um coeficiente de amortecimento de cerca de 2 \% a 3 \% na faixa de frequências entre os 5 e 80 Hz. Como é intrínseco ao método de Rayleigh, não se consegue garantir um valor do coeficiente de amortecimento constante independente da frequência. Esse fato torna-se ainda mais evidente quando a faixa de frequências de interesse é tão ampla como acontece no presente estudo. Na Figura 6.4 ilustra-se, para o presente caso, a evolução do referido coeficiente conforme a frequência em consideração. Como se pode verificar, adotando um modelo de amortecimento de Rayleigh não é possível garantir um coeficiente de amortecimento constante para a faixa de frequências em estudo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-236_1849_1221_122_423.jpg)
Figura 6.3: Caracterização geométrica do edifício: a) representação esquemática; b) modelo de elementos finitos 3D.
Quadro 6.1: Propriedades dos elementos estruturais do edifício.

| Elementos | E (GPa) | $\nu$ | $\rho\left(\mathbf{k g} / \mathbf{m}^{\mathbf{3}}\right)$ | Dimensões |
| :--- | :--- | :--- | :--- | :--- |
| Lajes | 30 | 0,2 | 2500 | espessura: 0,25 m |
| Vigas | 30 | 0,2 | 2500 | $0,30 \times 0,60 \mathrm{~m}^{2}$ |
| Pilares | 30 | 0,2 | 2500 | $0,30 \times 0,30 \mathrm{~m}^{2}$ |


![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-237_432_701_118_683.jpg)
Figura 6.4: Coeficiente de amortecimento material do edifício em função da frequência.

Para o cálculo da impedância do maciço de fundação, procedeu-se a uma discretização da superfície em planta das fundações em 144 elementos quadrados, correspondendo a uma dimensão máxima de 0,167 m. Com esta discretização, é possível garantir uma boa aproximação ao comportamento de uma fundação rígida, permitindo concentração de tensões de contato solo-fundação em determinadas zonas para satisfazer as condições de compatibilidade de deslocamentos implícitas a uma fundação rígida.

Quanto ao material rodante, considera-se a passagem do trem Alfa-Pendular circulando à velocidade de 40 m/s. A geometria do trem Alfa-Pendular foi já apresentada na Figura 5.24 pelo que se dispensa sua repetição aqui. Contrariamente ao exemplo constante no capítulo anterior, considerou-se agora um modelo completo de trem, no qual não só a massa do eixo é atendida, mas também a presença das massas semissuspensas (bogies) e suspensas, ligadas pelas respectivas suspensões primária e secundária. Desse modo, são apresentadas no Quadro 6.2 as propriedades necessárias à definição do modelo de veículo.

Quadro 6.2: Propriedades mecânicas dos veículos.
| Componente | Parâmetro | Valor |
| :--- | :--- | :--- |
| Eixos | $\mathrm{M}_{\mathrm{r}}(\mathrm{kg})$ | 1538-1884 |
| Suspensão primária | $\mathrm{k}_{\mathrm{p}}(\mathrm{kN} / \mathrm{m})$ | 3420 |
|  | $\mathrm{c}_{\mathrm{p}}(\mathrm{kNs} / \mathrm{m})$ | 36 |
| Bogies | $\mathrm{M}_{\mathrm{b}}(\mathrm{kg})$ | 4712-4932 |
|  | $\mathrm{J}_{\mathrm{b}}\left(\mathrm{kg} / \mathrm{m}^{2}\right)$ | 5000-5150 |
| Suspensão secundária | $\mathrm{k}_{\mathrm{s}}(\mathrm{kN})$ | 1320 |
|  | $\mathrm{c}_{\mathrm{s}}(\mathrm{kNs} / \mathrm{m})$ | 36 |
| Caixa | $\mathrm{M}_{\mathrm{c}}(\mathrm{kg})$ | 32900-35710 |
|  | $\mathrm{J}_{\mathrm{c}}\left(\mathrm{kg} / \mathrm{m}^{2}\right)$ | 2083600 |


Relativamente ao perfil de irregularidades da via, considerou-se o perfil de irregularidades ilustrado na Figura 6.5. Este foi gerado de forma aleatória, com base no espectro de potência definido na seção 5.5.1.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-238_708_1743_358_162.jpg)
Figura 6.5: Perfil de irregularidades adotado: a) representação espacial; b) representação no domínio do número de onda.

Como a velocidade de circulação do trem assumida é de 40 m/s, o perfil de irregularidades da via adotado excita o trem na faixa de frequências entre 1,4 Hz e 72 Hz, dado que o mesmo é constituído por senoides com comprimentos de onda compreendidos entre 28 m e 0,55 m. Esta faixa de frequências é particularmente interessante para o estudo das vibrações induzidas pelo tráfego nos edifícios, uma vez que para frequências acima de 80 Hz a própria estrutura do edifício filtra os níveis de vibração.

### 6.2.2 Resposta dinâmica da via férrea

A Figura 6.6 apresenta a velocidade vertical de vibração do trilho, na posição $\mathrm{x}=0 \mathrm{~m}$, durante a passagem do trem Alfa-Pendular à velocidade de 40 m/s na via férrea com o perfil de irregularidades atrás definido. Admitiu-se que no instante $\mathrm{t}=0 \mathrm{~s}$, o último eixo do trem ocupa a posição geométrica definida por $\mathrm{x}=0 \mathrm{~m}$. No registro temporal, bem como na representação no domínio da frequência, encontram-se sobrepostos os resultados provenientes do cálculo considerando a excitação total (mecanismos quase estático e dinâmico) e os resultados obtidos a partir de um cálculo em que apenas se atende à excitação quase estática.

Da análise da Figura 6.6 constata-se que a passagem de cada um dos eixos do trem é claramente identificada no registro temporal, o qual evidencia uma resposta praticamente uniforme para todos os eixos (Figura 6.6a). Verifica-se ainda que a consideração apenas da excitação quase estática conduz a valores de pico da velocidade vertical muito semelhantes aos obtidos considerando a excitação total, concluindo-
-se deste modo que a resposta do trilho é fundamentalmente condicionada pelo mecanismo de excitação quase estático. De fato, analisando o registro no domínio da frequência (Figura 6.6b), é possível verificar que o maior conteúdo em frequência da resposta ocorre no intervalo 0-40 Hz, faixa de frequências dominada pelo mecanismo de excitação quase estático [34]. Em contrapartida, para frequências superiores a 50 Hz o mecanismo de excitação dinâmica tem preponderância sobre o quase estático, embora a energia associada a essa faixa de frequências seja substancialmente inferior à verificada na faixa de frequências mais baixa.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-239_663_1752_740_156.jpg)
Figura 6.6: Velocidade vertical do trilho: a) registro temporal; b) conteúdo em frequência.

Face ao acima exposto, pode-se concluir que caso a análise verse apenas sobre a obtenção de valores de pico da resposta (em termos de deslocamento ou velocidade) do trilho, poderá negligenciar-se a contribuição do mecanismo dinâmico, o que se traduz em uma economia drástica do esforço computacional. Deverá ser aqui ressalvado que tal conclusão não é extensível aos casos de vias férreas com defeitos pontuais graves, onde a contribuição do mecanismo dinâmico toma proporções muito mais significativas do que as agora apontadas.

A Figura 6.7 ilustra a evolução da velocidade vertical do ponto central do invert (pertencente à seção transversal correspondente a $\mathrm{x}=0 \mathrm{~m}$ ) em função da frequência de excitação. Como era esperado, comparando o resultado obtido para o trilho (Figura 6.6b) com o agora apresentado para a soleira do túnel, verifica-se que há uma redução drástica (mais de uma ordem de grandeza) da energia que é transmitida da via férrea ao seu suporte. É no entanto de realçar que houve uma alteração da banda de frequência dominante, que na resposta do trilho é até cerca dos 35 Hz, passando a ser dos 25 Hz aos 45 Hz no caso da resposta no invert. Este último aspecto é explicado atendendo à frequência natural do sistema devido à presença da manta resiliente entre a laje e a soleira do túnel.

Com efeito, na banda de frequência em torno da frequência de ressonância do sistema de laje, assiste-se ao aumento significativo da força de interação dinâmica entre a laje e o seu suporte, o que aliás já foi salientado no Capítulo 4 da presente tese. Este aspecto, já abordado por Alves Costa et al. (2012b), deve ser atendido com cautela, pois a concentração de energia transmitida da via férrea ao seu suporte em uma faixa de frequências específica pode ter consequências prejudiciais nas edifica-ções próximas à via. Este aspecto será alvo de uma reflexão mais profunda em seção posterior do presente capítulo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-240_643_701_738_684.jpg)
Figura 6.7: Velocidade vertical do ponto central do invert no domínio da frequência.

### 6.2.3 Resposta dinâmica do campo livre induzida pela passagem do trem

A análise realizada na presente seção visa as vibrações induzidas pelo tráfego ferroviário nas imediações da via férrea, assumindo-se que não existe qualquer edificação (condição de campo livre). Com esse propósito consideram-se três pontos de observação localizados na superfície do terreno e pertencentes à seção transversal definida por $\mathrm{x}=0 \mathrm{~m}$, encontrando-se o ponto P1 inscrito no plano de simetria do túnel, o ponto P2 afastado de 10 m e o ponto P3 a 20 m desse mesmo plano.

A Figura 6.8 ilustra o registro temporal da velocidade vertical nos pontos de observação anteriormente indicados. Como se pode verificar, e seria esperado face aos estudos preliminares elaborados nos capítulos precedentes, observa-se uma redução da velocidade de pico com o aumento da distância do ponto de observação face ao túnel. No entanto, a redução da resposta não ocorre de forma uniforme em todas as faixas de frequência, o que aliás se encontra bem patente na Figura 6.9, onde se ilustram os espectros de banda de terço de oitava correspondentes aos sinais temporais ilustrados na Figura 6.8.

Este tipo de representação possui algumas vantagens, em particular pela facilidade de comparação que oferece. Além desta clara vantagem, este tipo de representação
vem sendo adotado por uma boa parte da regulamentação internacional, justificando--se assim a sua aplicação no presente contexto.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-241_608_1749_285_159.jpg)
Figura 6.8: Registro temporal da velocidade vertical experimentada nos pontos localizados na superfície do terreno na condição de campo livre: a) Ponto 1; b) Ponto 2; c) Ponto 3.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-241_533_704_1063_682.jpg)
Figura 6.9: Representação em banda de terço de oitava da velocidade vertical experimentada nos pontos localizados na superfície do terreno na condição de campo livre (dB-ref. $10^{-8} \mathrm{~m} / \mathrm{s}$ ).

Da observação da Figura 6.9 conclui-se, como era esperado, que a velocidade de resposta na direção vertical segue uma tendência de diminuição com o acréscimo da distância do ponto de observação em relação ao túnel. Esta atenuação deve-se tanto ao amortecimento geométrico como ao amortecimento material. Como se pode verificar, em geral, a atenuação é maior na faixa de frequências mais elevada do que nas frequências mais baixas, devendo-se tal fato ao amortecimento material, uma vez que a componente geométrica do amortecimento não depende da frequência de excitação. Não obstante, os resultados apresentados evidenciam uma forte redução da resposta dinâmica na faixa de frequência mais baixa, quando o ponto de observação passa de uma distância de 10 m para os 20 m (em relação ao plano de simetria do túnel). Este efeito interessante pode ser justificado atendendo à complexidade da resposta dinâmica do sistema túnel-maciço. Como anteriormente analisado no Capítulo 4, a representação no domínio da frequência da resposta dinâmica vertical em pontos localizados na superfície do solo exibe picos invertidos (abaixamentos); estes picos
nas funções de resposta são consequência da interação ao longo da superfície livre entre as ondas de compressão, de cisalhamento e de Rayleigh, sendo dependentes da distância do ponto de observação em relação à fonte. Assim, a diminuição abrupta observada quando se compara a resposta do ponto P2 com a do ponto P3, na faixa de frequência mais baixa, é justificada pelo comportamento complexo do sistema.

Um outro aspecto notável que ressalta da Figura 6.9 é o fato de o conteúdo em frequência mais relevante da resposta ilustrada na Figura 6.8 ocorrer nas bandas entre os 20 Hz e os 40 Hz. Com efeito, como já evidenciado na Figura 6.7, a frequência de ressonância do sistema de via flutuante ocorre no interior desta faixa, o que leva a uma amplificação da energia que é transmitida pela via ao suporte. No caso de pontos localizados na superfície do terreno, este efeito torna-se ainda mais evidente quando comparado com a excitação providenciada pelo mecanismo quase estático. Na verdade, para pontos localizados a uma pequena distância da via férrea, o efeito do mecanismo de excitação quase estático é negligenciável para os casos em que a velocidade de circulação é menor do que a velocidade de propagação de ondas elásticas no sistema túnel-solo. Este aspecto foi já ilustrado por outros autores [52], [130] sendo mais recentemente estudado de forma teórica por Alves Costa et al. (2015), para o caso de tráfego superficial, tendo mostrado que só há lugar à propagação de ondas devido ao tráfego ferroviário quando a velocidade de circulação iguala ou ultrapassa a velocidade de fase de propagação de ondas no sistema. Nos casos em que tal não ocorre, este mecanismo de excitação dá apenas origem a ondas evanescentes, as quais, como o nome indica, não se fazem sentir a distâncias moderadas da fonte de excitação.

### 6.2.4 Resposta dinâmica do edifício

### 6.2.4.1 Generalidades

Nas seções anteriores foi analisada a resposta dinâmica do sistema via-túnel-maciço devido à passagem do trem. Todavia, o objetivo final do estudo consiste em avaliar os níveis de vibração induzidos no interior de edifícios situados nas imediações da infraestrutura ferroviária. Por conseguinte, nesta seção é estudada a resposta dinâmica do edifício induzida pela passagem do trem, aplicando para o efeito a metodologia explanada no Capítulo 5.

A resposta dinâmica do edifício é avaliada considerando a resposta dinâmica do campo livre "fictício" nos pontos correspondentes à localização das fundações do edifício, a impedância do solo de fundação e as características dinâmicas da própria estrutura. No estudo desenvolvido a impedância do solo de fundação é avaliada
usando as matrizes de transferência e o método dos elementos de contorno apresentado no capítulo anterior. Pontualmente, a resposta obtida através desta formulação é também comparada com a resultante da aplicação do modelo discreto condensado "monkey-tail model", também apresentado no Capítulo 5. Embora o primeiro método seja muito mais rigoroso do que o segundo, este último não deve ser descartado, pois o esforço computacional inerente à sua aplicação é muito menor e, como se verá a seguir, permite alcançar resultados satisfatórios.

Para uma compreensão mais profunda da resposta dinâmica do edifício devido à passagem de tráfego ferroviário, é importante começar por analisar e refletir sobre o comportamento dinâmico do edifício e da sua interação dinâmica com o solo, passando-se em seguida à análise da resposta dinâmica do edifício devido à excitação imposta pela passagem do trem no túnel.

Nesse sentido e com o objetivo de melhor discernir os fatores determinantes do problema, as subseções que se seguem estão organizadas da seguinte forma: i) análise do comportamento dinâmico do edifício e dos efeitos da interação solo-estrutura; ii) avaliação da influência da rigidez do solo no mecanismo de interação solo-estrutura; iii) comparação da resposta dinâmica obtida através da formulação pelo MEC 3D, com a resultante da aplicação de uma abordagem alternativa, o modelo discreto condensado "monkey-tail model"; iv) estudo da resposta dinâmica do edifício devido às vibrações induzidas pelo tráfego ferroviário.

### 6.2.4.2 Comportamento dinâmico do edifício

Influência da interação solo-estrutura no comportamento dinâmico do edifício A Figura 6.10 ilustra os modos de vibração da estrutura do edifício associados às primeiras doze frequências naturais. As frequências naturais e os modos apresentados foram avaliados considerando que o deslocamento nas fundações do edifício se encontra impedido, ou seja, assumindo que o solo é infinitamente rígido e negligenciando deste modo os efeitos da interação solo-estrutura. O comportamento estrutural do edifício foi simulado recorrendo a um programa de cálculo automático baseado no método dos elementos finitos, o qual foi desenvolvido por Ferraz (2010) na Faculdade de Engenharia da Universidade do Porto.

Da observação da Figura 6.10 é possível concluir que os modos associados a frequências naturais até 10 Hz compreendem o movimento horizontal das lajes. Por outro lado, o movimento vertical das lajes está essencialmente associado a frequências naturais que ocorrem entre os 14 Hz e os 20 Hz, verificando-se que as frequências
naturais acima de 30 Hz estão associadas a modos locais que também implicam flexão das lajes e deformação axial dos pilares.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-244_2231_1748_279_160.jpg)
Figura 6.10: Configuração dos modos de vibração da estrutura do edifício.

Como mencionado atrás, as frequências naturais e os modos de vibração apresentados na Figura 6.10 foram avaliados assumindo uma ligação rígida do edifício ao exterior.

No entanto, uma vez que o solo não é infinitamente rígido, é esperado que se assista a um ligeiro desvio das frequências naturais para valores mais baixos quando a flexibilidade dinâmica do maciço de fundação for tomada em consideração. É ainda de referir que é também esperado um efeito de amortecimento na resposta devido à radiação de energia pelo maciço de fundação, ou seja, parte da energia é transmitida da estrutura para o maciço, influenciando deste modo significativamente a resposta dinâmica do edifício.

Estes efeitos podem ser claramente observados na Figura 6.11, onde estão ilustradas as curvas FRF (Função de Resposta em Frequência) do deslocamento vertical dos pontos J e H (ver Figura 6.3), devido a um deslocamento incidente, com direção vertical e magnitude unitária, aplicado em todas as fundações do edifício e com frequência variável. Refira-se que a FRF expressa a razão, em função da frequência, entre a amplitude do deslocamento verificado no ponto em análise e a amplitude do deslocamento incidente aplicado na fundação. A fim de melhor discernir a influência do acoplamento entre o edifício e o solo de fundação, foi assumido um valor nulo para o amortecimento material da estrutura do edifício.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-245_718_1750_1353_156.jpg)
Figura 6.11: Representação das funções FRF do deslocamento vertical de dois pontos, devido a um deslocamento vertical unitário harmônico aplicado nas fundações da estrutura não amortecida: a) Ponto H; b) Ponto J.

Da observação da Figura 6.11 fica bem patente a ocorrência de vários fenômenos de ressonância e antirressonância, os quais, quando os efeitos de interação solo-estrutura (SSI) são negligenciados, se traduzem por uma variação brusca da resposta dado que o amortecimento material da estrutura não é contemplado na presente análise. Como esperado, a introdução da interação solo-estrutura (SSI) traduz-se em uma grande influência no comportamento dinâmico do edifício. Verifica-se de fato um ligeiro desvio das frequências naturais do sistema que implicam o movimento vertical
das lajes, principalmente na faixa de frequência mais baixa. Este efeito é devido à contribuição da flexibilidade do solo para o comportamento dinâmico da estrutura, o que, obviamente se traduz por uma quebra de rigidez face ao cenário de apoio rígido, e consequente diminuição das frequências ressonantes cujos modos associados implicam de alguma forma movimento da fundação. Além disso, destaca-se como ainda mais relevante o efeito de amortecimento induzido pela interação da estrutura com o solo. Como pode ser observado, mesmo para estruturas não amortecidas, o comportamento dinâmico da estrutura é amortecido devido à radiação de energia para o maciço de fundação. Este efeito é bastante evidente nos modos de vibração que envolvem a deformação dos pilares da estrutura, pois, nesses casos, é implicado o movimento vertical das fundações, com consequente radiação de energia para o maciço de fundação

Para um melhor entendimento do comportamento dinâmico da estrutura, a Figura 6.12 mostra resultados homólogos aos da Figura 6.11, mas agora referentes ao deslocamento horizontal na direção x. As funções de resposta FRF para a direção y são semelhantes, razão pela qual não são aqui apresentadas.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-246_714_1748_1353_157.jpg)
Figura 6.12: Representação das funções FRF do deslocamento horizontal de dois pontos, devido a um deslocamento horizontal unitário harmônico aplicado nas fundações da estrutura não amortecida: a) Ponto H; b) Ponto J.

Mais uma vez, é possível observar um desvio muito pequeno da primeira frequência natural para um valor menor devido à consideração da interação solo-estrutura. Comparando os resultados ilustrados na Figura 6.12 com os homólogos representados na Figura 6.11, constata-se que a atenuação da resposta em torno das frequências naturais é muito mais pronunciada para as funções FRF na direção vertical. Com efeito, quando um deslocamento unitário harmônico na direção horizontal é aplicado às fundações da estrutura, o deslocamento gerado nas lajes dá origem a um incremento
do deslocamento por translação na fundação, acompanhado da sua rotação. Este tipo de movimento da fundação está associado a valores mais baixos de amortecimento por radiação quando comparados com os valores obtidos para o movimento vertical da sapata. Como demonstrado por Gazetas (1991), quando a fundação está sujeita a uma oscilação vertical, as ondas geradas no maciço de fundação são emitidas em fase em todas as direções, propagando-se por grandes distâncias; por conseguinte, uma significativa parte da energia das ondas é radiada para o maciço de fundação e espalhada geometricamente, sendo deste modo o amortecimento por radiação associado a este tipo de movimento consideravelmente elevado. Em contraste, dois pontos, simetricamente localizados em lados opostos de uma fundação que sofre uma rotação, emitem ondas que apresentam uma defasagem de 180° e que tendem a anular-se mutuamente, uma vez que convergem ao longo do plano de simetria; deste modo, estas ondas não podem alcançar longas distâncias e, consequentemente dissipam pouca da energia que é comunicada ao solo de fundação, sendo por isso o amortecimento por radiação reduzido. Dado que este efeito de rotação da fundação é muito pronunciado quando a estrutura é solicitada na direção horizontal, são pois compreensíveis as diferenças notadas entre as Figura 6.11 e Figura 6.12.

Um outro aspecto relevante, evidenciado pela Figura 6.12, diz respeito à visível atenuação dos deslocamentos horizontais identificados nas lajes para as frequências de excitação mais elevadas. De fato, a estrutura funciona como um "filtro" no caso das vibrações horizontais e os valores das funções FRF obtidos quando a frequência de excitação é superior aos 10 Hz tornam-se insignificantes. Dada a geometria e rigidez da estrutura, este efeito é ainda mais notório no ponto J, o qual corresponde a um ponto central de um vão de laje do segundo pavimento.

Como é bem sabido, mesmo para pequenas deformações, as estruturas apresentam sempre alguma dissipação de energia, a qual tende a ser quantificada através do coeficiente de amortecimento. Assim, no presente estudo é assumida uma variação do coeficiente de amortecimento compatível com o resultado ilustrado na Figura 6.4. As curvas FRF avaliadas na mesma localização, mas agora para o caso da estrutura amortecida estão representadas na Figura 6.13 e na Figura 6.14, para deslocamentos verticais e horizontais, respectivamente.

A consideração do amortecimento da estrutura resulta na atenuação dos picos das curvas FRF, levando a uma aproximação considerável entre os resultados obtidos com e sem a consideração da interação solo-estrutura, ou seja, o amortecimento por radiação perde parte da sua relevância no contexto do amortecimento global do sistema.

Além disso, também é possível constatar que a consideração do amortecimento estrutural induz uma forte atenuação da resposta nas frequências naturais mais elevadas, que em alguns casos são tão fortemente amortecidas que deixam de ser perceptíveis. No entanto, a semelhança entre os resultados obtidos nas duas situações (com e sem interação solo-estrutura) é mais evidente para as curvas FRF referentes aos deslocamentos horizontais, uma vez que permanecem diferenças significativas quando a análise incide na resposta dinâmica vertical das lajes. Com efeito, a comparação entre os resultados mostrados na Figura 6.13 evidencia a forte influência do amortecimento por radiação, conferido pela interação solo-estrutura, no comportamento dinâmico vertical da estrutura, quando as suas fundações são sujeitas a um movimento vertical.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-248_653_1751_894_156.jpg)
Figura 6.13: Representação das funções FRF do deslocamento vertical de dois pontos, devido a um deslocamento vertical unitário harmônico aplicado nas fundações da estrutura amortecida: a) Ponto H; b) Ponto J.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-248_658_1761_1765_147.jpg)
Figura 6.14: Representação das funções FRF do deslocamento horizontal de dois pontos, devido a um deslocamento horizontal unitário harmônico aplicado nas fundações da estrutura amortecida: a) Ponto H; b) Ponto J.

Influência da rigidez do solo no mecanismo de interação solo-estrutura A partir do que foi exposto até o momento é, então, possível concluir que o mecanismo de interação solo-estrutura condiciona de modo relevante o comportamento dinâmico da estrutura, principalmente quando os modos de vibração de interesse implicam um potencial deslocamento vertical das fundações. Atendendo a que a rigidez do solo, ao afetar a flexibilidade dinâmica do sistema, pode desempenhar um papel importante no mecanismo de interação solo-estrutura, a sua influência é também aqui analisada.

Tendo em vista a avaliação da influência da rigidez do solo no mecanismo de interação solo-estrutura assumem-se três cenários distintos para o solo de fundação, o cenário de referência (ver Figura 6.1), a que corresponde uma velocidade de propagação das ondas de cisalhamento, $\mathrm{C}_{\mathrm{s}}$, de 250 m/s e mais dois novos cenários com velocidades $\mathrm{C}_{\mathrm{s}}$ de 150 m/s e 410 m/s, mantendo constantes as outras propriedades mecânicas do solo: coeficiente de Poisson, $\nu=0,3$; massa específica, $\rho=1900 \mathrm{~kg} / \mathrm{m}^{3}$ e amortecimento material do solo, $\xi=0,04$.

Na Figura 6.15 estão representadas, para os três cenários em estudo e para o caso em que não se considera a interação solo-estrutura, as curvas FRF do deslocamento vertical do ponto H (ver Figura 6.3), devido a um deslocamento incidente vertical, de amplitude unitária, e com frequência variável aplicado a todas as sapatas do edifício. Com o intuito de melhor discernir a influência da rigidez do maciço de fundação no mecanismo de interação solo-estrutura, a Figura 6.15a apresenta os resultados, em termos de curvas FRF, respeitantes a um comportamento estrutural não amortecido, sendo o amortecimento material da estrutura contemplado nos resultados ilustrados na Figura 6.15b.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-250_764_1748_123_160.jpg)
Figura 6.15: Representação das funções FRF do deslocamento vertical do ponto H, devido a um deslocamento vertical unitário harmônico aplicado nas fundações da estrutura: a) não amortecida; b) amortecida.

Como já constatado na análise anterior, verifica-se que a interação solo-estrutura exibe uma influência muito significativa no comportamento dinâmico do edifício, sendo agora visível que o seu efeito é tanto mais pronunciado quanto menor a rigidez do solo de fundação. Refira-se no entanto que, até mesmo para o cenário mais rígido, é possível identificar um ligeiro desvio das frequências naturais (no sentido da redução) do sistema associadas aos modos de vibração que envolvem o movimento vertical da laje onde está inscrito o ponto H. Este efeito, como anteriormente mencionado, resulta da contribuição da flexibilidade do solo para o comportamento dinâmico da estrutura. É claro que o referido desvio das frequências naturais para valores mais baixos é tão mais evidente quanto menor for a rigidez do solo de fundação. É também possível observar que, nos três cenários em análise, a interação solo-estrutura desempenha um papel muito importante na magnitude da resposta dinâmica, em particular em torno das frequências naturais do sistema. Efetivamente, quando a interação solo--estrutura é tomada em consideração observa-se um efeito de amortecimento na resposta devido à radiação de energia pelo maciço de fundação, o qual é tanto mais evidente quanto menor a rigidez do solo de fundação. Este efeito é muito notório na Figura 6.15a, onde o amortecimento da estrutura foi negligenciado. Todavia, mesmo quando o amortecimento da estrutura é considerado (ver Figura 6.15b), é possível constatar que o amortecimento por radiação, induzido pela interação solo-estrutura, é um aspecto relevante. A esse propósito, note-se que nos cenários em que o solo exibe menor rigidez, alguns dos efeitos de ressonância são tão amortecidos que deixam de
ser perceptíveis, como é por exemplo o caso da ressonância em torno da frequência de 33 Hz.

Avaliação da impedância da fundação por abordagem alternativa e comparação de resultados
No presente trabalho os efeitos da interação solo-estrutura são tidos em conta por meio da incorporação da impedância do solo de fundação (ou da sua rigidez dinâmica) nas equações que regem o equilíbrio da estrutura. Como apresentado no Capítulo 5 o cálculo da impedância das fundações pode ser realizado através de diferentes metodologias, tais como o MEC 3D ou os modelos discretos condensados, entre outras.

As análises previamente apresentadas da interação solo-estrutura foram desenvolvidas adotando o método dos elementos de contorno (MEC 3D) para o cálculo da rigidez dinâmica da fundação. Como mencionado anteriormente, o tempo de computação necessário, bem como a complexidade numérica inerente ao próprio método, são desvantagens significativas, justificando assim a busca de abordagens alternativas, como por exemplo, o modelo discreto condensado aqui designado por modelo cauda de macaco. A Figura 6.16 compara as curvas FRF do deslocamento vertical do ponto H avaliadas pelos dois métodos em causa (incluindo ainda a representação negligenciando a interação solo-estrutura) e para diferentes valores da rigidez do solo de fundação. Para os cenários em que o solo exibe maior rigidez (Figura 6.16b e c), os resultados obtidos pelo modelo cauda de macaco ajustam-se muito bem aos provenientes da abordagem pelo MEC 3D para frequências até 60 Hz. Não obstante, a atenuação da resposta em torno da frequência natural de 70 Hz, propiciada pela interação solo-estrutura, não é bem refletida quando o modelo discreto condensado é considerado. No entanto, como se verá em uma fase posterior do presente capítulo, o conteúdo em frequência do campo de onda incidente centra-se, principalmente, em uma faixa de frequências inferior a 60 Hz, pelo que esta potencial falta de precisão do modelo não apresenta consequência em termos de resposta dinâmica do edifício induzida pelo tráfego ferroviário no túnel.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-252_506_1740_125_162.jpg)
Figura 6.16: Representação das funções FRF do deslocamento vertical do ponto H, devido a um deslocamento vertical unitário harmônico aplicado nas fundações da estrutura, para solos com diferentes propriedades e aplicando métodos distintos para avaliar a impedância da fundação: a) $\mathrm{Cs}=150 \mathrm{~m} / \mathrm{s}$; b) $\mathrm{Cs}=250 \mathrm{~m} / \mathrm{s}$; c) $\mathrm{Cs}=410 \mathrm{~m} / \mathrm{s}$ (linha preta- MEC 3D; linha azul- Modelo cauda de macaco; linha vermelha tracejada- negligenciando a interação solo-estrutura).

Comparando os resultados da Figura 6.16a com os restantes cenários, é bastante evidente que ocorre uma perda de precisão do modelo cauda de macaco com a diminuição da rigidez do solo. Este efeito pode ser atribuído a vários fatores dado o caráter simplificado dos modelos discretos condensados. No entanto, no presente caso, deve-se principalmente, no entender da autora, ao fato de no modelo cauda de macaco as sapatas serem consideradas como elementos individuais desacoplados, em contraste com o que acontece na formulação pelo MEC 3D onde a interação entre as fundações é levada em consideração na avaliação da rigidez dinâmica do conjunto das sapatas. Obviamente, este efeito de acoplamento entre as várias fundações do edifício é tão mais pronunciado quanto menor é a rigidez do solo. No entanto, deve--se ressaltar que, mesmo para o pior cenário, o modelo discreto condensado permite reproduzir muito bem o efeito da interação solo-estrutura para frequências próximas das frequências naturais associadas a modos locais que implicam movimento vertical das lajes (frequências até cerca de 25 Hz).

### 6.2.4.3 Resposta dinâmica do edifício devido às vibrações induzidas pelo tráfego

Atendendo à discussão apresentada na seção anterior, é possível antever que a resposta dinâmica do edifício será condicionada pelas suas propriedades dinâmicas assim como pelas características do campo de onda incidente (magnitude e conteúdo em frequência) induzido pela passagem do trem no túnel.

Na análise a seguir apresentada consideram-se como pontos de observação os pontos designados pelas letras H e J na Figura 6.3 (pontos centrais de lajes do primeiro e segundo pavimentos) e a sapata aí indicada com a letra D. O estudo irá incidir primeiro sobre a resposta dinâmica do edifício na direção vertical, sendo também abordada a resposta da estrutura na direção horizontal.

Atendendo ao modelo de interação exposto no capítulo anterior, pode pois afirmar-se que a resposta dinâmica das fundações do edifício é determinada pelas propriedades dinâmicas da estrutura e pela sua interação com o solo de fundação. Por conseguinte, a resposta dinâmica das sapatas do edifício é distinta do campo de onda incidente, o que aliás se ilustra na Figura 6.17, onde o conteúdo em frequência do campo de onda incidente é comparado com a resposta dinâmica da fundação D (ver Figura 6.3), ambos avaliados em termos de velocidade na direção vertical. De fato, a análise da Figura 6.17 permite identificar algumas amplificações ou atenuações da resposta, resultantes do mecanismo de interação solo-estrutura.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-253_537_704_810_683.jpg)
Figura 6.17: Conteúdo em frequência da velocidade vertical experimentada na fundação D e do campo de onda incidente nessa mesma localização.

A Figura 6.18 mostra o registro temporal da velocidade vertical experimentada na fundação D e no ponto de observação H, localizado no centro de uma das lajes do 1° pavimento. Atentando nas respostas dinâmicas apresentadas verifica-se desde logo que ocorre uma amplificação da resposta, registrando-se valores de pico da velocidade vertical no ponto H superiores aos obtidos na fundação do edifício. Note-se ainda que a observação do registro temporal permite adiantar a ocorrência de uma alteração do conteúdo de frequências dominantes na resposta, dependendo do ponto em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-253_594_1484_2059_287.jpg)
Figura 6.18: Registro temporal da velocidade vertical experimentada nos pontos de observação: a) fundação D; b) ponto H (ponto central da laje do 1° pavimento).

Na Figura 6.19 a velocidade vertical avaliada nos dois pontos de observação é representada no domínio da frequência. Comparando o conteúdo em frequência da resposta dinâmica do ponto inscrito na laje do edifício com o registrado na sua fundação, constata-se que ocorre de fato uma alteração das frequências dominantes, sendo a resposta do ponto H dominada por frequências entre os 10 Hz e os 20 Hz. Note-se que é exatamente nessa faixa de frequências que ocorre a amplificação dos níveis de vibração vertical já mencionada anteriormente. Procedendo a uma análise mais detalhada do conteúdo em frequência da resposta do ponto H, é possível identificar que os picos mais acentuados ocorrem em torno dos 13 Hz, 16,7 Hz e 18,6 Hz. A frequência do primeiro pico é coerente com a frequência de passagem dos bogies do trem à velocidade de 40 m/s. Quanto aos outros dois picos de frequência, verifica-se que estão em correspondência com as frequências naturais associadas ao 9° e 10° modos de vibração da estrutura, os quais implicam o movimento vertical da laje onde está inscrito o ponto H (ver Figura 6.10). Deste modo, a preponderância na resposta das últimas frequências referidas é justificada pelo comportamento dinâmico do edifício considerado, ao passo que o primeiro pico é ditado essencialmente pelo conteúdo em frequência do campo incidente.

Face ao exposto no parágrafo anterior, pode então afirmar-se que a resposta no ponto de observação H é condicionada pelo campo de onda incidente e pelas frequências naturais associadas aos modos de vibração que implicam movimento vertical da laje onde o ponto H se inscreve.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-254_587_1489_1734_285.jpg)
Figura 6.19: Conteúdo em frequência da velocidade vertical experimentada nos pontos de observação: a) fundação D; b) ponto H (ponto central da laje do 1º pavimento).

Atentando ainda na Figura 6.19, da comparação dos resultados relativos à fundação do edifício com os obtidos para a laje é possível observar que ocorre, no caso do ponto H, uma atenuação do conteúdo em frequência da resposta para frequências superiores a cerca de 25 Hz. Esse fato é também explicado pelas características
dinâmicas do edifício, uma vez que o movimento vertical das lajes está sobretudo associado a modos de vibração com frequências naturais que ocorrem entre os 14 Hz e os 20 Hz. Esse fato pode ser compreendido observando a Figura 6.13a, onde de fato se verifica que a curva FRF apresenta valores inferiores à unidade no intervalo de frequência entre 25 Hz e 50 Hz. Este aspecto deve ser analisado com cuidado, pois a função FRF ilustrada refere-se à incidência de um campo uniforme em todas as fundações e apenas dirigido na direção vertical. Ora, dada a tridimensionalidade do problema em estudo, os pressupostos que levaram ao desenvolvimento dos resultados ilustrados na Figura 6.13 poderão não apresentar uma correspondência perfeita com a complexidade do problema agora em estudo.

Quanto à resposta dinâmica do edifício na direção horizontal, e tendo em consideração as informações fornecidas pelas curvas FRF ilustradas na Figura 6.14, é esperado que a estrutura atue como um "filtro", atenuando o conteúdo em frequência das vibrações que impelem as suas fundações na faixa de frequências mais elevada, sendo por sua vez amplificada a resposta na faixa das frequências mais baixas. Este efeito está bem patente na Figura 6.20, a qual compara o conteúdo em frequência da velocidade horizontal de vibração na direção x experimentada na fundação D e no ponto de observação J (ponto central da laje do 2° pavimento).

Analisando a Figura 6.20, relativa à resposta na direção horizontal, verifica-se que ocorre de fato uma amplificação do conteúdo em frequência da resposta do ponto J (ponto inscrito na laje do edifício), relativamente ao ponto D (fundação), para as frequências mais baixas, a qual é acompanhada de uma drástica redução da resposta dinâmica na laje para frequências superiores a cerca de 8 Hz, deixando, inclusive, praticamente de haver conteúdo de resposta. Estes resultados são coerentes com a análise dos modos de vibração da estrutura realizada na seção anterior (ver Figura 6.10), e justificam-se atendendo às frequências naturais da estrutura associadas ao movimento horizontal das lajes, que ocorrem na faixa de frequências mais baixa, isto é inferiores a 10 Hz. Para frequências de excitação superiores, a estrutura funciona efetivamente como um "filtro", sendo responsável por uma atenuação da resposta dinâmica quando comparada com a resposta na fundação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-256_711_965_118_552.jpg)
Figura 6.20: Comparação do conteúdo em frequência da velocidade horizontal de vibração na direção x experimentada na fundação D e no ponto J (ponto central da laje do 2° pavimento).

Diante dos resultados do estudo da resposta dinâmica do edifício desenvolvido aqui, pode-se afirmar que as características dinâmicas da estrutura desempenham um papel muito relevante nos níveis de vibração presentes no interior do edifício.

### 6.3 Influência da rigidez da manta resiliente

### 6.3.1 Descrição geral

Um modelo global como o proposto neste trabalho, incluindo a fonte, o meio de propagação e também o receptor, permite o desenvolvimento de novos estudos sobre a eficiência de medidas de mitigação na resposta dinâmica de edifícios. Como já mencionado, uma medida de mitigação de vibrações comum e com elevada potencialidade prática consiste na incorporação de elementos resilientes na via, sendo exemplos de aplicação desta medida de isolamento na fonte as soluções de via em laje flutuante.

Assim, nesta seção é desenvolvido um estudo numérico que pretende contribuir para melhor avaliar a eficiência dos sistemas de via em laje flutuante na mitigação das vibrações induzidas em edifícios localizados nas imediações de túneis ferroviários. Com esse intuito são consideradas diferentes condições para o sistema de via em laje flutuante, sendo comparada a sua eficácia e discutida a influência da rigidez da manta resiliente introduzida entre a laje e a soleira do túnel como medida de isolamento.

No estudo apresentado a seguir assume-se o cenário de referência descrito na seção 6.2.1 do presente capítulo. Porém, uma vez que a eficiência do sistema de laje flutuante é condicionada pela rigidez do elemento resiliente são consideradas as variantes de propriedades indicadas no Quadro 6.3.

Quadro 6.3: Propriedades das mantas de isolamento.
| Cenário | Rigidez por unidade de comprimento longitudinal k ( $\mathrm{N} / \mathrm{m}^{2}$ ) | Amortecimento viscoso por unidade de comprimento longitudinal c $\left.\boldsymbol{(} \mathbf{N s} \boldsymbol{/} \mathbf{m}^{\mathbf{2}}\right)$ |
| :--- | :--- | :--- |
| Manta flexível | 0,04×10 ${ }^{9}$ | $5,5 \times 10^{4}$ |
| Manta intermediária | $0,153 \times 10^{9}$ | $5,5 \times 10^{4}$ |
| Manta rígida | $0,283 \times 10^{9}$ | $5,5 \times 10^{4}$ |
| Não isolado | $\infty$ | 0 |


Atendendo às propriedades da via enunciadas e com base no modelo físico simplificado (sistema massa-mola) e nas expressões [4.3] e [4.4] apresentadas no Capítulo 4, prevê-se que o comportamento do sistema de laje flutuante seja caracterizado pelas frequências naturais e de corte indicadas no Quadro 6.4.

Quadro 6.4: Frequências naturais e de corte dos cenários isolados.
| Cenário | $\mathbf{f}_{\mathbf{n}} \boldsymbol{(} \mathbf{H z} \boldsymbol{)}$ | $\mathbf{f}_{\text {corte }} \boldsymbol{(} \mathbf{H z} \boldsymbol{)}$ |
| :--- | :--- | :--- |
| Manta flexível | 18,6 | 26,3 |
| Manta intermediária | 36,4 | 51,5 |
| Manta rígida | 49,5 | 70,1 |


Atendendo aos resultados preliminares expostos no Capítulo 4, é esperado que a introdução das mantas resilientes resulte em uma atenuação da energia que é transmitida pela via férrea ao restante sistema para frequências de excitação superiores à frequência de corte, ocorrendo todavia uma amplificação para frequências inferiores. Porém, o impacto que tal efeito tem nas vibrações percebidas no interior de edifícios próximos à infraestrutura ferroviária ainda não foi totalmente examinado, tendo os primeiros estudos integrados sobre a temática sido realizados pela autora da presente tese [44], [93], [175].

Refira-se que as frequências notáveis apresentadas foram calculadas atendendo apenas ao comportamento dinâmico da via, não sendo assim considerada a dinâmica do sistema túnel-maciço. Deve ainda ser mencionado que a abordagem seguida para a definição da frequência natural apenas é válida desde que a flexibilidade da soleira do túnel possa ser desprezada quando comparada com a flexibilidade da via. Se este pressuposto não se verificar, é desejável que se adote um procedimento mais detalhado, como por exemplo, o conceito de fator de transferência de carga proposto por Auersch (2012) e Alves Costa et al. (2012b).

### 6.3.2 Resposta dinâmica da via férrea

A Figura 6.21 apresenta a velocidade vertical de vibração do trilho, na posição $\mathrm{x}=0 \mathrm{~m}$, durante a passagem do trem Alfa-Pendular à velocidade de 40 m/s para os diferentes tipos de via férrea atrás definidos. Tal como no cenário base, considerou-se que no instante $\mathrm{t}=0 \mathrm{~s}$, o último eixo do trem ocupa a posição geométrica definida por $\mathrm{x}=0 \mathrm{~m}$.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-258_1334_1751_507_159.jpg)
Figura 6.21: Registro temporal da velocidade vertical do trilho para diferentes condições de suporte da laje: a) sem manta resiliente; b) manta com rigidez elevada; c) manta com rigidez intermediária; d) manta com rigidez baixa.

Os resultados provenientes do cálculo considerando a excitação total (mecanismos quase estático e dinâmico) e os resultados oriundos de um cálculo em que apenas se atende à excitação quase estática encontram-se sobrepostos no registro temporal ilustrado na Figura 6.21, e na representação no domínio da frequência patente na Figura 6.22.

A passagem de cada um dos eixos do trem pode ser claramente identificada a partir do registro temporal, que mostra uma resposta praticamente uniforme para todos os eixos, independentemente da rigidez adotada para a manta introduzida debaixo da laje. É no entanto observada uma tendência de amplificação da resposta com o aumento da flexibilidade da manta resiliente utilizada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-259_1272_1747_123_159.jpg)
Figura 6.22: Conteúdo em frequência da velocidade vertical do trilho para diferentes condições de suporte da laje: a) sem manta resiliente; b) manta com rigidez elevada; c) manta com rigidez intermediária; d) manta com rigidez baixa.

Os resultados expostos na Figura 6.21 permitem concluir que a resposta do trilho é dominada pela influência do mecanismo de excitação quase estático. Este aspecto é corroborado pela análise do conteúdo em frequência da resposta ilustrada na Figura 6.22, onde também se constata a preponderância do mecanismo quase estático na resposta dinâmica do trilho, qualquer que seja a rigidez da manta considerada. Não obstante, cabe mencionar que, embora se verifique, para frequências até 40 Hz, que a resposta dinâmica é dominada pelo mecanismo quase estático, para a faixa de frequências acima de 50 Hz, a resposta é totalmente condicionada pelo mecanismo de excitação dinâmica. Mais uma vez, observa-se um incremento na resposta dinâmica do trilho com a diminuição da rigidez da manta instalada.

Para facilitar a comparação dos resultados obtidos pelos diferentes modelos de via férrea, na Figura 6.23 ilustra-se a representação do conteúdo em frequência em banda de terço de oitava para as diferentes soluções em análise. Como se pode verificar, as maiores diferenças na velocidade vertical do trilho ocorrem na faixa de frequências mais baixa, ou seja até os 8 Hz, as quais se devem claramente a diferenças na rigidez
do suporte. No entanto, diferenças também notáveis são verificadas na faixa acima dos 30 Hz, neste caso associadas ao comportamento dinâmico do sistema de via flutuante.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-260_761_964_278_552.jpg)
Figura 6.23: Espectro de terço de oitava da resposta do trilho para os diferentes sistemas de via férrea em análise.

Embora os resultados relativos à laje não sejam aqui apresentados, um comportamento semelhante foi observado para a resposta dinâmica deste elemento.

O efeito de mitigação induzido pela introdução do elemento resiliente na via (entre a laje e a soleira do túnel) pode ser observado na Figura 6.24, que ilustra o conteúdo em frequência da velocidade vertical do ponto central do invert, na posição $\mathrm{x}=0 \mathrm{~m}$, para as diferentes soluções de isolamento da via em laje flutuante. A resposta dinâmica do ponto homólogo, mas para o caso da via sem isolamento, está também representada na mesma figura, a fim de facilitar a comparação dos resultados.

A presença da manta resiliente permite uma atenuação da energia que é transmitida pela via férrea ao seu suporte (invert do túnel) para frequências de excitação superiores à frequência de corte da via. Este efeito encontra-se bem patente na Figura 6.24, em que é possível observar uma considerável redução da energia transmitida ao invert do túnel para frequências acima de 68 Hz, 50 Hz e 30 Hz, para as soluções de isolamento com manta de rigidez elevada, intermediária e baixa, respectivamente. Por outro lado, assiste-se a uma amplificação clara da resposta no conteúdo em frequência próximo das frequências naturais dos sistemas isolados (ver Quadro 6.4). Refira-se que resultados com tendências semelhantes foram também obtidos por Alves Costa et al. (2012b) e Auersch (2011) para o caso de mantas em vias com lastro e sistemas de via em laje flutuante, respectivamente.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-261_1411_1752_119_157.jpg)
Figura 6.24: Conteúdo em frequência da velocidade vertical do ponto central do invert, na posição $\mathrm{x}=0 \mathrm{~m}$, para diferentes soluções de isolamento: a) manta com rigidez elevada; b) manta com rigidez intermediária; c) manta com rigidez baixa.

Uma forma mais evidente de avaliar a eficiência da medida de mitigação em análise consiste na representação do conteúdo da resposta em banda de terço de oitava (Figura 6.25a), ou, de forma ainda mais evidente, na análise das curvas de IL (insertion loss), as quais permitem avaliar o ganho efetivo, por banda de frequência, alcançado pela solução flutuante face ao cenário não isolado. Como é evidente, as conclusões refletidas nos parágrafos anteriores são diretamente transpostas para a análise da Figura 6.25a, razão pela qual não são necessários comentários adicionais. No entanto, quanto à Figura 6.25b, compete referir que quanto menor a rigidez da manta, maior é o seu potencial de redução de vibrações transmitidas da via ao seu suporte (invert do túnel). Um aspecto interessante desta figura prende-se com a redução de vibração entre os 3 Hz e os 8 Hz, a qual ocorre para uma faixa de frequência inferior à frequência natural de qualquer um dos sistemas de mitigação sob análise. De fato, esta atenuação de vibrações não se deve propriamente ao comportamento dinâmico do sistema, mas sim ao efeito estático resultante da flexibilização do suporte da laje.

Assemelhado o comportamento da laje a um modelo de Winkler, quanto maior for a flexibilidade do seu suporte maior é o seu comprimento elástico e, consequentemente, a ação aplicada é equilibrada por uma pressão "espalhada" por um comprimento longitudinal maior, logo, a pressão transmitida a um ponto discreto do invert é menor.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-262_784_1748_437_157.jpg)
Figura 6.25: Velocidade vertical do ponto central do invert, na posição $\mathrm{x}=0 \mathrm{~m}$ : a) espectro de terço de oitava; b) espectro de IL (insertion loss)

### 6.3.3 Resposta dinâmica do campo livre induzida pela passagem do trem

Procede-se agora à análise das vibrações induzidas pelo tráfego ferroviário nas proximidades da via férrea, assumindo que não existe qualquer edificação (condição de campo livre) e admitindo diferentes soluções de isolamento da via em laje flutuante. Para o estudo consideram-se os três pontos de observação situados na superfície do maciço anteriormente referidos: P1 (0,0,0); P2 (0,10,0); P3 (0,20,0).

Na Figura 6.26 apresentam-se os espectros de banda de terço de oitava relativos à velocidade vertical experimentada pelos pontos de observação considerados na superfície do terreno, em um cenário em que a presença do edifício é negligenciada (condição de campo livre), e para diferentes condições de isolamento da via.

Comparando a resposta dinâmica da superfície do terreno para as diferentes soluções de via é possível concluir que a presença de elementos resilientes na via não afeta a resposta dinâmica no campo livre para frequências até cerca de 8 Hz, para o caso da solução com manta mais flexível, ou até um valor ligeiramente mais elevado, para as demais situações. No entanto, para a faixa de frequências em torno da frequência de ressonância do sistema de isolamento, as soluções isoladas dão origem a amplificações consideráveis da resposta dinâmica, sendo este efeito acompanhado por uma redução da amplitude da resposta para a faixa de frequências acima da frequência
de corte. Este efeito está bem patente na Figura 6.27, onde as curvas de IL (insertion loss) da velocidade vertical, que traduzem o ganho em termos de redução de vibração devido à introdução da medida de mitigação, são ilustradas para os três pontos em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-263_645_1749_435_157.jpg)
Figura 6.26: Representação em banda de terço de oitava da velocidade vertical experimentada nos diferentes pontos localizados na superfície do terreno, na condição de campo livre, e para condições de isolamento da via distintas (dB-ref. $10^{-8} \mathrm{~m} / \mathrm{s}$ ): a) P1 ( $0,0,0$ ); b) P2 ( $0,10,0$ ); c) P3 ( $0,20,0$ ).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-263_630_1748_1299_158.jpg)
Figura 6.27: Representação dos espectros de IL (insertion loss) da velocidade vertical para os diferentes pontos localizados na superfície do terreno, na condição de campo livre, e para soluções de isolamento da via distintas: a) P1 (0,0,0); b) P2 (0,10,0); c) P3 (0,20,0)

Como se observa, uma alta eficiência na redução das vibrações no campo livre pode ser alcançada através de soluções de via férrea em laje flutuante, principalmente quando elementos resilientes de baixa rigidez são utilizados, ou seja, no caso de soluções com menor frequência de ressonância (assumindo que a massa da laje permanece constante). De fato, quando a manta menos rígida é adotada, uma significativa redução da velocidade vertical, de mais de 20 dB, é alcançada para o conteúdo de frequências mais elevadas. Por outro lado, a opção por mantas de elevada rigidez só permite alcançar uma redução considerável da velocidade vertical no campo livre para
a faixa de frequências acima de 80 Hz, onde a relevância da solução de atenuação não é tão interessante do ponto de vista da análise de vibrações estruturais.

Em relação à resposta dinâmica na direção horizontal, deve mencionar-se que os resultados seguem a mesma tendência observada para a direção vertical, dispensando deste modo uma análise detalhada no presente contexto.

Apesar dos efeitos de atenuação evidenciados no conteúdo de frequências mais elevadas, não se deve ignorar que ocorre uma amplificação da resposta dinâmica na faixa de frequências em torno da frequência natural da solução de isolamento. No caso da manta mais flexível, que corresponde à solução mais eficiente na atenuação de vibrações, a amplificação ocorre, principalmente, na faixa de frequências entre os 10 Hz e os 25 Hz. Este aspecto é particularmente relevante, uma vez que a faixa de frequências em que as amplificações são observadas pode coincidir com as frequências naturais das lajes de edifícios vizinhos, o que resulta em uma amplificação das vibrações percebidas nesses elementos. Este aspecto será discutido na seção seguinte, onde é analisada a resposta dinâmica do edifício devido às vibrações induzidas pelo tráfego ferroviário, atendendo à interação solo-estrutura.

### 6.3.4 Resposta dinâmica do edifício devido ao tráfego ferroviário no túnel

Com base nos estudos previamente apresentados do comportamento dinâmico do edifício e da sua interação com o solo de fundação, pode-se afirmar que a resposta dinâmica do edifício será condicionada pelas suas características dinâmicas e pelo campo de onda incidente induzido pela passagem do trem no túnel. Este último aspecto depende das medidas de mitigação implementadas, em particular da rigidez da manta introduzida no sistema de via em laje flutuante, ou seja, da frequência de ressonância da via (ver Figura 6.26 e Figura 6.27).

Dado que se assume que as propriedades dinâmicas do edifício são constantes, independentemente do cenário de isolamento considerado para a via, as diferenças registradas na resposta dinâmica das fundações, em função da rigidez da manta introduzida na via férrea, resultam das diferenças obtidas no campo de onda incidente. Assim, a Figura 6.28 mostra o registro temporal da velocidade vertical da fundação D do edifício (ver Figura 6.3) para as diferentes soluções de mitigação. Uma primeira análise dos resultados não permite identificar diferenças significativas na resposta dinâmica da sapata. De fato, à exceção dos valores de pico mais elevados evidenciados na solução com a manta mais rígida, os registros ilustrados para as outras situações, incluindo o caso do cenário não isolado, são muito semelhantes. No entanto, uma
análise mais profunda, tendo em consideração o conteúdo em frequência da resposta, como se apresenta na Figura 6.29, permite extrair algumas informações interessantes.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-265_654_1748_284_159.jpg)
Figura 6.28: Registro temporal da velocidade vertical da fundação D para os diferentes cenários de rigidez da manta: a) rigidez baixa; b) rigidez intermediária; c) rigidez elevada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-265_645_1745_1100_161.jpg)
Figura 6.29: Conteúdo em frequência da velocidade vertical da fundação D para os diferentes cenários de rigidez da manta: a) rigidez baixa; b) rigidez intermediária; c) rigidez elevada.

A partir da análise do conteúdo em frequência da velocidade vertical da fundação D é possível observar que a resposta dinâmica é amplificada para a faixa de frequências em torno da frequência de ressonância do sistema de isolamento, sendo este efeito acompanhado por uma atenuação da resposta dinâmica para frequências superiores à frequência de corte. Este aspecto é particularmente interessante para o caso em que se utiliza a manta mais flexível, onde a resposta dinâmica da fundação D é quase completamente dominada por uma faixa de baixas frequências, inferiores a 25 Hz, com uma forte componente de conteúdo para frequências entre 10 Hz e 20 Hz.

Os aspectos mencionados no parágrafo anterior são corroborados pela observação dos espectros de IL (insertion loss) referentes ao ponto D e às diferentes soluções de mitigação, os quais se ilustram na Figura 6.30a. Dado que o IL corresponde apenas a uma razão entre resultados, podendo não refletir totalmente a relevância da atenuação
alcançada para fins de engenharia, na Figura 6.30b ilustra-se a velocidade vertical da fundação D em termos de espectro de banda de terço de oitava. A observação conjunta das duas grandezas em questão permite não só perceber qual a eficiência alcançada pela solução, mas também o seu reflexo prático.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-266_739_1743_434_160.jpg)
Figura 6.30: Velocidade vertical da fundação D para os diferentes cenários de isolamento: a) espectro de IL (insertion loss); b) espectro de terço de oitava.

Atendendo às características dinâmicas do edifício, ou seja, às frequências de ressonância e aos modos descritos na Figura 6.10, bem como às curvas FRF ilustradas na Figura 6.13, é possível antecipar que a opção por uma solução com mantas bastante flexíveis dá origem a uma amplificação considerável da resposta dinâmica vertical das lajes do edifício. De fato, havendo uma correspondência entre as frequências de ressonância associadas aos modos de vibração que implicam o movimento vertical das lajes do edifício e a frequência natural do sistema de isolamento da via, é previsível que ocorram efeitos de amplificação apreciáveis nas lajes.

A questão mencionada é confirmada pela análise da Figura 6.31, onde os registros temporais da velocidade vertical dos pontos centrais das lajes do primeiro pavimento do edifício (ponto H e ponto G) são apresentados. A fim de facilitar a comparação, os resultados para o cenário não isolado (sem manta resiliente) são sobrepostos nas figuras.

Como se pode observar, a opção pela instalação de uma manta pouco rígida por baixo da laje da via férrea dá origem a uma amplificação considerável da resposta dinâmica vertical das lajes do edifício. Ao contrário do que acontece nas outras situações, quando a manta mais flexível é adotada, a resposta dinâmica das lajes é totalmente dominada pela faixa de frequências em torno das frequências naturais do edifício que implicam modos locais de flexão das lajes. Este aspecto está bem ilustrado
na Figura 6.32, onde o conteúdo em frequência da velocidade vertical do ponto H é descrito para as diferentes soluções de via em laje flutuante em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-267_1290_1749_281_159.jpg)
Figura 6.31: Registro temporal da velocidade vertical experimentada nos pontos centrais das lajes do 1° pavimento para as diferentes soluções de via em laje flutuante: a) Ponto H- manta com rigidez baixa; b) Ponto H- manta com rigidez intermediária; c) Ponto H- manta com rigidez elevada; d) Ponto G- manta com rigidez baixa; e) Ponto G- manta com rigidez intermediária; f) Ponto G- manta com rigidez elevada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-267_676_1750_1882_159.jpg)
Figura 6.32: Conteúdo em frequência da velocidade vertical experimentada no ponto H para as diferentes soluções de via em laje flutuante: a) manta com rigidez baixa; b) manta com rigidez intermediária; c) manta com rigidez elevada.

Uma análise detalhada do conteúdo em frequência ilustrado na Figura 6.32 permite identificar que, independentemente das propriedades do sistema de laje flutuante, ocorrem três picos principais na resposta, para frequências próximas dos 13 Hz, 16,7 Hz e 18,6 Hz, à semelhança do já verificado em análise anterior efetuada para o cenário de referência. Como aliás já constatado, a frequência do primeiro pico é consistente com a frequência de passagem dos bogies do trem à velocidade de 40 m/s, estando por outro lado as frequências associadas aos restantes dois picos em consonância com o 9º e 10° modos de vibração da estrutura. Como esperado, esses picos são amplificados no caso da opção pela solução com manta mais flexível, uma vez que há uma correspondência entre o intervalo de frequências em que há amplificação devido à solução de isolamento e as frequências de ressonância da estrutura do edifício. Essa observação é muito relevante, pois uma análise simplista do problema tenderia a afirmar que a adoção de sistemas de laje flutuante de menor frequência natural (utilização das mantas mais flexíveis ou aumento da massa da laje) conduziria a resultados mais satisfatórios, dado que a frequência de corte seria mais baixa e, consequentemente, valores mais elevados do IL (insertion loss) seriam alcançados. Contudo, como associado ao efeito de atenuação para frequências superiores à frequência de corte ocorre um efeito de amplificação em torno da frequência natural do sistema flutuante, a coincidência das frequências naturais da estrutura com esse efeito pode conduzir a uma amplificação da velocidade de pico percebida na estrutura (ver Figura 6.31a).

Embora os espectros lineares ilustrados na Figura 6.32 permitam uma análise detalhada de efeitos locais, tais como a identificação clara dos picos da resposta, a sua interpretação energética torna-se mais complexa dado o caráter irregular dos mesmos. Para destacar a conclusão alcançada no parágrafo anterior, considere-se a Figura 6.33a, onde se ilustra o espectro de banda de terço de oitava da velocidade vertical observada no ponto H para os vários cenários em estudo. Na Figura 6.33b, ilustram-se os espectros de IL (insertion loss) para as diferentes soluções de isolamento.

Com o intuito de permitir uma melhor percepção da potencial consequência das vibrações em causa, encontram-se representadas na Figura 6.33a as curvas limite propostas por Gordon (1991) para vibrações compatíveis com a operação de equipamentos sensíveis. O mesmo autor, em uma versão mais recente [14], inclui também uma curva limite para a velocidade de vibração no interior de edifícios em período noturno. Como se pode verificar, atendendo ao critério representado na figura, a
solução de mitigação através da incorporação de manta flexível não é compatível com a curva VC-C (esta curva define o limite para a condução de operações de litografia ou de inspeção com detalhe não inferior a 1 micrômetro). Porém, caso o foco da análise não estivesse nas vibrações, mas no ruído re-radiado, então a solução com melhor desempenho seria a alcançada com a manta mais flexível dado que permite uma atenuação drástica da amplitude da resposta para frequências pouco superiores a 20 Hz, tal como se observa na Figura 6.33b.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-269_773_1749_664_157.jpg)
Figura 6.33: Espectro de terço de oitava da resposta no ponto H: a) velocidade vertical; b) insertion loss.

Relativamente à evolução da resposta dinâmica vertical do edifício em função da altura do pavimento, é possível concluir que as diferenças nos resultados não são muito relevantes. Com efeito, comparando os resultados apresentados na Figura 6.34, que ilustram a velocidade vertical do ponto J (ponto central da laje do segundo pavimento) para o caso da solução com manta mais flexível, com os homólogos apresentados na Figura 6.31a e na Figura 6.32a para o ponto H, é possível afirmar que as diferenças não são significativas, uma vez que se registram as mesmas tendências independentemente da altura do pavimento do edifício.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-270_654_1756_121_152.jpg)
Figura 6.34: Velocidade vertical do ponto J (ponto central da laje do 2° pavimento) para a solução de via em laje flutuante com manta de baixa rigidez: a) registro temporal; b) conteúdo em frequência.

Quanto à resposta dinâmica do edifício nas direções horizontais, e com base nas informações transmitidas pelas curvas FRF representadas na Figura 6.14 e nos estudos anteriormente apresentados, prevê-se que a estrutura funcione como um "filtro", atenuando as vibrações que atingem as fundações na faixa de frequências mais elevadas, registrando-se contudo uma amplificação significativa da resposta dinâmica para as frequências mais baixas, que é justificada atendendo às frequências naturais da estrutura associadas aos modos de vibração onde o movimento horizontal das lajes está implícito. Este efeito está efetivamente ilustrado na Figura 6.35, que compara o conteúdo em frequência da velocidade de vibração nas direções horizontais da fundação D com o do ponto J (ponto central da laje do 2° pavimento), para o cenário de via não isolada. Da análise da Figura 6.35 fica então claro que o conteúdo em frequência da resposta do ponto inscrito na laje do edifício é agora limitado a uma faixa estreita de baixas frequências.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-270_643_1750_1950_156.jpg)
Figura 6.35: Conteúdo em frequência da velocidade horizontal de vibração da fundação D e do ponto J (ponto central da laje do 2° pavimento) para o cenário de via não isolada: a) direção x; b) direção y.

Atendendo a que a faixa de frequências para a qual ocorre amplificação da resposta horizontal das lajes do edifício é muito inferior à frequência de ressonância dos sistemas de isolamento em análise, não é esperado que se observem alterações significativas na resposta dinâmica do edifício em função das propriedades da via férrea. Este aspecto pode ser confirmado pela inspeção da Figura 6.36, onde se mostram os espectros de banda de terço de oitava referentes à velocidade horizontal na direção x experimentada pelos pontos H e J (ver Figura 6.3) para diferentes condições de isolamento.

Como se pode constatar, a consideração de mantas com valores de rigidez distintos em sistemas de laje flutuante não afeta substancialmente a resposta dinâmica da estrutura na direção horizontal, uma vez que a sua resposta está confinada à faixa de frequências até cerca de 8 Hz. Note-se que este resultado é consistente com a análise modal do edifício realizada anteriormente (ver Figura 6.10). Comparando os resultados apresentados na Figura 6.36a e b, é perceptível um acréscimo da resposta dinâmica na direção horizontal com o aumento da altura do ponto de observação, contrariamente ao verificado nos resultados relativos à resposta dinâmica vertical onde não se registrou nenhuma alteração significativa na resposta dinâmica em altura.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-271_625_1747_1431_156.jpg)
Figura 6.36: Representação em banda de terço de oitava da velocidade horizontal na direção x experimentada em dois pontos distintos e para diferentes condições de isolamento (dB-ref. $10^{-8}$ m/s ): a) Ponto H; b) Ponto J.

Diante das análises desenvolvidas até o momento, torna-se evidente que a dinâmica do edifício é consideravelmente influenciada pela sua interação com o solo de fundação, principalmente no que respeita ao mecanismo de vibração vertical das lajes, que é uma das principais causas de incômodo dos habitantes de edifícios próximos de linhas ferroviárias. Pretendendo realçar a relevância da interação solo-estrutura, a Figura 6.37 mostra a velocidade vertical do ponto J do edifício para o caso em que a manta mais flexível é instalada na via férrea. Os resultados agora apresentados
foram calculados seguindo duas abordagens distintas: a) com base em uma abordagem que contempla a interação solo-estrutura (SSI), ou seja, considerando a impedância do solo de fundação na análise da resposta dinâmica da estrutura (através de uma formulação MEC - 3D); b) a partir de uma metodologia com acoplamento fraco entre o solo e a estrutura, em que o solo é assumido como um meio infinitamente rígido e os graus de liberdade das fundações do edifício são excitados pelo campo de vibração incidente gerado pela passagem do trem no túnel.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-272_653_1754_660_153.jpg)
Figura 6.37: Velocidade vertical experimentada no ponto J considerando duas abordagens distintas, com e sem interação solo-estrutura: a) registro temporal; b) conteúdo em frequência.

Como esperado, quando a interação solo-estrutura é negligenciada, registra-se uma superestimação da resposta dinâmica das lajes. Este efeito, que se verifica indepen-dentemente da medida de mitigação adotada na via, é particularmente relevante para a resposta dinâmica das lajes na direção vertical, a qual é dominada por modos de flexão locais. Conclusões semelhantes foram obtidas por François et al. (2007), que efetuou um estudo detalhado sobre a interação solo-estrutura, e também por Romero et al. (2013), acerca do comportamento dinâmico de pontes sujeitas a solicitações de tráfego.

Em suma, a partir do estudo aqui desenvolvido é possível concluir que a concepção de sistemas de via em laje flutuante deve ser realizada tendo em consideração as características dinâmicas dos edifícios situados na proximidade da infraestrutura ferroviária. Isto porque se verifica que, em determinadas situações, a frequência natural do sistema de laje flutuante pode ser muito próxima da frequência de ressonância das lajes do edifício, originando deste modo uma amplificação dos valores de pico da resposta.

### 6.4 Influência da rigidez do solo

### 6.4.1 Descrição geral

Nesta seção é apresentado um estudo numérico acerca da influência da rigidez do solo nas vibrações induzidas pelo tráfego ferroviário em túneis. A partir dos estudos já apresentados, é possível afirmar que a rigidez do solo não só desempenha um papel importante nas vibrações verticais induzidas na superfície do terreno e, portanto, no mecanismo de propagação de vibrações, como se concluiu do estudo paramétrico realizado no Capítulo 4, mas também condiciona de modo relevante o mecanismo de interação solo-estrutura, como se tornou evidente na análise do comportamento dinâmico do edifício realizada na seção 6.2.4.2 do presente capítulo. Do exposto, fica claro que a rigidez do solo é um parâmetro que irá influenciar significativamente a resposta dinâmica da estrutura devido às vibrações induzidas pelo tráfego ferroviário, surgindo assim como pertinente um estudo mais detalhado, realizado de forma integrada, acerca da influência deste parâmetro na resposta dinâmica do edifício.

Atendendo a que a rigidez do solo é um parâmetro que se assume como relevante em várias vertentes do problema em análise, na presente seção é desenvolvido um estudo integrado, contemplando agora o problema na sua globalidade, ou seja, tendo em conta a geração de vibrações devido à interação veículo-via, a propagação das vibrações pelo meio envolvente, bem como a recepção de vibrações no interior de edifícios situados nas proximidades do túnel.

No estudo paramétrico apresentado a seguir considera-se o cenário de referência descrito na seção 6.2.1 do presente capítulo. Todavia, com o intuito de avaliar a influência da rigidez do solo, assumem-se dois cenários distintos adicionais para o solo de fundação, em correspondência com as propriedades indicadas no Quadro 6.5 ( $\mathrm{C}_{\mathrm{s}}$ corresponde à velocidade de propagação das ondas de cisalhamento, $\nu$ é o coeficiente de Poisson, $\rho$ a massa específica e $\xi$ é o amortecimento material do solo).

Quadro 6.5: Propriedades mecânicas do maciço geotécnico.
| Cenário | $\mathbf{C}_{\mathbf{s}} \boldsymbol{(} \mathbf{m} \boldsymbol{/} \mathbf{s} \boldsymbol{)}$ | $\nu$ | $\rho\left(\mathbf{k g} / \mathbf{m}^{\mathbf{3}}\right)$ | $\xi$ |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 150 | 0,3 | 1900 | 0,04 |
| 2 | 250 | 0,3 | 1900 | 0,04 |
| 3 | 410 | 0,3 | 1900 | 0,04 |


### 6.4.2 Resposta dinâmica da via férrea

A Figura 6.38 apresenta o registro temporal da velocidade vertical de vibração do trilho, na posição $\mathrm{x}=0 \mathrm{~m}$, durante a passagem do trem Alfa-Pendular à velocidade de 40 m/s para os diferentes cenários atrás definidos (no instante $\mathrm{t}=0 \mathrm{~s}$, o último eixo do trem ocupa a posição geométrica definida por $\mathrm{x}=0 \mathrm{~m}$ ). Atendendo a que a deformabilidade da via é praticamente conferida na sua totalidade pelos elementos resilientes (palmilhas elásticas e mantas instaladas sob a laje), a resposta dinâmica da via quase não é afetada pelas propriedades elásticas do maciço onde se inscreve o túnel. No entanto, fora do contexto da via, como é por exemplo o caso da soleira do túnel, as propriedades do maciço começam a assumir alguma relevância. Este aspecto está bem evidenciado na representação dos espectros de banda de terço de oitava ilustrados na Figura 6.39, referentes à velocidade vertical experimentada no trilho e no ponto central do invert do túnel (na seção transversal definida por $\mathrm{x}=0 \mathrm{~m}$ ), para os diferentes cenários de rigidez do solo em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-274_564_1749_1190_159.jpg)
Figura 6.38: Registro temporal da velocidade vertical de vibração do trilho para diferentes propriedades do solo de fundação: a) $\mathrm{Cs}=150 \mathrm{~m} / \mathrm{s}$; b) $\mathrm{Cs}=250 \mathrm{~m} / \mathrm{s}$; c) $\mathrm{Cs}=410 \mathrm{~m} / \mathrm{s}$.

Uma primeira análise dos resultados apresentados na Figura 6.39 permite constatar a importância dos elementos resilientes da via na redução dos níveis de vibração que são transmitidos da via à soleira do túnel. Comparando os resultados apresentados na Figura 6.39a, relativos ao trilho, com os da Figura 6.39b, referentes ao invert do túnel, é possível observar uma considerável redução da velocidade de vibração, superior a 20 dB, independentemente da banda de frequência em questão. Verifica-se ainda que este efeito de atenuação é tanto mais pronunciado quanto maior a rigidez do solo de fundação. De fato, se quanto à resposta dinâmica da via as propriedades do solo não desempenham um papel relevante, a mesma afirmação não pode ser generalizada para o caso da resposta dinâmica do invert do túnel, dado que se registram diferenças de alguns dB em função da rigidez do maciço (Figura 6.39b). Esta conclusão deve
contudo ser apresentada com prudência, uma vez que é dependente do contraste de rigidez entre a via e o restante meio que lhe serve de suporte.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-275_652_1754_284_153.jpg)
Figura 6.39: Representação em banda de terço de oitava da velocidade vertical experimentada em dois pontos distintos (na posição $\mathrm{x}=0 \mathrm{~m}$ ), e para os diferentes cenários em análise (dB-ref. $10^{-8}$ m/s ): a) trilho; b) invert do túnel.

Embora os resultados referentes à laje não sejam aqui apresentados, o comportamento dinâmico deste elemento é muito semelhante ao do trilho, sendo apenas os níveis de vibração alcançados ligeiramente menores devido à presença da palmilha elástica entre a laje e o trilho.

Com base nos resultados até agora apresentados é possível avançar com duas conclusões distintas: a) as propriedades do solo não são um aspecto relevante para o problema da geração de vibrações induzidas pelo tráfego ferroviário em túneis (pelo menos quando os sistemas de via em laje flutuante adotados exibem condições de rigidez média a baixa); b) as propriedades do solo, em particular a sua rigidez, desempenham um papel importante nas vibrações percebidas no túnel e, por conseguinte, no problema de propagação de vibrações pelo meio envolvente. Esta última questão vai ser alvo de análise mais detalhada na seção que se segue.

### 6.4.3 Resposta dinâmica do campo livre induzida pela passagem do trem

A resposta dinâmica do campo livre, como já explanado previamente, resulta da convolução das forças de interação dinâmica geradas na interface roda-trilho (veículo-via) com as funções de transferência do sistema via-túnel-maciço. Conforme abordado na seção anterior, a resposta dinâmica do trilho é praticamente independente das propriedades do terreno. Atendendo ao mecanismo de interação veículo-via, expresso pela equação [5.4], é possível concluir que o problema da fonte de vibração, ou seja, da geração de forças dinâmicas devido à interação dinâmica entre o trem e a via, é também ele praticamente independente da rigidez do solo. Por conseguinte,
as diferenças registradas entre os resultados obtidos para cada um dos três cenários em análise devem-se às características dos mecanismos de transmissão de vibrações inerentes aos diferentes meios considerados.

Com vista à análise das vibrações induzidas pelo tráfego ferroviário nas proximidades da via férrea para os diferentes cenários de rigidez do solo de fundação, consideram-se vários pontos de observação, todos situados na superfície do maciço e na seção transversal definida por $\mathrm{x}=0 \mathrm{~m}$, mas localizados a diferentes distâncias do plano de simetria do túnel: o ponto P1, que pertence ao próprio plano, e os pontos Q1, Q2 e P3 que se encontram afastados de 5 m, 16 m e 20 m, respectivamente.

A Figura 6.40 compara os espectros de banda de terço de oitava relativos à velocidade vertical experimentada em pontos de observação considerados na superfície do terreno, assumindo a inexistência de edificações (condição de campo livre) e para os três cenários em análise, a que correspondem valores do módulo de cisalhamento do solo distintos (ou velocidades de propagação das ondas de cisalhamento, tal como indicado no Quadro 6.5).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-276_613_1752_1281_159.jpg)
Figura 6.40: Representação em banda de terço de oitava da velocidade vertical experimentada em diferentes pontos localizados na superfície do terreno, na condição de campo livre, e para condições de rigidez do solo de fundação distintas (dB-ref. $10^{-8} \mathrm{~m} / \mathrm{s}$ ): a) P1 ( $0,0,0$ ); b) Q2 ( $0,16,0$ ); c) P3 (0,20,0).

Atentando na Figura 6.40 observa-se que na faixa das baixas frequências há uma tendência para a diminuição da velocidade vertical de vibração com o aumento da rigidez do maciço. Quando o receptor está localizado diretamente acima do túnel (Figura 6.40a), a observação anterior também se estende à faixa de frequências mais elevada, uma vez que a resposta para estas frequências é largamente influenciada pela propagação das ondas de compressão (ondas P) na direção vertical, ao contrário do que se verifica, no caso da resposta dinâmica vertical, em pontos mais afastados do
túnel, onde as ondas de cisalhamento (ondas S) e as ondas de Rayleigh (ondas R) desempenham um papel mais relevante na resposta.

Em relação à componente horizontal da resposta, a qual está representada na Figura 6.41, pode-se afirmar o oposto, sendo a contribuição das ondas de compressão para a resposta horizontal dos pontos mais distantes do túnel muito importante. Este aspecto é inteiramente justificado pelas características de decaimento da resposta mediante o tipo de onda associado, como aliás já discutido em capítulo precedente da presente tese.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-277_617_1751_741_156.jpg)
Figura 6.41: Representação em banda de terço de oitava da velocidade horizontal (na direção y) experimentada em diferentes pontos localizados na superfície do terreno, na condição de campo livre, e para condições de rigidez do solo de fundação distintas (dB-ref. $10^{-8} \mathrm{~m} / \mathrm{s}$ ): a) Q1 ( $0,5,0$ ); b) Q2 (0,16,0); c) P3 (0,20,0).

Comparando os resultados obtidos para os vários pontos de observação em análise, conclui-se que é bastante difícil estabelecer uma tendência clara de comportamento. A resposta dinâmica na faixa de frequências média apresenta uma complexidade elevada, que é consequência da interação túnel-maciço, como aliás discutido por Gupta et al. (2009); Gupta et al. (2009) e Lopes et al. $(2013,2014)$ e também no Capítulo 4 da presente tese. No entanto, apesar da complexidade da resposta, é possível constatar que para as frequências mais elevadas, a influência da variação da rigidez do solo na velocidade vertical registrada tende a diminuir com o aumento da distância do ponto de observação em relação ao túnel. Este comportamento deve-se à compensação do "efeito da rigidez" pelo "efeito do amortecimento". A diminuição da rigidez do solo dá efetivamente origem a um incremento na resposta dinâmica, porém, este acréscimo é parcialmente compensado pelo aumento do efeito do amortecimento material, uma vez que os comprimentos de onda propagantes são mais curtos, o que se repercute em uma maior atenuação da resposta. Esse efeito, como é esperado, se torna mais evidente com o aumento da frequência de excitação e da distância entre o túnel e o receptor. Refira-se ainda uma outra observação interessante, que está relacionada com
o fato de na faixa de frequências entre os 5 Hz e os 30 Hz se verificar que a rigidez do solo desempenha um papel mais relevante na componente vertical da resposta do que na sua componente horizontal. Esta constatação deve todavia ser atendida com cautela pois é bastante dependente do mecanismo de interação túnel-maciço.

Em suma, apesar da assumida complexidade do problema, é possível afirmar que a rigidez do maciço influencia de modo relevante o campo de vibrações percebido na superfície do maciço. A sua influência é mais pronunciada na componente vertical da resposta e para a faixa de frequências abaixo de 40 Hz, principalmente quando o ponto receptor se encontra mais afastado do túnel.

### 6.4.4 Resposta dinâmica do edifício ao tráfego subterrâneo

Dos estudos efetuados anteriormente sobre o comportamento dinâmico do edifício e sua interação com o solo de fundação é possível inferir que a resposta dinâmica do edifício é condicionada pelas suas propriedades dinâmicas e pelo campo de onda incidente induzido pela circulação do trem no túnel. Ambos os aspectos referidos são profundamente afetados pelas propriedades do solo, uma vez que a rigidez do solo além de influenciar de modo significativo o mecanismo de propagação de vibrações pelo meio envolvente até a superfície, como se constata da análise efetuada na seção anterior (ver Figura 6.40 e Figura 6.41), também condiciona claramente o comportamento dinâmico da estrutura, dada a sua relevância no mecanismo de interação solo-estrutura (edifício), conforme abordado na seção 6.2.4.2 do presente capítulo (ver Figura 6.15 e Figura 6.16). Resulta do exposto a evidência de que a rigidez do solo é um parâmetro que irá certamente influenciar de modo relevante a resposta dinâmica da estrutura devido à excitação induzida pelo tráfego ferroviário no túnel.

Contudo, a partir dos resultados até agora apresentados, e da sua análise detalhada, não é fácil estabelecer uma tendência clara de como a rigidez do solo afeta os níveis de vibração percebidos no interior dos edifícios devido ao tráfego ferroviário. Considere-se o seguinte exemplo: foi salientado que a diminuição da rigidez do solo é acompanhada por um aumento da velocidade do campo de onda incidente para a faixa de frequências até 40 Hz (Figura 6.40), no entanto, os solos que exibem menor rigidez permitem uma maior radiação de energia pelo maciço de fundação (através do mecanismo de SSI), tal como se ilustra na Figura 6.15, o que pode compensar, pelo menos parcialmente, o efeito anteriormente referido. Surge deste modo a necessidade de desenvolver um estudo integrado que permita avaliar melhor a influência da rigidez do maciço na resposta dinâmica do edifício, o qual é apresentado na presente seção.

Como já discutido anteriormente, devido aos efeitos da interação solo-estrutura, a resposta dinâmica das sapatas do edifício é distinta do campo de onda incidente. A diferença registrada é tão mais pronunciada quanto menor a rigidez do solo de fundação, conforme está ilustrado na Figura 6.42, onde o conteúdo em frequência da velocidade de resposta na direção vertical da fundação D (ver Figura 6.3) é comparado com o da velocidade vertical do campo de onda incidente correspondente, para os diferentes cenários de rigidez do maciço em análise.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-279_614_1750_662_159.jpg)
Figura 6.42: Conteúdo em frequência da velocidade vertical experimentada na fundação D e do campo de onda incidente nessa mesma localização, para diferentes propriedades do solo de fundação: a) $\mathrm{Cs}=150 \mathrm{~m} / \mathrm{s}$; b) $\mathrm{Cs}=250 \mathrm{~m} / \mathrm{s}$; c) $\mathrm{Cs}=410 \mathrm{~m} / \mathrm{s}$ (linha vermelha- campo de onda incidente; linha azul- resposta da fundação D).

Da análise da Figura 6.42 constata-se que para a faixa de frequências até os 25 Hz ocorre amplificação do campo de onda incidente, ou seja, a velocidade vertical registrada na fundação é superior à velocidade vertical do campo incidente, independentemente da rigidez do solo. Como esperado, este efeito é tão mais acentuado quanto menor a rigidez do solo de fundação. No entanto, para frequências acima dos 25 Hz, é visível, para o caso do cenário menos rígido (Figura 6.42a), uma clara redução da velocidade vertical da fundação quando comparada com a do campo de onda incidente. Essa tendência, embora ocorra parcialmente, não é tão perceptível para os restantes cenários.

Quanto à resposta dinâmica vertical das lajes do edifício, a inspeção da Figura 6.43, a qual ilustra o registro temporal da velocidade vertical do ponto H (ponto central de uma laje do primeiro pavimento), permite constatar uma clara influência da rigidez do solo na resposta dinâmica do sistema.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-280_594_1745_123_162.jpg)
Figura 6.43: Registro temporal da velocidade vertical experimentada pelo ponto H (ponto central da laje do 1° pavimento) para diferentes propriedades do solo de fundação: a) Cs=150 m/s; b) $\mathrm{Cs}=250 \mathrm{~m} / \mathrm{s} ; \mathrm{c}) \mathrm{Cs}=410 \mathrm{~m} / \mathrm{s}$.

Uma primeira análise dos resultados permite concluir que os valores de pico da velocidade vertical aumentam à medida que aumenta a rigidez do solo de fundação. Note-se que o efeito de amortecimento induzido pelo mecanismo de interação solo--estrutura, que é tanto mais notório quanto menos rígido é o maciço de fundação, está aqui bem evidenciado. No caso do cenário mais rígido, é possível identificar um registro final de vibração livre do edifício após a passagem do trem, o qual só é perceptível, face aos restantes cenários, pelo fato de o efeito de amortecimento associado ao mecanismo de SSI ser aqui menos relevante. Refira-se que estas observações são também corroboradas pela análise do conteúdo em frequência da resposta do ponto H, que está representado na Figura 6.44.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-280_646_964_1712_551.jpg)
Figura 6.44: Representação do espectro de banda de terço de oitava da velocidade vertical do ponto H para diferentes propriedades do solo de fundação (dB-ref. $10^{-8} \mathrm{~m} / \mathrm{s}$ ).

Na análise da Figura 6.44, verifica-se que na faixa de frequências mais baixa, até cerca dos 10 Hz, a velocidade vertical aumenta com a diminuição da rigidez do maciço de fundação. Após esse limite esta tendência inverte-se, sendo este resultado explicado pela influência da interação solo-estrutura no comportamento dinâmico do edifício.

Com efeito existe uma perfeita compatibilidade entre os resultados agora ilustrados e os ditados pela Figura 6.15b, onde o efeito da rigidez do maciço de fundação nos mecanismos de SSI foi abordado.

De modo geral, a maior preocupação quando se lida com o problema das vibrações induzidas em edifícios devido ao tráfego, diz respeito à componente vertical da resposta [18], [229]. Todavia, as propriedades do maciço de fundação também afetam as componentes horizontais da resposta, como se mostra nos espectros de banda de terço de oitava referentes à velocidade horizontal (na direção y) experimentada pelo ponto H, os quais estão representados na Figura 6.45. Como se pode visualizar, o conteúdo em frequência da resposta está concentrado em uma faixa estreita de baixas frequências, em correspondência com as frequências naturais associadas ao 2° e 4° modos de vibração da estrutura do edifício (ver Figura 6.10), onde o movimento horizontal das lajes na direção y está implícito. Para a faixa de frequências mais elevada, a estrutura do edifício atua como um "filtro" em relação às vibrações do campo de onda incidente, deixando assim praticamente de haver conteúdo de resposta. Não obstante, é notório que a velocidade horizontal aumenta com a diminuição da rigidez do solo de fundação, dado que para a faixa de frequências em causa a resposta do sistema apenas é condicionada pela rigidez quase estática do solo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-281_648_964_1506_552.jpg)
Figura 6.45: Representação do espectro de banda de terço de oitava da velocidade horizontal (na direção y) do ponto H para diferentes propriedades do solo de fundação (dB-ref. $10^{-8} \mathrm{~m} / \mathrm{s}$ ).

### 6.4.5 Relevância da análise da interação solo-estrutura e abordagens alternativas

Os resultados apresentados na última seção foram calculados recorrendo a uma análise detalhada do sistema maciço-edificação pelo MEF-MEC 3D. Contudo, abordagens alternativas, de preferência mais simples e que permitam reduzir o esforço de cálculo sem comprometer em demasia a precisão da solução, devem também ser
consideradas. No limite, a alternativa mais simples consiste em negligenciar a contribuição do maciço de fundação para o comportamento dinâmico do edifício, ou seja, assumir que a rigidez do solo é tão elevada que a sua contribuição para a resposta não é relevante. Tendo em consideração as funções FRF apresentadas anteriormente (seção 6.2.4.2) torna-se evidente que esta opção só é aceitável nos casos em que é considerado um maciço de fundação muito rígido. No entanto, entre esta abordagem e a avaliação da impedância do solo de fundação através de uma formulação detalhada como o método dos elementos de contorno (MEC 3D), é necessário analisar e verificar com mais detalhe a adequação dos modelos discretos condensados, como por exemplo, o modelo apresentado no Capítulo 5 e designado por modelo cauda de macaco.

A Figura 6.46 compara o registro temporal da velocidade vertical do ponto H, calculada pelos três métodos distintos atrás mencionados, para os dois cenários extremos em análise: maciço mais flexível e maciço mais rígido (ver Quadro 6.5).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-282_736_1747_1125_156.jpg)
Figura 6.46: Influência da interação solo-estrutura (SSI) e do método de avaliação da impedância do solo de fundação no registro temporal da velocidade vertical experimentada pelo ponto H (ponto central da laje do 1° pavimento) para os dois cenários de rigidez do solo em análise: a) $\mathrm{Cs}=150 \mathrm{~m} / \mathrm{s}$; b) $\mathrm{Cs}=410 \mathrm{~m} / \mathrm{s}$.

A partir dos resultados agora apresentados podem tecer-se dois comentários principais, que pela sua evidência aqui se destacam: i) a consideração dos efeitos da interação solo-estrutura é imprescindível para uma avaliação precisa das vibrações induzidas no interior de edifícios devido ao tráfego ferroviário no túnel; ii) no presente caso, os resultados obtidos usando o modelo cauda de macaco para o cálculo da rigidez dinâmica do solo ajustam-se muito bem à solução proveniente da abordagem pelo MEC 3D. A primeira observação é particularmente notória na Figura 6.46a, onde se verifica uma significativa superestimação dos valores de pico da velocidade vertical quando os efeitos do mecanismo de interação solo-estrutura são negligenciados. As
observações realçadas ganham robustez através da análise dos resultados homólogos no domínio da frequência, os quais se encontram representados na Figura 6.47.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-283_706_1745_285_160.jpg)
Figura 6.47: Influência da interação solo-estrutura (SSI) e do método de avaliação da impedância do solo de fundação no conteúdo em frequência da velocidade vertical experimentada no ponto H (ponto central da laje do 1º pavimento) para os dois cenários de rigidez do solo em análise: a) $\mathrm{Cs}=150 \mathrm{~m} / \mathrm{s} ; \mathrm{b}) \mathrm{Cs}=410 \mathrm{~m} / \mathrm{s}$.

Como é possível visualizar, no cenário em que o maciço exibe menor rigidez (Figura 6.47a) a não inclusão dos efeitos da interação solo-estrutura pode dar origem a uma superestimação da resposta até cerca de 15 dB na faixa de frequências em torno dos 20 Hz, verificando-se que esta superestimação é reduzida para 5 dB quando se considera o cenário mais rígido. Apesar das diferenças registradas quando se comparam os resultados obtidos através do modelo discreto condensado com os oriundos da abordagem pelo MEC 3D, pode afirmar-se que, em geral, se obtém uma boa concordância, mesmo quando a rigidez do solo é muito baixa (que corresponde ao cenário mais desfavorável), o que evidencia as potencialidades do modelo em causa.

### 6.5 Considerações finais e conclusões

No capítulo que agora termina, com base na ferramenta numérica proposta neste trabalho, que consiste em um modelo abrangente que permite simular de modo eficiente as vibrações induzidas pelo tráfego ferroviário em túneis, foi desenvolvido um estudo numérico integrado desde a fonte (trem) até o receptor (edifício). A metodologia adotada compreende a simulação dos principais aspectos do problema, ou seja, a geração de vibrações, a sua propagação através do solo e a recepção de vibrações no interior de edifícios situados nas proximidades da infraestrutura ferroviária. A abordagem de subestruturação, recorrendo a modelos distintos para a simulação das diferentes partes do domínio, mostrou um alto padrão de eficiência computacional, o qual, aliás, permitiu conduzir o conjunto de estudos paramétricos apresentados.

O estudo efetuado procurou não só ilustrar as potencialidades do modelo de cálculo proposto, em particular na análise da resposta dinâmica de edifícios devido às vibrações induzidas pelo tráfego ferroviário, de uma forma integrada e interagindo com os diferentes módulos apresentados em capítulos precedentes, mas também avaliar a eficiência de medidas de mitigação, como é o caso das soluções de via em laje flutuante, e a influência da rigidez do solo nas vibrações percebidas no interior de edifícios localizados nas imediações de túneis ferroviários. O estudo realizado, de caráter abrangente e voltado à compreensão fundamental dos fenômenos, permitiu extrair diversas conclusões que se apresentam em seguida.

A partir do estudo desenvolvido, e de um ponto de vista geral, foi possível concluir que as características dinâmicas do edifício desempenham um papel muito relevante nas vibrações percebidas em seu interior. Do mesmo modo, verificou-se que a consideração da impedância do solo de fundação, e portanto dos efeitos da interação solo-estrutura, na solução do problema dinâmico do edifício é um aspecto fundamental para alcançar uma avaliação precisa das vibrações induzidas no interior dos edifícios devido ao tráfego ferroviário em túneis. De fato, se a impedância do solo de fundação não for considerada, ou seja, se se assumir que o movimento das fundações do edifício é igual ao campo de vibração incidente, negligenciando deste modo os efeitos do mecanismo de interação solo-estrutura, a resposta dinâmica das lajes do edifício na direção vertical é claramente superestimada. Com efeito, a interação solo-estrutura tem uma influência relevante no comportamento dinâmico do edifício, induzindo um efeito de amortecimento na resposta devido à radiação de energia pelo maciço de fundação. Levando em consideração este mesmo aspecto, investigou-se a possibilidade de recurso a metodologias alternativas, tais como modelos discretos condensados, para a inclusão, ainda que de forma simplificada, dos efeitos de interação solo-estrutura. O estudo realizado permitiu concluir que é alcançada uma concordância notável entre os resultados previstos por essas metodologias e os ditados por métodos mais completos, como por exemplo o MEC 3D. Essa concordância é tanto mais significativa quanto maior a rigidez do maciço de fundação.

Em relação à evolução da resposta dinâmica do edifício em função da altura do ponto de observação, foi possível concluir que ocorre uma amplificação da resposta na direção horizontal, permanecendo a resposta na direção vertical praticamente inalterada. A este respeito, refira-se ainda que, para o problema em estudo, a influência dos mecanismos de interação solo-estrutura é mais notória na componente vertical da resposta do que na componente horizontal.

O estudo paramétrico realizado considerando soluções distintas para a via férrea instalada no túnel permite avançar com várias conclusões, as quais agora se sintetizam:

i) A eficiência da utilização de mantas resilientes na mitigação de vibrações induzidas por tráfego ferroviário é claramente dependente da frequência de ressonância do sistema de isolamento. Na verdade, admitindo que a massa da laje da via permanece constante, pode afirmar-se que a solução é dependente da rigidez da manta. Para obter uma redução considerável das vibrações, são necessárias mantas de baixa rigidez, dado que induzem uma frequência de corte do sistema mais baixa. Por outro lado, essa mesma opção implica uma amplificação da resposta dinâmica da via férrea, o que pode limitar o campo de aplicação desta solução de atenuação;
ii) Apesar do efeito de atenuação proporcionado pela presença das mantas sob a laje da via férrea, um efeito pernicioso resulta da amplificação do campo de onda incidente (o qual excita o edifício) na faixa de frequências em torno do valor de ressonância do sistema de isolamento instalado na via férrea. Este efeito é particularmente prejudicial quando mantas de baixa rigidez são adotadas, uma vez que a frequência de ressonância da via férrea pode coincidir com as frequências naturais associadas aos modos locais de flexão das lajes do edifício (na faixa de frequência entre 14 Hz e 20 Hz, no presente caso). Quando isso ocorre, a opção por mantas de baixa rigidez, embora possibilite uma considerável atenuação das vibrações na faixa de frequências mais elevada, resulta em uma significativa amplificação da resposta dinâmica das lajes na direção vertical, permitindo que se atinjam valores de pico da velocidade vertical de cerca do dobro dos verificados para o caso dos cenários não isolados. Este efeito pode ser evitado usando mantas mais rígidas, com frequências de ressonância consideravelmente superiores às frequências naturais associadas aos modos locais de flexão das lajes. No entanto, a sua eficiência na redução de vibrações nas frequências mais elevadas, que são bastante importantes para a questão do ruído re-radiado, será minimizada;
iii) A resposta dinâmica das lajes do edifício na direção horizontal não é especialmente afetada pela medida de isolamento adotada na via férrea instalada no túnel. Na verdade, a resposta dinâmica na direção horizontal é dominada por uma faixa estreita de baixas frequências, sendo estas muito inferiores à frequência de ressonância dos sistemas de isolamento analisados neste trabalho.

Atendendo às observações anteriores, é possível concluir que a concepção de sistemas de via em laje flutuante com vista à mitigação das vibrações induzidas pelo tráfego ferroviário em túneis deve ser realizada de forma criteriosa. Se, por um lado, a opção por mantas de baixa rigidez permite alcançar elevada eficiência na atenuação de vibrações nas frequências acima de 25 Hz (quase 30 dB para frequências acima de 60 Hz, no caso aqui estudado), deve-se considerar que esse tipo de solução implica amplificações consideráveis na faixa de frequências mais baixa. Esta faixa de frequências em que as vibrações são amplificadas é, em algumas situações, coincidente com a faixa de frequências naturais associadas aos modos locais de flexão das lajes de edifícios próximos da via férrea subterrânea. Por conseguinte, nestes casos, em vez de uma atenuação das vibrações percebidas no interior do edifício, uma forte amplificação pode ocorrer, com valores de pico da velocidade vertical substancialmente superiores aos verificados em caso de ausência de medidas de mitigação.

No que se refere ao estudo paramétrico desenvolvido sobre a influência da rigidez do solo na resposta dinâmica do sistema, as seguintes conclusões são resumidas:

i) A resposta dinâmica da via férrea, bem como a do trem, não é particularmente afetada pela rigidez do maciço geotécnico. Esta observação deve ser feita com prudência, uma vez que apenas é válida quando elementos resilientes estão incluídos na via. Nestes casos, praticamente toda a flexibilidade da via é conferida por estes elementos resilientes e a influência da rigidez do solo é negligenciável;
ii) Os mecanismos de propagação de vibrações são fortemente afetados pelas propriedades do solo. A dependência da resposta dinâmica do campo livre, induzida pela passagem do trem, face às propriedades do solo é bastante complexa e também dependente da posição do receptor em relação ao túnel. Para os receptores localizados diretamente acima do túnel, há um aumento da resposta vertical com a diminuição da rigidez do solo, independentemente da faixa de frequências em questão. No entanto, quando a distância túnel-receptor aumenta, a participação das ondas R e S na resposta dinâmica torna o problema mais complexo, minimizando a influência da rigidez do solo na resposta para a faixa de frequências mais elevada;
iii) A influência da rigidez do solo na resposta dinâmica do edifício compreende dois aspectos principais: a) a influência da rigidez do solo no campo de onda incidente; b) a influência da rigidez do solo no comportamento dinâmico do edifício. O primeiro aspecto é apenas dependente do mecanismo de propagação, não sendo para a sua análise necessário considerar a interação

solo-estrutura. Relativamente ao último aspecto mencionado, verifica-se que a influência da rigidez do solo no mecanismo de interação solo-estrutura é bastante relevante, sobretudo quando se trata de solos com rigidez relativamente baixa. Em todo o caso, a inclusão da interação solo-estrutura resulta em um maior amortecimento da resposta vertical das lajes do edifício. Os valores de pico da velocidade vertical das lajes diminuem com a diminuição da rigidez do solo, uma vez que os efeitos de ressonância das lajes são tanto mais amortecidos quanto menor é a rigidez do solo de fundação. Da análise do conteúdo em frequência da resposta, constatou-se que para a faixa de frequência mais baixa, ou seja, até os 10 Hz, a velocidade vertical das lajes aumenta com a diminuição da rigidez do solo, ocorrendo o oposto para as frequências superiores.
iv) Atendendo a que a resposta do edifício nas direções horizontais é dominada pela faixa de frequências mais baixas, até cerca dos 8 Hz, é possível estabelecer uma tendência de diminuição da resposta à medida que aumenta a rigidez do solo. No entanto, deve ser notado que esta tendência é bastante dependente das características estruturais do edifício, de modo que a generalização dessa conclusão deve ser feita com cautela.

Em síntese, neste capítulo desenvolveu-se um estudo numérico, em que se procede à aplicação integrada dos modelos até agora apresentados, e que tem como finalidade contribuir para uma melhor compreensão do problema na sua globalidade. Foi investigada a influência de alguns parâmetros intervenientes e evidenciada a grande utilidade da ferramenta numérica proposta para a concepção de novas infraestruturas, bem como no apoio ao projeto de medidas de mitigação de vibrações induzidas pelo tráfego ferroviário em túneis. No capítulo subsequente da presente tese apresenta-se a validação experimental do modelo numérico desenvolvido. A ferramenta numérica é aplicada a um caso de estudo, correspondendo a um cenário real, sendo os resultados previstos pelo modelo confrontados com os correspondentes resultados experimentais.

## 7 Validação experimental: túnel ferroviário em Madrid

### 7.1 Preâmbulo

À luz dos estudos apresentados até aqui, pode-se afirmar que a previsão de vibrações induzidas pelo tráfego ferroviário em túneis é altamente complexa e exige ferramentas numéricas avançadas para uma avaliação correta. Nesse sentido, cabe observar que as exigências computacionais dizem respeito tanto à complexidade e à precisão das técnicas de previsão adotadas quanto à possibilidade de aplicá-las a cenários reais, nas condições usuais da prática de engenharia. Essas técnicas precisam ser suficientemente robustas e precisas, e sua aplicação deve ser viável em termos dos recursos computacionais necessários, sob pena de limitar excessivamente sua transferência da academia para a indústria. Na opinião da autora desta tese, os modelos propostos e aplicados nos capítulos anteriores atendem aos requisitos aqui apresentados.

Nos capítulos anteriores, foram apresentados modelos teóricos acompanhados de pequenos estudos de experimentação numérica. Esses estudos proporcionam uma melhor compreensão da dinâmica dos sistemas integrados resultantes do acoplamento veículo-via-túnel-maciço-edifício, o que, por si só, justifica sua pertinência.

Contudo, a elaboração de ferramentas teóricas de previsão, sejam elas numéricas, analíticas ou empíricas, sempre requer a validação experimental de seus resultados, por meio da comparação entre resultados experimentais e numéricos, para avaliar a confiabilidade dessas formulações na representação da realidade física. Nesse contexto, cabe destacar que a autora enfrentou o desafio de criar um campo experimental em uma seção do Metro do Porto, concebido especificamente para permitir a validação experimental dos modelos formulados, implementados e aplicados nesta tese. Embora esse trabalho estivesse em andamento, com atividades de experimentação no Campo Experimental do Pólo Universitário, diversas condicionantes externas impediram sua conclusão a tempo de inclusão nesta tese. Ainda assim, uma colaboração entre pesquisadores da Universidade do Porto e da Universidade da Corunha permitiu o acesso a dados experimentais de medições de vibrações devidas ao tráfego ferroviário em um túnel da rede ferroviária de Madrid. Assim, neste capítulo, comparam-se as medições de vibrações realizadas nesse caso de estudo com os resultados previstos pelos modelos numéricos propostos ao longo desta tese.

Há uma grande carência de dados experimentais sobre vibrações induzidas pelo tráfego ferroviário em túneis. Na época deste trabalho, havia um conjunto considerável
de casos de estudo sobre vibrações induzidas pelo tráfego superficial que permitiam, em alguma medida, a validação experimental de modelos numéricos desenvolvidos para essa finalidade [35], [133], [187], [230], [231], [232]. O mesmo não ocorria no caso do tráfego subterrâneo. A maioria dos poucos casos de estudo publicados sobre vibrações induzidas pelo tráfego ferroviário em túneis apresenta falta de informações detalhadas sobre diferentes aspectos, como o contexto geotécnico, o tipo de via férrea ou as características do material rodante [233], [234], [235]. Apesar disso, devem ser destacados os trabalhos desenvolvidos no projeto europeu CONVURT, no qual foram realizados estudos experimentais detalhados em um túnel da rede de metrô de Londres [36], [236].

Embora o caso de estudo selecionado não corresponda a um cenário ideal e faltem informações muito relevantes para a aplicação dos modelos numéricos, essa lacuna pode ser encarada como um desafio da prática de engenharia. O analista frequentemente enfrenta situações semelhantes, nas quais o julgamento de engenharia ganha relevância. O caso selecionado foi abordado na tese de doutorado de Jesús Fernández Ruiz [71], apresentada na Universidade da Corunha, para a validação experimental de um modelo numérico bidimensional de previsão de vibrações induzidas pelo tráfego ferroviário em túneis.

Apresentados o contexto e os objetivos deste capítulo, cabe uma breve descrição de sua organização. Inicialmente, faz-se uma descrição geral do caso de estudo, seguida da apresentação detalhada de algumas das atividades desenvolvidas. Em seguida, analisa-se a elaboração dos modelos numéricos, com ênfase nas opções adotadas, e comparam-se seus resultados com os obtidos experimentalmente. Por fim, discutem-se as medidas que poderiam ser adotadas para mitigar o problema identificado.

### 7.2 Descrição geral do caso de estudo

### 7.2.1 Localização e aspectos gerais

O caso de estudo corresponde a um trecho em túnel da ligação ferroviária suburbana entre as estações de Atocha e Príncipe Pio, na cidade de Madrid. Sua origem é um problema prático: um grande número de reclamações apresentadas pelos proprietários de um imóvel na Cuesta de San Vicente devido aos níveis excessivos de vibração percebidos no interior das habitações durante a passagem de trens no túnel sob o edifício. Em resposta às reclamações, a ADIF encarregou o CEDEX, Centro de Estudios y Experimentación de Obras Publicas, de realizar uma campanha de medição de vibrações, que ocorreu em 2002 [237].

A Figura 7.1 mostra, em planta, a localização da seção instrumentada onde foram realizadas as medições.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-291_713_1753_278_157.jpg)
Figura 7.1: Localização do caso de estudo: a) mapa de Madrid; b) esquema ilustrativo da seção em estudo (adaptado de [237]).

Como se pode observar, o traçado da linha férrea passa em túnel sob vários edifícios próximos à estação Príncipe Pio. A utilização da infraestrutura pela rede suburbana de transportes de Madrid tornava recorrentes os episódios de incômodo dos moradores, em razão do elevado número de passagens de trens no túnel.

### 7.2.2 Descrição do túnel e infraestrutura ferroviária

O túnel da linha verde é um túnel antigo de via única, construído em meados do século XIX. Trata-se de um túnel superficial, com seção transversal em ferradura, construído antes dos edifícios existentes na Cuesta de San Vicente. O recobrimento do túnel em relação às fundações dos edifícios é de apenas cerca de 5,80 m, pois os edifícios possuem um pavimento enterrado. A Figura 7.2a apresenta uma fotografia do emboquilhamento do túnel na estação Príncipe Pio, e a Figura 7.2b mostra uma representação esquemática de sua seção transversal.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-292_949_1752_119_157.jpg)
Figura 7.2: Geometria do túnel: a) fotografia do emboquilhamento na estação Príncipe Pio; b) corte esquemático.

O revestimento do túnel é de alvenaria de pedra. Como não foram realizados ensaios específicos para caracterizar suas propriedades, este trabalho adota os valores propostos por Fernández [71] para as propriedades deformacionais da alvenaria: módulo de deformabilidade de 5 GPa, coeficiente de Poisson de 0,2 e massa específica de $2500 \mathrm{~kg} / \mathrm{m}^{3}$.

A infraestrutura ferroviária possui uma via em laje do tipo STEDEF, solução muito utilizada em túneis ferroviários. Nesse tipo de via, os dormentes são mantidos e parcialmente embutidos na laje de concreto que os suporta. Entre os dormentes e a laje de concreto, dispõe-se uma palmilha de elastômero para proporcionar algum isolamento das vibrações de alta frequência que, de outra forma, seriam transmitidas à laje e poderiam danificá-la. A Figura 7.3a apresenta uma vista geral da via férrea, e a Figura 7.3b mostra um esquema do dormente STEDEF. O dormente é composto por dois blocos ligados por uma cantoneira metálica para garantir a bitola necessária. Seu embutimento parcial na laje de concreto, de cerca de 8 cm neste caso, garante a estabilidade transversal da via férrea.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-293_692_1748_117_158.jpg)
Figura 7.3: Via férrea STEDEF: a) vista geral na estação Príncipe Pio [71]; b) representação esquemática do dormente STEDEF.

Como mostra a Figura 7.3b, os trilhos UIC-54 apoiam-se em dormentes STEDEF com espaçamento longitudinal de 0,6 m e massa de 182 kg/un. A fixação do trilho ao dormente é do tipo NABLA, com uma palmilha interposta de rigidez de 200 kN/mm. O elemento elastomérico entre o dormente e a laje de concreto tem rigidez de cerca de 40 kN/mm. Não foi possível avaliar com exatidão as propriedades de amortecimento das palmilhas; por isso, adotaram-se os valores de 2 kN/mm.s e 0,4 kN/mm. s, respectivamente, para as palmilhas sob o trilho e sob o dormente.

A laje de concreto que suporta os dormentes foi concretada diretamente sobre o fundo do túnel, sem qualquer elemento resiliente na interface. Sua geometria é apresentada na Figura 7.4. Para o cálculo, adotaram-se as seguintes propriedades do material da laje: módulo de deformabilidade - 50 GPa; coeficiente de Poisson - 0,2; massa específica - $2500 \mathrm{~kg} / \mathrm{m}^{3}$.

As seções seguintes apresentam uma descrição sucinta do cenário geotécnico, do edifício onde foram realizadas as medições de vibrações e do material rodante utilizado nos testes conduzidos pelo CEDEX em 2002.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-293_441_1231_2139_419.jpg)
Figura 7.4: Detalhe da solução de via em laje.

### 7.2.3 Descrição do cenário geotécnico

Quanto ao cenário geotécnico, cabe esclarecer que esta tese não incluiu trabalhos específicos de reconhecimento geológico-geotécnico associados ao caso de estudo. As informações desta seção provêm dos estudos de Férnandez [71], que realizou uma ampla pesquisa sobre as propriedades mecânicas das formações geotécnicas em questão. Segundo esse autor, os estudos de Melis (2011), que compilou informações geotécnicas sobre a construção de túneis de metrô próximos ao túnel considerado, indicam que o maciço é constituído por duas formações geotécnicas principais:

i) Areias de Miga, que se estendem praticamente desde a superfície do terreno até à profundidade de cerca de 10 m.
ii) "Tosco", formação de grande espessura cujo topo coincide com o limite inferior da "Areia de Miga".

Os estudos de Melis (2011) permitem propor a estratificação do maciço e a variação das propriedades dinâmicas com a profundidade mostradas na Figura 7.5. Como os edifícios sobre o túnel possuem um pavimento enterrado, a cota do terreno natural situa-se cerca de 3,0 m acima da cota da laje de fundo das edificações. Adotou-se um coeficiente de Poisson de 0,3, independentemente da profundidade ou da formação considerada.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-294_883_1227_1489_419.jpg)
Figura 7.5: Perfil esquemático da evolução em profundidade das propriedades mecânicas do terreno.

Na ausência de informações detalhadas sobre o amortecimento material, adotou-se novamente o valor de 0,04 para o amortecimento histerético, considerado representativo das diferentes formações envolvidas.

### 7.2.4 Breve descrição do edifício sobre o túnel

O edifício onde foram realizadas as medições de vibrações induzidas pelo tráfego ferroviário, situado na Cuesta de San Vicente, foi construído em meados da década de 50 do século passado. Possui um pavimento enterrado e seis pavimentos elevados; sua fachada é apresentada na Figura 7.6a. O levantamento de Fernández [71] identificou uma estrutura de pórticos bidirecional em concreto armado, cuja planta estrutural típica é mostrada na Figura 7.6b.

Como mencionado anteriormente e mostrado na Figura 7.1b, o túnel atravessa o maciço de fundação do edifício a uma profundidade relativamente pequena. A Figura 7.7 apresenta um corte transversal do edifício com a representação do túnel em estudo ("túnel de cercanias"), além de uma planta de seu traçado longitudinal em relação à edificação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-295_1033_1749_1045_159.jpg)
Figura 7.6: Edifício em estudo: a) fotografia da fachada; b) planta estrutural do piso tipo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-296_821_1768_115_147.jpg)
Figura 7.7: Implantação do túnel e do edifício: a) corte esquemático; b) planta (adaptado de [237]).

Na análise numérica, o modelo simplificado do edifício utilizou as propriedades indicadas no Quadro 7.1.

Quadro 7.1: Propriedades dos elementos estruturais do edifício.
| Elementos | E (GPa) | $\nu$ | $\rho\left(\mathbf{k g} / \mathbf{m}^{\mathbf{3}}\right)$ | Dimensões |
| :--- | :--- | :--- | :--- | :--- |
| Lajes | 30 | 0,2 | 2500 | espessura: 0,25 m |
| Vigas | 30 | 0,2 | 2500 | $0,30 \times 0,60 \mathrm{~m}^{2}$ |
| Pilares | 30 | 0,2 | 2500 | $0,35 \times 0,35 \mathrm{~m}^{2}$ |


Além da massa dos elementos estruturais apresentados no Quadro 7.1, considerou-se uma massa de $450 \mathrm{~kg} / \mathrm{m}^{2}$ uniformemente distribuída nas lajes, para representar massas não estruturais, como revestimentos, paredes divisórias e sobrecargas de uso.

### 7.2.5 Material rodante utilizado nos testes realizados pelo CEDEX

A ligação ferroviária do caso de estudo é operada pelo serviço suburbano de Madrid, com trens da série 446, semelhantes ao apresentado na Figura 7.8. Essas composições são automotrizes elétricas, com duas unidades motoras, uma em cada extremidade, e um veículo não motorizado na posição intermediária.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-297_469_702_117_682.jpg)
Figura 7.8: Trem de serviço suburbano de Madrid - série 446.

Nos testes do CEDEX, foram utilizadas composições duplas, constituídas por seis veículos. A Figura 7.9 apresenta a geometria e a distribuição da carga estática por eixo de uma composição simples.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-297_306_1752_940_157.jpg)
Figura 7.9: Geometria e distribuição de carga por eixo do trem - série 446 - composição simples (RENFE).

Não foi possível obter informações consistentes sobre as características dinâmicas do veículo, em particular a distribuição de massa nos bogies e as características dos componentes de suspensão. O único dado disponível sobre as massas do veículo foi a massa do eixo, que, segundo Fernández [71], é de cerca de 1500 kg, independentemente do veículo considerado. Embora as informações sejam escassas, estudos recentes de Colaço et al. (2015) mostram que a massa do eixo é a característica do trem que condiciona o processo de geração de vibrações induzidas pelo tráfego ferroviário.

### 7.2.6 Breve nota sobre a campanha de monitoramento realizada pelo CEDEX

Como mencionado, este caso de estudo surgiu de um problema concreto e não de uma pesquisa exaustiva. Por isso, a campanha de instrumentação, da qual a autora desta tese não participou, foi orientada para responder ao problema em questão.

Diante disso, o CEDEX realizou uma campanha de instrumentação voltada a dois aspectos: i) avaliação da resposta dinâmica da via férrea; ii) avaliação da resposta vertical das lajes do 5º e do 7º pisos do edifício sobre o túnel. A Figura 7.7 mostra, em planta, os pontos de observação nas lajes do edifício.

A resposta dinâmica da via foi monitorada durante a passagem de trens com a configuração descrita anteriormente, por meio de acelerômetros instalados no trilho e na laje da via férrea. A Figura 7.10 apresenta uma fotografia desses acelerômetros.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-298_1066_697_358_685.jpg)
Figura 7.10: Instrumentação colocada na via férrea.

No interior do edifício, a resposta dinâmica vertical das lajes do 5° e do 7° pisos foi avaliada por meio de geofones.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-299_1144_1744_120_160.jpg)
Figura 7.11: Geofones para medição da velocidade de vibração das lajes na direção vertical: a) 5° piso; b) 7° piso.

Como o plano de instrumentação não foi elaborado pela autora desta tese, não se apresenta aqui uma descrição detalhada dos equipamentos e procedimentos adotados. Essas informações podem ser consultadas no trabalho recentemente apresentado por Fernández [71].

### 7.3 Modelagem numérica

### 7.3.1 Descrição geral do modelo

Com base nas características do caso de estudo e na metodologia de análise apresentada nos capítulos anteriores, construiu-se um modelo numérico subestruturado que contempla: i) geração de vibrações; ii) propagação de vibrações; iii) recepção de vibrações no interior do edifício. Como tanto o túnel quanto o edifício estão em uma área densamente urbanizada, introduziram-se simplificações para tornar viável a análise em termos computacionais. As simplificações adotadas serão discutidas em uma subseção posterior.

Na simulação do veículo, devido às limitações das informações sobre seus principais componentes (massas suspensas, massas semissuspensas, massas não suspensas e suspensões primária e secundária), considerou-se apenas a dinâmica das massas não suspensas. O modelo foi construído com base nas informações da seção 7.2.5.

Mais problemática que a falta de dados sobre as massas suspensas e semissuspensas é a ausência de informações precisas sobre as irregularidades geométricas da via férrea. Sabia-se apenas que seu estado era muito precário na época das medições, o que motivou a posterior substituição dos trilhos para reduzir os níveis de vibração no edifício. Essa lacuna exigiu a geração artificial de perfis de irregularidades, tratada em uma parte específica deste capítulo.

Para simular o sistema túnel-maciço, utilizou-se o modelo 2.5D MEF-PML apresentado anteriormente. A Figura 7.12 mostra a malha adotada para discretizar a seção transversal do problema. Devido às condições de simetria, simulou-se apenas metade da geometria. As propriedades dinâmicas do túnel e do maciço geotécnico circundante foram definidas com base nas informações das seções 7.2.2 e 7.2.3.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-300_979_1756_967_156.jpg)
Figura 7.12: Malha de MEF-PML adotada na discretização da seção transversal do problema.

Para a via férrea, considerou-se um sistema subestruturado, no qual a via é simulada por vigas, molas e massas distribuídas. O comportamento dinâmico do sistema túnel-maciço é incorporado por meio de sua impedância no fundo do túnel. Essa metodologia, utilizada em diversos estudos de escopo semelhante [32], [77], [239], [240], permite uma grande economia de cálculo em estudos paramétricos. Uma descrição detalhada de formulações alternativas para o acoplamento via-túnel pode ser encontrada em Alves Costa (2011). A Figura 7.13 apresenta um esquema do modelo da via férrea.

| Carris：El，m |  |  |  |  |  |  |  |  |  |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 山宰 | 紫謠製壁壁 |  | Palmilhas：k，c | 宰 | 崖 | 岸 | 崖 | 崋 | 岸 |
| 客 | 峯製壁壁壁 |  | Palmilhas sob travessa： | k，c | 䇂 | 岸 | 岸 | 岸 | 紫 |
| Laje：El，m |  |  |  |  |  |  |  |  |  |
| HMM－ | HMM－HW－ | HMM | HWM－ | Túnel－maciço <br> Rigidez equivalente： $\mathrm{k}_{\mathrm{eq}}(\omega)$ |  | 춘 | 춘 | 춛 | 촉 |

Figura 7．13：Modelo adotado para a simulação da via férrea．

O modelo inicial do edifício foi construído com o programa tridimensional de elementos finitos EVOLUTION，desenvolvido por Ferraz（2010）．Esse programa de cálculo é utilizado apenas para gerar as matrizes de rigidez e massa que descrevem o comportamento dinâmico da edificação．Essas matrizes são então utilizadas no módulo de interação solo－estrutura apresentado no Capítulo 5 desta tese．

A Figura 7.14 mostra a malha de elementos finitos adotada para representar o edifício．

Com base nas conclusões do capítulo anterior sobre as possibilidades e limitações dos modelos discretos condensados na representação da impedância do solo de fundação，optou－se por uma análise simplificada com o modelo＂cauda de macaco＂， em vez de uma solução por elementos de contorno．Embora seja uma abordagem mais simples，as análises dos capítulos anteriores confirmaram que seu uso não acarreta perda significativa de precisão na estimativa dos níveis de vibração das lajes de edifí－ cios próximos à infraestrutura ferroviária．Ainda assim，os modelos de parâmetros condensados são representações simplificadas do complexo mecanismo de interação dinâmica entre a estrutura e o maciço de fundação．Uma limitação importante é a representação do maciço de fundação como um meio homogêneo semi－infinito equi－ valente，que não corresponde às características do terreno deste estudo，pois se supõe que sua rigidez aumente progressivamente com a profundidade．Para lidar com essa limitação，adotou－se uma velocidade de propagação das ondas S de 280 m／s como valor médio representativo do maciço geotécnico envolvido na interação dinâmica entre as fundações do edifício e o respectivo maciço．

Quanto às fundações，a única informação disponível era que se tratava de funda－ ções superficiais．Por isso，adotaram－se fundações quadradas com 2，75 m de lado para todos os pilares．

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-302_1154_1222_122_423.jpg)
Figura 7.14: Modelo de elementos finitos 3D representativo do edifício.

### 7.3.2 Reflexão sobre as hipóteses consideradas

### 7.3.2.1 Modelagem do sistema túnel-maciço

O modelo do meio de propagação, isto é, do sistema túnel-maciço, apresenta uma particularidade em relação aos estudos anteriores: o maciço geotécnico é heterogêneo. Do ponto de vista conceitual, essa condição não traz complexidade especial à simulação do domínio de interesse, representado pelo MEF. O mesmo não se pode afirmar do tratamento das fronteiras artificiais com PML. A adoção de maciços heterogêneos ou estratificados exige funções de esticamento distintas nas PML, conforme as propriedades elásticas do meio. Isso pode causar distorções da malha, pois nós de elementos adjacentes podem sofrer transformações distintas para o domínio complexo, dependendo das propriedades dos elementos aos quais pertencem.

Embora não tenha sido desenvolvido um procedimento específico para essas situações, realizaram-se testes para verificar a ausência de reflexões espúrias. Para reduzir os tempos computacionais, sem perda de generalidade, os testes foram feitos em estado plano de deformação, adotando $\mathrm{k}_{1}=0$ no programa 2.5D. Aplicou-se uma ação impulsiva concentrada no fundo do túnel e registrou-se a história temporal dos deslocamentos no próprio fundo ou em pontos na superfície do maciço. A Figura 7.15 mostra o impulso adotado.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-303_631_1750_124_157.jpg)
Figura 7.15: Impulso de Ricker adotado: a) registro temporal; b) conteúdo em frequência.

A Figura 7.16 apresenta a história temporal do deslocamento vertical em diferentes pontos de observação. Na Figura 7.16a, que mostra a resposta no ponto de aplicação do impulso, observa-se uma resposta oscilatória nos instantes posteriores à aplicação da ação. Esse efeito decorre da reflexão da onda P na superfície livre e de sua posterior incidência no túnel, e não de uma reflexão espúria. Aspectos como esse podem ser simulados por modelos detalhados como o proposto, mas não podem ser observados em modelos simplificados como o PiP [31]. Nos demais pontos, independentemente de sua proximidade à fronteira artificial, não se observa reflexão espúria relevante, o que indica o bom desempenho do modelo proposto.

Quanto à simulação do maciço geotécnico, cabe destacar que não foram realizados ensaios para estimar o amortecimento material. O valor adotado para o amortecimento histerético foi considerado plausível, sem ter sido obtido de um estudo detalhado dessa propriedade mecânica.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-304_1321_1746_120_158.jpg)
Figura 7.16: Deslocamento vertical em diferentes pontos de observação: a) invert; b) superfície no eixo de simetria; c) superfície a 10 m do eixo de simetria; d) superfície a 30 m do eixo de simetria.

### 7.3.2.2 Modelagem do edifício e sua interação com o maciço de fundação

Há vários aspectos do modelo do edifício que precisam ser examinados com mais detalhe.

Os dados apresentados até aqui mostram a falta de informações detalhadas sobre a edificação. Na opinião da autora, a descrição estrutural das figuras anteriores é muito limitada, sobretudo pela ausência de referências a caixas de elevador ou a outros núcleos rígidos. Dado o porte da edificação, é muito pouco plausível que tais elementos não existam; sua presença certamente condicionaria a resposta dinâmica, especialmente na direção horizontal, que não é o objeto desta análise. Aqui se considera apenas a resposta dinâmica vertical das lajes, que, em princípio, não deve ser muito afetada pelo nível de detalhe da modelagem dos núcleos de rigidez da estrutura.

Também não foi possível determinar as dimensões das fundações. A dimensão adotada foi proposta pela autora e considerada razoável diante do cenário geotécnico e das ações previstas na base dos pilares.

Outro aspecto relevante é o contexto urbano do caso de estudo, caracterizado por uma alta densidade de construções (ver Figura 7.1). Como explicado nos capítulos anteriores, mesmo admitindo que a presença dos edifícios não afete o mecanismo de geração de vibrações (interação veículo-via), sua excitação produz um campo de vibração incremental que se propaga pelo terreno. Assim, edifícios adjacentes, não considerados no modelo, mas excitados pelo campo incidente do tráfego ferroviário, geram incrementos no campo que chega à estrutura analisada. Esses incrementos não são contemplados na modelagem deste estudo. Estudos recentes mostram que massas na superfície do terreno podem funcionar como medidas de mitigação, principalmente no caso do tráfego ferroviário superficial [121]. Portanto, entende-se que esse efeito possa ser uma fonte de incerteza não contemplada nesta análise.

A Figura 7.7 também mostra que o edifício possui um pavimento enterrado, cuja presença não é considerada diretamente na análise. Como se supõe que os edifícios adjacentes possam ter a mesma configuração, admite-se, para o cálculo, que a superfície "livre" do terreno esteja na cota do piso inferior dos edifícios. Há, portanto, uma incerteza decorrente da omissão da interação dinâmica entre os muros de contenção e o terreno, caso alguma face do edifício não seja adjacente a outro de configuração semelhante. Ainda assim, admite-se que esse efeito possa ter pouca relevância para a vibração vertical das lajes dos pavimentos elevados.

Por fim, a resposta dinâmica depende tanto das propriedades dos elementos estruturais quanto da contribuição dos elementos não estruturais. Estes podem contribuir para a rigidez e representar massas significativas, difíceis de quantificar. Sua contribuição em termos de rigidez, massa e amortecimento só poderia ser adequadamente incorporada por meio da calibração do modelo numérico com resultados de ensaios de caracterização dinâmica, como ensaios de vibração ambiental, o que está fora do escopo desta tese.

Apesar das limitações das informações disponíveis e das simplificações da metodologia de modelagem, este cenário se aproxima do que frequentemente ocorre em aplicações práticas. Nelas, o analista precisa responder ao problema proposto mesmo diante da escassez de informações e das limitações do próprio modelo, que necessariamente simplifica a realidade. Por isso, este caso de estudo é considerado um desafio e um teste da possibilidade de aplicação prática da metodologia proposta nesta tese.

### 7.3.2.3 Consideração do mecanismo de excitação dinâmica - avaliação do perfil de irregularidades da via férrea.

Como mostrado ao longo desta tese, a excitação resulta de dois mecanismos fundamentais: i) o mecanismo quase estático, decorrente do movimento das cargas estáticas transferidas pelo trem aos trilhos; ii) o mecanismo dinâmico, resultante da interação veículo-via na presença de perturbações geométricas ou de rigidez que geram forças de inércia no material rodante. As informações da seção 7.2.5 são suficientes para definir o mecanismo quase estático, mas não o dinâmico. Um dos principais dados necessários para simular este último é o perfil de irregularidades da via férrea, informação que não estava disponível para a autora.

A falta de informações sobre o perfil de irregularidades geométricas da via férrea é uma lacuna importante, também enfrentada por Fernandez (2014) nas simulações do mesmo cenário. Para lidar com ela, adotou-se um perfil artificial de irregularidades compatível com o conteúdo em frequência da resposta do trilho à passagem do trem. Contudo, gerar o perfil sem uma relação entre a amplitude das irregularidades e o respectivo comprimento de onda poderia conduzir a soluções sem correspondência com a realidade física. Para evitar isso, os perfis foram gerados com base na equação de PSD apresentada anteriormente (ver equação [5.10]).

O perfil de irregularidades da Figura 7.17, gerado para comprimentos de onda entre 7,2 m e 0,175 m, proporciona uma concordância razoável entre os conteúdos em frequência medido e simulado da resposta vertical do trilho, como mostrado na seção seguinte. Esses comprimentos de onda foram selecionados para cobrir frequências de excitação do material rodante entre 2 Hz e 80 Hz, considerando a passagem do trem a 14,25 m/s.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-306_612_965_1933_551.jpg)
Figura 7.17: Perfil de irregularidades adotado no estudo.

Cabe observar que esse perfil representa uma via férrea em condições muito ruins de conservação, segundo a proposta de Braun [194], [241]. Os parâmetros da PSD
compatíveis com o perfil da Figura 7.17 são $\mathrm{S}_{0}=1 \times 10^{-6} \mathrm{~m}^{3} / \mathrm{rad}$ e $\mathrm{w}=3$. Informações obtidas por Fernandez (2014) confirmaram que a via estava em estado muito ruim na época dos ensaios, o que justificou uma intervenção com substituição dos trilhos. Os moradores do edifício relataram a eficiência dessa medida: segundo eles, após a intervenção, a passagem de trens no túnel deixou de ser perceptível nas habitações.

Embora a metodologia adote um perfil sintético de irregularidades que pode não corresponder perfeitamente à realidade, ressalta-se que, segundo a argumentação apresentada, a validade do estudo não fica comprometida. Os resultados de todo o processo de transmissão de vibrações, do trilho ao interior do edifício, decorrem diretamente dos modelos propostos, sem ajustes para obter concordância entre resultados experimentais e numéricos nos pontos de observação, com a exceção já mencionada da resposta dinâmica do trilho. O dado de entrada ideal seria a própria geometria do perfil de irregularidades. Como isso não foi possível, utilizou-se a resposta dinâmica do trilho para estimar esse perfil.

### 7.4 Validação experimental

### 7.4.1 Resposta da via férrea

A Figura 7.18 compara os registros temporais medido e simulado da velocidade vertical do trilho. Como mencionado, esse registro é utilizado para ajustar um perfil de irregularidades compatível com o conteúdo em frequência da velocidade vertical observada, mostrado na Figura 7.19.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-307_659_966_1739_550.jpg)
Figura 7.18: Registro temporal da velocidade vertical do trilho devido à passagem do trem (linha azul - experimental; linha vermelha - numérico)

Os registros temporais da Figura 7.18 mostram uma concordância razoável entre os resultados experimentais e os previstos pelo modelo numérico. Há, contudo, uma defasagem entre as respostas numérica e experimental durante a passagem dos bogies
centrais do trem. Muito provavelmente, isso decorre de uma diferença entre a geometria real do trem e a adotada na simulação.

A análise dos resultados da Figura 7.18 permite avaliar a relevância dos diferentes mecanismos de excitação na resposta da via férrea. Os estudos apresentados até aqui mostraram que, em geral, essa resposta é predominantemente condicionada pelo mecanismo quase estático. Nesses casos, a passagem de cada eixo pela seção instrumentada é claramente identificável, e as oscilações são pequenas. O cenário da Figura 7.18 difere dessa idealização e revela uma forte contribuição da excitação dinâmica à resposta total, devido à baixa qualidade geométrica da via. Os resultados experimentais foram filtrados a 80 Hz e, mesmo assim, apresentam muitos picos que não podem ser associados apenas à passagem dos eixos pela seção instrumentada.

Quanto ao conteúdo em frequência da velocidade vertical do trilho, a Figura 7.19 mostra que o perfil de irregularidades selecionado leva a uma concordância muito satisfatória entre os resultados experimentais e numéricos. Isso é coerente com a relevância da excitação dinâmica neste caso: mesmo no trilho, o maior conteúdo energético se concentra em torno de 50 Hz, em vez de nas baixas frequências. O modelo reproduz esse comportamento, explicado pela combinação de dois efeitos: i) irregularidades geométricas expressivas, com comprimentos de onda compatíveis com essa frequência; ii) ressonância da massa não suspensa sobre a via férrea nessa faixa de frequências.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-308_636_960_1661_553.jpg)
Figura 7.19: Conteúdo em frequência da velocidade vertical do trilho induzida pela passagem do trem.

Para analisar a ressonância das massas não suspensas sobre a via férrea, considere--se a Figura 7.20, que mostra o deslocamento vertical do trilho devido à passagem de uma ação não oscilante de 1 N, à velocidade adotada neste estudo. O inverso do deslocamento no ponto de contato roda-trilho corresponde à rigidez equivalente de
um sistema de um grau de liberdade, cuja massa corresponde à massa não suspensa. Esse sistema simplificado, ilustrado na Figura 7.21, tem frequência natural não amortecida de 48,9 Hz. A interação entre os eixos do trem por meio do trilho e a diferença entre a rigidez dinâmica da via e sua rigidez em condições estáticas podem deslocar a frequência de ressonância em relação ao valor indicado, inclusive entre os diferentes eixos, mantendo-a, porém, na mesma ordem de grandeza. Em conjunto com os resultados da Figura 7.19, essa análise permite concluir que a predominância da resposta em torno de 50 Hz se deve a esse efeito ressonante, bem representado pelo modelo numérico.

A concordância razoável entre as medições e os resultados numéricos da velocidade vertical do trilho, que sustenta a metodologia utilizada, não garante a mesma concordância em outros pontos de observação. Para isso, todos os aspectos da modelagem precisam representar a realidade de forma suficientemente adequada. A Figura 7.22 apresenta, então, a velocidade vertical no ponto central da laje da via férrea.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-309_846_1136_1272_157.jpg)
Figura 7.20: Deslocamento do trilho induzido por uma carga móvel unitária não oscilante.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-309_515_566_1547_1342.jpg)
Figura 7.21: Modelo com um grau de liberdade explicativo da ressonância do eixo sobre a via.

Os registros temporais da Figura 7.22a também mostram uma concordância razoável entre resultados numéricos e experimentais nesse ponto de observação, com diferenças esperadas a priori. Apesar delas, o modelo reproduziu de forma razoável os valores de pico. O conteúdo em frequência da Figura 7.22b mostra semelhança significativa entre as respostas: nos dois casos, o maior conteúdo energético está entre 45 Hz e 60 Hz. Contudo, o modelo subestima a resposta até cerca de 40 Hz. Essa diferença, mais evidente na laje do que no trilho (ver Figura 7.19), pode decorrer de várias fontes:
incerteza do perfil de irregularidades, pequenos defeitos do rodado, uso de um modelo de via contínuo na direção longitudinal que não contempla a excitação paramétrica, ou transmissão localizada da carga do dormente à laje de apoio.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-310_643_1746_361_157.jpg)
Figura 7.22: Velocidade vertical da laje da via férrea induzida pela passagem do trem: a) registro temporal; b) conteúdo em frequência.

### 7.4.2 Resposta do edifício

Como apresentado nas seções anteriores, este caso de estudo surgiu de medições solicitadas pela ADIF e realizadas pelo CEDEX em resposta às reclamações dos moradores de um edifício sobre o túnel ferroviário. A campanha avaliou a resposta dinâmica das lajes do 5º e do 7 º pisos, em pontos diretamente acima do túnel.

Na formulação numérica dos capítulos anteriores, o cálculo da resposta no edifício requer a resposta em campo livre, obtida pelo modelo 2.5D MEF-PML sem o edifício. Essa resposta é o dado de entrada da segunda parte do modelo, que considera a interação dinâmica solo-estrutura. Os dados experimentais disponíveis não incluem medições em campo livre. Como esse aspecto foi discutido em detalhe no capítulo anterior e os resultados não poderiam ser comparados a medições, optou-se por não discuti-los nesta seção.

Antes da análise da resposta dinâmica das lajes à passagem do trem, cabe destacar o elevado grau de incerteza desse tipo de problema. A comparação entre resultados experimentais e numéricos deve, portanto, ser ampla, sem pretender uma reprodução excessivamente detalhada da realidade física. A complexidade e a incerteza desses estudos são reconhecidas pela comunidade acadêmica; diversos especialistas destacaram a dificuldade de reproduzir a realidade física com um nível de aproximação inferior a 10 dB [136], [168].

A Figura 7.23 compara os registros temporais experimentais e simulados da velocidade vertical das lajes do 5º e do 7º pisos. Ambos foram filtrados para eliminar as contribuições em frequências superiores a 80 Hz.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-311_723_1749_357_160.jpg)
Figura 7.23: Registro temporal da velocidade vertical nas lajes de diferentes pisos do edifício: a) piso 5; b) piso 7.

O modelo numérico reproduziu de forma bastante razoável as principais características dos registros temporais e suas tendências de variação do 5º para o 7º piso. Em geral, representou bem os valores de pico da velocidade vertical em ambos os pisos e a diminuição das amplitudes com a elevação do ponto de observação. Inicialmente, adotou-se um amortecimento de Rayleigh de cerca de 2 \% na faixa de 5 Hz a 80 Hz. Esse valor foi posteriormente reduzido para cerca de 1 \% para melhorar a concordância entre os resultados experimentais e numéricos. Os resultados da Figura 7.23 correspondem a esse ajuste.

Como as respostas dinâmicas da Figura 7.23 são fortemente oscilatórias, seus picos pontuais podem não representar, por si só, uma consequência particularmente grave. É comum analisar medidas suavizadas, como o "running RMS", aqui denominado RMS móvel, que, em termos práticos, representa o valor eficaz da resposta dinâmica calculado em janelas móveis de 0,125 s (fast running RMS). Essa grandeza foi calculada para ambos os pisos, e sua evolução temporal é mostrada na Figura 7.24, para os resultados numéricos e experimentais. Observa-se uma proximidade significativa entre as medições e as previsões do modelo.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-312_722_1749_121_157.jpg)
Figura 7.24: RMS móvel da velocidade vertical nas lajes de diferentes pisos do edifício: a) piso 5; b) piso 7.

A comparação das Figura 7.23 e Figura 7.24, por si só, não permite validar o modelo. Pode haver concordância razoável no RMS ou nos valores de pico do registro temporal e, ao mesmo tempo, completa incompatibilidade entre as faixas de frequência das respostas numérica e experimental. A Figura 7.25 compara os conteúdos em frequência obtidos experimentalmente e numericamente para a velocidade vertical das lajes do edifício.

A Figura 7.25a mostra uma correspondência notável entre a resposta experimental da laje do 5º piso e a previsão numérica. O modelo reproduz as principais tendências da resposta com a frequência, em particular a concentração do conteúdo energético entre 25 Hz e 55 Hz e sua queda abrupta acima desse limite. Como esperado, não há concordância absoluta em todos os picos, mas as principais tendências são reproduzidas de forma muito aceitável.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-312_726_1740_1947_159.jpg)
Figura 7.25: Conteúdo em frequência da velocidade vertical nas lajes de diferentes pisos do edifício: a) piso 5; b) piso 7.

Ao comparar a Figura 7.25a com a Figura 7.25b, observa-se uma redução da concordância entre resultados experimentais e numéricos. O modelo ainda reproduz de forma aceitável a resposta da laje do 7º piso, mas as diferenças se tornam mais evidentes, especialmente pela superestimação da faixa de frequências com maior conteúdo energético. Na Figura 7.25b, também se destaca o pico experimental acentuado próximo de 10 Hz. Esse pico pode decorrer de ruído ou de algum equipamento que tenha interferido na medição, pois não foi encontrada uma explicação associada à passagem do trem no túnel.

A análise conjunta das Figura 7.24 e Figura 7.25 mostra um aspecto curioso: no 5º piso, a concordância entre resultados experimentais e numéricos é maior no domínio da frequência, enquanto no 7º piso ocorre o contrário.

Os espectros de frequência da Figura 7.25 permitem uma análise detalhada, particularmente a identificação das frequências com maior conteúdo energético. Contudo, por serem muito irregulares, podem não representar de maneira inteiramente fiel as consequências dos níveis de vibração. Esse efeito pode ser contornado por espectros em bandas de terço de oitava, apresentados para ambos os pisos na Figura 7.26.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-313_692_1741_1359_161.jpg)
Figura 7.26: Espectro em bandas de terço de oitava da velocidade vertical avaliada nas lajes de diferentes pisos do edifício: a) piso 5; b) piso 7 (linha vermelha - resultado numérico; linha azul - resultado experimental).

A comparação por espectros de terço de oitava permite confirmar a elevada precisão do modelo numérico. Na faixa com maior conteúdo energético, entre 20 Hz e 60 Hz, seu desempenho é muito bom e, em geral, as diferenças são inferiores a 4 dB. Mesmo na Figura 7.26b, em que a simulação é um pouco menos precisa, o modelo reproduz de forma muito aceitável os principais aspectos da resposta, sobretudo os valores mais elevados da velocidade.

### 7.4.3 Reflexão sobre os resultados alcançados

A comparação entre resultados experimentais e numéricos das seções anteriores permite concluir que a metodologia integrada proposta para prever vibrações em edifícios devidas ao tráfego ferroviário em túneis constitui uma ferramenta robusta e confiável, de indiscutível interesse prático. Mesmo neste caso, com falta evidente de informações detalhadas, a capacidade da ferramenta, combinada ao senso crítico do analista, indispensável à análise de engenharia, permitiu reproduzir de forma muito expressiva a resposta dinâmica do sistema integrado, da via férrea ao interior do edifício.

Diante desses resultados e conclusões, pode-se afirmar que foi dado um passo muito importante na validação experimental do modelo proposto. Isso representa um ganho, pois aumenta a confiança tanto na ferramenta quanto nas conclusões extraídas do amplo conjunto de análises dos capítulos anteriores.

### 7.5 Proposta de medidas de mitigação

### 7.5.1 Considerações gerais

O principal objetivo deste capítulo é comparar resultados experimentais e numéricos para comprovar a robustez da metodologia proposta. Esse objetivo foi perseguido e alcançado, como mostram as seções anteriores. Uma das vantagens de dispor de uma ferramenta de cálculo robusta e confiável é poder avaliar as soluções mais adequadas para mitigar vibrações nos edifícios decorrentes do tráfego ferroviário em túneis. Esse aspecto de engenharia já foi detalhado em diversos estudos dos capítulos anteriores, de modo que novos estudos sobre o tema poderiam ser dispensados nesta etapa.

Ainda assim, a autora optou por explorar as possibilidades da metodologia para avaliar os benefícios de algumas medidas simples de mitigação no edifício deste capítulo. Nesta seção, realiza-se uma breve análise comparativa dos possíveis benefícios da melhoria da qualidade geométrica da via férrea e da instalação de material resiliente sob sua laje.

### 7.5.2 Melhoria da qualidade geométrica da via férrea

Uma das técnicas mais eficientes de mitigação de vibrações consiste no controle rigoroso da qualidade geométrica da via férrea. Esse tipo de intervenção permite reduzir as forças de interação dinâmica veículo-via e os níveis de energia que se propagam pelo maciço geotécnico e causam incômodo nas habitações vizinhas. Neste caso de estudo, a qualidade geométrica da via era claramente deficiente, o que justifica uma breve análise dos possíveis benefícios de sua melhoria. Gerou-se, então, um novo perfil de
irregularidades, adotando $5 \times 10^{-7} \mathrm{~m}^{3} /$ rad para a constante $\mathrm{S}_{0}$ da função densidade espectral de potência da equação [5.10], ou seja, metade do valor anteriormente considerado.

A Figura 7.27 compara a velocidade vertical do trilho nessas novas condições com os resultados numéricos anteriores. Como esperado, a amplitude da resposta diminui significativamente com a melhoria da qualidade geométrica da via. Entretanto, a Figura 7.27b mostra que, até cerca de 20 Hz, a velocidade vertical do trilho praticamente independe dessa qualidade. Isso ocorre porque as frequências mais baixas são predominantemente governadas pelo mecanismo quase estático, independente da amplitude das irregularidades.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-315_660_1752_900_155.jpg)
Figura 7.27: Velocidade vertical do trilho para diferentes níveis de qualidade geométrica da via férrea: a) registro temporal; b) conteúdo em frequência.

Quanto aos pontos de observação no 5° e no 7° pisos, a Figura 7.28 apresenta os registros temporais da velocidade vertical de vibração. As figuras também incluem, como referência, o resultado numérico do estudo de validação.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-316_727_1751_121_155.jpg)
Figura 7.28: Velocidade vertical observada em diferentes lajes do edifício e para diferentes níveis de qualidade geométrica da via férrea: a) 5° piso; b) 7° piso.

Como esperado, a melhoria da qualidade geométrica da via férrea reduz acentuadamente a amplitude da velocidade vertical nos pontos das lajes. A Figura 7.28, contudo, não permite conclusões muito além dessa constatação.

Como a análise em frequência geralmente facilita a interpretação dos fenômenos físicos, a Figura 7.29 apresenta os espectros em bandas de terço de oitava da velocidade vertical no 5º e no 7º pisos, para os níveis de qualidade geométrica considerados.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-316_696_1751_1496_154.jpg)
Figura 7.29: Espectro em bandas de terço de oitava da velocidade vertical observada em diferentes lajes do edifício e para diferentes níveis de qualidade geométrica da via férrea: a) 5° piso; b) 7° piso (linha vermelha $-\mathrm{S}_{0}=1 \times 10^{-6} \mathrm{~m}^{3} / \mathrm{rad}$; linha azul $-\mathrm{S}_{0}=5 \times 10^{-7} \mathrm{~m}^{3} / \mathrm{rad}$ ).

A Figura 7.29 mostra um ganho significativo com a melhoria da qualidade geométrica da via férrea, superior a 6 dB na faixa de frequências mais relevante. O ganho é menor abaixo de 15 Hz, o que tem pouca relevância para a engenharia neste caso, pois o conteúdo energético dessas bandas é baixo em comparação com o observado entre 30 Hz e 60 Hz.

Embora de escopo relativamente limitado, esse estudo permite concluir que a boa qualidade geométrica da via férrea é determinante para o desempenho satisfatório do sistema, especialmente quanto às vibrações percebidas em edifícios próximos à infraestrutura. Os benefícios da melhoria da qualidade geométrica têm caráter proporcional: segundo a análise apresentada, uma via de qualidade ainda melhor proporcionaria maior redução dos níveis de vibração no edifício.

### 7.5.3 Introdução de um sistema de laje flutuante

Os fundamentos do dimensionamento e da análise de sistemas de laje flutuante para reduzir as vibrações percebidas em edifícios já foram abordados no Capítulo 6. Esta aplicação busca apenas ilustrar as possibilidades da ferramenta de cálculo em um contexto prático.

Antes da análise, cabe observar que, na opinião da autora, qualquer medida de mitigação aplicável a este caso deve ser acompanhada de uma melhoria da qualidade geométrica da via férrea, muito degradada na época dos ensaios. Além disso, a instalação de laje flutuante em toda a via seria extremamente onerosa do ponto de vista técnico-econômico, pois a infraestrutura já está construída. Uma alternativa seria instalar esse sistema apenas nos trechos críticos.

As Figura 7.25 e Figura 7.26 demonstram que o maior conteúdo energético da velocidade vertical das lajes está restrito ao intervalo entre 35 Hz e 60 Hz, observação experimental reproduzida de forma satisfatória pelo modelo. Considerando essa faixa, o sistema de laje flutuante só terá eficiência significativa se introduzir uma frequência de corte não superior a 35 Hz, preferencialmente menor. Avalia-se, então, o ganho potencial da instalação de uma manta resiliente sob a laje da via que resulte em frequência natural de 20 Hz e frequência de corte de cerca de 28 Hz.

A manta resiliente amplifica consideravelmente a resposta do trilho, como mostra a Figura 7.30, que compara a velocidade vertical nas soluções com laje flutuante e de referência. Os valores de pico praticamente duplicam devido à flexibilização da via proporcionada pela manta sob a laje.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-318_604_962_120_551.jpg)
Figura 7.30: Registro temporal da velocidade vertical do trilho para os cenários de laje flutuante e não flutuante.

A Figura 7.31 apresenta um resultado mais relevante: o IL (insertion loss) em um ponto da seção de referência localizado no invert do túnel. Essa grandeza expressa, em alguma medida, a eficiência da mitigação, pois, na interpretação apresentada, representa a redução da energia transmitida da via ao túnel e, em seguida, ao maciço geotécnico. A laje flutuante permite uma redução muito significativa, de cerca de 18 dB, na faixa mais relevante, em torno de 50 Hz. Esse ganho é acompanhado por um aumento do conteúdo em frequência na banda próxima à frequência de ressonância do sistema de isolamento.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-318_631_963_1512_551.jpg)
Figura 7.31: Curva de IL avaliada no ponto central do invert (na seção de referência).

À luz da Figura 7.31, espera-se que a laje flutuante aumente a amplitude de vibração das lajes do edifício em frequências próximas de 20 Hz e a reduza nas frequências mais altas. Entretanto, conforme discutido no Capítulo 6, a magnitude desses efeitos depende fortemente tanto do campo de vibração incidente nas fundações quanto da dinâmica do edifício. No domínio do tempo, a presença do isolamento sob a laje da via reduz os picos de vibração vertical das lajes, principalmente no ponto de observação do 5º piso (ver Figura 7.32).

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-319_751_1753_119_156.jpg)
Figura 7.32: Velocidade vertical observada em diferentes lajes do edifício para a solução com sistema de laje flutuante: a) 5° piso; b) 7° piso.

Os espectros em bandas de terço de oitava da Figura 7.33 mostram que a laje flutuante modifica a faixa dominante da resposta das lajes. A concentração antes próxima de 50 Hz passa para cerca de 20 Hz. Mesmo com o aumento da amplitude da velocidade vertical em torno de 20 Hz, ocorre uma redução apreciável dos níveis máximos de vibração.

![](./images/d236f477-e041-4a8a-945d-e7cf62adf396-319_716_1759_1429_147.jpg)
Figura 7.33: Velocidade vertical observada em diferentes lajes do edifício para os cenários de laje flutuante e não flutuante: a) 5° piso; b) 7° piso (linha vermelha - sem manta; linha azul - com manta).

Com base nesses resultados, uma solução de engenharia poderia combinar a melhoria da qualidade geométrica da via, especialmente dos comprimentos de onda mais elevados, que geram vibrações na faixa inferior a

25 Hz, com a instalação de um sistema de laje flutuante como o proposto, que permitiria reduzir significativamente as vibrações nas frequências mais altas. Essa possibilidade ilustra uma vantagem de dispor de um modelo confiável e robusto:
realizar estudos de sensibilidade para avaliar os ganhos associados à combinação de diferentes medidas de mitigação e seus efeitos sinérgicos.

### 7.6 Considerações finais

Neste capítulo, aplicou-se o modelo desenvolvido nesta tese a um caso prático com medições disponíveis. Esse caso foi fundamental para a validação experimental do modelo proposto, desafio que foi alcançado com sucesso.

A incerteza na simulação de problemas dessa complexidade torna a validação experimental fundamental à aplicação prática dos modelos e, ao mesmo tempo, um grande desafio, pois nem todas as variáveis podem ser incluídas nas formulações matemáticas. Aqui, a falta de informações para caracterizar detalhadamente o problema aumentou essa dificuldade. Trata-se, porém, de uma situação recorrente na prática, em que o julgamento de engenharia do analista ganha relevância. Apesar dessas limitações, a comparação entre medições e previsões foi, em termos gerais, bastante satisfatória, aumentando a confiança nas metodologias propostas nesta tese.

O procedimento de validação mostrou que o modelo pode representar de forma confiável os mecanismos de geração e propagação de vibrações. Após o ajuste da resposta no trilho, necessário pela falta de informações sobre o perfil de irregularidades, o modelo previu satisfatoriamente a resposta nos demais pontos de observação, na via férrea e no interior do edifício.

Além da validação experimental, os estudos numéricos mostraram que a qualidade geométrica da via férrea é um fator preponderante nos níveis de vibração percebidos no interior dos edifícios.

Para demonstrar as possibilidades do modelo, realizou-se um estudo numérico dos ganhos potenciais da adoção de uma solução de laje flutuante. Os resultados são compatíveis com os do capítulo anterior, razão pela qual não se acrescentam outras considerações sobre o assunto.

## 8 Conclusões e propostas de desenvolvimentos futuros

### 8.1 Conclusões

Cabe apresentar uma síntese das principais conclusões à luz dos objetivos previamente definidos: i) desenvolver uma ferramenta numérica integrada para prever e analisar vibrações induzidas pelo tráfego ferroviário subterrâneo, com uma abordagem completa da fonte (interação veículo-via) ao receptor (edifício), incluindo o meio de propagação (sistema túnel-maciço); ii) ampliar o conhecimento sobre os fatores condicionantes do problema; iii) validar experimentalmente as metodologias propostas. Em todas as etapas de desenvolvimento numérico, buscou-se representar com precisão os principais aspectos físicos do problema, sem complexidade desnecessária ou esforço computacional desproporcional que impedisse a transferência dos modelos da academia para a prática de engenharia.

O Capítulo 2 apresenta uma introdução geral aos fundamentos do problema, às principais contribuições anteriores de outros autores e às técnicas de modelagem disponíveis. Também reúne medidas de mitigação que podem ser aplicadas para reduzir vibrações nos edifícios devidas ao tráfego ferroviário em túneis. Além disso, identifica lacunas que justificam os estudos dos capítulos seguintes e algumas opções adotadas no desenvolvimento dos modelos.

O primeiro objetivo exigiu um esforço significativo, apresentado nos Capítulos 3 e 5, que detalham os componentes dos modelos teóricos, seus objetivos, hipóteses fundamentais, fundamentação físico-matemática, implementação numérica e validação teórica. A exposição segue uma ordem de complexidade crescente e começa pelos aspectos físicos da geração, da propagação e da recepção de vibrações nos edifícios. As particularidades dos meios envolvidos justificam metodologias distintas de simulação. As escolhas de modelagem são fundamentadas e o acoplamento é introduzido posteriormente, segundo a estratégia de subestruturação. Na validação passo a passo, cada desenvolvimento numérico é seguido de pequenos exemplos que verificam a precisão das soluções e permitem interpretar fisicamente os problemas analisados.

Para simular grandes domínios tridimensionais sujeitos a ações dinâmicas móveis, como o sistema túnel-maciço, desenvolveu-se e implementou-se um modelo numérico alternativo aos existentes na época de início dos estudos. Esse modelo aplica o conceito 2.5D ao método dos elementos finitos e ao método das camadas de absorção perfeita (2.5D MEF-PML), conforme apresentado no Capítulo 3. A abordagem
mostrou-se muito eficaz: i) sua relativa simplicidade facilita a aplicação na prática de engenharia; ii) garante resultados de elevada qualidade, superando claramente outras metodologias baseadas no MEF, como elementos infinitos e fronteiras viscosas. Destaca-se a proposta de funções de esticamento, que permite obter soluções de elevada precisão mesmo quando a extensão do meio discretizado é substancialmente menor que o comprimento de onda propagante. Os estudos de validação teórica, comparando previsões com soluções analíticas ou técnicas alternativas de modelagem, demonstram a elevada precisão dos resultados.

O Capítulo 4 apresenta um estudo paramétrico amplo para compreender os fatores que condicionam a resposta do sistema via-túnel-maciço. Para interpretar os fenômenos físicos, utiliza funções de transferência de deslocamento em pontos no túnel, no interior e na superfície do maciço. O estudo avalia sistematicamente as características geométricas e estruturais do túnel (invert, espessura do revestimento, geometria etc.), do maciço (rigidez e amortecimento), do sistema túnel-maciço (profundidade do túnel) e da via férrea (propriedades mecânicas de elementos resilientes). Muitos parâmetros do túnel e do maciço influenciam pouco a resposta do próprio túnel, permitindo inferir que sua influência na interação veículo-via também é reduzida. Em outras palavras, nas condições estudadas, a geração de vibrações é pouco afetada pelas propriedades do sistema túnel-maciço. A conclusão muda quando se analisam as vibrações na superfície ou no interior do maciço: a resposta superficial depende de mecanismos complexos de amplificação e atenuação, relacionados, entre outros aspectos, à distância fonte-receptor e à velocidade de propagação das diferentes ondas.

Entre as variáveis analisadas, a rigidez do maciço mostrou-se crucial para a propagação das vibrações. A influência do amortecimento material é menos evidente, mas torna-se considerável nas frequências mais altas e com o aumento da distância entre o ponto de observação e o túnel. A rigidez das mantas sob as lajes dos sistemas de laje flutuante é outro fator condicionante. Esses dois fatores são examinados em mais detalhe no Capítulo 6, que apresenta um estudo integrado da fonte ao receptor.

O Capítulo 5 apresenta os modelos adotados para o veículo e a interação veículo--via, além dos modelos de interação solo-estrutura desenvolvidos para simular vibrações nos edifícios devidas ao tráfego ferroviário em túneis. Expõe os aspectos físico-mecânicos de cada modelo e propõe metodologias e procedimentos numéricos para incorporá-los ao cálculo. Como o modelo global utiliza subestruturação, são apresentados os pressupostos e as simplificações do acoplamento do veículo e do edifício ao sistema via-túnel-maciço dos capítulos anteriores.

Para o veículo e sua interação com a via, adotou-se um modelo de corpos rígidos previamente implementado e utilizado por Alves Costa (2011). A incorporação de edifícios adjacentes à infraestrutura ferroviária é uma das inovações desta tese. Para obter uma ferramenta versátil, formulou-se a interação solo-estrutura no domínio da frequência e desenvolveu-se um módulo de cálculo capaz de utilizar as matrizes que governam o equilíbrio dinâmico do edifício, geradas por qualquer programa tridimensional de elementos finitos. Assim, o modelo pode incorporar representações estruturais complexas do edifício.

A interação solo-estrutura foi tratada por duas técnicas de complexidade distinta: i) acoplamento tridimensional entre o método dos elementos finitos, que simula a estrutura, e o método dos elementos de contorno, que descreve a dinâmica do maciço de fundação; ii) acoplamento tridimensional entre o método dos elementos finitos e modelos de parâmetros condensados, que procuram representar a resposta dinâmica do maciço de fundação de forma simplificada.

Após a apresentação dos modelos desenvolvidos e implementados nesta tese, os Capítulos 6 e 7 exploram suas possibilidades em aplicações práticas.

O Capítulo 6 apresenta um estudo integrado que utiliza os modelos propostos para compreender melhor a influência da rigidez do maciço geotécnico no problema global e avaliar a eficiência da laje flutuante na mitigação de vibrações em edifícios próximos ao túnel ferroviário.

Os estudos produziram conclusões relevantes em diversos aspectos. Mostraram que a rigidez do maciço influencia tanto a propagação de vibrações quanto o comportamento dinâmico decorrente da interação solo-estrutura, podendo gerar tendências contraditórias em diferentes etapas. Em termos médios, o aumento da rigidez reduz as vibrações em campo livre, mas também diminui o amortecimento por radiação nas fundações superficiais do edifício. A combinação desses efeitos é complexa, sem uma tendência clara para todas as faixas de frequência analisadas, o que justifica o uso de um modelo abrangente. Além disso, na faixa estudada e em maciços de rigidez não muito baixa $\left(\mathrm{C}_{\mathrm{s}}>250 \mathrm{~m} / \mathrm{s}\right)$, os modelos de interação solo-estrutura que representam o maciço por parâmetros condensados mostraram-se viáveis: seus resultados não diferiram significativamente dos obtidos pelo acoplamento MEF-MEC.

Quanto à laje flutuante, os estudos mostraram que seu dimensionamento exige muito cuidado. Se a frequência natural do isolamento estiver próxima das frequências naturais do edifício associadas ao movimento vertical das lajes, os picos de vibração vertical podem ser amplificados em relação ao cenário sem isolamento. A comple-
xidade desse comportamento confirma a vantagem de dispor de um modelo global de previsão como o proposto nos capítulos anteriores.

Por fim, o Capítulo 7 trata da validação experimental do modelo. O caso é um túnel de uma linha suburbana de Madrid, cujos dados foram recentemente apresentados na tese de doutorado de Fernandez (2014). As medições foram solicitadas pela ADIF ao CEDEX em resposta às reclamações de vibrações excessivas dos moradores de um edifício adjacente ao túnel. Avaliaram-se as respostas dinâmicas da via férrea (aceleração do trilho e da laje da via) e do edifício (velocidade vertical nas lajes do 5º e do 7º pisos) à passagem do tráfego em um túnel superficial. A falta de informações precisas sobre o perfil longitudinal de irregularidades da via e sobre todos os elementos estruturais do edifício, como paredes e núcleos de contraventamento, exigiu hipóteses adicionais. Diante dessas dificuldades, o estudo também aproximou o conhecimento acadêmico da prática de engenharia, na qual a falta de informações detalhadas é frequente. Apesar da complexidade e dos dados incompletos, as previsões numéricas apresentaram concordância muito satisfatória com a realidade medida. Os níveis de vibração no edifício foram reproduzidos de forma bastante razoável no tempo e em frequência, tanto no 5º quanto no 7º piso.

Também foram realizadas análises numéricas desse caso que confirmaram a forte influência da qualidade geométrica da via nos níveis de vibração percebidos nos edifícios. Para explorar as possibilidades do modelo, avaliou-se ainda o benefício potencial da instalação de uma via em laje flutuante.

Em síntese, entende-se que a autora cumpriu com sucesso os principais objetivos propostos. As competências adquiridas contribuem significativamente para ampliar e sustentar a linha de pesquisa sobre vibrações associadas às infraestruturas ferroviárias, no centro de pesquisa em que esta tese foi desenvolvida. O desenvolvimento de todos os procedimentos numéricos a partir do zero, dentro do próprio grupo de pesquisa, favorece seus futuros aperfeiçoamentos e adaptações a novos desafios.

### 8.2 Propostas para pesquisa futura

Durante este trabalho, surgiram diversas possibilidades de pesquisa que não puderam ser exploradas por limitações de tempo ou de recursos e que, na opinião da autora, merecem atenção futura. Como se trata de uma linha de pesquisa muito ativa, alguns dos pontos apresentados a seguir já eram objeto de pesquisas em andamento na época desta tese.

Propõe-se, portanto, explorar as seguintes linhas de pesquisa, que complementam este estudo e decorrem de seus resultados:

i) O desenvolvimento conceitual, a implementação e a utilização de um campo experimental para coletar dados de qualidade sobre geração, propagação e transmissão de vibrações aos edifícios devidas ao tráfego ferroviário urbano constituem um objetivo urgente. Informações experimentais detalhadas permitirão avaliar criticamente a precisão dos modelos teóricos existentes e aprofundar o conhecimento sobre as técnicas de modelagem numérica e os fatores que condicionam o problema, favorecendo sua melhoria contínua. Parte desses trabalhos já estava em andamento na época desta tese, em um campo experimental que envolve um trecho da rede de metrô do Porto, próximo à estação do Pólo Universitário.
ii) Todos os estudos desta tese adotaram comportamento elástico e linear para os materiais, aproximação geralmente razoável para o túnel, o maciço geotécnico e o edifício. Na via férrea, porém, vários elementos, especialmente os resilientes, apresentam comportamento fortemente não linear, dependente do nível de carga e da frequência de excitação [178], que as técnicas utilizadas só representam aproximadamente. Como a inclusão da não linearidade exige formular o problema no domínio do tempo, seria interessante generalizar os modelos por uma formulação híbrida: o sistema via-veículo seria estudado no tempo, e os demais meios, para os quais a hipótese de elasticidade é razoável, permaneceriam no domínio da frequência. Na época da tese, essas técnicas híbridas vinham recebendo atenção dos principais grupos de pesquisa internacionais, conforme as publicações recentes de Triepaischajonsak \& Thompson (2015) e Nielsen et al. (2015). Essa abordagem permite incorporar tanto a não linearidade dos elementos da via quanto excitações decorrentes da heterogeneidade espacial do suporte, como a excitação paramétrica causada pelo apoio discreto do trilho [242]. Como os estudos citados tratam apenas da dinâmica de vias superficiais, é relevante estendê-los às vibrações induzidas pelo tráfego ferroviário em túneis;
iii) Os estudos de interação solo-estrutura desta tese consideraram apenas edifícios com fundações superficiais. Generalizar os modelos para edifícios com fundações em estacas ou pavimentos enterrados ampliaria significativamente a versatilidade da ferramenta numérica e merece atenção especial. Estudos preliminares foram apresentados por Hussein et al. (2015), em uma pesquisa

resultante da colaboração entre a U. Southampton, a U. Cambridge e a U. Porto;
iv) As vibrações induzidas pelo tráfego ferroviário em túneis podem ser percebidas nos edifícios como vibrações mecânicas ou como ruído re-radiado. Esta tese tratou apenas das primeiras; a simulação e a análise do ruído re-radiado ainda precisam ser desenvolvidas. Interessa, portanto, desenvolver e implementar um modelo acústico que possa ser acoplado ao modelo estrutural do edifício. Estudos preliminares nessa direção foram recentemente apresentados por Godinho et al. (2015), como resultado de uma colaboração entre a U. de Coimbra e a U. Porto;
v) Os estudos desta tese analisaram a resposta de forma determinística e, portanto, não representaram os níveis de incerteza associados a ela. Estudos não determinísticos constituem um desafio que merece atenção detalhada no futuro. Destaca-se a implementação de técnicas não determinísticas de caráter não paramétrico, que permitem reduzir significativamente o volume de cálculo em relação a abordagens paramétricas, como o método de Monte Carlo. Estudos iniciais, embora não voltados explicitamente à geração de vibrações pelo tráfego em túneis, foram apresentados por Schevenels (2007).

Na avaliação da incerteza, além da variabilidade das propriedades dos materiais, importa representar sua variabilidade espacial, decorrente tanto da gênese dos maciços geotécnicos quanto da construção do túnel. Esta última altera as propriedades deformacionais do maciço em torno do túnel devido às mudanças no estado de tensão.

vi) Mais estudos paramétricos, abrangendo um grande conjunto de parâmetros, como propriedades dos veículos e diferentes tipos de edifícios, ampliarão o conhecimento dos fatores condicionantes. Esses fatores merecem atenção especial tanto quanto ao rigor da modelagem numérica quanto à sua identificação e caracterização experimental;
vii) Estudos da eficiência e da eficácia de medidas de mitigação na fonte, no caminho de propagação ou no receptor merecem maior atenção futura. Para melhorar o desempenho ambiental dos sistemas ferroviários subterrâneos, esses estudos devem seguir uma visão integrada, que reúna gestão da manutenção, vibrações induzidas e ruído percebido nos edifícios adjacentes. Seria relevante incorporar modelos de degradação para tornar a análise mais abrangente e considerar o ciclo de vida do sistema.

## BIBLIOGRAFIA

[1] United Nations, Department of Economic and Social Affairs, Population Division, Population Division World Urbanization Prospects: The 2014 Revision, Highlights (ST/ESA/SER.A/352). 2014.
[2] INCEJ, The Regional Environmental Vibrations. Tokyo, 2001.
[3] A. Gidlöf-Gunnarsson, M. Ögren, T. Jerson, and E. Öhrström, "Railway noise annoyance and the importance of number of trains, ground vibration, and building situational factors," Noise Health, vol. 14(59), pp. 190-201, 2012.
[4] I. Croy, M. G. Smith, and K. Waye, "Effects of train noise and vibration on human heart rate during sleep: an experimental study," BMJ Open, 2013, doi: 10.1136/bmjopen-2013-002655.
[5] M. G. Smith, I. Croy, M. Ögren, and K. Persson Waye, "On the Influence of Freight Trains on Humans: A Laboratory Investigation of the Impact of Nocturnal Low Frequency Vibration and Noise on Sleep and Heart Rate," PLoS ONE, vol. 8(2), p. e55829, 2013.
[6] International Organization for Standardization, Mechanical vibration - Ground-borne noise and vibration arising from rail systems. ISO 14837-1 2005, 2005.
[7] H. M. M. Hansen, High-speed ground transportation. Noise and vibration impact assessment. Federal Railroad Administration, 2005.
[8] S. François, "Nonlinear modelling of the response of structures due to ground vibrations," Thesis, Katholieke Universiteit Leuven, 2008.
[9] E. Ohrstrom, "Effects of exposure to railway noise - a comparison between areas with and without vibration," Journal of Sound and Vibration, vol. 205(4), pp. 555-560, 1997.
[10] H. E. Apud and A. J. Brammer, "Effects of shock and vibration on humans," in Shock and Vibration handbook, 1998.
[11] International Organization for Standardization, ISO 10811-1 - Mechanical vibration and shock - Vibration and shock in buildings with sensitive equipment - Part 1: Measurement and evaluation. 2000.
[12] International Organization for Standardization, ISO 10811-2 - Mechanical vibration and shock - Vibration and shock in buildings with sensitive equipment - Part 1: Classification. 2000.

[13] C. Gordon, "Generic criteria for vibration-sensitive equipment," in Proceedings of International Society for Optical Engineering, 1991.
[14] C. Gordon, "Generic vibration criteria for vibration-sensitive equipment," Proc. SPIE, vol. 3786, pp. 22-39, 1999.
[15] P. J. Remington, L. G. Kurzweil, and D. A. Towers, "Low frequency noise and vibration from trains," in Transportation Noise Reference Book, 1987.
[16] P. Ellis, "Effects of traffic vibration on historic buildings," Science of the Total Environment, vol. 59(4), pp. 37-45, 1987.
[17] P. Clemente and D. Rinaldis, "Protection of a monumental building against trafficinduced vibrations," Soil Dynamics and Earthquake Engineering, vol. 246(2), pp. 319-335, 1998.
[18] M. Ma, V. Markine, W. Liu, Y. Yuan, and F. Zhang, "Metro train-induced vibrations on historic buildings in Chengdu," Journal of Zhejiang University -Science A (Applied Physics Engineering), vol. 12(10), pp. 782-793, 2011.
[19] Y. Yang and L. Hsu, "A review of researches on ground-borne vibrations due to moving trains via underground tunnels," Advances in Structural Engineering, vol. 9(3), pp. 377-392, 2006.
[20] J. Melke, "Noise and vibration from underground railway lines: proposals for a prediction procedure," Journal of Sound and Vibration, vol. 120, pp. 391-406, 1988.
[21] L. G. Kurzweil, "Ground-borne noise and vibration from underground rail system," Journal of Sound and Vibration, vol. 66(3), pp. 363-370, 1979.
[22] R. A. Hood, R. J. Greer, M. Breslin, and P. R. Williams, "The calculation and assessment of ground-borne noise and perceptible vibration from trains in tunnels," Journal of Sound and Vibration, vol. 193, pp. 215-225, 1996.
[23] J. T. Nelson and H. J. Saurenman, "A prediction procedure for rail transportation groundborne noise and vibration," Transportation Research Record, vol. 1143, pp. 3-12, 2008.
[24] C. Lai, A. Callerio, E. Faccioli, V. Morelli, and P. Romani, "Prediction of railway-induced ground vibrations in tunnels," Journal of Vibration and Acoustics, vol. 127(5), pp. 503-514, 2005.
[25] H. Verbraken, G. Lombaert, and G. Degrande, "Verification of an empirical prediction method for railway induced vibrations by means of numerical simulations," Journal of Sound and Vibration, vol. 330(8), pp. 1692-1703, 2011.

[26] G. Lombaert, S. François, H. Verbraken, G. Degrande, and D. J. Thompson, "Numerical, experimental and hybrid methods for the prediction of railway-induced ground vibration," in 9th International Conference on Structural Dynamics, 2014, pp. 91-99.
[27] Forrest and Hunt, "Ground vibration generated by trains in underground tunnels," Journal of Sound and Vibration, vol. 294(4-5), pp. 706-736, 2006.
[28] M. Hussein and H. Hunt, "A numerical model for calculating vibration from a railway tunnel embedded in a full-space," Journal of Sound and Vibration, vol. 305(3), pp. 401-431, 2007.
[29] K. A. Kuo, H. E. M. Hunt, and M. F. M. Hussein, "The effect of a twin tunnel on the propagation of ground-borne vibration from an underground railway," Journal of Sound and Vibration, vol. 330(25), pp. 6203-6222, 2011.
[30] A. Razquin, "A dynamical model of a double-deck circular tunnel embedded in a fullspace," Thesis, Universitat Politècnica de Catalunya, 2014.
[31] M. F. M. Hussein, S. François, M. Schevenels, H. E. M. Hunt, J. P. Talbot, and G. Degrande, "The fictitious force method for efficient calculation of vibration from a tunnel embedded in a multi-layered half-space," Journal of Sound and Vibration, vol. 333(25), pp. 6996-7018, 2014.
[32] X. Sheng, C. Jones, and D. Thompson, "A comparison of a theoretical model for quasistatically and dynamically induced environmental vibration from trains with measurements," Journal of Sound and Vibration, vol. 267(3), pp. 621-635, 2003.
[33] L. Auersch, "The excitation of ground vibration by rail traffic: Theory of vehicle-tracksoil interaction and measurements on high-speed lines," Journal of Sound and Vibration, vol. 284(1-2), pp. 103-132, 2005.
[34] G. Lombaert and G. Degrande, "Ground-borne vibration due to static and dynamic axle loads of InterCity and high-speed trains," Journal of Sound and Vibration, vol. 319(3-5), pp. 1036-1066, 2009.
[35] P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Track-ground vibrations induced by railway traffic: In-situ measurements and validation of a 2.5D FEM-BEM model," Soil Dynamics and Earthquake Engineering, vol. 32(1), pp. 111-128, 2012a.
[36] S. Gupta, G. Degrande, and G. Lombaert, "Experimental validation of a numerical model for subway induced vibrations," Journal of Sound and Vibration, vol. 321, pp. 786-812, 2009.

[37] A. Colaço, P. Alves Costa, and D. Connolly, "The influence of train properties on railway ground vibrations," Structure and Infrastructure Engineering, 2015, doi: 10.1080/15732479.2015.1025291.
[38] S. Neves, P. Montenegro, A. Azevedo, and R. Calçada, "A direct method for analyzing the nonlinear vehicle-structure interaction," Engineering Structures, vol. 69, pp. 83-89, 2014.
[39] X. Sheng, C. J. C. Jones, and D. J. Thompson, "A theoretical study on the influence of the track on train-induced ground vibration," Journal of Sound and Vibration, vol. 272(3-5), pp. 909-936, 2004.
[40] L. Auersch, "Ground vibration due to railway traffic - The calculation of the effects of moving static loads and their experimental verification," Journal of Sound and Vibration, vol. 293, pp. 599-610, 2006.
[41] P. Alves Costa, R. Calçada, and A. Cardoso, "Influence of train dynamic modelling strategy on the prediction of track-ground vibrations induced by railway traffic," Proceedings of the Institution of Mechanical Engineers, Part F: Journal of Rail and Rapid Transit, vol. 226(4), pp. 434-450, 2012.
[42] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Análise numérica de vibrações induzidas por tráfego ferroviário em túneis baseada em modelos 2.5D," in 12° Congresso Nacional de Geotecnia, 2010.
[43] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "An efficient numerical model for the simulation of vibrations induced by railway traffic in tunnels," in ISEV 2013 -International Symposium on Environmental Vibrations, 2013, pp. 105-118.
[44] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Mitigation of vibrations in buildings induced by railway traffic in tunnels: numerical study," in Railways 2014, 2014, pp. 1-20.
[45] H. Grundmann and S. Lenz, "Nonlinear interaction between a moving SDOF system and a Timoshenko beam/halfspace support," Archive of Applied Mechanics, vol. 72, pp. 830-842, 2003.
[46] L. Andersen, S. Nielsen, and R. Iwankiewicz, "Vehicle moving along an infinite beam with random surface irregularities on a kelvin foundation," Journal of Applied Mechanics, vol. 69, pp. 69-75, 2002.
[47] J. Bitzenbauer and J. Dinkel, "Dynamic interaction between a moving vehicle and an infinite structure excited by irregularities - Fourier transform solution," Archive of Applied Mechanics, vol. 72, pp. 199-211, 2002.

[48] P. Galvín, A. Romero, and J. Domínguez, "Fully three-dimensional analysis of high-speed train-track-soil-structure dynamic interaction," Journal of Sound and Vibration, vol. 329, pp. 5147-5163, 2010.
[49] S. Koroma, "Vibration of beams on non-linear and non-homogeneous elastic foundations with application to railway tracks," Thesis, University of Nothingham, 2013.
[50] H. A. Dieterman and A. Metrikine, "The equivalent stiffness of a half-space interacting with a beam. Critical velocities of a moving load along the beam," European Journal of Mechanics A/Solids, vol. 15(1), pp. 67-90, 1996.
[51] H. A. Dieterman and A. Metrikine, "Steady-state displacements of a beam on an elastic half-space due to a uniformly moving constant load," European Journal of Mechanics A/Solids, vol. 16(2), pp. 295-306, 1997.
[52] H. Hung and Y. Yang, "Analysis of ground vibrations due to underground trains by 2.5D finite/infinite element approach," Earthquake Engineering and Engineering Vibration, vol. 9(3), pp. 327-335, 2010.
[53] K. Knothe and Y. Wu, "Receptance behaviour of railway track and sub-grade," Archive of Applied Mechanics, vol. 68, pp. 457-470, 1998.
[54] A. Vostroukhov and A. Metrikine, "Periodically supported beam on a viscoelastic layer as a model for dynamic analysis of a high-speed railway track," International Journal of Solids and Structures, vol. 40(21), pp. 5723-5752, 2003.
[55] M. Hussein and H. Hung, "Modelling of floating-slab track with discontinuous slab Part 2: response to moving trains," Journal of Low Frequency Noise, Vibration and Active Control, vol. 25(2), pp. 111-118, 2006.
[56] M. Hussein and H. Hunt, "Modelling of floating-slab track with discontinuous slab part 1: response to oscillating moving loads," Journal of Low Frequency Noise, Vibration and Active Control, vol. 25(1), pp. 23-39, 2006.
[57] S. Gupta and G. Degrande, "Modelling of continuous and discontinuous floating slab tracks in a tunnel using periodic approach," Journal of Sound and Vibration, vol. 329(8), pp. 1101-1025, 2010.
[58] H. Lane, P. Kettil, and N. Wiberg, "Moving finite elements and dynamic vehicle interaction," European Journal of Mechanics A/Solids, vol. 27, pp. 515-531, 2008.

[59] S. Zhang, X. Xiao, Z. Wen, and X. Jin, "Effect of unsupported sleepers on wheel/rail normal load," Soil Dynamics and Earthquake Engineering, vol. 28(8), pp. 662-673, 2008.
[60] D. Ribeiro, R. Calçada, R. Delgado, M. Brehm, and V. Zabel, "Finite-element model calibration of a railway vehicle based on experimental modal parameters," Vehicle System Dynamics, vol. 51(6), pp. 821-856, 2013.
[61] W. Zhai and Z. Cai, "Dynamic Interaction between a lumped mass vehicle and a discretely supported continuous rail track," Computers and Structures, vol. 63(5), pp. 987-997, 1997.
[62] H. Lamb, "On the propagation of tremors over the surface of an elastic solid," Philosophical Transaction of the Royal Society, vol. 203, no. Serie A, pp. 1-42, 1904.
[63] P. Alves Costa, "Vibrações do sistema via-maciço induzidas por tráfego ferroviário. Modelação numérica e validação experimental," Thesis, Faculdade de Engenharia da Universidade do Porto, 2011.
[64] J. D. Achenbach, Wave propagation in elastic solids, vol. 16. North-Holland Series in Applied Mathematics and Mechanics: North-Holland, 1973.
[65] K. Aki and P. Richards, Quantitative Seismology: Theory and Methods. San Francisco: W.H. Freeman, 1980.
[66] G. F. Miller and H. Pursey, "The field and radiation of mechanical radiators on the free surface of a semi-infinite isotropic solid," Proceedings of the Royal Society, vol. A223, pp. 521-541, 1954a.
[67] G. F. Miller and H. Pursey, "On the partition of energy between elastic waves in a semiinfinite solid," Proceedings of the Royal Society, vol. A223, pp. 55-69, 1954b.
[68] L. Auersch and S. Said, "Attenuation of ground vibrations due to different technical sources," Earthquake Engineering and Engineering Vibration, vol. 9(3), pp. 338-344, 2010.
[69] A. Yaseri, M. H. Bazyar, and N. Hataf, "3D coupled scaled boundary finite-element/finiteelement analysis of ground vibrations induced by underground train movement," Computers and Geotechnics, vol. 60(0), pp. 1-8, 2014.
[70] Q. Xu, Z. Xiao, T. Liu, P. Lou, and X. Song, "Comparison of 2D and 3D prediction models for environmental vibration induced by underground railway with two types of tracks," Computers and Geotechnics, vol. 68(0), pp. 169-183, 2015.

[71] J. Fernandez, "Estudio numérico de vibraciones provocadas por el tráfico ferroviario en túneles en el dominio del tiempo: análisis geotécnico, validación experimental y propuesta de soluciones," in Escuela Técnica Superior de Ingenieros de Caminos, Canales y Puertos, 2014.
[72] M. Adam, G. Pflanz, and G. Schmid, "Two- and three-dimensional modelling of half-space and train-track embankment under dynamic loading," Soil Dynamics and Earthquake Engineering, vol. 19, pp. 559-573, 2000.
[73] D. Clouteau, M. Arnst, T. Al-Hussaini, and G. Degrande, "Free field vibrations due to dynamic loading on a tunnel embedded in a stratified medium," Journal of Sound and Vibration, vol. 283(1-2), pp. 173-199, 2005.
[74] S. Gupta, M. Hussein, G. Degrande, H. Hunt, and D. Clouteau, "A comparison of two numerical models for the prediction of vibrations from underground railway traffic," Soil Dynamics and Earthquake Engineering, vol. 27(7), pp. 608-624, 2007.
[75] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Numerical Modeling of Vibrations Induced in Tunnels: A 2.5D FEM-PML Approach," in Traffic Induced Environmental Vibrations and Controls: Theory and Application, 2013.
[76] P. Coulier, A. Dijckmans, S. François, G. Degrande, and G. Lombaert, "A spatial windowing technique to account for finite dimensions in 2.5D dynamic soil-structure interaction problems," Soil Dynamics and Earthquake Engineering, vol. 59, pp. 51-67, 2014.
[77] Y. Yang, H. Hung, and H. Hsu, "Ground vibrations due to underground trains considering soil-tunnel interactions," Interaction and Multiscale Mechanics, vol. 1(1), pp. 157-175, 2007.
[79] X. Bian, W. Jin, and H. Jiang, "Ground-borne vibrations due to dynamic loading from moving trains in subway tunnels," Journal of Zhejiang University - Science A (Applied Physics Engineering), vol. 13(11), pp. 870-876, 2012.
[78] X. Bian, E. Zeng, and Y. Chen, "Ground motions generated by harmonic loads moving in subway tunnel," in Proceedings of the Third International Symposium on Environmental Vibrations: Prediction, Monitoring, Mitigation and Evaluation. ISEV, 2007.
[80] P. Alves Costa, R. Calçada, J. Couto Marques, and A. Cardoso, "A 2.5D finite element model for simulation of unbounded domains under dynamic

loading," in 7th European Conference on Numerical Methods in Geotechnical Engineering, 2010, pp. 782-790.
[81] P. Galvín, S. François, M. Schevenels, E. Bongini, G. Degrande, and G. Lombaert, "A 2.5D coupled FE-BE model for the prediction of railway induced vibrations," Soil Dynamics and Earthquake Engineering, vol. 30(12), pp. 1500-1512, 2010.
[82] P. Amado Mendes, P. Alves Costa, L. Godinho, and P. Lopes, "2.5D MFS-FEM model for the prediction of vibrations due to underground railway traffic," Engineering Structures, 2015.
[83] P. Amado Mendes, L. Godinho, and P. Alves Costa, "2.5D modeling of soilstructure interaction using a coupled MFS-FEM formulation," in 11th World Congress on Computational Mechanics, 2014.
[84] G. Rieckh, W. Kreuzer, H. Waubke, and P. Balazs, "A 2.5D-Fourier-BEM model for vibrations in a tunnel running through layered anisotropic soil," Engineering Analysis With Boundary Elements, vol. 36, pp. 960-967, 2012.
[85] K. Muller, "Dreidimensionale dynamische Tunnel-Halbraum-Interaktion," Thesis, Technische Universitat Munchen, 2007.
[86] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Modeling of Vibrations in Tunnels using the Finite Element Method with Perfectly Matched Layers," in First International Conference on Railway Technology: Research, 2012.
[87] P. Coulier, G. Lombaert, and G. Degrande, "The influence of source-receiver interaction on the numerical prediction of railway induced vibrations," Journal of Sound and Vibration, vol. 333(12), pp. 2520-2538, 2014.
[88] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Influence of soil stiffness on vibrations inside buildings due to railway traffic: numerical study," Computers Geotechnics, vol. 61, pp. 277-291, 2014.
[89] L. Pyl, G. Degrande, and D. Clouteau, "Validation of a source-receiver model for road traffic induced vibrations in buildings. II: Receiver model," Journal of Engineering Mechanics, vol. 130(12), pp. 1394-1406, 2004a.
[90] L. Pyl, G. Degrande, G. Lombaert, and W. Haegeman, "Validation of source-receiver model for road traffic induced vibrations in buildings. I: Source model," Jornal of Engineering Mechanics, vol. 130(12), pp. 1377-1393, 2004b.

[91] A. Romero, M. Solís, and P. Galvín, "HIGH-SPEED TRAIN PASSAGE EFFECTS IN BUILDINGS: VIBRATION ASSESSMENT AND ISOLATION," in COMPDYN 2013, 2013.
[92] M. Hussein, H. Hunt, K. Kuo, P. Alves Costa, and J. Barbosa, "The dynamic effect of a piled-foundation building on an incident vibration field from an underground railway tunnel," in 20th International Congress on Sound and Vibration, 2013, pp. 1594-1601.
[93] P. Lopes, P. Alves Costa, M. Ferraz, R. Calçada, and A. Silva Cardoso, "Numerical modeling of vibrations induced by railway traffic in tunnels: From the source to the nearby buildings," Soil Dynamics and Earthquake Engineering, vol. 61-62, pp. 269-285, 2014.
[95] P. Fiala, G. Degrande, and F. Augusztinovicz, "Numerical modelling of ground-borne noise and vibration in buildings due to surface rail traffic," Journal of Sound and Vibration, vol. 301(3-5), pp. 718-738, 2007.
[94] P. Fiala, G. Degrande, J. Granát, and F. Augusztinovicz, "Structural and acoustic response of buildings in the higher frequency range due to surface rail traffic," in The Thirteenth International Congress of Sound and Vibration, 2006.
[96] L. Godinho, P. Amado Mendes, and P. Alves Costa, "A two-step numerical procedure for the analysis of re-radiated noise from underground transportation means," in CMH 2015 - Congress on Numerical Methods in Engineering, 2015.
[97] International Organization for Standardization, ISO 2631-2 - Mechanical vibration and shock - Evaluation of human exposure to whole-body vibration - Part 2: Vibration in buildings (1 Hz to 80 Hz). 2003.
[98] Norwegian Standards Institute, NS 8176 - Vibration and shock - Measurement of vibration in buildings from landbased transport and guidance to evaluation of its effects on human beings. 2005.
[99] Deutsches Institut für Normung, DIN 4150-2 - Structural vibration - Part 2: Human exposure to vibration in buildings. 1999.
[100] R. Klaeboe, I. Turunen-Rise, L. Harvik, and C. Madshus, "Vibration in dwellings from road and rail traffic - part ii: exposure-effect relationships based on ordinal logit and logistic regression models," Applied Acoustics, vol. 64(1), pp. 89-109, 2003.

[101] N. Santos, "Vibrações por tráfego na via e na envolvente de linhas ferroviárias: modelação numérica 3D e validação experimental," Thesis, Universidade do Porto, 2013.
[102] International Organization for Standardization, ISO 2631-1 - Mechanical vibration and shock - Evaluation of human exposure to whole-body vibration - Part 1: General requirements. 1997.
[103] Instituto Português da Qualidade, NP-ISO 2631-1 - Vibrações mecânicas e choque - Avaliação da exposição do corpo inteiro a vibrações - Parte 1: Requisitos gerais. 2007.
[104] X. Sun, W. Liu, H. Zhai, D. Ding, and J. Guo, "Vibration effects of metro trains on sensitive instruments and the study of the mitigation measures," Tunnelling and Underground Space Technology, vol. 21(3-4), p. 299, 2006.
[105] Deutsches Institut für Normung, DIN 4150-3 - Structural vibration - Part 3: Effects of vibration on structures. 1999.
[106] International Organization for Standardization, ISO 4866 - Mechanical vibration and shock - Vibration of buildings - Guidelines for the measurement of vibrations and evaluation of their effects on buildings. 1990.
[107] C. J. C. Jones, "Use of Numerical Models to Determine the Effectiveness of Anti-Vibration Systems for Railways," Proc. Instn Civ. Engrs Transp, vol. 105, pp. 43-51, 1994.
[108] D. Thompson, Railway Noise and Vibration. Mechanisms, Modelling and Means Control. Oxford: Elsevier, 2010.
[109] A. Johansson, J. Nielsen, R. Bolmsvik, and A. Karlstrom, "Under sleeper pads - Influence on dynamic train-track interaction," Wear, vol. 265, pp. 1479-1487, 2008.
[110] P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Ballast mats for the reduction of railway traffic vibrations. Numerical study," Soil Dynamics and Earthquake Engineering, vol. 42(0), pp. 137-150, 2012b.
[111] E. Bongini, G. Lombaert, S. François, and G. Degrande, "A parametric study of the impact of mitigation measures on ground borne vibration due to railway traffic," in EURODYN 2011, 2011, pp. 663-670.
[112] C. Esveld, Modern Railway Tracks. Delft: MRT-Productions, 2001.
[113] M. Bahrekazemi, "Train-Induced Ground Vibration and Its Prediction," Thesis, Royal Institute of Technology, 2004.

[114] J. Barbosa, P. Alves Costa, and R. Calçada, "Abatement of railway induced vibrations: Numerical comparison of trench solutions," Engineering Analysis with Boundary Elements, vol. 55(0), pp. 122-139, 2015.
[115] H. H. Hung, Y. B. Yang, and D. W. Chang, "Wave barriers for reduction of train-induced vibrations in soils," Journal of Geotechnical and Geoenvironmental Engineering, vol. 130(12), pp. 1283-1291, 2004.
[116] A. Karlström and A. Boström, "Efficiency of trenches along railways for trains moving at sub-or super sonic speeds," Soil Dynamics and Earthquake Engineering, vol. 27(7), pp. 625-641, 2007.
[117] A. Alzawi and M. Naggar, "Full scale experimental study on vibration scattering using open and in-filled (GeoFoam) wave barriers," Soil Dynamics and Earthquake Engineering, vol. 31(3), pp. 306-317, 2011.
[118] P. Coulier et al., "Numerical and experimental study of stiff wave barriers for the mitigation of railway induced vibrations," in In International Conference on Noise and Vibration Engineering, 2014, pp. 3489-3504.
[119] H. Takemiya, "Field vibration mitigation by honeycomb WIB for pile foundations of a high-speed train viaduct," Soil Dynamics and Earthquake Engineering, vol. 24, pp. 69-87, 2004.
[120] P. Coulier, S. François, G. Degrande, and G. Lombaert, "Subgrade stiffening next to the track as a wave impeding barrier for railway induced vibrations," Soil Dynamics and Earthquake Engineering, vol. 48, pp. 119-131, 2013.
[121] A. Dijckmans et al., "Mitigation of railway induced vibrations by using heavy masses next to the track," in EURODYN 2014-9th International Conference on Structural Dynamic, 2014, pp. 751-758.
[122] S. Chatterjee, T. K. Singha, and S. K. Karmakar, "Effect of high-frequency low-amplitude vibration on the performance of a class of semi-active base isolation systems with on-off damping," Journal of Sound and Vibration, vol. 274(3-5), pp. 893-914, 2004.
[123] J. Talbot and H. Hunt, "On the Performance of Base-isolated Buildings and Isolation of Buildings from Rail-tunnel Vibration: a Review," in Collected Papers in Building Acoustics: Sound Transmission, 2009.
[124] J. Talbot and H. Hunt, "On the performance of base-isolated buildings," Building Acoustics, vol. 7(3), pp. 163-178, 2001.

[125] F. Kawakami, T. Kobayashi, C. Jaffe, M. Holden, and R. Cooper, "Sound and vibration control for the Tokyo International Forum," Journal of the Acoustical Society of America, vol. 103(5), pp. 2994-2998, 1998.
[126] Forrest and Hunt, "A three-dimensional tunnel model for calculation of traininduced ground vibration," Journal of Sound and Vibration, vol. 294, pp. 678-705, 2006.
[128] S. Gupta, H. Berghe, G. Lombaert, and G. Degrande, "Numerical modelling of vibrations from a Thalys high speed train in the Groene Hart tunnel," Soil Dynamics and Earthquake Engineering, vol. 30(3), pp. 82-97, 2010.
[127] S. Gupta, Y. Stanus, G. Lombaert, and G. Degrande, "Influence of tunnel and soil parameters on vibrations from underground railways," Journal of Sound and Vibration, vol. 327, pp. 70-91, 2009.
[129] X. Sheng, C. Jones, and D. Thompson, "Prediction of ground vibration from trains using wavenumber finite and boundary element method," Journal of Sound and Vibration, vol. 293, pp. 575-586, 2006.
[130] Y. Yang and H. Hung, "Soil Vibrations Caused by Underground Moving Trains," Journal of Geotechnical and Geoenvironmental Engineering, vol. 134(11), pp. 1633-1644, 2008.
[131] Y. B. Yang and H. H. Hung, "A 2.5D finite/infinite element approach for modelling viscoelastic body subjected to moving loads," International Journal for Numerical Methods in Engineering, vol. 51, pp. 1317-1336, 2001.
[132] J. Domínguez, Boundary Elements in Dynamics. Elsevier Applied Science, 1993.
[133] P. Galvín and J. Domínguez, "Experimental and numerical analyses of vibrations induced by high-speed trains on Córdoba-Málaga line," Soil Dynamics and Earthquake Engineering, vol. 29(4), pp. 641-657, 2009.
[134] S. François, M. Schevenels, P. Galvín, G. Lombaert, and G. Degrande, "A 2.5D coupled FE-BE methodology for the dynamic interaction between longitudinally invariant structures and a layered halfspace," Computer Methods in Applied Mechanics and Engineering, vol. 199(23-24), pp. 1536-1548, 2010.
[135] S. Jones and H. Hunt, "Voids at the tunnel-soil interface for calculation of ground vibration from underground railways," Journal of Sound and Vibration, vol. 330, pp. 245-270, 2011.
[136] S. Jones, K. Kuo, M. Hussein, and H. Hunt, "Prediction uncertainties and inaccuracies resulting from common assumptions in modelling vibration

from underground railways," Proceedings of the Institution of Mechanical Engineers, Part F: Journal of Rail and Rapid Transit, vol. 226(5), pp. 501-512, 2012.
[137] A. Sommerfeld, Partial Differential Equations in Physics. New York: Academic Press, 1949.
[138] L. Godinho, P. Amado-Mendes, A. Pereira, and D. Soares Jr, "A coupled MFS-FEM model for 2-D dynamic soil-structure interaction in the frequency domain," Computers Structures, vol. 129(0), pp. 74-85, 2013.
[139] J. P. Wolf, The Scaled Boundary Finite Element Method. Wiley, 2003.
[140] M. Khani, Dynamic Soil-Structure Interaction Analysis Using the Scaled Boundary Finite Elements Method in School of Civil and Environmental Engineering. Sidney: University of New South-Wales, 2007.
[141] J. Lysmer and R. L. Kuhlemeyer, "Finite dynamic model for infinite media," Journal of Engineering Mechanics Division, vol. 95, pp. 859-877, 1969.
[142] G. Liu and S. Jerry, "A non-reflecting boundary for analyzing wave propagation using the finite element method," Finite Elements in Analysis and Design, vol. 39(5-6), pp. 403-417, 2003.
[143] S. Johnson, Notes on Perfectly Matched Layers (PMLs), L. notes, Editor. Massachusetts Institute of Technology, 2010.
[144] J. Berenger, "A perfectly matched layer for absorption of electromagnetic waves," Journal of computational physics, vol. 114, pp. 185-200, 1994.
[145] W. Chew and Q. Liu, "Perfectly matched layers for elastodynamics: a new absorbing boundary condition," Journal of Computational Acoustics, vol. 4, pp. 341-359, 1996.
[146] U. Basu and A. K. Chopra, "Perfectly matched layers for time-harmonic elastodynamics of unbounded domains: theory and finite-element implementation," Computer Methods in Applied Mechanics and Engineering, vol. 192, pp. 1337-1375, 2003.
[147] U. Basu, "Explicit finite element perfectly matched layer for transient three-dimensional elastic waves," International Journal for Numerical Methods in Engineering, vol. 77, pp. 151-176, 2009.
[148] J. M. O. Barbosa, J. Park, and E. Kausel, "Perfectly matched layers in the thin layer method," Computer Methods in Applied Mechanics and Engineering, vol. 217-220(0), pp. 262-274, 2012.

[149] S. François, M. Schevenels, G. Lombaert, and G. Degrande, "A 2.5D displace-ment-based PML for elastodynamic wave propagation," in IV European Conference on Computational Mechanics, 2010.
[150] P. Alves Costa, R. Calçada, A. Silva Cardoso, and A. Bodare, "Influence of soil non-linearity on the dynamic response of high-speed railway tracks," Soil Dynamics and Earthquake Engineering, vol. 30(4), pp. 221-235, 2010.
[151] A. Tadeu and E. Kausel, "Green's functions for two-and-a-half-dimensional elastodynamic problems," Journal of Engineering Mechanics, vol. 126(10), pp. 1093-1096, 2000.
[152] R. Hwang and J. Lysmer, "Response of buried structures to travelling waves," Journal of Geotechnical Engineering Division, vol. 107(2), pp. 183-200, 1981.
[153] P. Alves Costa, Moving loads on the ground: a 2.5D transformed finite element code for train-track-soil interaction. Porto: FEUP, 2008.
[154] H. Grundmann and J. Dinkel, "Moving oscillating loads acting on a dam over a layered half space," in Wave 2000, 2000, pp. 53-70.
[155] O. Kulhánek, Time Series Analysis - Lecture Notes. Uppsala: Uppsala University, 1995.
[156] M. Mazzotti, I. Bartoli, A. Marzani, and E. Viola, "A coupled SAFE-2.5D BEM approach for the dispersion analysis of damped leaky guided waves in embedded waveguides of arbitrary cross-section," Ultrasonics, vol. 53(7), pp. 1227-1241, 2013.
[157] E. Onate, Structural Analysis with Finite Element Method. Linear Statics. Springer, 2009.
[158] P. Bettess, Infinite Elements. Phenshaw Press, 1992.
[159] O. C. Zienkiewicz and R. L. Taylor, The Finite Element Method, vol. 1. Oxford: Butterworth-Heinemann, 2000.
[160] E. Kausel and J. M. de Oliveira Barbosa, "PMLs: A direct approach," International Journal for Numerical Methods in Engineering, vol. 90(3), pp. 343-352, 2012.
[161] D. Komatitsch and J. Tromp, "A perfectly matched layer absorbing boundary condition for the second-order seismic wave equation," Geophysical Journal International, vol. 154(1), pp. 146-153, 2003.

[162] Y. Yang, S. Kuo, and H. Hung, "Frequency independent infinite elements for analyzing semi-infinite problems," International Journal for Numerical Methods in Engineering, vol. 39, pp. 3553-3569, 1996.
[163] M. F. M. Hussein and H. E. M. Hunt, "A numerical model for calculating vibration due to a harmonic moving load on a floating-slab track with discontinuous slabs in an underground railway tunnel," Journal of Sound and Vibration, vol. 321, pp. 363-374, 2009.
[164] A. Mann, DYNATRACK: A survey of dynamic railway track properties and their quality. Technische Universiteit Delft: Delft, 2002.
[165] K. Knothe and S. Grassie, "Modelling of railway track and vehicle/track interaction at high frequencies," Vehicle Systems Dynamics, vol. 22, pp. 209-262, 1993.
[166] A. Karlstrom and B. Bostrom, "An analytical model for train-induced ground vibrations from trains," Journal of Sound and Vibration, vol. 292, pp. 221-241, 2006.
[167] M. Hussein and H. Hunt, "A computationally efficient software application for calculating vibration from underground railways," Journal of Physics Conference Series, vol. 181(1), pp. 1-6, 2009.
[168] H. Hunt and M. Hussein, "Vibration from railways: can we achieve better than +/- 10dB pridiction accuracy?," in ICSV14-14th International Congress on Sound and Vibration, 2007.
[169] L. Andersen and C. Jones, "Coupled boundary and finite element analysis of vibration from railway tunnels - a comparison of two and three-dimensional models," Journal of Sound and Vibration, vol. 293(3), pp. 611-625, 2006.
[170] M. Hussein, H. Hunt, K. Kuo, P. Alves Costa, and J. Barbosa, "The use of sub-modelling technique to calculate vibration in buildings from underground railways," Proceedings of the Institution of Mechanical Engineers Part F: Journal of Rail and Rapid Transit, vol. 229(3), pp. 303-314, 2015.
[171] M. Hussein, H. Hunt, K. Kuo, P. Alves Costa, and J. Barbosa, "A numerical model for calculating vibration in a building with pile-foundation from underground railway trains," in ICOVP 2013-11th International Conference on Vibration Problems Z. Dimitrovová, 2013, pp. 1-8.
[172] A. Tadeu, J. Antonio, and L. Godinho, "Green's function for two-and-a-half dimensional elastodynamic problems in a half-space," Computational Mechanics, vol. 27, pp. 484-491, 2001.

[173] W. Harmad, H. Hunt, M. Hussein, and J. Talbot, "Tunnel-pile interaction in the prediction of vibration from underground railways: validation of the submodels," in Eurodyn 2014, 2014, pp. 767-774.
[174] L. Auersch, "Dynamic Behavior of Slab Tracks on Homogeneous and Layered Soils and the Reduction of Ground Vibration by Floating Slab Tracks," Journal of Engineering Mechanics, vol. 138(8), pp. 923-933, 2012.
[175] P. Lopes, P. Alves Costa, R. Calçada, and A. Silva Cardoso, "Mitigation of vibrations induced by railway traffic in tunnels through floating slab systems: numerical study," in Eurodyn 2014, 2014, pp. 871-878.
[176] G. Lombaert, G. Degrande, B. Vanhauwere, B. Vandeborght, and S. François, "The control of ground-borne vibrations from railway traffic by means of continuous floating slabs," Journal of Sound and Vibration, vol. 297, pp. 946-961, 2006.
[177] P. Alves Costa, P. Lopes, R. Calçada, and A. Silva Cardoso, Efficiency of ballast mats for the reduction of vibrations induced by traffic: A parametric study in Ralways 2012, J. Pombo, Editor. J. Pombo, Editor. 2012: Gran Canaria, 2012.
[178] S. G. Koroma, M. F. M. Hussein, and J. S. Owen, "Vibration of a beam on continuous elastic foundation with nonhomogeneous stiffness and damping under a harmonically excited mass," Journal of Sound and Vibration, vol. 333(9), pp. 2571-2587, 2014.
[179] P. C. Dings and M. G. Dittrich, "Roughness on dutch railway wheels and rails," Journal of Sound and Vibration, vol. 193(1), pp. 103-112, 1996.
[180] J. Cordier and P. Fodiman, "Experimental characterization of wheel and rail surface roughness," Journal of Sound and Vibration, vol. 231(3), pp. 667-672, 2000.
[181] R. J. Diehl and P. Holm, "Roughness measurements - have the necessities changed?," Journal of Sound and Vibration, vol. 293, pp. 777-783, 2006.
[182] E. Verheijen, "A survey on roughness measurements," Journal of Sound and Vibration, vol. 293, pp. 784-794, 2006.
[183] J. Nielsen, E. Berggren, T. Lölgen, R. Müller, B. Stallaert, and L. Pesqueux, Overview of Methods for Measurement of Track Irregularities Important for Ground-Borne Vibration in RIVAS_CHALMERS_WP2_D2_5. 2013.

[184] A. Romero, A. Tadeu, P. Galvín, and J. António, "2.5D coupled BEM-FEM used to model fluid and solid scattering wave," International Journal for Numerical Methods in Engineering, vol. 101(2), pp. 148-164, 2015.
[185] G. Lombaert, "Development and Experimental Validation of a Numerical Model for the Free Field Vibrations Induced by Road Traffic," Thesis, Katholieke Universiteit Leuven, 2001.
[186] N. Beskou and D. Theodorakopoulos, "Dynamic effects of moving loads on road pavements: A review," Soil Dynamics and Earthquake Engineering, vol. 31, pp. 547-567, 2011.
[187] G. Lombaert, G. Degrande, J. Kogut, and S. François, "The experimental validation of a numerical model for the prediction of railway induced vibrations," Journal of Sound and Vibration, vol. 297, pp. 512-535, 2006.
[188] K. Muller, H. Grundmann, and S. Lenz, "Nonlinear interaction between a moving vehicle and a plate elastically mounted on a tunnel," Journal of Sound and Vibration, vol. 310, pp. 558-586, 2008.
[189] A. Remennikov and S. Kaewunruen, "A review of loading conditions for railway track structures due to train and track vertical interaction," Structural Control and Health Monitoring, vol. 15, pp. 207-234, 2007.
[190] T. Wu and D. Thompson, "On the parametric excitation of the wheel/track system," Journal of Sound and Vibration, vol. 278, pp. 725-747, 2004.
[191] T. Wu and D. Thompson, "A hybrid model for the noise generation due to railway wheel flats," Journal of Sound and Vibration, vol. 251(1), pp. 115-139, 2002.
[192] C. Vale, "Influência da qualidade dos sistemas ferroviários no comportamento dinâmico e no planeamento da manutenção preventiva de vias de alta velocidade," Thesis, Universidade do Porto, 2010.
[193] X. Sheng, "Ground Vibrations Generated from Trains," Thesis, University of Southampton, 2001.
[194] H. Braun and T. Hellenbroich, "Messergebnisse von strassenunebenheiten," VDI Berichte, vol. 877, pp. 47-80, 1991.
[195] L. Pyl, "Development and experimental validation of a numerical model for traffic induced vibrations in buildings," Thesis, Katholieke Universiteit Leuven, 2004.

[196] M. Arnst, "Three-dimensional modelling of free-field and structural vibration due to harmonic and transient loading in a tunnel," Thesis, École Centrale Paris, 2004.
[197] P. Fiala, S. Gupta, G. Degrande, and F. Augusztinovicz, "A parametric study on countermeasures to mitigate subway traffic induced vibration and noise in buildings," in Proceedings of ISMA2008 International Conference on Noise and Vibration Engineering, 2008, pp. 2751-2764.
[198] E. Kausel, "Commentaries on methods to estimate ground vibrations elicited by fast moving loads," in Noise and Vibration on high-speed railways, 2008.
[199] O. V. Estorff and E. Kausel, "Coupling of boundary and finite elements for soil-structure interaction problems," Earthquake Engineering and Structural Dynamics, vol. 18, pp. 1065-1075, 1989.
[200] L. Andersen, Wave propagation in infinite structures and media. Aalborg University, 2002.
[201] L. Andersen, Linear elastodynamic analysis. Aalborg: Aalborg University, 2007.
[202] L. Andersen and S. Nielsen, "Boundary element analysis of the steady-state response of an elastic half-space to a moving force on its surface," Engineering Analysis with Boundary Elements, vol. 27(1), pp. 23-38, 2003.
[203] M. Bonnet, Boundary integral equation methods for solids and fluids. London: John Wiley, Sons, 1995.
[204] O. V. Estorff, A. L. Pais, and E. Kausel, "Some observations on time domain and frequency domain boundary elements," International Journal for Numerical Methods in Engineering, vol. 29, pp. 785-800, 1990.
[205] L. Andersen, S. Nielsen, and S. Krenk, "Numerical methods for analysis of structure and ground vibration from moving loads," Computers and Structures, vol. 85, pp. 43-58, 2007.
[206] E. Kausel and J. Roesset, "Stiffness matrices for a layered soils," Bulletin of the Seismological Society of America, vol. 71(6), pp. 1743-1761, 1981.
[207] N. Haskell, "The dispersion of surface waves on multilayered medium," Bulletin of the Seismological Society of America, vol. 73, pp. 17-43, 1953.
[208] E. Kausel, An explicit solution for the green functions for dynamic loads in layered media, R.R. R81-13, Editor. Boston: MIT, 1981.

[209] L. Andersen and J. Clausen, "Impedance of surface footings on layered ground," Computers and Structures, vol. 86, pp. 72-87, 2008.
[210] J. P. Wolf, Dynamics soil-structure interaction. New Jersey: Prentice Hall, 1985.
[211] J. P. Wolf, Foundation Vibration Analysis Using Simple Physical Models. Englewood Cliffs: Prentice Hall, 1994.
[212] X. Sheng, C. Jones, and M. Petyt, The Fourier Transformed Stationary and Moving Dynamic Flexibility Matrices of a Layered Ground. Southampton: Institute of Sound, Vibration Research, 1999.
[213] E. Çelebi, S. Firat, and I. Çankaya, "The evaluation of impedance functions in the analysis of foundations vibrations using boundary element method," Applied Mathematics and Computation, vol. 173, pp. 636-667, 2006.
[214] L. Andersen, "Assessment of lumped-parameter models for rigid footings," Computers Structures, vol. 88(23-24), pp. 1333-1347, 2010.
[215] J. P. Wolf and C. Song, Finite-element modeling of unbounded media. New York: Wiley, 1996.
[216] W. H. Wu and W. H. Lee, "Systematic lumped-parameter models for foundations based on polynomial-fraction approximation," Earthquake Engineering and Structural Dynamics, vol. 31(7), pp. 1383-1412, 2002.
[217] W. H. Wu and W. H. Lee, "Nested lumped-parameter models for foundation vibration," Earthquake Engineering and Engineering Vibration, vol. 33(9), pp. 1051-1058, 2004.
[218] L. Ibsen and M. Liingaard, Lumped-parameter models. Aalborg University, 2006.
[219] L. Ibsen and M. Liingaard, Application of lumped-parameter models. Aalborg: Aalborg University, 2006.
[220] A. Veletsos and Y. Tang, "Vertical vibration of ring foundations," Earthquake Engineering and Structural Dynamics, vol. 15, pp. 1-21, 1987.
[221] L. Auersch, "Force and ground vibration reduction of railway tracks with elastic elements," Journal of Vibration and Control, 2013.
[222] P. Galvín, A. Romero, and J. Domínguez, "Vibrations induced by HST passage on ballast and non-ballast tracks," Soil Dynamics and Earthquake Engineering, vol. 30(9), pp. 862-873, 2010.

[223] P. Alves Costa, A. Colaço, R. Calçada, and A. S. Cardoso, "Critical speed of railway tracks. Detailed and simplified approaches," Transportation Geotechnics, vol. 2(0), pp. 30-46, 2015.
[224] M. Ferraz, "A model for the assement of the strutural behaviour of bridges," Thesis, Faculty of Engineering of University of Porto, 2010.
[225] G. Gazetas, "Formulas and charts for impedances of surface and embedded foundations," Journal of Geotechnical Engineering, vol. 117(9), pp. 1363-1381, 1991.
[226] L. Auersch, "The dynamic force transfer of slab tracks and floating slab tracks and the corresponding ground vibration," in EURODYN 2011, 2011, pp. 820-827.
[227] S. François, L. Pyl, H. Masoumi, and G. Degrande, "The influence of dynamic soilstructure interaction on traffic induced vibrations in buildings," Soil Dynamics and Earthquake Engineering, vol. 27(7), pp. 655-674, 2007.
[228] A. Romero, M. Solís, J. Domínguez, and P. Galvín, "Soil-structure interaction in resonant railway bridges," Soil Dynamics and Earthquake Engineering, vol. 47(0), pp. 108-116, 2013.
[229] H. Xia, Y. Cao, G. Roeck, and G. Degrande, "Environmental problems of vibrations induced by railway traffic," Frontiers of Architecture and Civil Engineering in China, 2007.
[230] D. P. Connolly, G. Kouroussis, P. K. Woodward, P. Alves Costa, O. Verlinden, and M. C. Forde, "Field testing and analysis of high speed rail vibrations," Soil Dynamics and Earthquake Engineering, vol. 67, pp. 102-118, 2014.
[231] W. Zhai, K. Wei, X. Song, and M. Shao, "Experimental investigation into ground vibrations induced by very high speed trains on a non-ballasted track," Soil Dynamics and Earthquake Engineering, vol. 72(0), pp. 24-36, 2015.
[232] G. Degrande and L. Shillemans, "Free fields vibrations during the passage of a Thalys high-speed train at variable speed," Journal of Sound and Vibration, vol. 247(1), pp. 131-144, 2001.
[233] M. Sanayei, A. Kayiparambil P, J. A. Moore, and C. R. Brett, "Measurement and prediction of train-induced vibrations in a full-scale building," Engineering Structures, vol. 77(0), pp. 119-128, 2014.
[234] M. Sanayei, P. Maurya, and J. A. Moore, "Measurement of building foundation and ground-borne vibrations due to surface trains and subways," Engineering Structures, vol. 53(0), pp. 102-111, 2013.

[235] M. Sanayei, P. Maurya, and J. A. Moore, "Corrigendum to "Measurement of building foundation and ground-borne vibrations due to surface trains and subways" Eng. Struct. 53 (2013) 102-111," Engineering Structures, vol. 72(0), p. 160, 2014.
[236] G. Degrande et al., "Vibrations due to a test train at variable speeds in a deep bored tunnel embedded in London clay," Journal of Sound and Vibration, vol. 293(3-5), pp. 626-644, 2006.
[237] CEDEX, Estudio de vibraciones inducidas por la explotación ferroviaria en la Cuesta de San Vicente nº36 y en el túnel del campo del moro en el pasillo verde ferroviario de Madrid. Madrid: CEDEX, 2003.
[238] M. Melis, Apuntes de introducción al Proyecto y Construcción de Túneles y Metros en suelos y rocas blandas o muy rotas, C. de and E.T.S.d.I.d.C. ferrocarriles, Canales y Puertos, Editors. Universidad Politécnica de Madrid: Madrid, 2011.
[239] N. Triepaischajonsak and D. J. Thompson, "A hybrid modelling approach for predicting ground vibration from trains," Journal of Sound and Vibration, vol. 335(0), pp. 147-173, 2015.
[240] H. Grundmann, M. Lieb, and E. Trommer, "The response of a layered half-space to traffic loads moving along its surface," Archive of Applied Mechanics, vol. 69, pp. 55-67, 1999.
[241] P. Van den Broeck, "A prediction model for ground-borne vibrations due to railway traffic," Thesis, Katholieke Universiteit Leuven, 2001.
[242] J. Nielsen, G. Lombaert, and S. François, "A hybrid model for prediction of ground-borne vibration due to discrete wheel/rail irregularities," Journal of Sound and Vibration, vol. 345, pp. 103-120, 2015.
[243] M. Schevenels, "The impact of uncertain dynamic soil characteristics on the prediction of ground vibrations," Thesis, Katholieke Universiteit Leuven, 2007.
[244] S. Jones and H. Hunt, "Predicting surface vibration from underground railways through inhomogeneous soil," Journal of Sound and Vibration, vol. 331, pp. 2055-2069, 2012.
[245] X. Sheng, C. Jones, and D. Thompson, "Responses of infinite periodic structures to moving or stationary harmonic loads," Journal of Sound and Vibration, vol. 282, pp. 125-149, 2005.

