# Makefile para ejecutar múltiples programas Prolog

.PHONY: all clean

# Lista de programas Prolog
PROLOG_FILES = programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl \
               programa6.pl programa7.pl programa8.pl programa9.pl programa11.pl \
               programa13.pl programa14.pl programa15.pl programa16.pl programa17.pl \
               programa18.pl programa19.pl programa20.pl programa21.pl programa22.pl \
               programa23.pl programa24.pl programa25.pl

# Objetivo por defecto: compilar y ejecutar todos los programas
all: run_programa1 run_programa2 run_programa3 run_programa4 run_programa5 \
     run_programa6 run_programa7 run_programa8 run_programa9 run_programa11 \
     run_programa13 run_programa14 run_programa15 run_programa16 run_programa17 \
     run_programa18 run_programa19 run_programa20 run_programa21 run_programa22 \
     run_programa23 run_programa24 run_programa25

# Reglas para ejecutar cada programa
run_programa1: programa1.pl
	swipl -s programa1.pl -g "programa1(X, [a, b, c, d]), write('El último elemento es: '), write(X), nl, halt."

run_programa2: programa2.pl
	swipl -s programa2.pl -g "programa2(X, [a, b, c, d]), write('El penúltimo elemento es: '), write(X), nl, halt."

run_programa3: programa3.pl
	swipl -s programa3.pl -g "programa3(X, [a, b, c, d, e], 3), write('El 3-esimo elemento es: '), write(X), nl, halt."

run_programa4: programa4.pl
	swipl -s programa4.pl -g "programa4([a, b, c, d, e], N), write('La longitud de la lista es: '), write(N), nl, halt."

run_programa5: programa5.pl
	swipl -s programa5.pl -g "programa5([a, b, c, d, e], R), write('La lista invertida es: '), write(R), nl, halt."

run_programa6: programa6.pl
	swipl -s programa6.pl -g "programa6([a, b, c, b, a]), write('La lista es un palíndromo: true'), nl, halt."

run_programa7: programa7.pl
	swipl -s programa7.pl -g "programa7([1, [2, 3], 4, [5, [6, 7]]], Flat), write('Lista aplanada: '), write(Flat), nl, halt."

run_programa8: programa8.pl
	swipl -s programa8.pl -g "programa8([a, a, b, b, c, a, a, d], R), write('Lista sin duplicados consecutivos: '), write(R), nl, halt."

run_programa9: programa9.pl
	swipl -s programa9.pl -g "programa9([a, a, b, b, c, a, a, d], R), write('Lista agrupada: '), write(R), nl, halt."

run_programa11: programa11.pl
	swipl -s programa11.pl -g "programa11([a, a, b, c, c, a, d], R), write('Lista modificada: '), write(R), nl, halt."

run_programa13: programa13.pl
	swipl -s programa13.pl -g "programa13([1, 2, 3], R), write('Lista codificada: '), write(R), nl, halt."

run_programa14: programa14.pl
	swipl -s programa14.pl -g "programa14([1, 2, 3], R), write('Lista duplicada: '), write(R), nl, halt."

run_programa15: programa15.pl
	swipl -s programa15.pl -g "programa15([1, 2, 3], 2, R), write('Lista duplicada 2 veces: '), write(R), nl, halt."

run_programa16: programa16.pl
	swipl -s programa16.pl -g "programa16([a, b, c, d], N), write('Lista con elementos eliminados: '), write(N), nl, halt."

run_programa17: programa17.pl
	swipl -s programa17.pl -g "programa17([1, 2, 3, 4, 5], L1, L2), write('Lista dividida: '), write(L1), write(', '), write(L2), nl, halt."

run_programa18: programa18.pl
	swipl -s programa18.pl -g "programa18([a, b, c, d, e], 2, R), write('Sublista: '), write(R), nl, halt."

run_programa19: programa19.pl
