%=================CAUSAS FALLA HEPÁTICA AGUDA===================
escausa(hepatitis_a,infeccion_viral).
escausa(hepatitis_b,infeccion_viral).
escausa(hepatitis_c,infeccion_viral).
escausa(hepatitis_d,infeccion_viral).
escausa(hepatitis_e,infeccion_viral).
escausa(herpes_simplex,infeccion_viral).
escausa(influenza,infeccion_viral).
escausa(ebola,infeccion_viral).
escausa(paracetamol,drogas).
escausa(isoniazida,drogas).
escausa(nitrofurantoina,drogas).
escausa(amoxicilina,drogas).
escausa(acido_valproico,drogas).
escausa(sales_de_oro,drogas).
escausa(sulfas,drogas).
escausa(hongos,toxinas).
escausa(solventes_organicos,toxinas).
escausa(hierbas_medicinales,toxinas).
escausa(bacteria,toxinas).
escausa(higado_graso,otras).
escausa(leucemia,otras).
escausa(linfoma,otras).
escausa(tuberculosis,otras).
%======================SINTOMAS ENCEFALOPATÍA HEPÁTICA=================
essintoma_FHA(grado1;grado2,llanto_inconsolable).
essintoma_FHA(grado1;grado2,insomnio).
essintoma_FHA(grado1;grado2,desatencion).
essintoma_FHA(grado3,somnolencia).
essintoma_FHA(grado3,agresividad).
essintoma_FHA(grado3,estupor).
essintoma_FHA(grado4,comatoso).
essintoma_EH(grado1,confusion).
essintoma_EH(grado1,cambio_humor).
essintoma_EH(grado2,somnoliento).
essintoma_EH(grado2,desorientado).
essintoma_EH(grado2,comportamiento_inadecuado).
essintoma_EH(grado3,estuporoso).
essintoma_EH(grado3,aletardado).
essintoma_EH(grado4,comaprofundo).
essintoma_EH(grado4,comatoso).
% ===================CLASIFICACION DE LO GRADOS=========================
etapa(temprana,grado1).
etapa(temprana,grado2).
etapa(media,grado3).
etapa(tardia,grado4).
%=================TRATAMIENTO ENCEFALOPATÍA HEPÁTICA===================
%===================DIETA-PROTEINAS================
tratamiento(oral_45mlc/hora,disacaridos).
tratamiento(oral_45mlc/hora,lactulosa).
tratamiento(oral_30gr/dia,lactosa).
tratamiento(oral_30gr/dia,lactito).
tratamiento(oral_5gr/dia,benzoatodesodio).
tratamiento(oral_9gr/dia,aspartato_de_ornitina).
% =============================ANTIBIOTICOS===============================
tratamiento(rifaximina,Y):-Y=hepatitis_b.
tratamiento(flumazenil,Y):-Y=hepatitis_c.
tratamiento(metronidazol,Y):-Y=hepatitis_e.
tratamiento(hidratantes,Y):-Y=nitrofurantoina.
tratamiento(baycuten,Y):-Y=bacteria.
tratamiento(bromocriptina,Y):-Y=acido_valproico.
tratamiento(penicilina,Y):-Y=hepatitis_a;Y=hepatitis_d.
tratamiento(aciclovir,Y):-Y=herpes_simplex.
tratamiento(azanamivir,Y):-Y=influenza.
tratamiento(liquidos_intravenosos,Y):-Y=ebola.
tratamiento(vitamina_a,Y):-Y=paracetamol;Y=isoniazida;Y=amoxicilina;Y=sales_de_oro;Y=sulfas.
tratamiento(toxina_butolinica,Y):-Y=hongos;Y=solventes_organicos;Y=hierbas_medicinales.
tratamiento(trasplante_de_medula_osea,Y):-Y=leucemia.
tratamiento(metformina,Y):-Y=higado_graso.
tratamiento(rituximab,Y):-Y=linfoma.
tratamiento(atambutol,Y):-Y=tuberculosis.
% ============================DIAGNOSTICO===================================
diagnostico(grado1,X):-X=imnsomio;X=llanto_inconsolable;X=desatencion.
diagnostico(grado2,X):-X=imnsomio;X=llanto_inconsolable;X=desatencion;X=inquieto.
diagnostico(grado3,X):-X=somnolencia;X=estupor;X=agresividad.
diagnostico(grado4,X):-X=comatoso;X=comaprofundo.
% =================================REGLAS===================================
estratamiento(X,Y):-escausa(Y,A),tratamiento(Y,X).    % permite consultar si X medicamento sirve para Y enferemedad
essintoma_EH(B,Y):-diagnostico(B,Y),etapa(Z,B).	      % me permite verificar los sintomas segun el grado
etapa(Y,B):-diagnostico(B,E),essintoma_FHA(B,E).      % permite consultar la etapa
