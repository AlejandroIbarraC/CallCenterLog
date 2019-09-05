% Archivo:      patrones.pl
% Autor:        José Alejandro Ibarra, Esteban Alvarado
%
% Descripción:  Busca patrones especiales en la comunicación con el usuario.

% patronEstudios/2 (Nivel 2)
% Busca patrones que pregunten por el estudio del programa.
patronEstudios([que, estas, estudiando, X |_], X):-!.
patronEstudios([que, estudias, X |_], X):-!.
patronEstudios([en, que, curso, estas, X |_], X):-!.
patronEstudios([what, is, your, degree, X |_], X):-!.
patronEstudios([_|T], X):-
    patronEstudios(T, X).

% patronNombre/2 (Nivel 2)
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

% patronYo/2 (Nivel 2)
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

% patronProblema/2 (Nivel 2)
% Busca patrones que indican un problema del usuario.

%~ problema
patronProblema([tengo, un, problema, X |_], X):- !.
patronProblema([presenta, un, problema, X |_], X):-!.
patronProblema([tiene, un, problema, X |_], X):-!.

%~ funciona
patronProblema([no, funciona, X |_], X):-!.
patronProblema([no, esta, funcionando, X |_], X):- !.
patronProblema([mal, funcionamiento, X |_], X):-!.
patronProblema([funciona, mal, X |_], X):- !.

%~ daños
patronProblema([esta, dañado, X|_], X):- !.
patronProblema([se,daño, X|_], X):-!.
patronProblema([un,daño, X|_], X):-!.

%~ otros
patronProblema([algo, anda, mal, X |_], X):-!.
patronProblema([presenta, un, error, X |_], X):-!.
patronProblema([esta, malo, X |_], X):-!.
patronProblema([_|T], X):-
  patronProblema(T, X).

% patronCausa/2 (Nivel 2)
% para que estos patrones funcionen, se necesita un punto al final
% Busca patrones en las causas de un problemas

% Causas impresora
patronCausa(impresora,[no, esta, conectada, X |_], X, NS):- !, NS is 1.
patronCausa(impresora,[no, esta, encendida, X |_], X, NS):- !, NS is 2.
patronCausa(impresora,[no, enciende, X |_], X, NS):- !, NS is 2.
patronCausa(impresora, [no, responde, X |_], X, NS):- !, NS is 3.
patronCausa(impresora,[no, tiene, drivers, X |_], X, NS):- !, NS is 4.
patronCausa(impresora, [no, esta, en, la, misma, red, wifi, X |_], X, NS):- !, NS is 5.
patronCausa(impresora,[no, tiene, tinta, X |_], X, NS):- !, NS is 6.
patronCausa(impresora,[no, tiene, papel, X |_], X, NS):- !, NS is 7.
patronCausa(impresora,[cabezales, desalineados, X|_], X, NS):- !, NS is 8.
patronCausa(impresora, [esta, sucia, X |_], X, NS):- !, NS is 9.
patronCausa(impresora, [esta, vieja, X |_], X, NS):- !, NS is 10.

% Causas computadora
patronCausa(computadora, [esta, descargada, X |_], X, NS):-! ,NS is 1.
patronCausa(computadora, [no, enciende, X |_], X, NS):- !, NS is 2.
patronCausa(computadora, [no, esta, encendida, X |_], X, NS):-!, NS is 2.
patronCausa(computadora, [no, responde, X |_], X, NS):- !, NS is 3.
patronCausa(computadora, [no, esta, actualizada, X |_], X, NS):-!, NS is 4.
patronCausa(computadora, [no, esta, conectada, al, wifi, X |_], X, NS):-!, NS is 5.
patronCausa(computadora, [esta, desconectada, de, sus, datos, X |_], X, NS):-!, NS is 6.
patronCausa(computadora, [esta, llena, X |_], X, NS):-!, NS is 7.
patronCausa(computadora, [volumen, bajo, X |_], X, NS):-!, NS is 8.
patronCausa(computadora, [esta, sucia, X |_], X, NS):- !, NS is 9.
patronCausa(computadora, [esta, vieja, X |_], X, NS):- !, NS is 10.

% Causas Parlante
patronCausa(parlante, [no, esta, conectado, X |_], X, NS):- !, NS is 1.
patronCausa(parlante, [servicios, de, streaming, no, conectados, X |_], X, NS):-!, NS is 2.
patronCausa(parlante, [volumen, bajo, X |_], X, NS):-!, NS is 3.
patronCausa(parlante, [esta, pausado, X |_], X, NS):-!, NS is 4.
patronCausa(parlante, [no, esta, conectado, a, la, red, X |_], X, NS):-!, NS is 5.
patronCausa(parlante, [no, esta, en, la, misma, red, wifi, X |_], X, NS):-!, NS is 6.
patronCausa(parlante, [el, sistema, no, esta, soportado, X |_], X, NS):- !, NS is 7.
patronCausa(parlante, [alexa, desactivada, X |_], X, NS):- !, NS is 8.
patronCausa(parlante, [esta, sucia, X |_], X, NS):- !, NS is 9.
patronCausa(parlante, [esta, vieja, X |_], X, NS):- !, NS is 10.

% Causas audifonos
patronCausa(audifonos, [no, estan, cargados, X |_], X, NS):- !, NS is 1.
patronCausa(audifonos, [no, estan, conectados, X |_], X, NS):- !, NS is 2.
patronCausa(audifonos, [estan, mal, colocados, X |_], X, NS):- !, NS is 3.
patronCausa(audifonos, [las, cubiertas, estan, deterioradas, X |_], X, NS):- !, NS is 4.
patronCausa(audifonos, [estan, desactualizados, X |_], X, NS):- !, NS is 5.
patronCausa(audifonos, [no, se, conectan, X |_], X, NS):- !, NS is 6.
patronCausa(audifonos, [volumen, bajo, X |_], X, NS):-!, NS is 7.
patronCausa(audifonos, [pausados, X |_], X, NS):- !, NS is 8.
patronCausa(audifonos,  [estan, sucios, X |_], X, NS):- !, NS is 9.
patronCausa(audifonos,  [estan, viejos, X |_], X, NS):- !, NS is 10.

% patronCausa( Dispositivo, Lista, Comparador, Número de Solución).
patronCausa(D, [_|T], X, NS):-
  patronCausa(D, T, X, NS).
