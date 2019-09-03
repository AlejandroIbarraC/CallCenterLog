% Archivo:      patrones.pl
% Autor:        José Alejandro Ibarra Campos
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
patronProblema([tengo,un,problema, X |_], X):- !.
patronProblema([no,funciona, X |_], X):-!.
patronProblema([algo,anda,mal, X |_], X):-!.
patronProblema([_|T],X):-
  patronProblema(T,X).
