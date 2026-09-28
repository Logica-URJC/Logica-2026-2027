%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Copyright (C)2026 Joaquín Arias (URJC)
%  Name: DeduccionNatural.pl
%  Author: Joaquín Arias
%  Version x.0
%  Date: 28 September 2026
%  LICENSE: Apache License 2.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Operator precedence
:- op(200, fy, !).
:- op(400, xfy,[and, or]).
:- op(600, xfy,[-->, <->]).

% Auxiliary precedence for !
% Used to define the inference rules
:- op(400, xfy, !).

:- discontiguous rule/4.
rule(_,_,_,_) :- fail. %% 

%% Examples
ejemplo1 :-
    dn(
        [
            s and p or q,
            p --> ! r,
            q --> ! r
        ],
        s and ! r,
        [
            'Premisa'(1),
            'E' and b(1),
            'Premisa'(2),
            'Premisa'(3),
            'E' or (2, 3, 4),
            'E' and a(1),
            'I' and (6, 5)
        ]
    ).

ejemplo2 :-
    dn(
        [
            !p --> q and !q
        ],
        p,
        [
            'Premisa'(1),
            'I' ! (1),
            'E' ! (2)
        ]
    ).

ejemplo3 :-
    dn(
        [
            p --> !r,
            !r-->q, p
        ],
        q,
        [
            'Premisa'(1),
            'Premisa'(3),
            'E' --> (1, 2),
            'Premisa'(2),
            'E' --> (4, 3)
        ]
    ).

ejemplo4 :-
    dn(
        [
            p --> q,
            q --> r
        ],
        p --> r,
        [
            'Premisa'(1),
            'Premisa'(2),
            'Supuesto'(p),
            'E' --> (1, 3),
            'E' --> (2, 4),
            'I' --> (3, 5)
        ]
    ).

ejemploMT :-
    dn(
        [
            r --> (q and s),
            !(q and s)
        ],
        !r,
        [
            'Premisa'(1),
            'Premisa'(2),
            'MT'(1, 2)
        ]
    ).

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ADD here your examples and/or derived rules ;-)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% This example fails becuase the assumption is not closed
ejemploSupuesto :- 
    dn( [ s and p or q, p --> ! r, q --> ! r ],
          s and ! r,
          [ 'Premisa'(1),
            'E' and b(1),
            'Premisa'(2),
            'Premisa'(3),
            'Supuesto'(p1),
            'Supuesto'(p2),
            'Supuesto'(p3),
%            'I' --> (6,5),
            'I' --> (7,5),
            'Supuesto'(p4),
            'Supuesto'(s and !r)
          ]).

%% Bug found by students of the cybersecurity degree of the URJC in
%% the academic year 23/24. Solved in 24 October 2023 
bug :-
    dn([s --> c],
        c,
        [ 'Premisa'(1),
          'Supuesto'(s),
          'E' --> (1,2),
          'I' --> (2,3),
          'I' or a(3,sa),
          'E' --> (5,2)
        ]).

:- data counter/1, formula/2, tabular/1, closed/1, opened/1, check/1.
dn(Hypotheses, Deduction, Proof) :-
    retractall(counter(_)), retractall(formula(_,_)), retractall(tabular(_)),retractall(closed(_)),retractall(opened(_)),retractall(check(_)),
    assert(counter(0)), assert(tabular(0)),
    format(" T~p  |-  ~p\n\n",[Hypotheses, Deduction]),
    eval(Hypotheses, Deduction, Proof),
    check_pending.

check_pending :-
    setof(Name, check(Name), Pending), !,
    check_pending_(Pending).
check_pending.

check_pending_([]).
check_pending_([Name|Ns]) :-
    retractall(counter(_)),retractall(formula(_,_)), retractall(tabular(_)),retractall(closed(_)),retractall(opened(_)),
    assert(counter(0)), assert(tabular(0)),
    rule(Name, Hypotheses, Deduction, Proof), !,
    numbervars([Hypotheses, Deduction, Proof], 0, _),
    format("\n\n Demostración de la regla auxiliar ~p:  T~p  |-  ~p\n\n",[Name,Hypotheses,Deduction]),
    eval(Hypotheses, Deduction, Proof), !,
    check_pending_(Ns).

eval(Hypotheses, Deduction, [ Rule | Proof ]) :-
    eval_rule(Rule, Hypotheses),
    eval(Hypotheses, Deduction, Proof).
eval(_, Deduction, []) :-
    check_deduccion(Deduction).

eval_rule(R, P):-
    (   exec(R, P) ->
        output(R)
    ;
        format("\nFALLO: No se puede aplicar la regla \t\t~p\n\n", [R]), !, fail
    ).

exec('Premisa'(C), Hypotheses) :- !,
    'Premisa'(C, Hypotheses).
exec(Rule,_) :-
    Rule =.. [Name|Args],
    rule(Name,Hypotheses, Deduction, _Proof), !,
    assert(check(Name)),
    exec_rule(Args, Hypotheses, Deduction).
exec(Rule,_) :-
    catch(call(Rule),_,fail).

'Premisa'(1,[P | _Hypotheses]) :- !,
    add_formula(P).
'Premisa'(A,[_ | Hypotheses]) :-
    A1 is A - 1,
    'Premisa'(A1, Hypotheses).

exec_rule(Args, Hypotheses, Deduction) :-
    see_formulas(Args, Formulas),
    Hypotheses = Formulas,
    add_formula(Deduction).
see_formulas([],[]).
see_formulas([A|As], [FA|FAs]) :-
    formula(A, FA),
    see_formulas(As, FAs).

check_deduccion(Deduction) :-
    retract(counter(C)),
    formula(C, Formula),
    (   opened(_) ->
        findall(A, opened(A), LA),
        format("\nFALLO: Supuesto(s) '~w' no está(n) cerrado(s)\n\n",[LA]),!,fail
    ;
        (   Formula = Deduction ->
            format("~50|ok",[])
        ;
            format("\nFALLO: Se demuestra '~w' en lugar de '~w'\n\n",[Formula,Deduction]),!,fail
        )
    ).

add_formula(Formula) :-
    next_couonter(C),
    asserta(formula(C, Formula)).

next_couonter(C1) :-
    retract(counter(C)),
    C1 is C + 1,
    asserta(counter(C1)).
    

output(Rule) :-
    tabular(T),
    counter(C),
    formula(C, Formula),
    format("  ~p~5|",[C]),
    format_tabular(T),
    format("~p",[Formula]),
    format("~50|~p\n",[Rule]).    

increase_tab :-
    retract(tabular(Tab)),
    Tab1 is Tab + 1,
    assert(tabular(Tab1)).
decrease_tab :-
    retract(tabular(Tab)),
    Tab1 is Tab - 1,
    assert(tabular(Tab1)).

format_tabular(0) :- !.
format_tabular(T) :-
    T1 is T - 1,
    format("     ",[]),
    format_tabular(T1).


%% Inference Rules
% Conjunction
'I' and (A, B) :-
    formula(A, FA), is_valid(A),
    formula(B, FB), is_valid(B),
    add_formula(FA and FB).

'E' and a(A) :-
    formula(A, FA and _FB), is_valid(A),
    add_formula(FA).
'E' and b(A) :-
    formula(A, _FA and FB), is_valid(A),
    add_formula(FB).
% Disjuncion
'E' or (A, B, C) :-
    formula(A, FB or FC), is_valid(A),
    formula(B, FB --> F), is_valid(B),
    formula(C, FC --> F), is_valid(C),
    add_formula(F).

'I' or a(A, Formula) :-
    formula(A, FA), is_valid(A),
    add_formula(FA or Formula).
'I' or b(Formula, B) :-
    formula(B, FB), is_valid(B),
    add_formula(Formula or FB).
% Negation
'I' ! (A) :-
    formula(A, FA --> B and ! B), is_valid(A),
    add_formula(! FA).

'E' ! (A) :-
    formula(A, ! ! FA), is_valid(A),
    add_formula(FA).
% Implication
'E' --> (A, B) :-
    formula(A, FB --> FC), is_valid(A),
    formula(B, FB), is_valid(B),
    add_formula(FC).
'I' --> (A, B) :-
    formula(A, FA), is_valid(A),
    last_opened(A),
    formula(B, FB), is_valid(B),
    close_assumption(A),
    add_formula(FA --> FB).
'Supuesto'(FA) :-
    increase_tab,
    add_formula(FA),
    counter(C),
    asserta(opened(C)).
% Bi-Implication
'I' <-> (A, B) :-
    formula(A, FA --> FB), is_valid(A),
    formula(B, FB --> FA), is_valid(B),
    add_formula(FA <-> FB).
'E' <-> a(A) :-
        formula(A, FA <-> FB), is_valid(A),
        add_formula(FA --> FB).
'E' <-> b(A) :-
        formula(A, FA <-> FB), is_valid(A),
        add_formula(FB --> FA).

% Auxiliary predicates
last_opened(A) :-
    retract(opened(L)),
    (   L = A ->
        true
    ;
        format("\nFALLO: Cerrar antes el supuesto '~w'", [L]), !, fail
    ).
is_valid(A) :-
    (   valid(A) ->
        true
    ;
        format("\nFALLO: La fórmula '~p' está en un supuesto cerrado", [A]), !, fail
    ).
valid(B) :-
    \+ closed(B).
close_assumption(A) :-
    counter(C),
    between(A, C, C1),
    assert(closed(C1)),
    fail.
close_assumption(_A) :-
    decrease_tab.

