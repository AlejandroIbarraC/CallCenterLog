% Archivo:      idioma.pl
% Autores:      Jesús Yamir Sandoval Morales y José Alejandro Ibarra Campos
%
% Descripción:  Definicion de BNF para gramática libre de contexto. Inspirado por el libro
%               "El Lenguaje de Programación PROLOG", de M. Teresa. Escrig.

%------------------------------ORACION------------------------------%

oracion(S0, S) :-
    sintagma_nominal(Num, _, Pers, S0, S1),
    sintagma_verbal(Num, _, Pers, S1, S).

oracion(S0, S) :-
    pronombre(Num, Gen, Pers, S0, S1),
    sintagma_verbal(Num, Gen, Pers, S1, S).

oracion(S0, S) :-
    pregunta(S0, S1),
    pronombre(S1, S2),
    sintagma_verbal(_, _, _, S2, S).

oracion(S0, S) :-
    pregunta(S0, S1),
    adverbio(S1, S).

oracion(S0, S) :-
    pregunta(S0, S1),
    determinante(_, _, _, S1, S).

oracion(S0, S) :-
    sintagma_verbal(_, _, _, S0, S1),
    adjetivo(S1, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    sintagma_verbal(Num, Gen, Pers, S1, S2),
    adjetivo(S2, S).

oracion(S0, S) :-
    adjetivo(S0, S1),
    sintagma_nominal(_, _, _, S1, S2),
    sintagma_verbal(_, _, _, S2, S3),
    adjetivo(S3, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    adverbio(S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    adjetivo(S0, S1),
    sintagma_nominal(_, _, _, S1, S2),
    sintagma_verbal(_, _, _, S2, S3),
    sintagma_verbal(_, _, _, S3, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    adverbio(S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    sintagma_verbal(Num, Gen, Pers, S0, S1),
    sintagma_nominal(Num, Gen, Pers, S1, S2),
    adverbio(S2, S).

oracion(S0, S) :-
    sintagma_verbal(Num, Gen, Pers, S0, S1),
    sintagma_nominal(Num, Gen, Pers, S1, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    pronombre_relativo(S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    adverbio(S0, S1),
    determinante(Num, Gen, Pers, S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    adverbio(S0, S1),
    sintagma_verbal(_, _, _, S1, S).

% Sintagma Nominal %
sintagma_nominal(Num, Gen, Pers, S0, S) :-
    determinante(Num, Gen, Pers, S0, S1),
    sustantivo(Num, Gen, S1, S).

% Sintagma Verbal %
sintagma_verbal(Num, _, Pers, S0, S) :-
    verbo(Num, Pers, S0, S1),
    sintagma_nominal(_, _, _, S1, S).

sintagma_verbal(Num, _, Pers, S0, S) :-
    verbo(Num, Pers, S0, S).

%------------------------------ADJETIVOS------------------------------%

% Adjetivos Calificativos
adjetivo([apagada|S], S).
adjetivo([apagado|S], S).
adjetivo([conectada|S], S).
adjetivo([conectado|S], S).
adjetivo([gran|S], S).
adjetivo([grande|S], S).
adjetivo([bueno|S], S).
adjetivo([buena|S], S).
adjetivo([feo|S], S).
adjetivo([fea|S], S).
adjetivo([bien|S], S).
adjetivo([sirve|S], S).
adjetivo([dañada|S], S).
adjetivo([dañado|S], S).
adjetivo([largo|S], S).
adjetivo([larga|S], S).
adjetivo([inservible|S], S).
adjetivo([malo|S], S).
adjetivo([mala|S], S).

% Adjetivos Posesivos
adjetivo([tuya|S], S).
adjetivo([suya|S], S).
adjetivo([su|S], S).
adjetivo([tu|S], S).
adjetivo([mio|S], S).
adjetivo([mia|S], S).

%------------------------------ADVERBIOS------------------------------%

adverbio([aqui|S], S).
adverbio([alla|S], S).
adverbio([lejos|S], S).
adverbio([cerca|S], S).
adverbio([hoy|S], S).
adverbio([temprano|S], S).
adverbio([menos|S], S).
adverbio([poco|S], S).
adverbio([muy|S], S).
adverbio([bastante|S], S).
adverbio([mucho|S], S).
adverbio([no|S], S).
adverbio([si|S], S).

%------------------------------DETERMINANTES------------------------------%

% Articulos determinados
determinante(sing, masc, tercera, [el|S], S).
determinante(sing, fem, tercera, [la|S], S).
determinante(plu, masc, tercera, [los|S], S).
determinante(plu, fem, tercera, [las|S], S).

% Articulos indeterminados
determinante(sing, masc, tercera, [un|S], S).
determinante(sing, fem, tercera, [una|S], S).
determinante(plu, masc, tercera, [unos|S], S).
determinante(plu, fem, tercera, [unas|S], S).

% Posesivos
determinante(sing, _, _, [mi|S], S).
determinante(plu, _, _, [mis|S], S).
determinante(sing, _, _, [su|S], S).
determinante(plu, _, _, [sus|S], S).

% Demostrativos
determinante(sing, masc, _, [este|S], S).
determinante(plu, masc, _, [estos|S], S).
determinante(sing, fem, _, [esta|S], S).
determinante(plu, masc, _, [estas|S], S).
determinante(sing, masc, _, [aquel|S], S).
determinante(sing, fem, _, [aquella|S], S).

% Numerales
determinante(sing, masc, tercera, [un|S], S).
determinante(sing, fem, tercera, [una|S], S).
determinante(plu, masc, tercera, [unos|S], S).
determinante(plu, fem, tercera, [unas|S], S).

% Indefinidos
determinante(plu, masc, _, [algunos|S], S).
determinante(plu, masc, _, [pocos|S], S).
determinante(plu, masc, _, [varios|S], S).
determinante(sing, masc, _, [demasiado|S], S).
determinante(plu, masc, _, [demasiados|S], S).
determinante(sing, fem, _, [demasiada|S], S).
determinante(plu, fem, _, [demasiadas|S], S).

% Interrogativos
determinante(sing, _, _, [que|S], S).
determinante(sing, _, _, [cuanto|S], S).
determinante(sing, _, _, [cuanta|S], S).
determinante(sing, _, _, [como|S], S).

%------------------------------PREGUNTAS------------------------------%

pregunta([por, que|S], S).
pregunta([como|S], S).
pregunta([donde|S], S).
pregunta([cuando|S], S).
pregunta([que|S], S).
pregunta([quien|S], S).
pregunta([cual|S], S).
pregunta([a, donde|S], S).
pregunta([cuanto|S], S).

%------------------------------PRONOMBRES------------------------------%

% Pronombres directos
pronombre(sing, _, primera, [yo|S], S).
pronombre(sing,_,segunda,[tu|S],S).
pronombre(sing,masc,tercera,[el|S],S).
pronombre(sing,fem,tercera,[ella|S],S).
pronombre(plu,masc,tercera,[ellos|S],S).
pronombre(plu,fem,tercera,[ellas|S],S).
pronombre(plu,masc,primera,[nosotros|S],S).
pronombre(plu,fem,primera,[nosotras|S],S).

% Pronombres indirectos
pronombre([me|S], S).
pronombre([te|S], S).
pronombre([se|S], S).
pronombre([nos|S], S).
pronombre([os|S], S).

% Pronombres Relativos
pronombre([que|S], S).

%------------------------------SUSTANTIVOS------------------------------%

sustantivo(sing, masc, [archivo|S],S).
sustantivo(sing, fem, [computadora|S], S).
sustantivo(sing, fem, [mac|S], S).
sustantivo(sing, fem, [impresora|S], S).
sustantivo(sing, fem, [solucion|S], S).
sustantivo(sing, masc, [cable|S], S).
sustantivo(sing, masc, [parlante|S], S).
sustantivo(sing, masc, [wifi|S], S).
sustantivo(sing, masc, [papel|S], S).
sustantivo(sing, fem, [pantalla|S], S).
sustantivo(sing, fem, [situacion|S], S).
sustantivo(sing, masc, [teclado|S], S).
sustantivo(sing, masc, [problema|S], S).
sustantivo(plu, masc, [drivers|S], S).
sustantivo(plu, masc, [audifonos|S], S).
sustantivo(sing, fem, [referencia|S], S).
sustantivo(sing, fem, [tinta|S], S).
sustantivo(plu, fem, [referencias|S], S).


%------------------------------VERBOS------------------------------%

%------A------%
% ayudar
verbo(sing, primera, [ayudar|S], S).

% apagar
verbo(sing, segunda, [apague|S], S).

%------B------%
%------C------%
% comentar
verbo(sing, primera, [comento|S], S).

% conectar
verbo(plu, tercera, [conectan|S], S).
verbo(sing, segunda, [conecte|S], S).

%------D------%
% decir
verbo(sing, segunda, [dicen|S], S).

% descargar
verbo(sing, segunda, [descargue|S], S).
verbo(sing, segunda, [descargo|S] ,S).

% deber
verbo(sing, segunda, [debera|S], S).
verbo(sing, segunda, [debe|S], S).

%------E------%
% estar
verbo(sing, tercera, [esta|S], S).
verbo(sing, segunda, [esta|S], S).
verbo(plu, primera, [estamos|S], S).

% empezar
verbo(sing, segunda, [empiece|S], S).

% esperar
verbo(sing, segunda, [espere|S], S).

% encender
verbo(sing, primera, [enciendo|S], S).
verbo(sing, tercera, [enciende|S], S).

% entender
verbo(sing, primera, [entiendo|S], S).
verbo(sing, tercera, [entiende|S], S).

%------F------%
% funcionar
verbo(sing, tercera, [funciona|S], S).
verbo(plu, tercera, [funcionan|S], S).

% facilitar
verbo(sing, segunda, [facilitar|S], S).

%------G------%
%------H------%
% hacer
verbo(sing, segunda, [haga|S], S).
verbo(plu, primera, [haremos|S], S).

%------I------%
% ir
verbo(sing, segunda, [vaya|S], S).
verbo(plu, primera, [vamos|S], S).

% instalar
verbo(sing, segunda, [instalo|S], S).
verbo(sing, segunda, [instale|S], S).

% intentar
verbo(sing, segunda, [intente|S], S).
verbo(sing, segunda, [intento|S], S).

% imprimir
verbo(sing, tercera, [imprime|S], S).
verbo(sing, tercera, [imprimir|S], S).

%------J------%
%------K------%
%------L------%
% llamar
verbo(sing, segunda, [llamas|S], S).

%------M------%
%------N------%
% necesitar
verbo(sing, primera, [necesito|S], S).
verbo(sing, tercera, [necesita|S], S).

%------O------%
%------P------%
% parecer
verbo(sing, primera, [parece|S], S).

% poder
verbo(sing, primera, [podre|S], S).
verbo(sing, primera, [puedo|S], S).
verbo(sing, segunda, [pueda|S], S).
verbo(sing, segunda, [puede|S], S).
verbo(sing, segunda, [podria|S], S).

% probar
verbo(sing, segunda, [pruebe|S], S).

% persistir
verbo(sing, tercera, [persiste|S], S).

%------Q------%
%------R------%
% realizar
verbo(sing, primera, [realice|S], S).

% revisar
verbo(sing, segunda, [revise|S], S).

%------S------%
% salir
verbo(sing, tercera, [sale|S], S).
verbo(sing, tercera, [salio|S], S).

% ser
verbo(sing, tercera, [es|S], S).
verbo(sing, segunda, [es|S], S).
verbo(plu, tercera, [eran|S], S).
verbo(plu, tercera, [fueron|S], S).
verbo(plu, tercera, [son|S], S).

% servir
verbo(sing, tercera, [sirve|S], S).
verbo(plu, tercera, [sirven|S], S).

%------T------%
% tener
verbo(sing, tercera, [tiene|S], S).
verbo(sing, tercera, [tenga|S], S).
verbo(sing, primera, [tengo|S], S).
verbo(plu, tercera, [tienen|S], S).
verbo(sing, segunda, [tendra|S], S).
verbo(sing, segunda, [tendran|S], S).

%------U------%
% utilizar
verbo(sing, tercera, [usa|S], S).
verbo(sing, tercera, [utiliza|S], S).
verbo(plu, tercera, [utilizan|S], S).

%_________________ V ____________
% ver
verbo(sing, tercera, [vea|S], S).

%_________________ W ____________
%_________________ X ____________
%_________________ Y ____________
%_________________ Z ____________

