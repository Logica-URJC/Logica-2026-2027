

:- include('DeduccionNatural').
:- include(solucion).

main :-
    name(N), format("\nAlumno = ~p\n\n",[N]),
    P is 0,
    ( ejercicio01 ->
        P1 is P + 1
    ;
        P1 is P
    ),
    ( ejercicio02 ->
        P2 is P1 + 1
    ;
        P2 is P1
    ),
    ( ejercicio03 ->
        P3 is P2 + 1
    ;
        P3 is P2
    ),
    format("\nNota Practica = ~p\n\n",[P3]).
    
