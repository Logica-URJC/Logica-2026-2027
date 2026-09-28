# Práctica 1 · Lógica Proposicional (Curso 2026-2027)

Repositorio de entrega de la **Práctica 1** de la asignatura **Lógica**  
(Grado en Ingeniería de la Ciberseguridad, ETSII - URJC).

## 🎯 Objetivo

Practicar los conceptos de **lógica proposicional** mediante la resolución de 10 ejercicios de **deducción natural**, utilizando:

- [DeduccionNatural.pl y DeduccionNatural.blockly](https://github.com/Xuaco/DeduccionNatural)
- Repositorio personal en GitHub con evaluación automática (GitHub Actions)

## 🧩 Estructura del repositorio

Este repositorio contiene, como mínimo:

- `solucion.pl` → archivo donde debes:
  - completar tus datos en `alumno/3`
  - incluir las demostraciones en `proof/2` para los ejercicios 01–10
- `README.md` → instrucciones de uso y entrega

## ✅ Qué hay que hacer en `solucion.pl`

1. Rellenar el predicado:

```prolog
alumno('Nombre Apellidos', 'correo@alumnos.urjc.es', 'Grado').
```

2. Completar las pruebas `proof/2` de los ejercicios.

3. (Opcional, si procede) añadir reglas derivadas con `rule/4`:

```prolog
rule(Nombre, Premisas, Consecuente, Demostracion).
```

> El `ejercicio01` aparece resuelto como ejemplo en la plantilla.


## 🛠 Herramientas recomendadas

- Repositorio oficial con manuales y vídeos:  
  👉 [https://github.com/Xuaco/DeduccionNatural](https://github.com/Xuaco/DeduccionNatural)

- Enlace web de apoyo para la práctica (draft/alternativa):  
  👉 [https://platon.etsii.urjc.es/~jarias/DN/Practica/2026-2027](https://platon.etsii.urjc.es/~jarias/DN/Practica/2026-2027)

## 🔁 Evaluación automática (GitHub Actions)

Cada `commit` lanza la corrección automática.

Para ver el resultado:

1. Ve a la pestaña **Actions**
2. Abre el flujo del último commit
3. Consulta **Summary** (apartado de calificación)
4. (Opcional) descarga el **artifact** con detalle de evaluación y nota

---

## 👤 Datos del alumno

Rellenar en `solucion.pl`:

- Nombre completo
- Correo institucional URJC
- Grado: `Ciber` o `IA`

---

**Autores del enunciado:** Iván Bernabé Sánchez, Joaquín Arias Herrero.
