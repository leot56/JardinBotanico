:-include('jardinBotanico').

:- begin_tests(jardin_botanico).

% Tests para el punto 1

test(rose_es_arbusto) :-
    tipo_arbusto(rose).

test(tulip_no_es_arbusto, fail) :-
    tipo_arbusto(tulip).

test(rose_florece_en_primavera) :-
    florece_primavera(rose).

test(lily_no_florece_en_primavera, fail) :-
    florece_primavera(lily).

test(plantas_que_florecen_en_primavera, set(Planta == [orchid, rose, tulip])) :-
    florece_primavera(Planta).

test(rose_tiene_color_rojo) :-
    tiene_color(rose, rojo).

test(el_color_de_rose_no_es_amarillo, fail) :-
    tiene_color(rose, amarillo).


% Tests para el punto 2

test(ninguna_planta_necesita_riego_especial, fail) :-
    requiere_riego_especial(_).

test(plantas_que_atraen_insectos_beneficos, set(Planta == [rose, sunflower, tulip])) :-
    atrae_insectos_beneficos(Planta).

test(rose_planta_alta) :-
    considerada_alta(rose).

test(lily_no_es_planta_alta, fail) :-
    considerada_alta(lily).

%Tests Para el punto 3
test(plantas_cortas_de_tipo_flor, set(Planta == [lily, orchid, tulip])) :-
    plantas_cortas_flores(Planta).

% Test para el punto 4
test(hay_relacion_planta_observador) :-
    relaciona_planta_observador(rose, arbol_rojo).

test(no_hay_relacion_planta_observador, fail) :-
    relaciona_planta_observador(lily, arbol_rojo).

% Test para el punto 5
test(cantidad_pistas_cumple_rose) :-
    cantidad_pistas_cumple(rose, 9).

test(cantidad_pistas_cumple_bamboo) :-
    cantidad_pistas_cumple(bamboo, 6).

test(rose_atrae_mas_visitas_que_bamboo) :-
    atrae_mas_visitas(rose, bamboo).

test(bamboo_no_atrae_mas_visitas_que_rose, fail) :-
    atrae_mas_visitas(bamboo, rose).
    
:- end_tests(jardin_botanico).
