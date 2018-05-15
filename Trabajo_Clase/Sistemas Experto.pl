:- use_module(library(pce)).
:- use_module(library(pce_style_item)).

:-pce_image_directory('./imagenes').
resource(imagen1,image,image('uno.jpg')).
resource(imagen2,image,image('dos.jpg')).

main:-
    new(Menu, dialog('SISTEMA EXPERTO "Diagnóstico Médico de Enfermedades"')),
    new(L, label(nombre, 'BIENVENIDO A SU DIAGNOSTICO MEDICO')),
    %Crear variables que me va a contener preguntas y respuestas
    new(@texto, label(nombre,'segun sus datos de sintomas, tendra un resultado:')),
    new(@resp1, label(nombre,'')),
    %Crear boton salir
    new(Salir, button('SALIR',and(message(Menu,destroy),message(Menu,free)))),
    %Crear boton para realizar el test con su variable
    new(@boton, button('REALIZAR CONSULTA',message(@prolog, botones))),

    % implementacion del tipo y tamaño de letra
    send(Menu, append(L)), new(@btncarrera,button('¿Diagnostico?' )),
    send(Menu, display,L,point(70,20)),
    send(Menu, display,@boton,point(300,150)),
    send(Menu, display,@texto,point(20,100)),
    send(Menu, display,Salir,point(200,200)),
    send(Menu, display,@resp1,point(20,130)),
    send(Menu, open_centered),
    send(@texto,font,font(comic,bold,10)),
    send(L,font,font(comic,bold,20)).

%INGRESO DE ENFERMEDADES
enfermedades(tuberculosis):- tuberculosis,!.
enfermedades(sida):- sida,!.
enfermedades(peste):- peste,!.
enfermedades(malaria):- malaria,!.

enfermedades('Una enfermedad desconocida').

%REGLAS
tuberculosis :- padece_tuberculosis,
    pregunta('¿Tos con sangre o esputo?'),
    pregunta('¿Dolor en el pecho?'),
    pregunta('¿Debilidad o cansancio?'),
    pregunta('¿Perdida de peso?'),
    pregunta('¿Falta de apetito?'),
    pregunta('¿Escalofrios?'),
    pregunta('¿Fiebre?'),
    pregunta('¿sudor durante la noche?').

sida :- padece_sida,
    pregunta('¿Fiebre?'),
    pregunta('¿Dolor de cabeza?'),
    pregunta('¿Sufre de fatiga?'),
    pregunta('¿Glandios linfaticos hinchados?'),
    pregunta('¿Dolor de garganta?'),
    pregunta('¿Sarpullido?').

peste :- padece_peste,
    pregunta('¿Fiebre?'),
    pregunta('¿Escalofrios?'),
    pregunta('¿Cansancio?'),
    pregunta('¿Dolor de cabeza?'),
    pregunta('¿Dolor de estomago?'),
    pregunta('¿Infiltraciones de sangre en la piel?').

malaria :- padece_malaria,
    pregunta('¿Fiebre?'),
    pregunta('¿Escalofrios?'),
    pregunta('¿Tiritonas?'),
    pregunta('¿Sudoracion?'),
    pregunta('¿Cefaleas y dolores generalizados de musculos y articulaciones?'),
    pregunta('¿Vomito y diarrea?').

desconocido :- se_desconoce_enfermedad.
    padece_tuberculosis :- pregunta('¿padece o tiene tos con sangre o esputo? '),!.
    padece_sida :- pregunta('¿padece o tiene fiebre?'),!.
    padece_peste :- pregunta('¿padece o tiene fiebre?'),!.
    padece_malaria :- pregunta('¿padece o tiene fiebre?'),!.

:-dynamic si/1,no/1. %Me permite considerar SI o NO

preguntar(Problema):- new(Di,dialog('EXAMEN MEDICO')),
new(L2,label(texto,'Responde las siguientes preguntas:')),
new(La,label(prob,Problema)),

%Aqui se crean los botones de SI o NO
new(B1,button(si,and(message(Di,return,si)))),
new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
send(Di,append(La)),
send(Di,append(B1)),
send(Di,append(B2)),

         send(Di,default_button,si),
send(Di,open_centered),get(Di,confirm,Answer),
write(Answer),send(Di,destroy),
%Aqui se pregunta si o no del problema
         ((Answer==si)->assert(si(Problema));
assert(no(Problema)),fail).
pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
%Aqui se limpiara en caso de darle salir
limpiar:-retract(si(_)),fail.
limpiar:-retract(si(_)),fail.
limpiar.

%En esta parte ira llamando las enfermedades
botones:- lim,
send(@boton, free),
send(@btncarrera,free),
enfermedades(Enfer),
send(@texto, selection('De acuerdo con sus respuestas obtenidas usted padece de:')),

send(@resp1, selection(Enfer)),
send(@resp1,font,font(comic,bold,15)),
new(@boton, button('Iniciar su Evaluacion',message(@prolog, botones))),
send(Menu, display,@boton,point(40,50)),
send(Menu, display,@btncarrera,point(20,50)),
limpiar.
lim:-send(@resp1, selection('')).

