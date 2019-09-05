% Archivo:      main.pl
% Autor:        José Alejandro Ibarra Campos
%
% Descripción:  Punto de entrada para el programa. Maneja la interfaz con el usuario,
%               el análisis de entradas y sus respuestas.

% Importar modulos de utilidades y archivos del programa.
:- [db, patrones, readin, english, util, nombres].
:- use_module(library(random)).

% Definición de variables para almacenar informacion de usuario
:- dynamic nombre_usuario/1, usr_location/1, information/2, feedback/2, dispositivo/1, loc/1.

%---------------------------INICIO---------------------------

% consultar/0 (Nivel 0)
% Punto de entrada inicial. Inicia ciclo de conversación.
consultar:-
	saludar,
	conversacion.

% conversacion/0 (Nivel 0)
% Ciclo de backtracking principal. Se repite hasta que el usuario se despide.
conversacion :-
	repeat, % definición del ciclo
	imprimirUsuario(usted),
	readin(S),
	generarRespuesta(S,R),
	imprimirUsuario(yo),
	imprimirLista(R),
    salir(S),
    print_report, !.


%--------------------------- REGLAS ---------------------------


% buscarGracias/1
% Verifica si la oración es de agradecimiento en la base de datos.
buscarGracias(S):-
    gracias(D),
    interseca(S, D, A),
    A \== [].

% buscarPregunta/1 (Nivel 1)
% Verifica si la entrada es una pregunta en la base de datos.
buscarPregunta(S):-
    member('?', S).

% buscarSaludo(Oración)
% Verifica si la oración es de saludo en la base de datos.
buscarSaludo(S):-
    saludos(D),
    interseca(S, D, A),
    A \== [].

% generarRespuesta/2 (Nivel 2)
% Genera una respuesta dependiendo de lo que el usuario escriba.

% buscar despedida "adios"
generarRespuesta(S, R):-
  salir(S), !,
	respuestas(despedida, Res),
	respuestaAleatoria(Res, R).

% buscar frase de saludo
generarRespuesta(S, R):-
  buscarSaludo(S), !,
	respuestas(saludo, Res),
	respuestaAleatoria(Res, R).

% buscar frase de agradecimiento
generarRespuesta(S, R):-
  buscarGracias(S), !,
  respuestas(agradecido, Res),
  respuestaAleatoria(Res, R).

% buscar pregunta de mi nombre
generarRespuesta(S, R):-
    patronNombre(S, _), !, % Si lo que busca lo encuentra en un patrón, le brinda una respuesta [cut]
    respuestas(mi_nombre, D),
    respuestaAleatoria(D, R).

% preguntando sobre lo que estudio
generarRespuesta(S, R):-
    patronEstudios(S, _), !,
    respuestas(mi_estudio, D),
    respuestaAleatoria(D, R).

% preguntando al usuario sobre su dispositivo
generarRespuesta(S, _R):-
    patronProblema(S, _) !,
		respuestas(problema, D),
		respuestaAleatoria(D,W),
		imprimirUsuario(yo),
		imprimirLista(W),
		obtenerDispositivo.


% El usuario dice que tiene un problema con la impresora.
generarRespuesta(S,R):-
	patronCausa(impresora,S,_,NS),!,
	respuestas(impresora, D),
	nElemento(D,NS,R).

% El usuario dice que tiene un problema con la computadora.
generarRespuesta(S,R):-
	patronCausa(computadora,S,_,NS),!,
	respuestas(conputadora, D),
	nElemento(D,NS,R).

% El usuario dice que tiene un problema con el parlante.
generarRespuesta(S,R):-
	patronCausa(parlante,S,_,NS),!,
	respuestas(parlante, D),
	nElemento(D,NS,R).

% El usuario dice que tiene un problema con los audifonos.
generarRespuesta(S,R):-
	patronCausa(audifonos,S,_,NS),!,
	respuestas(audifonos, D),
	nElemento(D,NS,R).

generarRespuesta(S, R):- % preguntando por el estado del programa
    patronYo(S, _), !,
    respuestas(me, D),
    respuestaAleatoria(D, R).

generarRespuesta(S, R):- % detectar pregunta con por qué
	oracion(_Tree1, S, _Rest), !,
	pregunta(_Tree2, Rep,[]),
	append(Rep, ['?'], R).

generarRespuesta(S, R):- % detectar pregunta
	pregunta(_Tree2, S, _Rest), !,
	oracion(_Tree1, Rep,[]),
	append([yes, ','|Rep], ['!'], R).

generarRespuesta(S, R):- % obtener informacion de usuario
    \+ buscarPregunta(S),
    \+ information(_, _), !,
    obtenerInformacion(2),
		respuestas(gracias, D),
		respuestaAleatoria(D,R).

generarRespuesta(S, R):- % get feedback
    \+ buscarPregunta(S),
    \+ feedback(_, _), !,
    get_feedback(4),
    respuestas(gracias, D),
    respuestaAleatoria(D, R).

generarRespuesta(S, R):- % preguntar algo aleatorio
    \+ buscarPregunta(S), !,
	respuestas(preguntas_aleatorias, Res),
	respuestaAleatoria(Res, R).

generarRespuesta(S, R):- % responder algo aleatorio
    buscarPregunta(S), !,
    respuestas(respuestas_aleatorias, Res),
    respuestaAleatoria(Res, R).

% get_feedback/1
%
% Asks the user for a number (N) of pieces of feedback,
% and asserts the responses into the database.
get_feedback(1).
get_feedback(N):-
    preguntas_db(feedback, D),
    nElemento(D, N, R),
    imprimirUsuario(yo),
    imprimirLista(R),
    imprimirUsuario(usted),
    readin(S),
    assert(feedback(R, S)),
    M is N - 1,
    get_feedback(M).

% Escribe en la consola el nombre del usuario que habla
imprimirUsuario(yo):-
    mi_nombre(X), write(X), write(': '), flush_output.
imprimirUsuario(usted):-
    su_nombre(X), write(X), write(': '), flush_output.
mi_nombre('CallCenterLog').
su_nombre('Usted').

% obtenerDispositivo/0 (Nivel 0)
% Le pide al usuario un dispositivo válido.
obtenerDispositivo:-
    imprimirUsuario(usted),
    readin(S),
    obtenerDispositivo(S).
obtenerDispositivo(S):-
    verificarDispositivo(S), !.
obtenerDispositivo(_):-
    respuestas(obtener_dispositivo, D),
    respuestaAleatoria(D, R),
    imprimirUsuario(yo),
    imprimirLista(R),
    obtenerDispositivo.

% obtenerInformacion/1 (Nivel 1)
% Pregunta al usuario por informacion y lo introduce en la base de datos
obtenerInformacion(0).
obtenerInformacion(N):-
    preguntas_db(info, D),
    nElemento(D, N, Q),
    imprimirUsuario(yo),
    imprimirLista(Q),
    imprimirUsuario(usted),
    readin(R),
    assert(information(Q, R)),
    obtenerInformacion(Q, R),
    M is N - 1,
    obtenerInformacion(M).

obtenerInformacion(QL, RL):-
    nElemento(QL, 1, Q),
    contiene(Q, nombre), !,
    obtenerNombre(Q, RL).

obtenerInformacion(QL, RL):-
    nElemento(QL, 1, Q),
    contiene(Q, subjects), !,
    obtenerDispositivo(RL).

obtenerInformacion(QL, RL):-
    nElemento(QL, 1, Q),
    contiene(Q, from), !,
    assert(usr_location(RL)).

obtenerInformacion(_, _).

% obtenerNombre/2 (Nivel 2)
% Le pide al usuario un nombre y lo agrega a la base de datos.
obtenerNombre(Q):-
    imprimirUsuario(usted),
    readin(S),
    obtenerNombre(Q, S).

obtenerNombre(_, RL):-
    verificarNombre(RL), !.

obtenerNombre(Q, _):-
    respuestas(obtener_nombre, D),
    respuestaAleatoria(D, X),
    imprimirUsuario(yo),
    imprimirLista(X),
    obtenerNombre(Q).

% respuestaAleatoria/2 (Nivel 2)
% Escoge una respuesta aleatoria de una lista de respuestas.
respuestaAleatoria(Res, R):-
    length(Res, Longitud),
    Mayor is Longitud + 1,
    random(1, Mayor, Rand),
    nElemento(Res, Rand, R).

% salir/1 (Nivel 1)
% Verifica si la entrada contiene la frase de despedida
salir(S):-
    subset([adios], S).

% saludar/0 (Nivel 0)
% Saluda al usuario con una frase de saludo aleatoria.
saludar:-
    respuestas(saludo, D),
    respuestaAleatoria(D, W),
    imprimirUsuario(yo),
    imprimirLista(W),
    flush_output.

% verificarDispositivo/1 (Nivel 1)
% Verifica si el dispositivo es valido, y lo agrega a la base de datos actual.
verificarDispositivo(S):-
    dispositivos(D),
    interseca(S, D, A),
    A \== [],
    assert(dispositivo(A)).

% verificarNombre/1 (Nivel 1)
% Verifica si la entrada contiene un nombre válido
verificarNombre([N|_]):-
	nombre(N),!,
	assert(nombre_usuario(N)).

verificarNombre([_|R]):-
 	verificarNombre(R).

% print_report/0
% Outputs a conversation summary based on facts gathered
% during chat.
print_report:-
        write('\n--- Conversation report ---\n'),
	nombre_usuario(X), usr_location(Y), dispositivo(Z),
        imprimirLista(['Usuario: ', X, '\nDe: ', Y, '\nStudying: ', Z]),
        retract(nombre_usuario(X)),retract(usr_location(Y)), retract(dispositivo(Z)), fail.
print_report:-
        nl, feedback(X, Y), write(X), write(' : '), imprimirLista(Y),
        retract(feedback(X, Y)), fail.
print_report:-
        nl, information(X, Y), write(X), write(' : '), imprimirLista(Y),
        retract(information(X, Y)), fail.
print_report.
