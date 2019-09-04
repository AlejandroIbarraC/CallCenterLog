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
% Busca patrones en las causas de un problemas

patronCausa([no, esta, conectada, X |_], X):- !.
patronCausa([no, esta, encendida, X |_], X):- !.
patronCausa([no, responde, X |_], X):- !.
patronCausa([no, tiene, drivers, X |_], X):- !.
patronCausa([no, esta, en, la, misma, red, X |_], X):- !.
patronCausa([no, tiene, tinta, X |_], X):- !.
patronCausa([no, tiene, papel, X |_], X):- !.
patronCausa([esta, sucia, X |_], X):- !.

patronCausa([_|T], X):-
  patronCausa(T, X).

% patron
