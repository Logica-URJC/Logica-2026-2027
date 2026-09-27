

:- include('DeduccionNatural'). %% dn/3
:- include(practica).           %% test/1 enunciado/2
:- include(solucion).           %% alumno/3, proof/2 


main :-
    alumno(Name,Mail,Grade),
    format("\nAlumno = ~p",[Name]),
    format("\nCorreo electrónico = ~p",[Mail]),
    format("\nGrado = ~p\n\n",[Grade]),
    eval_test(0,Nota),
    format("\nNota Practica = ~p\n\n",[Nota]).
    
eval_test(N,Nota) :-
    test(Tests),
    eval_test_(Tests,N,Nota).

eval_test_([fin],Nota,Nota).
eval_test_([T|Ts],Nin,Nout) :-
    enunciado(T,Premisas,Consecuente),
    format("\n* Evaluar: ~p\n",[T]),
    (  proof(T,Proof),
       format("Comprobar demostración: ~p\n\n", [Proof]),
       dn(Premisas,Consecuente,Proof) ->
        Nmid is Nin + 1
    ;
        Nmid is Nin
    ),
    eval_test_(Ts,Nmid,Nout).
            