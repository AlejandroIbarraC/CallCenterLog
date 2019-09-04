% Archivo:      db.pl
% Autor:        José Alejandro Ibarra Campos
%
% Descripción:  Base de datos general del programa

respuestas(solucion, [['Tienes un problema'],
        ['Puedo ayudarte!'],
        ['Creo que tengo una solución para ti']]).

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
        ['Necesito saber tu nomnbre!'],
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
        ['Gracias. Me ayuda mucho.'],
        ['Okay, muchas gracias.'],
        ['Gracias por eso.'],
        ['Muy buena esa.'],
        ['Increíble!'],
        ['Buena!']
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

questions_db(feedback, [
        ['Okay. Did you find any of the talks interesting?'],
        ['Hmm. Do you think the open day has been well organised?'],
        ['Ok, thanks. Have the student ambassadors been helpful?'],
        ['So, what are your thoughts on the open day overall?']
        ]).

questions_db(info, [
        [' ¡Genial!¿Cómo puedo ayudarte?'],
        ['¿De dónde eres?'],
        ['¡Un gusto en conocerte!'],
        ['¿Como te llamas?']
        ]).

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

dispositivos([impresora,
        computadora,
        mac,
        parlante,
        tablet,
        calculadora,
        wifi,
        telefono,
        conmigo
        ]).
