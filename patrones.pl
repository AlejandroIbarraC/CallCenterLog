% Archivo:      patrones.pl
% Autor:        José Alejandro Ibarra, Esteban Alvarado
%
% Descripción:  Busca patrones especiales en la comunicación con el usuario.

% patronEstudios/2
% Busca patrones que pregunten por el estudio del programa.
patronEstudios([que, estas, estudiando, X |_], X):-!.
patronEstudios([que, estudias, X |_], X):-!.
patronEstudios([en, que, curso, estas, X |_], X):-!.
patronEstudios([what, is, your, degree, X |_], X):-!.
patronEstudios([_|T], X):-
    patronEstudios(T, X).

% patronNombre/2
% Busca patrones que pregunten por el nombre del programa.
patronNombre([cual, es, tu, nombre, X |_], X):-!.
patronNombre([tu, nombre, X |_], X):-!.
patronNombre([como, te, llamas, X |_], X):-!.
patronNombre([y, tu, eres, X |_], X):-!.
patronNombre([quien, eres, X |_], X):-!.
patronNombre([quien, eres, tu, X |_], X):-!.
patronNombre([quien, es, X |_], X):-!.
patronNombre([quien, sos, X |_], X):-!.
patronNombre([quien, tu, eres, X |_], X):-!.
patronNombre([_|T], X):-
    patronNombre(T, X).

% patronYo/2
% Busca patrones que pregunten estado emocional del programa.
patronYo([como, estas, X |_], X):-!.
patronYo([estas, bien, X |_], X):-!.
patronYo([te, encuentras, bien, X |_], X):-!.
patronYo([todo, bien, X |_], X):-!.
patronYo([como, te, encuentras, X |_], X):-!.
patronYo([te, veo, mal, X |_], X):-!.
patronYo([cual, es, tu, estado, emocional, X |_], X):-!.
patronYo([como, te, sientes, X |_], X):-!.
patronYo([_|T], X):-
    patronYo(T, X).

% patronConsulta/2
% Busca patrones que indican que el usuario está realizando
% una consulta.

% Consulta
patronConsulta([tengo, una, consulta, X|_],X):-!.
patronConsulta([necesito, consultar, X|_],X):-!.
patronConsulta([realizar, una, consulta, X|_],X):-!.
patronConsulta([hacer, una, consulta, X|_],X):-!.
patronConsulta([necesito, conocer, X|_],X):-!.
patronConsulta([consulta, X|_],X):-!.
patronConsulta([consultar, X|_],X):-!.

% Causas
patronConsulta([cuales, son, las, causas, X|_],X):-!.
patronConsulta([quiero, saber, las, causas, X|_],X):-!.
patronConsulta([cual, es, la, causa, X|_],X):-!.
patronConsulta([causas, X|_],X):-!.
patronConsulta([causa, X|_],X):-!.

patronConsulta([_|T],X):-
  patronConsulta(T,X).

% patronReferencia/2
% Busca patrones que indican que el usuario está solicitando
% una Referencia.

% Referencia
patronReferencia([tienes, una, referencia, X|_],X):-!.
patronReferencia([tendras, referencias, X|_],X):-!.
patronReferencia([puedo, conseguir, informacion, X|_],X):-!.
patronReferencia([tienes, informacion, acerca, de, X|_],X):-!.
patronReferencia([necesito, conocer, X|_],X):-!.
patronReferencia([necesito, informacion, X|_],X):-!.
patronReferencia([tienes, alguna, referencia, X|_],X):-!.
patronReferencia([referencia, X|_],X):-!.
patronReferencia([referencias, X|_],X):-!.

patronReferencia([_|T],X):-
  patronReferencia(T,X).

% patronProblema/2
% Busca patrones que indican un problema del usuario.

%~ problema
patronProblema([tengo, un, problema, X |_], X):- !.
patronProblema([presentan, un, problema, X |_], X):-!.
patronProblema([presenta, un, problema, X |_], X):-!.
patronProblema([tiene, un, problema, X |_], X):-!.
patronProblema([tienen, un, problema, X |_], X):-!.
patronProblema([problema, X |_], X):-!.

%~ funciona
patronProblema([no, funciona, X |_], X):-!.
patronProblema([no, funcionan, X |_], X):-!.
patronProblema([no, esta, funcionando, X |_], X):- !.
patronProblema([no, estan, funcionando, X |_], X):- !.
patronProblema([mal, funcionamiento, X |_], X):-!.
patronProblema([funciona, mal, X |_], X):- !.
patronProblema([funcionan, mal, X |_], X):- !.

%~ daños
patronProblema([esta, dañado, X|_], X):- !.
patronProblema([estan, dañados, X|_], X):- !.
patronProblema([esta, dañada, X|_], X):- !.
patronProblema([se,daño, X|_], X):-!.
patronProblema([se,dañaron, X|_], X):-!.
patronProblema([un,daño, X|_], X):-!.

%~ otros
patronProblema([algo, anda, mal, X |_], X):-!.
patronProblema([presenta, un, error, X |_], X):-!.
patronProblema([esta, malo, X |_], X):-!.
patronProblema([estan, malos, X |_], X):-!.
patronProblema([_|T], X):-
  patronProblema(T, X).

%patronProbRef/4

% Problema-Referencia de impresora
patronProbRef(impresora,[no, imprime, X|_],X, [9,5,4]):- !.
patronProbRef(impresora,[no, enciende, X|_],X, [10,9]):- !.
patronProbRef(impresora,[no, salen, las, impresiones, X|_],X, [5]):- !.
patronProbRef(impresora,[la, impresion, esta, borrosa, X|_],X,[5,3,2]):- !.
patronProbRef(impresora,[la, impresion, sale, sucia, X|_],X, [3,2]):- !.

% Problema-Referencia de computadora
patronProbRef(computadora,[no, trabaja, X|_],X, [10,9,4]):- !.

% Problema-Referencia de parlante
patronProbRef(parlante,[no, suena, X|_],X, [10,9,8,7]):- !.

% Problema-Referencia de audifonos
patronProbRef(audifonos,[no, suenan, X|_],X, [9,4,3]):- !.
patronProbRef(audifonos,[no, se, escuchan, X|_],X, [9,4,3]):- !.

patronProbRef(D,[_|T],X,N):-
  patronProbRef(D,T,X,N).

% patronCausa/4
% para que estos patrones funcionen, se necesita un punto al final
% Busca patrones en las causas de un problemas

% Causas impresora
patronCausa(impresora,[no, esta, conectada, X |_], X, NS):- !, NS is 10.
patronCausa(impresora,[no, esta, encendida, X |_], X, NS):- !, NS is 9.
patronCausa(impresora,[no, enciende, X |_], X, NS):- !, NS is 9.
patronCausa(impresora,[no, responde, X |_], X, NS):- !, NS is 8.
patronCausa(impresora,[no, tiene, drivers, X |_], X, NS):- !, NS is 7.
patronCausa(impresora,[no, esta, en, la, misma, red, wifi, X |_], X, NS):- !, NS is 6.
patronCausa(impresora,[no, tiene, tinta, X |_], X, NS):- !, NS is 5.
patronCausa(impresora,[no, tiene, papel, X |_], X, NS):- !, NS is 4.
patronCausa(impresora,[cabezales, desalineados, X|_], X, NS):- !, NS is 3.
patronCausa(impresora,[esta, sucia, X |_], X, NS):- !, NS is 2.
patronCausa(impresora,[esta, vieja, X |_], X, NS):- !, NS is 1.

% Causas computadora
patronCausa(computadora, [esta, descargada, X |_], X, NS):-! ,NS is 10.
patronCausa(computadora, [no, enciende, X |_], X, NS):- !, NS is 9.
patronCausa(computadora, [no, esta, encendida, X |_], X, NS):-!, NS is 9.
patronCausa(computadora, [no, responde, X |_], X, NS):- !, NS is 8.
patronCausa(computadora, [no, esta, actualizada, X |_], X, NS):-!, NS is 7.
patronCausa(computadora, [no, esta, conectada, al, wifi, X |_], X, NS):-!, NS is 6.
patronCausa(computadora, [esta, desconectada, de, sus, datos, X |_], X, NS):-!, NS is 5.
patronCausa(computadora, [esta, llena, X |_], X, NS):-!, NS is 4.
patronCausa(computadora, [volumen, bajo, X |_], X, NS):-!, NS is 3.
patronCausa(computadora, [esta, sucia, X |_], X, NS):- !, NS is 2.
patronCausa(computadora, [esta, vieja, X |_], X, NS):- !, NS is 1.

% Causas Parlante
patronCausa(parlante, [no, esta, conectado, X |_], X, NS):- !, NS is 10.
patronCausa(parlante, [servicios, de, streaming, no, conectados, X |_], X, NS):-!, NS is 9.
patronCausa(parlante, [volumen, bajo, X |_], X, NS):-!, NS is 8.
patronCausa(parlante, [esta, pausado, X |_], X, NS):-!, NS is 7.
patronCausa(parlante, [no, esta, conectado, a, la, red, X |_], X, NS):-!, NS is 6.
patronCausa(parlante, [no, esta, en, la, misma, red, wifi, X |_], X, NS):-!, NS is 5.
patronCausa(parlante, [el, sistema, no, esta, soportado, X |_], X, NS):- !, NS is 4.
patronCausa(parlante, [alexa, desactivada, X |_], X, NS):- !, NS is 3.
patronCausa(parlante, [esta, sucia, X |_], X, NS):- !, NS is 2.
patronCausa(parlante, [esta, vieja, X |_], X, NS):- !, NS is 1.

% Causas audifonos
patronCausa(audifonos, [no, estan, cargados, X |_], X, NS):- !, NS is 10.
patronCausa(audifonos, [no, estan, conectados, X |_], X, NS):- !, NS is 9.
patronCausa(audifonos, [estan, mal, colocados, X |_], X, NS):- !, NS is 8.
patronCausa(audifonos, [las, cubiertas, estan, deterioradas, X |_], X, NS):- !, NS is 7.
patronCausa(audifonos, [estan, desactualizados, X |_], X, NS):- !, NS is 6.
patronCausa(audifonos, [no, se, conectan, X |_], X, NS):- !, NS is 5.
patronCausa(audifonos, [volumen, bajo, X |_], X, NS):-!, NS is 4.
patronCausa(audifonos, [pausados, X |_], X, NS):- !, NS is 3.
patronCausa(audifonos, [estan, sucios, X |_], X, NS):- !, NS is 2.
patronCausa(audifonos, [estan, viejos, X |_], X, NS):- !, NS is 1.

% patronCausa( Dispositivo, Lista, Comparador, Número de Solución).
patronCausa(D, [_|T], X, NS):-
  patronCausa(D, T, X, NS).
