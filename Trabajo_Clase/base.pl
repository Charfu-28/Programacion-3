%=================CAUSAS FALLA HEPÁTICA AGUDA=================
escausa(infeccion_viral,fallahepatica).
escausa(drogas,fallahepatica).
escausa(toxinas,fallahepatica).
escausa(otras,fallahepatica).
%=================SINTOMAS ENCEFALOPATÍA HEPÁTICA=================
sintoma_FHA(grado1;grado2,llantoinconsolable).
sintoma_FHA(grado1;grado2,insomnio).
sintoma_FHA(grado1;grado2,desantencion).
sintoma_FHA(grado3,somnolencia).
sintoma_FHA(grado3,agresividad).
sintoma_FHA(grado3,estupor).
sintoma_FHA(grado4,comatoso).
sintoma_EH(grado1,confusion).
sintoma_EH(grado,cambio_humor).
sintoma_EH(grado2,somnoliento).
sintoma_EH(grado2,desorientado).
sintoma_EH(grado2,comportamientoinadecuado).
sintoma_EH(grado3,estuporoso).
sintoma_EH(grado3,aletardado).
sintoma_EH(grado4A,comaprofundo).
sintoma_EH(grado4A,comatoso).
%=================TRATAMIENTO ENCEFALOPATÍA HEPÁTICA=================
%===================DIETA-PROTEINAS================
tratamiento(oral_45mlc/hora,disacaridos).
tratamiento(oral_45mlc/hora,lactulosa).
tratamiento(oral_30gr/dia,lactosa).
tratamiento(oral_30gr/dia,lactito).
tratamiento(oral_5gr/dia,benzoatodesodio).
tratamiento(oral_9gr/dia,aspartatodeornitina).
%===================ANTIBIOTICOS=================
tratamiento(oral_3gr/dia,neomicina).
tratamiento(oral_2gr/dia,aguda).
tratamiento(oral_2gr/dia,cronica).
tratamiento(oral_500mg/dia,metronidazol).
tratamiento(oral_400mg/dia,rifaximina).
tratamiento(intravenoso_1mg/dia,flumazenil).
tratamiento(oral_60mg/dia,bromocriptina).

diagnostico(A,Y):- sintoma(A,Y).

