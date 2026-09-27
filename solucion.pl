%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Archivo para completar por el alumnos %%


%% alumno(+Nombre, +Correo, +Grado) is det.
%
%  Representa un alumno de la asignatura.
%
%  @param +Nombre: Nombre completo del alumno.
%  @param +Correo: Correo electrónico institucional.
%  @param +Grado:  Grado del alumno (Ciber | IA).

alumno('Joan Clarke', 'j.clarke.2026@alumnos.urjc.es', 'Ciber').

%% Ejemplo alumno de IA
% alumno('John McCarthy', 'j.mccarthy.2026@alumnos.urjc.es', 'IA').


%% Este ejercicio esta ya resuelto
proof(ejercicio01,
      [
          'Premisa'(1),
          'E' and b(1),
          'Premisa'(2),
          'Premisa'(3),
          'E' or (2, 3, 4),
          'E' and a(1),
          'I' and (6, 5)
      ]).

proof(ejercicio02,
      [
          % Completar con la demostración
      ]).


% Incluir el resto de demostraciones



%% Puedes incluir reglas derivadas %%
rule(_,_,_,_) :- fail.