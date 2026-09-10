:- module(solucion,_).


name(joaquin).

ejercicio01 :-
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


ejercicio02 :-
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