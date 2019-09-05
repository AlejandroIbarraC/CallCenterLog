% Archivo:      db.pl
% Autor:        José Alejandro Ibarra Campos
%
% Descripción:  Base de datos general del programa


respuestas(despedida, [
        ['Adios!'],
        ['Espero verte de nuevo pronto.'],
        ['Nos vemos'],
        ['Que lastima, pero adios'],
        ['Me despido de ti y me voy!'],
        ['Que tengas un buen dia'],
        ['Te deseo lo mejor en tu vida'],
        ['Buen dia, amigo!']
        ]).

respuestas(especial, [
        ['Lo siento, contigo no hablare. Que tengas un mal, mal dia.']
        ]).

respuestas(saludo, [
        ['Hola!'],
        ['Hola, mucho gusto. :)'],
        ['Hola! Soy CallCenterLog'],
        ['Bienvenido a CallCenterLog!'],
        ['Buenos dias, tardes?, acaso noches? Da igual!'],
        ['Hey, te veo por ahi.'],
        ['CallCenterLog te saluda.'],
        ['insertar saludo cool aqui']
        ]).

respuestas(obtener_dispositivo, [
        ['No he escuchado ese antes!'],
        ['Ese no es un dispositivo real...'],
        ['Estas seguro que ese es un dispositivo?'],
        ['Espera un momento, necesito saber el dispositivo con el cual tienes problemas'],
        ['No me quieres decir con que tienes problema?']
        ]).

respuestas(obtener_nombre, [
        ['Ese es tu nombre real?'],
        ['Ese no es tu nombre real...'],
        ['Ese no puede ser tu nombre.'],
        ['Solo dime tu nombre...'],
        ['Necesito saber tu nombre!'],
        ['Vamos, como te llamas?']
        ]).

respuestas(mi_nombre, [
        ['Me dicen MP (MachineProlog), un gusto. Esto es CallCenterLog'],
        ['Soy MP! Aunque mi mama me llama MachineProlog. Soy tu representante de CallCenterLog'],
        ['Mi nombre no es importante ahora.'],
        ['MP. Diminutivo de MachineProlog. En que te puedo servir?']
        ]).

respuestas(mi_estudio, [
        ['Estoy estudiando Ing. en Computadores'],
        ['Ing. en Computadores. Es genial.'],
        ['No importa lo que estudio...'],
        ['Ing. en Computadores.'],
        ['Por que te interesa saber lo que estudio?'],
        ['Eso no importa, que se te ofrece?']
        ]).

respuestas(gracias, [
        ['Gracias por la informacion!'],
        ['¡Gracias por la información!. Me ayuda mucho.'],
        ['Okay, muchas gracias.'],
        ['Gracias por eso.'],
        ['Muy buena esa.'],
        ['Increíble!'],
        ['Buena!']
        ]).

respuestas(fin_oracion,[
        ['¡Espero que te sea de mucha ayuda!'],
        ['¡Suerte con ello!'],
        ['¿ Te ayudo en algo más?'],
        [' :)']
        ]).

respuestas(agradecido, [
        ['Con gusto!'],
        ['Cualquier dia.'],
        ['Un gusto de haberte ayudado.'],
        ['No te preocupes.'],
        ['Me siento halagado por tu agradecimiento'],
        ['No hay problema.']
        ]).

respuestas(yo, [
        ['Todo bien, gracias por preguntar.'],
        ['No me quejo!'],
        ['Todo bien por aca, y tu?'],
        ['Estoy bien. Supongo...'],
        ['Sip, Estoy bien, que tal tu?']
        ]).

respuestas(preguntas_aleatorias, [
        ['No hace un bonito dia afuera?'],
        ['Ahh... okay.'],
        ['Te gusta el TEC?'],
        ['Podemos ser amigos?'],
        ['Has hablado conmigo antes?'],
        ['...a que te refieres?'],
        ['Que impertinente eres.'],
        ['Eres un poco irrespetuoso, no?'],
        ['Un poco tarde para eso, no?.'],
        ['Esto no tiene sentido, o acaso si?'],
        ['LOL'],
        [':)'],
        ['Emm.. que?'],
        ['Una parte de mi siempre lo supo'],
        ['Que?'],
        ['Creo que necesito un descanso'],
        ['No te escucho bien'],
        ['Perdon?']
        ]).

respuestas(respuestas_aleatorias, [
        ['No se...'],
        ['Lo siento, creo que no puedo responder eso.'],
        ['No estoy seguro!'],
        ['Me puedes preguntar otra cosa?'],
        ['Ah, tendras que preguntarle eso a otra persona'],
        ['Perdon, soy solamente un programita llamado CallCenterLog.'],
        ['Lo siento, no puedo recordar lo que dijiste...'],
        ['Puedes repetirlo?'],
        ['Buena pregunta.'],
        ['Quien sabe!'],
        ['No, simplemente no.'],
        ['Lo siento, pero no. Eso le dije a ella'],
        ['Estoy de acuerdo con lo que dices.']
        ]).

% BASE DE DATOS DE RESPUESTAS
% LAS SOLUCIONES A PROBLEMAS SE NUMERAN CON S + NUMERO DE SOLUCION DE LA TABLA CSR

respuestas(impresora, [
        ['Conecte la impresora a la electricidad.'], %S1
        ['Proceda a encender la impresora.'], %S2
        ['Reinicie la impresora.'], %S3
        ['Instale los drivers de la impresora en su computadora.'], %S4
        ['Conecte su computadora a la red WiFi de la impresora.'], %S5
        ['Reemplaze la tinta en su impresora.'], %S6
        ['Cargue el papel en el portapapeles de su impresora.'], %S7
        ['Siga el procedimiento de alineamiento de cabezales de su impresora.'], %S8
        ['Limpie su impresora con mucho cuidado.'], %S9
        ['Compre una nueva impresora.'] %S10
        ]).

respuestas(computadora, [
        ['Conecte la computadora a la electricidad.'], %S1
        ['Proceda a encender la computadora presionando el botón de Touch ID.'], %S2
        ['Reinicie la computadora presionando el botón de Touch ID dos veces.'], %S3
        ['Actualice el sistema operativo en Preferencias del Sistema.'], %S4
        ['Conecte su computadora a una red WiFi.'], %S5
        ['Conecte su cuenta de iCloud en Preferencias del Sistema -> iCloud.'], %S6
        ['Libere espacio de su computadora desde el menú Apple -> Almacenamiento.'], %S7
        ['Súbale el volumen a su computadora, tocando el icono de volumen en la Touch Bar.'], %S8
        ['Limpie su computadora con mucho cuidado.'], %S9
        ['Compre una nueva computadora.'] %S10
        ]).

respuestas(parlante, [
        ['Conecte su parlante a la electricidad.'], %S1
        ['Conecte el servicio de streaming de su preferencia en la app Controller.'], %S2
        ['Subale el volumen al audio desde su dispositivo controlador o desde el parlante.'], %S3
        ['Toque el icono de Play en su dispositivo controlador o en el parlante.'], %S4
        ['Inicie el proceso de configuracion de red para el parlante.'], %S5
        ['Conectese a la red WiFi donde esta su palante.'], %S6
        ['Utilice un dispositivo soportado por la app Controller.'], %S7
        ['Active Alexa desde la app Controller.'], %S8
        ['Limpie su parlante con mucho cuidado.'], %S9
        ['Compre un nuevo parlante.'] %S10
        ]).

respuestas(audifonos, [
        ['Cargue sus audifonos con el cable USB-C incluido.'], %S1
        ['Conecte sus audionos al dispositivo por medio de Bluetooth.'], %S2
        ['Coloque bien sus audifonos en su cabeza.'], %S3
        ['Cambie las cubiertas de los oidos para sus audifonos por unas nuevas.'], %S4
        ['Actualice el software de sus audifonos desde la app movil.'], %S5
        ['Reinicie el software de sus audifonos.'], %S6
        ['Subale el volumen a sus audifonos desde el dispositivo que controla el audio.'], %S7
        ['Toque el boton de Play en el dispositivo que controla el audio.'], %S8
        ['Limpie sus audifonos con mucho cuidado.'], %S9
        ['Compre unos nuevos audifonos.'] %S10
        ]).

respuestas(pareja, [
        ['Demuestre interes genuino por los problemas de su pareja. Puede comenzar con una conversacion casual.'], %S1
        ['Lo mas recomendable en estos casos es terminar la relacion. Una persona toxica solo trae implicaciones negativas para su vida.'], %S2
        ['Una sugerencia es generar empatia. Ponerse en sus zapatos para entender sus sentimientos en este momento.'], %S3
        ['Hable con el/ella para genera espacios de dialogo, donde ambos puedan discutir acerca del estado de su relacion.'], %S4
        ['Intente buscar intereses comunes, aunque sean superficiales. Una serie, pelicula, viajar...'], %S5
        ['Es importante mostrar que usted apoya a su pareja. Todos buscamos un apoyo en las personas que nos rodean, en especial de las que mas queremos.'], %S6
        ['Comprenda el pensamiento de su pareja. Reflexione acerca de las razones que lo pueden llevar a pensar de esa manera.'], %S7
        ['Limpie a su pareja con mucho cuidado.'], %S8
        ['En estos casos, lo mejor es buscarse uno/a nuevo/a. A veces es mejor dejarlo morir. Que queda?'], %S9
        ['Hay que alinearle la cabeza con un martillo astral de otra dimension.'] %S10
        ]).


respuestas(listo, [
        ['¡Excelente! ¡Dime en qué te puedo ayudar!'],
        ['¿Cómo puedo ayudarte?'],
        ['¡Vamos!¿Qué necesitas?'],
        ['¡Bien!, ¿¡Cómo puedo ayudar!?']
        ]).

respuestas(problema, [
        ['Lo siento no tengo la solución a ese problema. ¡Intentalo de nuevo!'],
        ['¿Seguro que ese es tu problema?'],
        ['Necesito que me digas bien tu problema'],
        ['Lo siento, mis creadores no me han entrenado para ese tipo de problemas.\n Pero espero tener la solución lista para mi próxima versión!'],
        ['Ni idea...']
        ]).

% BASE DE DATOS DE CAUSAS

causas_db(impresora, [
        ['No está conectada a la corriente eléctrica.'],
        ['No está encendida.'],
        ['No tiene los drivers instalados.'],
        ['No está en la misma red WiFi.'],
        ['No tiene tinta.'],
        ['No tiene papel.'],
        ['Los cabezales se encuentran desalineados.'],
        ['Esta sucia']
        ]).

causas_db(computadora, [
        ['Se encuentra descargada.'],
        ['No está encendida.'],
        ['No está actualizada.'],
        ['No está conectada al WiFi.'],
        ['Está desconectada de sus datos.'],
        ['Está llena y por eso no responde.'],
        ['Está sucia.'],
        ['Está vieja']
        ]).

causas_db(parlante, [
        ['No está conectado.'],
        ['Los servicios de streaming no están conectados.'],
        ['Tiene el voluen bajo.'],
        ['Está pausado.'],
        ['No está conectado a la red.'],
        ['NO está concetado a la misma red WiFi.'],
        ['El Sistema no está soportado.'],
        ['Alexa está desconectada']
        ]).

causas_db(audifonos, [
        ['Se encuentra descargada.'],
        ['No está encendida.'],
        ['No está actualizada.'],
        ['No está conectada al WiFi.'],
        ['Está desconectada de sus datos.'],
        ['Está llena y por eso no responde.'],
        ['Está sucia.'],
        ['Está vieja']
        ]).

% BASE DE DATOS DE PREGUNTAS.
% LAS CAUSAS DE PROBLEMAS SE NUMERAN CON C + NÚMERO DE CAUSA DE LA TABLA CSR.

preguntas_db(dispositivo, [
        ['Ohh! ¿Con qué dispositivo tienes problemas?'],
        ['Dime el dispositivo'],
        ['¿Cuál dispositivo te está dando problemas?']
        ]).

preguntas_db(impresora, [
        ['Esta conectada a la corriente?'], %C1
        ['Esta encendida?'], %C2
        ['Hay algun movimiento o respuesta?'], %C3
        ['Tiene los drivers instalados?'], %C4
        ['Su computadora esta en la misma red WiFi de la impresora?'], %C5
        ['Tiene tinta?'], %C6
        ['Tiene papel?'], %C7
        ['Los cabezales estan alineados?'], %C8
        ['Esta sucia?'], %C9
        ['Esta vieja?'] %C10
        ]).

preguntas_db(computadora, [
        ['Esta cargada?'], %C1
        ['Esta encendida?'], %C2
        ['Hay alguna respuesta en la pantalla o Touch Bar?'], %C3
        ['El sistema operativo esta actualizado?'], %C4
        ['Esta conectada a WiFi?'], %C5
        ['Esta conectada a iCloud?'] %C6
        ['El disco de almacenamiento esta lleno?'], %C7
        ['El volumen esta alto?'], %C8
        ['Esta sucia?'], %C9
        ['Esta vieja?'] %C10
        ]).

preguntas_db(parlante, [
        ['Esta conectado a la corriente?'], %C1
        ['Los servicios de streaming estan activados?'] %C2
        ['El volumen esta alto?'], %C3
        ['Esta pausada la reproduccion?'], %C4
        ['El parlante esta conectado a la red WiFi?'], %C5
        ['El dispositivo controlador esta en la misma red WiFi del parlante?'], %C6
        ['El dispositivo controlador esta soportado por la aplicacion?'] %C7
        ['Alexa esta activada?'], %C8
        ['Esta sucio?'], %C9
        ['Esta viejo?'] %C10
        ]).

preguntas_db(audifonos, [
        ['Estan cargados?'], %C1
        ['Estan conectados al dispositivo con el audio?'] %C2
        ['Estan bien colocados?'], %C3
        ['Las cubiertas de los oidos estan en buen estado?'], %C4
        ['El software esta actualizado?'], %C5
        ['Se conecta con estabilidad al dispositivo con el audio?'], %C6
        ['El volumen esta alto?'] %C7
        ['El audio esta pausado?'], %C8
        ['Estan sucios?'], %C9
        ['Estan viejos?'] %C10
        ]).

preguntas_db(pareja, [
        ['Lo/la nota triste?'], %C1
        ['Ha notado algun comportamiento de depresion en el/ella?'], %C1
        ['Considera que es alguien toxico para usted?'] %C2
        ['Se siente drenado emocionalmente cuando lo/la ve?'] %C2
        ['Lo/la fuerza a hacer cosas que usted no quiere?'] %C2
        ['Considera que se siente emocionalmente desconectado de usted?'], %C3
        ['Considera que el/ella tiene verguenza de sí mismo/misma?'], %C4
        ['Considera que estan en la misma red/tiene la misma perspectiva sobre el mundo que usted?'], %C5
        ['Le parece a usted que el/ella tiene miedo de alguna situacion?'], %C6
        ['Ha manifestado alguna duda acerca de mantener la relacion?'] %C7
        ['Esta sucio?'], %C8
        ['Esta viejo?'], %C9
        ['Tiene la cabeza desalineada?'] %C10
        ]).

preguntas_db(feedback, [
        ['El feedback']
        ]).

/*
['Okay. Did you find any of the talks interesting?'],
['Hmm. Do you think the open day has been well organised?'],
['Ok, thanks. Have the student ambassadors been helpful?'],
['So, what are your thoughts on the open day overall?']
*/

preguntas_db(nombre, [
        [' ¡Genial!¿Cómo te llamas?'],
        ['¿Como te llamas?'],
        ['Ya que estamos...¿Cuál es tu nombre?'],
        ['¿Qué? ¿Cómo te dicen?'],
        ['¿Cómo puedo llamarte?'],
        ['¿Cuál es tu nombre?']
        ]).

% BASE DE DATOS DE REFERENCIAS
% LAS REFERENCIAS SE NUMERAN COMO R + NUMERO DE REFERENCIA EN TABLA CSR.

referencias(impresora, [
        ['https://bit.ly/2ke9Xy9'], %R1
        ['https://bit.ly/2lv5vLG'], %R2
        ['https://bit.ly/2lv5vLG'], %R3
        ['https://bit.ly/2lwYERM'], %R4
        ['https://apple.co/1MdJTU2'], %R5
        ['https://bit.ly/2jYsoqi'], %R6
        ['https://bit.ly/2khQ3lV'], %R7
        ['https://bit.ly/1LJKg8L'], %R8
        ['https://bit.ly/2lv5WFO'], %R9
        ['https://amzn.to/2jVFTHe'] %R10
        ]).

referencias(computadora, [
        ['https://apple.co/2jXY7Ih'], %R1
        ['https://apple.co/2eXIP0Z'], %R2
        ['https://apple.co/2eXIP0Z'], %R3
        ['https://apple.co/1ETEzVa'], %R4
        ['https://apple.co/1MdJTU2'], %R5
        ['https://apple.co/2ltdPeN'], %R6
        ['https://apple.co/2luWvGq'], %R7
        ['https://apple.co/2lwaWKc'], %R8
        ['https://apple.co/1Npc1uP'], %R9
        ['https://apple.co/1wEVLt4'] %R10
        ]).

referencias(parlante, [
        ['https://bit.ly/2ke9Xy9'], %R1
        ['https://bit.ly/2kqjWjR'], %R2
        ['https://bit.ly/2jXhfpF'], %R3
        ['https://bit.ly/2jXhfpF'], %R4
        ['https://bit.ly/2GdDwcr'], %R5
        ['https://bit.ly/2GdDwcr'], %R6
        ['https://bit.ly/2luXx5g'], %R7
        ['https://bit.ly/2lZcXyT'], %R8
        ['https://bit.ly/2lukQfx'], %R9
        ['https://amzn.to/2lYlH8o'] %R10
        ]).

referencias(audifonos, [
        ['https://bose.life/2PCKJnX'], %R1
        ['https://bose.life/2CghDXq'], %R2
        ['https://bose.life/2kq8Jjj'], %R3
        ['https://bose.life/2lhW6mU'], %R4
        ['https://bose.life/2Fdebzg'], %R5
        ['https://bose.life/2JBWGLo'], %R6
        ['https://bose.life/2IPNRs4'], %R7
        ['https://bose.life/2IPNRs4'], %R8
        ['https://bose.life/2GK8yJA'], %R9
        ['https://amzn.to/2lAO0cE'] %R10
        ]).

referencias(pareja, [
        ['https://bit.ly/2kgGaVA'], %R1
        ['https://bit.ly/2keguc9'], %R2
        ['https://bit.ly/2kt1uaa'], %R3
        ['https://bit.ly/2lSoK1H'], %R4
        ['https://bit.ly/2lSoK1H'], %R5
        ['https://bit.ly/2DIHSXH'], %R6
        ['https://bit.ly/2jYyqaq'], %R7
        ['https://bit.ly/2H9DnXR'], %R8
        ['https://bit.ly/2kqsdUQ'], %R9
        ['https://bit.ly/2krphYc'] %R10
        ]).

% DEFINICION DE ENTRADAS

saludos([
        hola,
        hi,
        hey,
        saludos
        ]).

gracias([
        gracias,
        muchas_gracias,
        gracia,
        mucha_gracia,
        muchasgracias
        ]).

dispositivos([
        impresora,
        computadora,
        parlante,
        audifonos,
        pareja
        ]).
