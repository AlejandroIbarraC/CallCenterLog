/*----------------------------------------------------------------------
												CALL CENTER LOG - READIN

	Este código es un lector (reading) de las entradas del usuario. Su funciona-
	miento general es relativamente sencillo: "Ingresa el usuario una oración
	y readin(S) se encarga de retornar una lista cuyos elementos son las pala-
	bras que componen la oración".

	Ejemplo: ?- readin(S).
					|:  Este es mi texto!
					S = [este, es, mi, texto, !]

	NOTA: El código está basado en el código de David Warren y Fernando Pereira
	desarrollador del primer compilador de prolog, las modificaciones realizadas
	han sido solo para agregar elementos del idioma español con el ascii exten-
	dido.

	Este código está basado en el código chat-80 de Warren y Pereira (1982)
	source: http://nli-gems.org/system.php?id=chat-80

	Artículos:
	* An efficient easily adaptable system for interpreting natural
		language queries - Pereira, Warren (1982)
	* Efficient Processing of Interactive Relational Database Queries
		Expressed in Logic - Warren (1981)
	* Logic for natural language analysis - Pereira (1983)
	* Issues in natural language access to databases from a logic
		programming perspective - Warren (1982?)
	______________________________________________________________________
	Copyright (C)  David Warren and  Fernando Pereira
	This program may be used, copied, altered or included in other programs
	only for academic purposes and provided that the authorship of the initial
	program is aknowledged.
	Use for commercial purposes without the previous written agreement of
	the authors is forbidden.
	_______________________________________________________________________

	Código comentado y modificado por @estalvgs1999 (Sep 2019)
  ----------------------------------------------------------------------*/


/* read_in(P) recibe una oración por parte del usuario, luego coloca todas las
 * palabras en la lista P.
 * La sentencia debe ser terminada con '.', '!', o '?'
 */
read_in(P):-initread(L),words(P,L,[]).

/* initread(L) - Lee cada caracter de la entrada y lo reemplaza
 * con su código ascci (get_code).
 	~ get_code. Retorna el valor ascii de un caracter dado.
 */

initread([K1,K2|U]):-get_code(K1),get_code(K2),readrest(K2,U).


% Función recursiva que se encarga de leer el resto de la oración.
readrest(46,[]):-!.  % 46 ascii -> '.'
readrest(63,[]):-!.  % 63 ascii -> '?'
readrest(33,[]):-!.  % 33 ascii -> '!'
readrest(10,[]):-!.  % 10 ascii -> '\n'

% Si el caracter es menor a 32 es un caracter "no imprimible"
% por tanto se hace un cut.
readrest(K,[K1|U]):- K=<32,!,get_code(K1),readrest(K1,U).
readrest(_K1,[K2|U]):-get_code(K2),readrest(K2,U).

/* Este es un analizador léxico que convierte una secuencia de caracteres
 * en una secuencia de símbolos~
 * words (P,L,[]) donde L es una lista de chars y P es el resultado del
 * analizador, es decir(i.e), una lista de símbolos.
 */

% Uso de DGC
words([V|U]) --> word(V),!,blanks,words(U).
words([]) --> [].

% El predicado name(A,L) indica que la lista L contiene los códigos ascii
% de los caracteres que conforman A.

word(U1) --> [K],{lc(K,K1)},!,alphanums(U2),{name(U1,[K1|U2])}.
word(nb(N)) --> [K],{digit(K)},!,digits(U),{name(N,[K|U])}.
word(V) --> [K],{name(V,[K])}.

alphanums([K1|U]) --> [K],{alphanum(K,K1)},!,alphanums(U).
alphanums([]) --> [].

% Valida si el código corresponde a un alfanumérico
alphanum(95,95) :- !.
alphanum(K,K1):-lc(K,K1).
alphanum(K,K):-digit(K).

digits([K|U]) --> [K],{digit(K)},!,digits(U).
digits([]) --> [].

blanks--> [K],{K=<32},!,blanks.
blanks --> [].

% valida si el caracter es un dígito.
digit(K):-K>47,K<58.

% Cambiar de mayúsculas a minúsculas.
lc(K,K1):-K>64,K<91,!,K1 is K+32.

% Caso especial Ñ
lc(K,K1):-K=209,!,K1 is 241.

% En caso de que ya sea minúsculas solamente retorna el valor ascii.
lc(K,K):-K>96,K<123; K=241. % El valor de ñ en ascii es 241

% Se encapsula el algortimo en el predicado
% readin(S) que recibe un texto y devuelve la lista con las palabras y signos
% especiales.
readin(S):- read_in(S).
