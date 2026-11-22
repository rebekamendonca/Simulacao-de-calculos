function validar_laboratorio_ferroviario()
[~,referencia] = configuracao_ferroviaria();
q = referencia.oscilador;
[A,M] = modelo_ferroviario('oscilador',q,0,1);
assert(abs(A*q.k-1)<1e-12 && M.NaturalAmortecida_Hz < M.Natural_Hz);
assert(M.MaxReceptancia_Hz < M.NaturalAmortecida_Hz);
q = referencia.contato;
N = modelo_ferroviario('contato',q,[1;2],1);
q.a = 2*q.a;
N2 = modelo_ferroviario('contato',q,[1;2],1);
assert(norm(N2-2*N)<1e-10 && any(imag(N)~=0));
q = referencia.laje;
[~,M] = modelo_ferroviario('laje',q,0,3);
T = modelo_ferroviario('laje',q,[0 M.LimiarIsolamento_Hz],3);
assert(max(abs(abs(T)-1))<1e-12);
q = referencia.solo;
u = modelo_ferroviario('solo',q,[0 20 40],1);
assert(all(diff(abs(u))<0) && any(imag(u)~=0));
q = referencia.edificio;
assert(abs(modelo_ferroviario('edificio',q,0,1)-1)<1e-12);
fprintf('Verificações físicas concluídas.\n');
end
