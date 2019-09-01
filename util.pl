% Archivo:      util.pl
% Autor:        José Alejandro Ibarra Campos
%
% Descripción:  Funciones generales utilitarias para el programa de Prolog.

% contiene(String, SubString)
% Retorna true si el SubString existe en el String principal
contiene(A, B) :-
    atom(A),
    atom(B),
    name(A, AA),
    name(B, BB),
    contiene(AA, BB).
contiene(A, B) :-
    atom(A),
    name(A, AA),
    contiene(AA, B).
contiene(A, B) :-
    sublista(B, A),
    B \= [].

% imprimirLista(List)
% Imprime una lista (oración) sin corchetes ni comas.
imprimirLista([]):- nl.
imprimirLista([H|T]):-
    write(H),
    write(' '),
    imprimirLista(T).

% interseca(Set1, Set2, SubSet)
% Verifica si SubSet interseca a Set1 y Set2
interseca([], _, []).
interseca([H|T1], L2, [H|T3]):-
        member(H, L2), !,
        interseca(T1, L2, T3).
interseca([_|T1], L2, L3):-
        interseca(T1, L2, L3).

% nElemento(List, N, Elemento)
% Devuelve true si el enésimo elemento de la lista es Elemento.
nElemento([H|_], 1, H).
nElemento([_|T], N, X):-
    nElemento(T, N1, X),
    N is N1 + 1.

% sublista(SubLista, Lista)
% Definicion de sublista.
sublista(S, L) :-
    append(_, L2, L),
    append(S, _, L2).

% subset(SubSet, Set)
% Retorna true si SubSet es parte de Set
subset([], _).
subset([H|T], L2):- 
    member(H, L2),
    subset(T, L2).
