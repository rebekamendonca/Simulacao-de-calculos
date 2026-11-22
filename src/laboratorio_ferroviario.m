function pasta = laboratorio_ferroviario(qual,opcoes)
% LABORATORIO_FERROVIARIO Executa os ensaios e atualiza os gráficos PNG em figure/.
%   Na raiz do projeto: addpath('src')
%   laboratorio_ferroviario                 % todos os experimentos
%   laboratorio_ferroviario(2)             % abre a aba de gráficos do experimento 2
%
%   Para ajustar a massa do oscilador nesta execução:
%   P.oscilador.m = [450 600 900]; % referência, A e B em kg
%   laboratorio_ferroviario(2,Parametros=P,Mostrar=true)
%
%   A pasta retornada é figure/; cada ensaio mantém o mesmo nome de arquivo.
%   No MATLAB Desktop, use Mostrar=false para executar sem abrir a aba.
%   Consulte configuracao_ferroviaria.m para nomes e unidades dos parâmetros.
arguments
    qual double = 1:5
    opcoes.Parametros (1,1) struct = struct()
    opcoes.Mostrar (1,1) logical = true
    opcoes.DadosUFC (1,1) logical = false
end
validateattributes(qual,{'numeric'},{'nonempty','vector','integer','>=',1,'<=',5});
[C,referencia,E] = configuracao_ferroviaria(opcoes.Parametros);
mostrar = opcoes.Mostrar && ~batchStartupOptionUsed;
tipos = {'estatico','oscilador','contato','solo','laje','edificio'};
grupos = [1 2 3 4 5 5];
rotulos = {{'Deslocamento estático (mm)'},{'Receptância (mm/kN)'}, ...
    {'Força de contato (N)'},{'Deslocamento no solo (mm)','Deslocamento no solo (mm)'}, ...
    {'Deslocamento da laje (mm)','Força transmitida (N)','Transmissibilidade'}, ...
    {'Amplificação do piso'}};
escalas = {[1e3],[1e6],[1],[1e3 1e3],[1e3 1 1],[1]};
projeto = fileparts(fileparts(mfilename('fullpath')));
pasta = fullfile(projeto,'figure');
if ~isfolder(pasta)
    mkdir(pasta);
end
if opcoes.DadosUFC
    dadosUFC = fullfile(projeto,'resultados','dados_simulacao');
    if ~isfolder(dadosUFC)
        mkdir(dadosUFC);
    end
    imagensUFC = fullfile(dadosUFC,'imagens_publicacao');
    if ~isfolder(imagensUFC)
        mkdir(imagensUFC);
    end
    execucao = struct([]);
    ensaios = {};
    paginas = zeros(1,5);
    panorama = {};
end
nomes = {'Referência','Teste A','Teste B'};
if mostrar
    anteriores = findall(groot,'Type','figure','Tag','PainelLaboratorioFerroviario');
    painel = figure('Name','Gráficos do laboratório ferroviário','NumberTitle','off', ...
        'Visible','off','WindowStyle','docked','MenuBar','none','ToolBar','none','Theme','dark', ...
        'Tag','PainelLaboratorioFerroviario');
    descartar = onCleanup(@() descartar_painel_incompleto(painel));
    abas = uitabgroup(painel);
    abasEnsaios = gobjects(1,5);
    nomesAbas = {'Estática','Oscilador','Roda–trilho','Solo','Laje e edifício'};
end
for t = find(ismember(grupos,qual))
    tipo = tipos{t};
    dados = C.(tipo);
    g = grupos(t);
    if mostrar && ~isgraphics(abasEnsaios(g))
        aba = uitab(abas,'Title',nomesAbas{g});
        abasEnsaios(g) = uitabgroup(aba,'TabLocation','left');
    end
    variaveis = find(cellfun(@numel,dados(:,3)) > 1).';
    for j = variaveis
        valores = dados{j,3};
        validateattributes(valores,{'numeric'},{'vector','numel',3,'finite','real'});
        for s = saidas(tipo,j,numel(rotulos{t}))
            ficha = E(t);
            ficha.parametro = sprintf('%s (%s)',dados{j,1},dados{j,2});
            if opcoes.DadosUFC && strcmp(tipo,'laje') && j == 4
                ficha.causa = ['P escala U e Ft. A razão Ft/P cancela P, ' ...
                    'portanto o limiar de isolamento e toda a curva T coincidem.'];
            end
            casos = struct([]);
            for b = 1:3
                p = referencia.(tipo);
                p.(dados{j,1}) = valores(b);
                [x,xlabel,marca] = dominio(C,tipo,p,s);
                [y,M] = modelo_ferroviario(tipo,p,x,s);
                [xplot,yplot,xp,yp,M] = resumo(tipo,x,y,p,marca,escalas{t}(s),M);
                assert(all(isfinite(y)),'Resposta não finita. Confira a configuração.');
                casos(b).p = p;
                casos(b).x = x;
                casos(b).y = y;
                casos(b).xplot = xplot(:);
                casos(b).yplot = yplot(:);
                casos(b).xp = xp;
                casos(b).yp = yp;
                casos(b).legenda = sprintf('%s · %.4g %s',nomes{b},valores(b),dados{j,2});
                if opcoes.DadosUFC
                    metricas(b) = M;
                end
            end
            codigo = sprintf('%d_%s_%s_%d',g,tipo,dados{j,1},s);
            salvar_figura(casos,codigo,ficha,tipo,xlabel,rotulos{t}{s},pasta);
            if mostrar
                nomeAba = ficha.parametro;
                if strcmp(tipo,'solo')
                    sufixos = {' · Distância',' · Frequência'};
                    nomeAba = [nomeAba sufixos{s}];
                elseif g == 5
                    grandeza = strtok(rotulos{t}{s},'(');
                    nomeAba = [nomeAba ' · ' strtrim(grandeza)];
                end
                aba = uitab(abasEnsaios(g),'Title',nomeAba);
                desenhar_grafico(axes(aba),casos,ficha,tipo,xlabel,rotulos{t}{s},true);
            end
            if opcoes.DadosUFC
                imagem = [codigo '.png'];
                copyfile(fullfile(pasta,imagem),fullfile(imagensUFC,imagem),'f');
                tabela = comparacao(metricas);
                writetable(tabela,fullfile(dadosUFC,[codigo '.csv']));
                execucao(end+1).codigo = codigo; %#ok<AGROW>
                execucao(end).casos = casos;
                execucao(end).tabela = tabela;
                paginas(g) = paginas(g)+1;
                ensaios{end+1} = relatorio_ferroviario(codigo,ficha,dados,j,casos,tabela, ...
                    xlabel,rotulos{t}{s}); %#ok<AGROW>
                panorama{end+1} = sprintf('%d.%d  %s · %s | %s',g,paginas(g), ...
                    ficha.parametro,rotulos{t}{s},destaque(tabela)); %#ok<AGROW>
                clear metricas
            end
        end
    end
end
if opcoes.DadosUFC
    save(fullfile(dadosUFC,'simulacao.mat'),'C','execucao');
    data = char(datetime('today','TimeZone','America/Sao_Paulo','Format','dd/MM/yyyy'));
    publicacao = struct('data',data,'ensaios',{ensaios},'panorama',{panorama});
    arquivo = fopen(fullfile(dadosUFC,'publicacao.json'),'w','n','UTF-8');
    assert(arquivo >= 0,'Não foi possível gravar publicacao.json.');
    fechar = onCleanup(@() fclose(arquivo));
    fprintf(arquivo,'%s\n',jsonencode(publicacao,PrettyPrint=true));
    fprintf('Dados UFC: %s\n',dadosUFC);
end
fprintf('Imagens atualizadas: %s\n',pasta);
if mostrar
    painel.Visible = 'on';
    delete(anteriores(isgraphics(anteriores)));
end
end

function descartar_painel_incompleto(painel)
if isgraphics(painel) && strcmp(painel.Visible,'off')
    delete(painel);
end
end

function salvar_figura(casos,codigo,ficha,tipo,eixoX,eixoY,pasta)
fig = figure('Visible','off','Theme','light','Color','white','Name',codigo, ...
    'NumberTitle','off','Position',[100 100 850 525]);
limpar = onCleanup(@() delete(fig));
desenhar_grafico(axes(fig),casos,ficha,tipo,eixoX,eixoY,false);
exportgraphics(fig,fullfile(pasta,[codigo '.png']),'Resolution',200,'BackgroundColor','white','Padding',12);
end

function desenhar_grafico(ax,casos,ficha,tipo,eixoX,eixoY,escuro)
fundo = [1 1 1];
texto = [.15 .21 .27];
cores = [.09 .25 .41; .64 .26 .08; 0 .43 .39];
if escuro
    fundo = [.10 .13 .17];
    texto = [.90 .93 .96];
    cores = [.44 .73 1; 1 .64 .39; .43 .85 .70];
end
set(ax,'Color',fundo,'FontName','Arial','FontSize',12, ...
    'XColor',texto,'YColor',texto,'GridColor',texto,'GridAlpha',.16);
hold(ax,'on');
grid(ax,'on');
tracos = {'-','--',':'};
marcadores = {'o','s','^'};
rodas = strcmp(tipo,'contato');
for b = 1:numel(casos)
    c = casos(b);
    if rodas
        plot(ax,c.xplot+(b-2)*.12,c.yplot,marcadores{b},'Color',cores(b,:), ...
            'MarkerFaceColor',cores(b,:),'MarkerSize',8,'DisplayName',c.legenda);
    else
        plot(ax,c.xplot,c.yplot,tracos{b},'Color',cores(b,:), ...
            'LineWidth',2.2,'DisplayName',c.legenda);
        if ~isempty(c.xp)
            plot(ax,c.xp,c.yp,marcadores{b},'Color',cores(b,:), ...
                'LineWidth',1.3,'MarkerFaceColor',fundo,'HandleVisibility','off');
        end
    end
end
ylabel(ax,eixoY);
xlabel(ax,eixoX);
if rodas
    xticks(ax,[1 2]);
    xticklabels(ax,{'Roda 1','Roda 2'});
    xlim(ax,[.6 2.4]);
elseif strcmp(tipo,'estatico')
    ylabel(ax,'Força aplicada (N)');
elseif any(strcmp(eixoY,{'Transmissibilidade','Amplificação do piso'}))
    yline(ax,1,'--','Razão = 1','Color',texto,'HandleVisibility','off');
end
title(ax,{ficha.titulo, ['Parâmetro variado: ' ficha.parametro]},'Interpreter','none', ...
    'Color',texto,'FontSize',15);
legend(ax,'Location','southoutside','Orientation','horizontal','Box','off', ...
    'TextColor',texto,'FontName','Arial','FontSize',11);
end

function s = saidas(tipo,j,n)
s = 1:n;
% A posição do receptor aparece em ambos os gráficos, como ponto e como curva.
if strcmp(tipo,'laje') && j == 4
    s = 3;
end
end

function [x,label,marca] = dominio(C,tipo,p,s)
x = C.f;
label = 'Frequência (Hz)';
marca = NaN;
switch tipo
    case 'estatico'
        x = linspace(0,p.P,101).';
        label = 'Deslocamento (mm)';
    case 'contato'
        x = [1;2];
        label = 'Roda';
    case 'solo'
        if s == 1
            x = C.r;
            label = 'Distância (m)';
            marca = p.r;
        else
            marca = p.f0;
        end
end
end

function [X,Y,xp,yp,M] = resumo(tipo,x,y,p,marca,escala,M)
X = x;
Y = escala*abs(y);
xp = [];
yp = [];
switch tipo
    case 'estatico'
        X = Y;
        Y = x;
        xp = X(end);
        yp = Y(end);
    case 'contato'
        % Uma amplitude por roda, sem interpolação física entre contatos.
    otherwise
        [amplitude,i] = max(Y);
        if strcmp(tipo,'solo')
            xp = marca;
            yp = M.Receptor_mm;
        elseif strcmp(tipo,'oscilador') && M.MaxReceptancia_Hz <= max(x) && ...
                M.MaxReceptancia_Hz >= min(x)
            xp = M.MaxReceptancia_Hz;
            yp = M.MaxReceptancia_mm_kN;
        elseif i > 1 && i < numel(x)
            xp = x(i);
            yp = amplitude;
        end
        if ~strcmp(tipo,'solo') || x(1) == 0
            M.MaximoNaMalha = amplitude;
            M.CoordenadaDoMaximo = x(i);
        end
        if strcmp(tipo,'laje')
            M.ForcaAplicada_N = p.P;
        end
end
end

function T = comparacao(M)
grandezas = fieldnames(M);
ref = cell2mat(struct2cell(M(1)));
A = cell2mat(struct2cell(M(2)));
B = cell2mat(struct2cell(M(3)));
base = ref;
base(base==0) = NaN;
T = table(grandezas,ref,A,A-ref,100*(A-ref)./base,B,B-ref,100*(B-ref)./base, ...
    'VariableNames',{'Grandeza','Referencia','A','Delta_A','Pct_A','B','Delta_B','Pct_B'});
end

function frase = destaque(T)
i = height(T);
if any(strcmp(T.Grandeza,'NaturalAmortecida_Hz')) && ~any(strcmp(T.Grandeza,'LimiarIsolamento_Hz'))
    frase = sprintf('pico %+.1f%%/%+.1f%% · fn %+.1f%%/%+.1f%% · largura %+.1f%%/%+.1f%%', ...
        T.Pct_A(4),T.Pct_B(4),T.Pct_A(1),T.Pct_B(1),T.Pct_A(5),T.Pct_B(5));
    frase = strrep(frase,'NaN%','—');
    return
elseif any(strcmp(T.Grandeza,'Receptor_mm')) || any(strcmp(T.Grandeza,'Roda1_N'))
    i = 1;
elseif any(strcmp(T.Grandeza,'MaximoNaMalha'))
    i = find(strcmp(T.Grandeza,'MaximoNaMalha'),1);
elseif any(strcmp(T.Grandeza,'Deslocamento_mm'))
    i = 1;
end
frase = sprintf('%+.1f%% / %+.1f%% (A/B)',T.Pct_A(i),T.Pct_B(i));
end
