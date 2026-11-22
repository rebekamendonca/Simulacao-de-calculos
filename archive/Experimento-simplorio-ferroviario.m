%% CINCO EXPERIMENTOS GUIADOS - GRAFICOS LEGIVEIS
% Cada secao (%%) pode ser executada independentemente com Run Section.
% Nao sao os modelos nem os valores originais da tese de Patricia Lopes.
% Estilo: fundo branco, texto escuro, fontes maiores, legenda fora da curva.

%% EXPERIMENTO 1 - FORCA, RIGIDEZ E DESLOCAMENTO
P = 1000;                     % N
k = [1e6,2e6,5e6];           % N/m
u_mm = 1000*P./k;            % mm
fig = figure('Name','EXP 1 - Forca e rigidez','Color','w', ...
    'Position',[70 70 1250 730]);
ax = axes('Parent',fig); hold(ax,'on');
b = bar(ax,1:3,u_mm,0.58,'FaceColor','flat');
b.CData = [0.16 0.40 0.68; 0.14 0.61 0.52; 0.86 0.55 0.20];
ax.XTick=1:3;
ax.XTickLabel={'Referencia: 1 MN/m','Teste A: 2 MN/m','Teste B: 5 MN/m'};
ylabel(ax,'Deslocamento estatico (mm)');
title(ax,'Experimento 1 | Forca constante e rigidez variavel');
for j=1:3
    text(ax,j,u_mm(j)+0.04,sprintf('%.2f mm',u_mm(j)), ...
        'HorizontalAlignment','center','FontSize',15,'FontWeight','bold', ...
        'Color',[0.12 0.18 0.25]);
end
ylim(ax,[0 max(u_mm)*1.25]);
estilo(ax,fig,'Mesma forca: 1000 N. Quanto MAIOR a rigidez, MENOR o deslocamento.',false);
fprintf('EXP 1 | Deslocamentos (mm): %.3f, %.3f, %.3f\n',u_mm);

%% EXPERIMENTO 2 - MASSA E RECEPTANCIA DINAMICA
ff=linspace(1,80,4001); w=2*pi*ff;
massas=[450 1000 2000]; k2=2e7; c2=2e4;
cores=[0.08 0.40 0.75; 0.89 0.48 0.13; 0.12 0.61 0.38];
fig=figure('Name','EXP 2 - Massa e ressonancia','Color','w', ...
    'Position',[70 70 1350 760]);
ax=axes('Parent',fig); hold(ax,'on');
leg=cell(1,3); picos=zeros(3,2);
for j=1:3
    m=massas(j);
    A=1./(k2-m*w.^2+1i*c2*w);
    R=1e6*abs(A);             % mm/kN
    [pico,ind]=max(R); fp=ff(ind);
    picos(j,:)=[fp,pico];
    plot(ax,ff,R,'LineWidth',2.9,'Color',cores(j,:));
    plot(ax,fp,pico,'o','MarkerSize',8,'MarkerFaceColor',cores(j,:), ...
        'MarkerEdgeColor','w','HandleVisibility','off');
    % Anotacoes com deslocamentos calibrados para nao se sobrepor as curvas.
    dx=[2.7 2.0 1.4]; dy=[0.028 0.040 0.030];
    text(ax,fp+dx(j),pico+dy(j),sprintf('%.1f Hz',fp), ...
        'Color',cores(j,:),'FontSize',15,'FontWeight','bold', ...
        'HorizontalAlignment','left','Clipping','on');
    nomes={'Referencia','Teste A','Teste B'};
    leg{j}=sprintf('%s: %d kg',nomes{j},m);
    fn=sqrt(k2/m)/(2*pi);
    fprintf('EXP 2 | %d kg: fn = %.2f Hz, pico = %.2f Hz, receptancia maxima = %.4f mm/kN\n', ...
        m,fn,fp,pico);
end
xlabel(ax,'Frequencia da excitacao (Hz)');
ylabel(ax,'Receptancia: deslocamento por forca (mm/kN)');
title(ax,'Experimento 2 | Influencia da massa na vibracao');
legend(ax,leg,'Location','northeastoutside','FontSize',15,'Box','off');
xlim(ax,[1 80]); ylim(ax,[0 max(picos(:,2))*1.22]);
estilo(ax,fig,'Compare duas coisas: POSICAO do pico = frequencia; ALTURA = resposta por unidade de forca.',true);

%% EXPERIMENTO 3 - CONTATO DE DUAS RODAS COM A VIA
% Modelo simplificado 2x2 de receptancias complexas em f0 = 12 Hz.
f0=12; w0=2*pi*f0;
mt=450; kt=2e7; ct=2e4; mv=250; kv=1.5e7; cv=1.5e4; kH=1e9;
Fv=1/(kv-mv*w0^2+1i*cv*w0);
At=1/(kt-mt*w0^2+1i*ct*w0);
F=diag([Fv Fv]); A2=At*[1 0.20;0.20 1]; FH=eye(2)/kH;
amp=[0.3e-3 0.6e-3 0.3e-3]; v=[15 15 30]; d=2;
forcas=zeros(3,2);
for j=1:3
    fase=2*pi*f0*d/v(j);
    Delta=amp(j)*[1;exp(-1i*fase)];
    N=-(F+FH+A2)\Delta;
    forcas(j,:)=abs(N(:)).';
    fprintf('EXP 3 | caso %d: |N1|=%.1f N, |N2|=%.1f N\n',j,forcas(j,1),forcas(j,2));
end
fig=figure('Name','EXP 3 - Duas rodas','Color','w', ...
    'Position',[70 70 1350 760]);
ax=axes('Parent',fig); hold(ax,'on');
b=bar(ax,forcas,'grouped');
b(1).FaceColor=[0.08 0.40 0.75]; b(2).FaceColor=[0.89 0.48 0.13];
ax.XTick=1:3;
ax.XTickLabel={'Ref: 0,3 mm | 15 m/s','Teste A: 0,6 mm | 15 m/s', ...
    'Teste B: 0,3 mm | 30 m/s'};
ylabel(ax,'Amplitude da forca dinamica (N)');
title(ax,'Experimento 3 | Forcas calculadas em duas rodas');
legend(ax,{'Roda 1','Roda 2'},'Location','northeastoutside', ...
    'FontSize',15,'Box','off');
ylim(ax,[0 max(forcas(:))*1.20]);
estilo(ax,fig,'Teste A: muda a irregularidade. Teste B: muda a defasagem entre eixos (f = 12 Hz fixa).',true);

%% EXPERIMENTO 4 - PROPAGACAO ILUSTRATIVA PELO SOLO
r=linspace(0,50,400); H0=2e-9; Nsolo=200;
alphas=[0.02 0.05 0.10];
cores=[0.08 0.40 0.75; 0.89 0.48 0.13; 0.12 0.61 0.38];
fig=figure('Name','EXP 4 - Atenuacao ilustrativa','Color','w', ...
    'Position',[70 70 1350 760]);
ax=axes('Parent',fig); hold(ax,'on');
for j=1:3
    u_mm=1000*Nsolo*H0*exp(-alphas(j)*r);
    plot(ax,r,u_mm,'LineWidth',2.9,'Color',cores(j,:));
end
xlabel(ax,'Distancia do ponto de excitacao (m)');
ylabel(ax,'Amplitude do deslocamento (mm)');
title(ax,'Experimento 4 | Atenuacao com a distancia');
legend(ax,{'Referencia: 0,02 1/m','Teste A: 0,05 1/m', ...
    'Teste B: 0,10 1/m'},'Location','northeastoutside', ...
    'FontSize',15,'Box','off');
xlim(ax,[0 50]);
estilo(ax,fig,'Forca fixa de 200 N. Maior atenuacao = reducao mais rapida; NAO representa o MEF-PML.',true);

%% EXPERIMENTO 5 - RESPOSTA SOLO-EDIFICIO
ff5=linspace(1,40,1200); w5=2*pi*ff5;
massas5=[5000 10000 20000];
kb=2e7; cb=8e4; ks=5e7; cs=1e5; u0=0.02e-3;
cores=[0.08 0.40 0.75; 0.89 0.48 0.13; 0.12 0.61 0.38];
fig=figure('Name','EXP 5 - Solo e edificio','Color','w', ...
    'Position',[70 70 1350 760]);
ax=axes('Parent',fig); hold(ax,'on');
for j=1:3
    mb=massas5(j); um=zeros(size(ff5));
    for q=1:numel(ff5)
        w=w5(q); Kb=kb+1i*w*cb; Zs=ks+1i*w*cs;
        D=[Kb-mb*w^2, -Kb; -Kb, Kb+Zs];
        u=D\[0;Zs*u0];
        um(q)=u(1);
    end
    R=abs(um)/u0;
    plot(ax,ff5,R,'LineWidth',2.9,'Color',cores(j,:));
    [pico,ind]=max(R);
    fprintf('EXP 5 | massa do piso=%d kg; amplificacao maxima=%.2f em %.2f Hz\n', ...
        mb,pico,ff5(ind));
end
yline(ax,1,'--','Referencia: resposta = 1', ...
    'Color',[0.36 0.42 0.49],'LineWidth',1.6, ...
    'LabelHorizontalAlignment','left','FontSize',13,'HandleVisibility','off');
xlabel(ax,'Frequencia (Hz)');
ylabel(ax,'Amplificacao do piso |u_{piso}| / |u_0|');
title(ax,'Experimento 5 | Massa do piso e amplificacao');
legend(ax,{'Referencia: 5000 kg','Teste A: 10000 kg', ...
    'Teste B: 20000 kg'},'Location','northeastoutside', ...
    'FontSize',15,'Box','off');
xlim(ax,[1 40]);
estilo(ax,fig,'Acima de 1: amplificacao. Abaixo de 1: atenuacao. Modelo simplificado de 2 GDL.',true);

%% FUNCAO AUXILIAR - PADRAO VISUAL PARA TODOS OS GRAFICOS
function estilo(ax,fig,explicacao,legendaExterna)
    set(fig,'Color',[1 1 1], 'InvertHardcopy','off');
    set(ax,'Color',[1 1 1], 'XColor',[0.12 0.18 0.25], ...
        'YColor',[0.12 0.18 0.25], 'FontName','Arial', ...
        'FontSize',15,'LineWidth',1.2,'Box','off', ...
        'GridColor',[0.75 0.79 0.83], 'GridAlpha',0.34);
    grid(ax,'on');
    ax.Title.FontSize=20; ax.Title.FontWeight='bold';
    ax.Title.Color=[0.09 0.15 0.23];
    ax.XLabel.FontSize=17; ax.YLabel.FontSize=17;
    ax.XLabel.Color=[0.09 0.15 0.23];
    ax.YLabel.Color=[0.09 0.15 0.23];
    if legendaExterna
        set(ax,'Position',[0.105 0.225 0.635 0.66]);
    else
        set(ax,'Position',[0.12 0.225 0.81 0.66]);
    end
    annotation(fig,'textbox',[0.08 0.055 0.85 0.08], ...
        'String',explicacao,'EdgeColor','none', ...
        'FontName','Arial','FontSize',15,'FontWeight','bold', ...
        'Color',[0.20 0.31 0.43], ...
        'BackgroundColor',[0.95 0.97 0.99], ...
        'HorizontalAlignment','center','VerticalAlignment','middle', ...
        'FitBoxToText','off');
end
