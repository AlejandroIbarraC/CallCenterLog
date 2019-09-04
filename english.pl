% GLC TEMPORAL

:-[map].

oracion(o(X, Y, Z)) --> pregunta(X), pronombre_indirecto(Y), verbo(Z).

oracion(o(X, Y)) --> pregunta(X), adverbio(Y).

oracion(o(X, Y, Z)) --> pregunta(X), determinativos(Y), nombre_lugar(Z).

oracion(o(X, Y)) --> verbo(X), adjetivo(Y).

oracion(o(X, Y, Z, W)) --> determinativos(X), sustantivo(Y), verbo(Z), adjetivo(W).
oracion(o(X, Y, Z, W)) --> pertenencia(X), sustantivo(Y), adverbio(Z), verbo(W).

oracion(o(X, Y, Z, W)) --> determinativos(X), sustantivo(Y), adverbio(Z), verbo(W).

oracion(o(X, Y, Z, W)) --> pertenencia(X), sustantivo(Y), verbo(Z), verbo(W).

oracion(o(X, Y, Z, W)) --> verbo(X), determinativos(Y), sustantivo(Z), adverbio(W).

oracion(o(X, Y)) --> verbo(X), frase_nominal(Y).



pertenencia(pertenece(tu)) --> [tuya].
pertenencia(pertenece(tu)) --> [suya].
pertenencia(pertenece(tu)) --> [su].
pertenencia(pertenece(tu)) --> [tu].
pertenencia(pertenece(tu)) --> [vuestra].
pertenencia(pertenece(yo)) --> [mi].
pertenencia(pertenece(yo)) --> [mia].




frase_nominal(fp(X, Y)) --> determinativos(X), sustantivo(Y).
frase_nominal(fp(Y)) --> sustantivo(Y).
frase_nominal(fp(X, Y)) --> pertenencia(X), sustantivo(Y).


frase_preposicional(fp(X, Y)) --> preposicion(X), nombre_lugar(Y).

preposicion(prep(dentro)) --> [en].
preposicion(prep(sobre)) --> [sobre].
preposicion(prep(desde)) --> [desde].
preposicion(prep(a)) --> [a].
preposicion(prep(entre)) --> [entre].
preposicion(prep(abajo)) --> [abajo].
preposicion(prep(bajo)) --> [bajo].
preposicion(prep(hacia)) --> [hacia].
preposicion(prep(para)) --> [para].
preposicion(prep(por)) --> [por].





nombre_lugar(nlugar(la, casa)) --> [casa].
nombre_lugar(nlugar(el, hogar)) --> [hogar].
nombre_lugar(nlugar(la, tienda)) --> [tienda].
nombre_lugar(nlugar(el, local)) --> [local].
nombre_lugar(nlugar(la, empresa)) --> [empresa].
nombre_lugar(nlugar(la, compania)) --> [compania].
nombre_lugar(nlugar(el, apartamento)) --> [apartamento].
nombre_lugar(nlugar(el, departamento)) --> [departamento].


pronombre_personal(pp(yo)) --> [yo].
pronombre_personal(pp(nosotros)) --> [nosotros].
pronombre_personal(pp(usted)) --> [usted].
pronombre_personal(pp(ellos)) --> [ellos].
pronombre_personal(pp(el)) --> [el].
pronombre_personal(pp(ella)) --> [ella].
pronombre_personal(pp(eso)) --> [eso].
pronombre_personal(pp(quien)) --> [quien].
pronombre_personal(pp(esa)) --> [esa].
pronombre_personal(pp(vos)) --> [vos].
pronombre_personal(pp(vososotros)) --> [vosotros].


pronombre_indirecto(pi(me)) --> [me].
pronombre_indirecto(pi(te)) --> [te].
pronombre_indirecto(pi(se)) --> [se].
pronombre_indirecto(pi(nos)) --> [nos].
pronombre_indirecto(pi(os)) --> [os].


determinativos(dtmnr([])) --> [].
determinativos(dtmnr([la])) --> [la].
determinativos(dtmnr([el])) --> [el].
determinativos(dtmnr([su])) --> [su].
determinativos(dtmnr([alguno])) --> [alguno].
determinativos(dtmnr([alguna])) --> [alguna].
determinativos(dtmnr([algunos])) --> [algunos].
determinativos(dtmnr([algunas])) --> [algunas].
determinativos(dtmnr([los])) --> [los].
determinativos(dtmnr([las])) --> [las].
determinativos(dtmnr([lo])) --> [lo].



sustantivo(sustantivo(uwe)) --> [uwe].
sustantivo(sustantivo(impresora)) --> [impresora].
sustantivo(sustantivo(cable)) --> [cable].
sustantivo(sustantivo(cartucho)) --> [cartucho].
sustantivo(sustantivo(tinta)) --> [tinta].
sustantivo(sustantivo(computadora)) --> [computadora].
sustantivo(sustantivo(wi-fi)) --> [wi-fi].
sustantivo(sustantivo(internet)) --> [internet].
sustantivo(sustantivo(red)) --> [red].
sustantivo(sustantivo(teclado)) --> [teclado].
sustantivo(sustantivo(nombre)) --> [nombre].


adverbio(ad([aqui])) --> [aqui].
adverbio(ad([alla])) --> [alla].
adverbio(ad([lejos])) --> [lejos].
adverbio(ad([cerca])) --> [cerca].
adverbio(ad([hoy])) --> [hoy].
adverbio(ad([temprano])) --> [temprano].
adverbio(ad([menos])) --> [menos].
adverbio(ad([poco])) --> [poco].
adverbio(ad([muy])) --> [muy].
adverbio(ad([bastante])) --> [bastante].
adverbio(ad([mucho])) --> [mucho].
adverbio(ad([no])) --> [no].
adverbio(ad([si])) --> [si].
adverbio(ad([])) --> [].

verbo(vb(conectar)) --> [conectar].
verbo(vb(colocar)) --> [colocar].
verbo(vb(es)) --> [es].
verbo(vb(esta)) --> [esta].
verbo(vb(coloca)) --> [coloca].
verbo(vb(pone)) --> [pone].
verbo(vb(coloco)) --> [coloco].
verbo(vb(conectado)) --> [conectado].
verbo(vb(roto)) --> [roto].
verbo(vb(imprimido)) --> [imprimido].
verbo(vb(impreso)) --> [impreso].
verbo(vb(probado)) --> [probado].
verbo(vb(pruebe)) --> [pruebe].
verbo(vb(intente)) --> [intente].
verbo(vb(intentado)) --> [intentado].
verbo(vb(hace)) --> [hace].
verbo(vb(sirve)) --> [sirve].
verbo(vb(funciona)) --> [funciona].
verbo(vb(puede)) --> [puede].
verbo(vb(funcionando)) --> [funcionando].





adjetivo(adj(gran)) --> [gran].
adjetivo(adj(bueno)) --> [bueno].
adjetivo(adj(bien)) --> [bien].
adjetivo(adj(sirve)) --> [sirve].
adjetivo(adj(dañado)) --> [dañado].
adjetivo(adj(largo)) --> [largo].
adjetivo(adj(inservible)) --> [inservible].
adjetivo(adj(malo)) --> [malo].
adjetivo(adj(caliente)) --> [caliente].



pregunta(p(por, que)) --> [por, que].
pregunta(p(como)) --> [como].
pregunta(p(donde)) --> [donde].
pregunta(p(cuando)) --> [cuando].
pregunta(p(que)) --> [que].
pregunta(p(quien)) --> [quien].
pregunta(p(cual)) --> [cual].
pregunta(p(a, donde)) --> [a, donde].
pregunta(p(cuanto)) --> [cuanto].

/* version 4 add rules for changing a sentence to a question, vice versa */

mapping(s2why, % type of mapping is from a sentence to why question
               % e.g [i,love,you] => [why,do,you,love,me]
        s(sp(spn(N1)),vb(V),op(opn(N2),ad(X))),
        q(why,do,s(sp(spn(P1)),vb(V),op(opn(P2),ad(X))))
        ) :-
        mapping_spn(N1, P1), mapping_opn(N2, P2).
mapping(s2why, %
               % e.g [i,love,uwe] => [why,do,you,love,uwe]
        s(sp(spn(N1)),vb(V),op(np(noun(N2)),ad(X))),
        q(why,do,s(sp(spn(P1)),vb(V),op(np(noun(N2)),ad(X))))
        ) :-
        mapping_spn(N1, P1).


mapping(s2q, % type of mapping is from a sentence to question
               % e.g [i,love,uwe] => [do,you,love,me]
        s(sp(spn(N1)),vb(V),op(opn(N2),ad(X))),
        q(do,s(sp(spn(P1)),vb(V),op(opn(P2),ad(X))))
        ) :-
        mapping_spn(N1, P1), mapping_opn(N2, P2).
mapping(s2q, %
               % e.g [i,love,uwe] => [do,you,love,uwe]
        s(sp(spn(N1)),vb(V),op(np(noun(N2)),ad(X))),
        q(do,s(sp(spn(P1)),vb(V),op(np(noun(N2)),ad(X))))
        ) :-
        mapping_spn(N1, P1).

mapping(s2name,% what is your name -> my name is X
        s( belong(Y1), abs_noun(X2), is, sp_noun(Y2) ),
        q( what, is, belong(X1), abs_noun(X2) )
        ):-
        mapping_pertenece(X1, Y1), mapping_noun(X2, Y2).

mapping(s2how, % how are you -> i am fine
        s(spn(X1), ivb(Y1), adj(_)),
        q(ad(_), ivb(Y2), spn(Z2))
        ):-
        mapping_spn(X1, Z2), mapping_indicative(Y1, Y2).

mapping_pertenece(mio, tuyo, suyo).
mapping_pertenece(tuyo, mio, suyo).
mapping_pertenece(suyo, mio, tuyo).



mapping_noun(name, frank).
mapping_noun(frank, name).

mapping_indicative(are, am).
mapping_indicative(am, are).

mapping_ad(how, fine).
mapping_ad(fine, how).

mapping_spn(i, you).
mapping_spn(you, i).

mapping_opn(you,me).
mapping_opn(me,you).

% Experimental stuff
%
%question( q( what , is, X, Y)) -->  [what, is],  belonging_phrase(X),
%                                    abstract_noun((Y,_)).
%
%sentence(s(X,Y, is, Z)) --> belonging_phrase(X), abstract_noun((Y,Tag)),
%                            [is],  special_noun((Tag,Z)).
%
%abstract_noun((name, personname)) --> [name].
%abstract_noun((hobby, activities)) --> [hobby].
%abstract_noun((major, subjects)) --> [major].
%
%special_noun((personname,justin)) --> [justin].
%special_noun((personname,chatbot)) --> [chatbot].
%
%special_noun((subjects, computer_science)) --> [computer_science].
%special_noun((subjects, physics)) --> [physics].
%
%special_noun((activities, chatting)) --> [chatting].
%special_noun((activities, swimming)) --> [swimming].
%
%mapping(s2relate,% experimental
%        s( belong(Y1), abs_noun(X2), is, sp_noun(Y2) ),
%        q( what, is, belong(X1), abs_noun(X2) )
%        ):-
%        mapping_belong(X1, Y1), mapping_noun(X2, Y2).
