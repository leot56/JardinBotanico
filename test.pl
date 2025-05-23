:-include('jardinBotanico').

:- begin_tests(jardin_botanico).

% Tests para el punto 1
%a
test(rose_es_arbusto) :-
    tipo_arbusto(rose).

test(tulip_no_es_arbusto, fail) :-
    tipo_arbusto(tulip).
%b
test(rose_florece_en_primavera) :-
    florece_primavera(rose).

test(lily_no_florece_en_primavera, fail) :-
    florece_primavera(lily).

test(plantas_que_florecen_en_primavera, set(Planta == [orchid, rose, tulip])) :-
    florece_primavera(Planta).
%c
test(rose_tiene_color_rojo) :-
    tiene_color(rose, rojo).

test(el_color_de_rose_no_es_amarillo, fail) :-
    tiene_color(rose, amarillo).


% Tests para el punto 2
%a
test(ninguna_planta_necesita_riego_especial, fail) :-
    planta(_, requiere(riego_especial)).

%b
test(plantas_que_atraen_insectos_beneficos, set(Planta == [rose, sunflower, tulip])) :-
    planta(Planta, atrae(insectos_beneficos)).

test(lily_no_atrae_insectos_beneficos, fail):-
    planta(lily, atrae(insectos_beneficos)).

test(atrae_insectos_color_amarillo) :-
    planta(sunflower, atrae(insectos_beneficos)).

test(atrae_insectos_rojo) :-
    planta(rose, atrae(insectos_beneficos)).
%c
test(bamboo_planta_alta) :-
    planta(bamboo, considerada(alta)).

test(lily_no_es_planta_alta, fail) :-
    planta(lily, considerada(alta)).

%Tests Para el punto 3
    
test(rose_no_es_corta_y_ni_flor, fail) :-
    corta_y_flor(rose).

test(sunflower_no_es_corta_y_flor, fail) :-
    corta_y_flor(sunflower). 

test(plantas_que_son_cortas_y_flores, set(Planta == [lily, tulip, orchid])) :-
    corta_y_flor(Planta).

test(plantas_cortas_y_flor_no_es_flor, fail) :-
    plantas_cortas_flores(Plantas),
    member(cactus, Plantas).

test(plantas_cortas_y_flor_tiene_tres_elementos) :-
    plantas_cortas_flores(Plantas),
    length(Plantas, 3).

% Test para el punto 4
test(hay_relacion_planta_observador) :-
    relaciona_planta_observador(rose, arbol_rojo).

test(no_hay_relacion_planta_observador, fail) :-
    relaciona_planta_observador(lily, arbol_rojo).

% Test para el punto 5
test(cantidad_pistas_cumple_rose) :-
    cantidad_pistas_cumple(rose, 7).

test(cantidad_pistas_cumple_bamboo) :-
    cantidad_pistas_cumple(bamboo, 6).

test(rose_atrae_mas_visitas_que_bamboo) :-
    atrae_mas_visitas(rose, bamboo).

test(bamboo_no_atrae_mas_visitas_que_rose, fail) :-
    atrae_mas_visitas(bamboo, rose).
    
:- end_tests(jardin_botanico).
