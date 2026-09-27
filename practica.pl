%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Practica 1 Lógica Proposicional %%
%% Octubre 2026 - URJC             %%
%% Autor: Joaquín Arias            %%


% Ejemplo diapositiva 48 del tema 2
enunciado(ejercicio01,
          [
              s and p or q,
              p --> ! r,
              q --> ! r
          ],
          s and ! r
         ).

enunciado(ejercicio02,
          [
              !p --> q and !q
          ],
          p
         ).

enunciado(ejercicio03,
          [
              p and q --> r,
              !r
          ],
          !p or !q
         ).

enunciado(ejercicio04,
          [
              p or q,
              p --> r,
              q --> s,
              !r
          ],
          s
         ).

enunciado(ejercicio05,
          [
              p --> q or r,
              !q,
              !r
          ],
          !p
         ).

enunciado(ejercicio06,
          [
              p and (q or r),
              q --> !s,
              r --> !s
          ],
          !s
         ).

enunciado(ejercicio07,
          [
              p or q,
              !p or r,
              !q or r
          ],
          r
         ).

enunciado(ejercicio08,
          [
              p --> q and r,
              !q or s,
              !r or t,
              !s,
              !t
          ],
          !p
         ).

enunciado(ejercicio09,
          [
              p and q --> r,
              r --> s,
              !s,
              t or q,
              !t
          ],
          !p
         ).

enunciado(ejercicio10,
          [
              p or q,
              p --> r and s,
              q --> t,
              !r or !t,
              !s --> u,
              !u
          ],
          !p
         ).


test(
    [
        ejercicio01,
        ejercicio02,
        ejercicio03,
        ejercicio04,
        ejercicio05,
        ejercicio06,
        ejercicio07,
        ejercicio08,
        ejercicio09,
        ejercicio10,
        fin
    ]).        