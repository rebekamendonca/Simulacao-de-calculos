function ensaio = relatorio_ferroviario(codigo,ficha,dados,j,casos,T,xe,ye)
% Dados editoriais para a publicação UFC. Os valores numéricos ficam no CSV.
const = setdiff(1:size(dados,1),j,'stable');
limites = cellfun(@(n,u,v) sprintf('%s=%.4g %s',n,v(1),u), ...
    dados(const,1),dados(const,2),dados(const,3),'UniformOutput',false);
ensaio.codigo = codigo;
ensaio.parametro = ficha.parametro;
ensaio.eixo_x = xe;
ensaio.eixo_y = ye;
ensaio.secoes = {
    'Objetivo', ficha.objetivo;
    'Modelo', ficha.equacao;
    'Dados de entrada', strjoin(limites, ', ');
    'Configurações', strjoin({casos.legenda},'  |  ');
    'Resultados', 'Δ = teste − referência. % relativo à referência. — indica valor indefinido.';
    'Gráfico', 'Curvas e marcadores identificam os casos. Marcadores indicam pontos avaliados ou máximos, conforme o ensaio.';
    'Interpretação', [ficha.causa ' ' ficha.ferrovia];
    'Relação com Lopes', ficha.tese;
    'Limitações', ficha.limite;
    'Conclusão', conclusao(T,ficha.parametro,ye);
    'Referência', 'C. P. F. C. Lopes. Vibrações induzidas por tráfego ferroviário em túneis. Tese, FEUP.';
    };
end

function s = conclusao(T,parametro,ye)
i = find(ismember(T.Grandeza,{'Deslocamento_mm','Roda1_N','Receptor_mm','MaximoNaMalha'}),1);
if isempty(i)
    i = 1;
end
s = sprintf(['Ao variar %s, %s passou de %s para %s (A, %s%%) e %s (B, %s%%), ' ...
    'com os controles acima.'],parametro,lower(ye),numero(T.Referencia(i)), ...
    numero(T.A(i)),numero(T.Pct_A(i)),numero(T.B(i)),numero(T.Pct_B(i)));
end

function s = numero(v)
s = sprintf('%.3g',v);
if isnan(v)
    s = '—';
end
end
