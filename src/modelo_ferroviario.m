function [y,metricas] = modelo_ferroviario(tipo,p,x,saida)
% Respostas complexas em SI, com convenção temporal exp(i omega t).
w = 2*pi*x;
metricas = struct();
switch tipo
    case 'estatico'
        y = x/p.k;
        metricas = struct('Deslocamento_mm',1e3*p.P/p.k, ...
            'Flexibilidade_mm_kN',1e6/p.k);
    case {'oscilador','laje'}
        wn = sqrt(p.k/p.m);
        z = p.c/(2*sqrt(p.m*p.k));
        A = receptancia(p.m,p.k,p.c,w);
        if strcmp(tipo,'oscilador')
            y = A;
        else
            U = p.P*A;
            Ft = (p.k+1i*w*p.c).*U;
            respostas = {U,Ft,Ft/p.P};
            y = respostas{saida};
        end
        fd = NaN;
        if z < 1
            fd = wn*sqrt(1-z^2)/(2*pi);
        end
        fp = wn*sqrt(max(0,1-2*z^2))/(2*pi);
        Ap = abs(receptancia(p.m,p.k,p.c,2*pi*fp));
        % Soluções de |A| = |A(fp)| / sqrt(2).
        r2 = (2*pi*fp/wn)^2 + [-1 1]/(p.k*Ap);
        largura = NaN;
        if all(r2 >= 0)
            largura = wn*diff(sqrt(r2))/(2*pi);
        end
        metricas = struct('Natural_Hz',wn/(2*pi),'NaturalAmortecida_Hz',fd, ...
            'MaxReceptancia_Hz',fp,'MaxReceptancia_mm_kN',1e6*Ap, ...
            'LarguraMeiaPotencia_Hz',largura);
        if strcmp(tipo,'laje')
            metricas.LimiarIsolamento_Hz = sqrt(2)*wn/(2*pi);
        end
    case 'contato'
        omega = 2*pi*p.f0;
        F = eye(2)*receptancia(p.mv,p.kv,p.cv,omega);
        FH = eye(2)/p.kH;
        A = receptancia(p.mt,p.kt,p.ct,omega)*[1 p.rho; p.rho 1];
        fase = omega*p.d/p.v;
        delta = p.a*[1;exp(-1i*fase)];
        y = -(F+FH+A)\delta;
        metricas = struct('Roda1_N',abs(y(1)),'Roda2_N',abs(y(2)), ...
            'Defasagem_rad',fase);
    case 'solo'
        if saida == 1
            y = propagacao(p,x,p.f0);
        else
            y = propagacao(p,p.r,x);
        end
        metricas = struct('Receptor_mm',1e3*abs(propagacao(p,p.r,p.f0)));
    case 'edificio'
        y = zeros(size(x));
        for q = 1:numel(x)
            Kb = p.kb+1i*w(q)*p.cb;
            Zs = p.ks+1i*w(q)*p.cs;
            D = [Kb-p.mb*w(q)^2,-Kb; -Kb,Kb+Zs];
            u = D\[0;Zs*p.u0];
            y(q) = u(1)/p.u0;
        end
        metricas.NaturalBaseRigida_Hz = sqrt(p.kb/p.mb)/(2*pi);
end
end

function A = receptancia(m,k,c,w)
A = 1./(k-m*w.^2+1i*c*w);
end

function u = propagacao(p,r,f)
q = f/p.fr;
H = p.H0*(1+r/p.r0).^(-0.5).*exp(-p.alpha*r.*q-1i*2*pi*f.*r/p.vs) ...
    ./(1-q.^2+2i*p.zeta*q);
u = H*p.P;
end
