# Makefile para ejecutar múltiples programas Prolog

.PHONY: all clean

# Lista de programas Prolog
PROLOG_FILES = programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl \
               programa6.pl programa7.pl programa8.pl programa9.pl programa10.pl \
               programa11.pl programa12.pl programa13.pl programa14.pl programa15.pl \
               programa16.pl programa17.pl programa18.pl programa19.pl programa20.pl \
               programa21.pl programa22.pl programa23.pl programa24.pl programa25.pl \
               programa26.pl programa27.pl programa28.pl programa29.pl programa30.pl \
               programa31.pl programa32.pl programa33.pl  # Agregado programa33

# Objetivo por defecto: compilar y ejecutar todos los programas
all: run_programa1 run_programa2 run_programa3 run_programa4 run_programa5 \
     run_programa6 run_programa7 run_programa8 run_programa9 run_programa10 \
     run_programa11 run_programa12 run_programa13 run_programa14 run_programa15 \
     run_programa16 run_programa17 run_programa18 run_programa19 run_programa20 \
     run_programa21 run_programa22 run_programa23 run_programa24 run_programa25 \
     run_programa26 run_programa27 run_programa28 run_programa29 run_programa30 \
     run_programa31 run_programa32 run_programa33

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

run_programa10: programa10.pl
	swipl -s programa10.pl -g "programa10([a, a, b, b, c, a, a, d], R), write('Lista codificada: '), write(R), nl, halt."

run_programa11: programa11.pl
	swipl -s programa11.pl -g "programa11([a, a, b, c, c, a, d], R), write('Lista modificada: '), write(R), nl, halt."

run_programa12: programa12.pl
	swipl -s programa12.pl -g "programa12([[2,a], [1,b], [3,c], [1,a], [2,d]], R), write('Lista decodificada: '), write(R), nl, halt."

run_programa13: programa13.pl
	swipl -s programa13.pl -g "programa13([a, a, b, b, c, c, a], R), write('Lista codificada: '), write(R), nl, halt."

run_programa14: programa14.pl
	swipl -s programa14.pl -g "programa14([1, 2, 3], R), write('Lista duplicada: '), write(R), nl, halt."

run_programa15: programa15.pl
	swipl -s programa15.pl -g "programa15([1, 2, 3], 2, R), write('Lista duplicada 2 veces: '), write(R), nl, halt."

run_programa16: programa16.pl
	swipl -s programa16.pl -g "programa16([a, b, c, d, e, f, g, h, i, j], 3, R), write('Lista sin cada 3-esimo elemento: '), write(R), nl, halt."

run_programa17: programa17.pl
	swipl -s programa17.pl -g "programa17([1, 2, 3, 4, 5, 6], 3, L1, L2), write('Primera parte: '), write(L1), nl, write('Segunda parte: '), write(L2), nl, halt."

run_programa18: programa18.pl
	swipl -s programa18.pl -g "programa18([a, b, c, d, e, f], 2, 4, R), write('Porción de la lista: '), write(R), nl, halt."

run_programa19: programa19.pl
	swipl -s programa19.pl -g "programa19([1, 2, 3, 4, 5], 2, R), write('Lista rotada: '), write(R), nl, halt."

run_programa20: programa20.pl
	swipl -s programa20.pl -g "programa20(X, [1, 2, 3, 4, 5], 3, R), write('Elemento eliminado: '), write(R), nl, halt."

run_programa21: programa21.pl
	swipl -s programa21.pl -g "programa21(3, [1, 2, 4, 5], 3, R), write('Lista después de insertar: '), write(R), nl, halt."

run_programa22: programa22.pl
	swipl -s programa22.pl -g "programa22(1, 5, R), write('Lista en rango: '), write(R), nl, halt."

run_programa23: programa23.pl
	swipl -s programa23.pl -g "programa23([1, 2, 3, 4, 5], 2, R), write('Elementos aleatorios: '), write(R), nl, halt."

run_programa24: programa24.pl
	swipl -s programa24.pl -g "programa24(6, 49, L), write('Números seleccionados: '), write(L), nl, halt."

run_programa25: programa25.pl
	swipl -s programa25.pl -g "programa25([1, 2, 3, 4, 5], P), write('Permutación aleatoria: '), write(P), nl, halt."

run_programa26: programa26.pl
	swipl -s programa26.pl -g "programa26(2, [1, 2, 3, 4], Comb), write('Combinaciones: '), write(Comb), nl, halt."

run_programa27: programa27.pl
	swipl -s programa27.pl -g "programa27([2, 3], [1, 2, 3, 4, 5], Gs), write('Grupos generados: '), write(Gs), nl, halt."

run_programa28: programa28.pl
	swipl -s programa28.pl -g "programa28([[1, 2], [1, 2, 3, 4], [1], [1, 2, 3]], S), write('Lista ordenada: '), write(S), nl, halt."

run_programa29: programa29.pl
	swipl -s programa29.pl -g "programa29([[1, 2], [1, 2, 3, 4], [1], [1, 2, 3]], F), write('Frecuencia de longitudes: '), write(F), nl, halt."

run_programa30: programa30.pl
	swipl -s programa30.pl -g "programa30(29), nl, halt."

# Regla para ejecutar programa31
run_programa31: programa31.pl
	swipl -s programa31.pl -g "programa31(48, 18, G), write('El MCD es: '), write(G), nl, halt."

run_programa32: programa32.pl
	swipl -s programa32.pl -g "programa32(15, 28), write('15 y 28 son coprimos: true'), nl, halt."

# Regla para ejecutar programa33
run_programa33: programa33.pl
	swipl -s programa33.pl -g "programa33(10, Phi), write('El totiente de 10 es: '), write(Phi), nl, halt."

clean:
	rm -f *.log *.out *.swp
