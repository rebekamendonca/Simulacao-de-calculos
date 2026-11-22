function grade = grade_massa_rigidez_ferroviaria()
% Análise opcional de dois fatores, independente dos relatórios OFAT.
[C,referencia] = configuracao_ferroviaria();
dados = C.oscilador;
[m,k] = ndgrid(dados{1,3},dados{2,3});
natural = zeros(numel(m),1);
pico = natural;
receptancia = natural;
p = referencia.oscilador;
for j = 1:numel(m)
    p.m = m(j);
    p.k = k(j);
    [~,M] = modelo_ferroviario('oscilador',p,0,1);
    natural(j) = M.Natural_Hz;
    pico(j) = M.MaxReceptancia_Hz;
    receptancia(j) = M.MaxReceptancia_mm_kN;
end
grade = table(m(:),k(:),repmat(p.c,numel(m),1),natural,pico,receptancia, ...
    'VariableNames',{'Massa_kg','Rigidez_N_m','Amortecimento_N_s_m', ...
    'Natural_Hz','Pico_Hz','Receptancia_mm_kN'});
end
