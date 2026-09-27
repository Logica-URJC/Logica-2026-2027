

test(
    [
        ejercicio01,
        ejercicio02,
        ejercicio03,
        ejercicio04,
        %% ejercicio05,
        %% ejercicio06,
        %% ejercicio07,
        %% ejercicio08,
        %% ejercicio09,
        %% ejercicio10,
        fin
    ]).

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
              s and p or q,
              p --> ! r,
              q --> ! r
          ],
          s and ! r
         ).

enunciado(ejercicio04,
          [
              s and p or q,
              p --> ! r,
              q --> ! r
          ],
          s and ! r
         ).


        