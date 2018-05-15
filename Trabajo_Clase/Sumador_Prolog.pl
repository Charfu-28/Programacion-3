% Autor:
% Fecha: 12/05/2017

:-pce_image_directory('./imagenes').
resource(imagen1,image,image('4.jpg')).
resource(imagen2,image,image('5.jpg')).

sumar(N1,N2,R):-atom_number(N1,N1C),atom_number(N2,N2C),Resultado is N1C + N2C, send(R, selection, Resultado).
cambiar(X):-send(X,selection,resource(imagen2)).
inicial(Y):-send(Y,selection,resource(imagen1)).

:- new(Dialogo, dialog('Mi primera Interfaz')),
   new(Etiqueta, label(nombre,'SUMADOR')),
   new(EtiquetaImg,label(nombre2, resource(imagen1))),
   new(Texto1, text_item('Ingrese el Primer Numero')),
   new(Texto2, text_item('Ingrese el Segundo Numero')),
   new(Texto3, text_item('Resultado')),
   new(Boton1, button('Sumar',message(@prolog,sumar,Texto1?selection,Texto2?selection,Texto3))),
   new(Boton2, button('Salir',message(Dialogo, destroy))),
   
   send(Etiqueta, font, font(times, bold, 20)),
   send(Texto3, editable, false),
   
   new(VentanaEmergente, popup),
   send_list(VentanaEmergente, append, [menu_item('Cambiar Imagen',message(@prolog,cambiar,EtiquetaImg)),
                                        menu_item('Imagen Inicial',message(@prolog,inicial,EtiquetaImg))
                                        ]),
   send(Boton1,popup,VentanaEmergente),
                                        
   send_list(Dialogo, append, [Etiqueta,EtiquetaImg,Texto1,Texto2,Texto3,Boton1,Boton2]),
   send(Dialogo, open).
   