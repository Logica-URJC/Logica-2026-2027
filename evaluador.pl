

:- include('DeduccionNatural'). %% dn/3
:- include(practica).           %% test/1 enunciado/2
:- include(solucion).           %% proof/2 name/1


main :-
    name(Name),
    format("\nAlumno = ~p\n\n",[Name]),
    eval_test(0,Nota),
    format("\nNota Practica = ~p\n\n",[Nota]).
    
eval_test(N,Nota) :-
    test(Tests),
    eval_test_(Tests,N,Nota).

eval_test_([fin],Nota,Nota).
eval_test_([T|Ts],Nin,Nout) :-
    enunciado(T,Premisas,Consecuente),
    format("\nEvaluar: ~p\n",[T]),
    (  proof(T,Proof),
       format("Comprobar demostración: ~p\n\n", [Proof]),
       dn(Premisas,Consecuente,Proof) ->
        Nmid is Nin + 1
    ;
        Nmid is Nin
    ),
    eval_test_(Ts,Nmid,Nout).
            