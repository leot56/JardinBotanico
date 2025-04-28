% swipl -f base.pl 
planta(rose, color(rojo)).
planta(rose, altura(media)).
planta(rose, epoca(floracion, primavera)).
planta(rose, tipo(arbusto)).
planta(lily, color(blanco)).
planta(lily, altura(corta)).
planta(lily, epoca(floracion, verano)).
planta(lily, tipo(flor)).
planta(tulip, color(amarillo)).
planta(tulip, altura(corta)).
planta(tulip, epoca(floracion, primavera)).
planta(tulip, tipo(flor)).
planta(sunflower, color(amarillo)).
planta(sunflower, altura(alta)).
planta(sunflower, epoca(floracion, verano)).
planta(sunflower, tipo(flor)).
planta(cactus, color(verdes)).
planta(cactus, altura(baja)).
planta(cactus, epoca(floracion, verano)).
planta(cactus, tipo(suculenta)).
planta(fern, color(verdes)).
planta(fern, altura(media)).
planta(fern, epoca(floracion, todo_el_ano)).
planta(fern, tipo(helecho)).
planta(orchid, color(purple)).
planta(orchid, altura(corta)).
planta(orchid, epoca(floracion, primavera)).
planta(orchid, tipo(flor)).
planta(bamboo, color(verdes)).
planta(bamboo, altura(alta)).
planta(bamboo, epoca(floracion, todo_el_ano)).
planta(bamboo, tipo(pasto)).
planta(ivy, color(verdes)).
planta(ivy, altura(media)).
planta(ivy, epoca(floracion, todo_el_ano)).
planta(ivy, tipo(plantas_enredaderas)).
plantas_companeras(rose, lily).
plantas_companeras(lily, rose).
plantas_companeras(tulip, sunflower).
plantas_companeras(sunflower, tulip).
plantas_companeras(cactus, fern).
plantas_companeras(fern, cactus).
plantas_companeras(orchid, ivy).
plantas_companeras(ivy, orchid).
plantas_companeras(bamboo, rose).
plantas_companeras(rose, bamboo).

%1
tipo_arbusto(Planta) :- planta(Planta, tipo(arbusto)).
florece_primavera(Planta):- planta(Planta, epoca(floracion, primavera)).
tiene_color(Planta, Color) :- planta(Planta, color(Color)).

%2
requiere_riego_especial(Planta):- tipo_arbusto(Planta), planta(Planta, epoca(floracion, verano).
atrae_insectos_beneficos(Planta):- tiene_color(Planta, amarillo).
atrae_insectos_beneficos(Planta):- tiene_color(Planta, rojo).
considerada_alta(Planta):- not(planta(Planta, tipo(flor)).


% 3. Plantas Cortas y Flores:
plantas_cortas_flores(Planta) :- planta(Planta, altura(corta)), planta(Planta, tipo(flor)).

%4
relaciona_planta_observador(Planta, Observador) :-
    forall(pista(Observador, Caracteristica), planta(Planta, Caracteristica)).

pista(arbol_rojo, tipo(arbusto)).
pista(arbol_rojo, altura(media)).
pista(flor_amarilla, color(amarillo)).
pista(flor_amarilla, tipo(flor)).
pista(planta_verde, color(verdes)).
pista(planta_verde, altura(baja)).
pista(trepadora_todo_ano, tipo(plantas_enredaderas)).
pista(trepadora_todo_ano, epoca(floracion, todo_el_ano)).
pista(flor_primavera, epoca(floracion, primavera)).
pista(flor_corta, altura(corta)).
pista(planta_alta, altura(alta)).
pista(planta_verano, epoca(floracion, verano)).
pista(arbusto_primavera, tipo(arbusto)).
pista(arbusto_primavera, epoca(floracion, primavera)).
pista(flor_morada_primavera, color(purple)).
pista(flor_morada_primavera, epoca(floracion, primavera)).
pista(pasto_alto, tipo(pasto)).
pista(pasto_alto, altura(alta)).
pista(suculenta_verano_baja, tipo(suculenta)).
pista(suculenta_verano_baja, epoca(floracion, verano)).
pista(suculenta_verano_baja, altura(baja)).
pista(helecho_verde_mediano, tipo(helecho)).
pista(helecho_verde_mediano, color(verdes)).
pista(helecho_verde_mediano, altura(media)).

%5     
cumple_pista(Planta, Caracteristica):- pista(_, Caracteristica), planta(Planta, Caracteristica).

cantidad_pistas_cumple(Planta, Count):- 
    findall(Pista, cumple_pista(Planta, Pista), Pistas),
    length(Pistas, Count).
     
atrae_mas_visitas(Planta, Companiera):-
    plantas_companeras(Planta, Companiera),
    cantidad_pistas_cumple(Planta, MisVisitas),
    cantidad_pistas_cumple(Companiera, SusVisitas),
    MisVisitas > SusVisitas.
