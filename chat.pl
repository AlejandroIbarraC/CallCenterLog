/* --------------------------------------------------------
 * Archivo; chat.pl
 * Autores: José Alejandro Ibarra & Esteban Alvarado
 *
 * Descripción: Punto de entrada para el programa. Maneja
 *              la interfaz con el usuario, el análisis de
 *              entradas y sus respuestas.
 * versión: Sep 2019
 * -------------------------------------------------------*/

 % Modulos y archivos
 :- [db, patrones, readin, idioma, nombres, util].
 :- use_module(library(random)).

 % Variables que almacenan la información del Usuario
 :- dynamic nombre_usuario/1,
            dispositivo/1.

%----------------------- INICIO --------------------------

% consultar/0
% Inicia una conversación con el bot.
consultar:-
  saludar,
  obtener_nombre,
  conversacion.

% saludar/0
% Saluda al usuario con una frase de saludo aleatoria.
saludar:-
  respuestas(saludo, D),
  respuesta_aleatoria(D, W),
  imprimir_usuario(bot),
  imprimir_lista(W),
  imprimir_usuario(usuario),
  readin(_).

% conversacion/0
% Ciclo de backtracking principal. Se repite hasta que el
% usuario se despide.
conversacion:-
  repeat,
  imprimir_usuario(usuario),
  readin(S),
  generar_respuesta(S,R),
  imprimir_usuario(bot),
  imprimir_lista(R),
    salir(S),
    print_report, !.


%--------------------- RESPUESTAS ------------------------

% A) RESPUESTAS A UNA CONSULTA
% Si en la misma frase el usuario ya indicó el dispositivo
generar_respuesta(S,R):-
  patronConsulta(S,_),
  verificar_dispositivo(S),!,
  resolver_consulta,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si no lo introduce, en la consulta, se procede a preguntarlo
generar_respuesta(S,R):-
  patronConsulta(S,_),!,
  obtener_dispositivo,
  resolver_consulta,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% B) RESPUESTAS A UNA REFERENCIA

% Si en la misma frase el usuario ya indicó el dispositivo y el problema
generar_respuesta(S,R):-
  patronReferencia(S,_), verificar_dispositivo(S),
  es_causa(S,N),!,
  imprimir_usuario(bot),write('Esta referencia puede serte útil: '),
  brindar_referencia(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si en la misma frase el usuario ya indicó el dispositivo y el problema
generar_respuesta(S,R):-
  patronReferencia(S,_),
  verificar_dispositivo(S),
  es_caso_especial(S,N),!,
  imprimir_usuario(bot),write('Estas referencias te ayudarán: \n'),
  brindar_referencia(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si el usuario solo brinda el dispositivo
generar_respuesta(S,R):-
  patronReferencia(S,_),
  verificar_dispositivo(S),!,
  brindar_referencias,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% Si no dice ni dispositivo, ni problema se brindan todas.
generar_respuesta(S,R):-
  patronReferencia(S,_),!,
  obtener_dispositivo,
  brindar_referencias,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

% C) RESPUESTAS A UN PROBLEMA
generar_respuesta(S,_):-
  patronProblema(S,_),
  verificar_dispositivo(S),!,
  display('AK7').

generar_respuesta(S,_):-
  patronProblema(S,_),!,
  obtener_dispositivo.

%--------------------------------------------------------
% buscar despedida "adios"
generar_respuesta(S, R):-
  salir(S), !,
	respuestas(despedida, Res),
	respuesta_aleatoria(Res, R).

% Buscar frase de saludo
generar_respuesta(S, R):-
  buscar_saludo(S), !,
	respuestas(saludo, Res),
	respuesta_aleatoria(Res, R).

% Buscar frase de agradecimiento
generar_respuesta(S, R):-
  buscar_gracias(S), !,
  respuestas(agradecido, Res),
  respuesta_aleatoria(Res, R).

% Pregunta por el nombre del bot
generar_respuesta(S, R):-
  patronNombre(S, _), !,
  respuestas(mi_nombre, D),
  respuesta_aleatoria(D, R).

% Preguntando sobre lo que estudio
generar_respuesta(S, R):-
  patronEstudios(S, _), !,
  respuestas(mi_estudio, D),
  respuesta_aleatoria(D, R).

% Preguntando por el estado del programa
generar_respuesta(S, R):-
  patronYo(S, _), !,
  respuestas(yo, D),
  respuesta_aleatoria(D, R).

% Detectar pregunta con por qué
generar_respuesta(S, R):-
	oracion(_Tree1, S, _Rest), !,
	pregunta(_Tree2, Rep,[]),
	append(Rep, ['?'], R).

% Detectar pregunta
generar_respuesta(S, R):-
	pregunta(_Tree2, S, _Rest), !,
	oracion(_Tree1, Rep,[]),
	append([yes, ','|Rep], ['!'], R).

% Preguntar algo aleatorio
generar_respuesta(S, R):-
  \+ buscar_pregunta(S), !,
	respuestas(preguntas_aleatorias, Res),
	respuesta_aleatoria(Res, R).

% Responder algo aleatorio
generar_respuesta(S, R):-
    buscar_pregunta(S), !,
    respuestas(respuestas_aleatorias, Res),
    respuesta_aleatoria(Res, R).

%---------------------------------------------------------

% respuesta_aleatoria/2
% Escoge una respuesta aleatoria de una lista de respuestas.
respuesta_aleatoria(Res, R):-
    length(Res, Longitud),
    Mayor is Longitud + 1,
    random(1, Mayor, Rand),
    nElemento(Res, Rand, R).

%----------------------- OBTENER -------------------------

% obtener_nombre/0
% Le pide al usuario un nombre y lo almacena como nombre
% de usuario
obtener_nombre:-
  preguntas_db(nombre,LP),
  respuesta_aleatoria(LP,R),
  imprimir_usuario(bot),
  imprimir_lista(R),
  imprimir_usuario(usuario),
  readin(S),
  obtener_nombre(S).

% obtener_nombre/1
% Verifica que el nombre que ingresa el usuario es válido.
obtener_nombre(P):-
  verificar_nombre(P),!,
  ofrecer_ayuda.

obtener_nombre(_):-
  respuestas(obtener_nombre,LR),
  respuesta_aleatoria(LR,RA),
  imprimir_usuario(bot),imprimir_lista(RA),
  imprimir_usuario(usuario),readin(S),
  obtener_nombre(S).

% ofrecer_ayuda/0
% Funciona como un paso para entrar a la conversación.
ofrecer_ayuda:-
  respuestas(listo,RL),
  respuesta_aleatoria(RL,R),
  imprimir_usuario(bot),
  imprimir_lista(R).

% obtener_dispositivo/0
% Le pide al usuario un dispositivo válido.
obtener_dispositivo:-
  preguntas_db(dispositivo,LP),
  respuesta_aleatoria(LP,P),
  imprimir_usuario(bot),imprimir_lista(P),
  imprimir_usuario(usuario),readin(S),
  obtener_dispositivo(S).

obtener_dispositivo(D):-
  verificar_dispositivo(D),!.

obtener_dispositivo(_):-
  respuestas(obtener_dispositivo,LR),
  respuesta_aleatoria(LR,RA),
  imprimir_usuario(bot),imprimir_lista(RA),
  imprimir_usuario(usuario),readin(D),
  obtener_dispositivo(D).

%----------------------- Q/A FX --------------------------

% resolver_consulta/0
% Muestra al usuario las causas de un problema con su dispositivo
resolver_consulta:-
  imprimir_usuario(bot),
  write('Las posibles causas de su problema son: \n'),
  dispositivo(D),nElemento(D,1,Disp),
  causas_db(Disp,LS),
  length(LS,N),
  imprimir_ul(N,LS),!.

% brindar_referencias/0
% Brinda al usuario todas las referencias de un dispositivo.
brindar_referencias:-
  imprimir_usuario(bot),write('Esta referencias pueden ayudarte con tu problema: \n'),
  dispositivo(D),nElemento(D,1,Disp),
  referencias(Disp,LR),
  length(LR,N),imprimir_ul(N,LR),!.

% brindar_referencia/1
% Brinda una o varias referencias asociadas a un problema.
brindar_referencia(N):-
  integer(N),!,
  dispositivo(D),nElemento(D,1,Disp),
  referencias(Disp,LRF),
  nElemento(LRF,N,RF),
  imprimir_lista(RF).

brindar_referencia(N):-
  dispositivo(D),nElemento(D,1,Disp),
  referencias(Disp,LRF),
  imprimir_seleccion(LRF,N),!.

%----------------------- AUX FX --------------------------
% Nota: en un predicado se usa la notación:
% nombre/(numero de args)

% imprimir_usuario/1
% Escribe en la consola el nombre del usuario que habla
imprimir_usuario(bot):-
    nombre_bot(X), write(X), write(': '), flush_output.
imprimir_usuario(usuario):-
    n_usuario(X), write(X), write(': '), flush_output.
nombre_bot('CallCenterLog').
n_usuario('tu').

% buscar_saludo/1
% Verifica si la oración es un saludo en la DB
buscar_saludo(S):-
  saludos(D),
  interseca(S, D, A),
  A \== [].

% buscar_pregunta/1
% Verifica si la entrada es una pregunta en la DB
buscar_pregunta(S):-
  member('?',S).

% buscar_gracias/1
% Verifica si la oración es de agradecimiento en la DB
buscar_gracias(S):-
  gracias(D),
  interseca(S, D, A),
  A \== [].

% salir/1
% Verifica si la entrada contiene la frase de despedida
salir(S):-
    subset([adios], S).

% verificar_nombre/1
% Verifica si la entrada contiene un nombre válido
verificar_nombre([N|_]):-
	nombre(N),!,
	assert(nombre_usuario(N)).

verificar_nombre([_|R]):-
 	verificar_nombre(R).

% verificar_dispositivo/1
% Verifica si el dispositivo es valido, y lo agrega a la base de datos actual.
verificar_dispositivo(S):-
  dispositivos(D),
  interseca(S, D, A),
  A \== [],
  assert(dispositivo(A)).

% es_causa/2
% Indica si en una oración se da una causa principal
es_causa(S,N):-
  dispositivo(D),nElemento(D,1,Disp),
  patronCausa(Disp,S,_,N).

% es_caso_especial/?
% Indica si se hace request de un problema específico
es_caso_especial(S,N):-
  dispositivo(D),nElemento(D,1,Disp),
  patronProbRef(Disp,S,_,N).

% print_report/0
% Retorna un resumen de la conversación que se tuvo.
print_report:-
  write('\n--- Resumen de la Conversación ---\n'),
	nombre_usuario(X), dispositivo(Z),
  imprimir_lista(['Usuario: ', X, '\nDispositivo: ', Z]),
  retract(nombre_usuario(X)),retract(dispositivo(Z)),fail.

% print_report:-
%         nl, feedback(X, Y), write(X), write(' : '), imprimir_lista(Y),
%         retract(feedback(X, Y)), fail.
% print_report:-
%         nl, information(X, Y), write(X), write(' : '), imprimir_lista(Y),
%         retract(information(X, Y)), fail.
  print_report.
%------------------ FIN DEL CODIGO ----------------------
