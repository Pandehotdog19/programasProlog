# Makefile para ejecutar múltiples programas Prolog

.PHONY: all clean

# Lista de programas Prolog
PROLOG_FILES = programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl \
               programa6.pl programa7.pl programa8.pl programa9.pl programa11.pl \
               programa12.pl programa13.pl programa14.pl programa15.pl

# Objetivo por defecto: compilar y ejecutar todos los programas
all: run_programa1 run_programa2 run_programa3 run_programa4 run_programa5 \
     run_programa6 run_programa7 run_programa8 run_programa9 run_programa11 \
     run_programa12 run_programa13 run_programa14 run_programa15

# Regla para ejecutar programa1
run_programa1: programa1.pl
	swipl -s programa1.pl -g "programa1(X, [a, b, c, d]), write('El último elemento es: '), write(X), nl, halt."

# Regla para ejecutar programa2
run_programa2: programa2.pl
	swipl -s programa2.pl -g "programa2(X, [a, b, c, d]), write('El penúltimo elemento es: '), write(X), nl, halt."

# Regla para ejecutar programa3
run_programa3: programa3.pl
	swipl -s programa3.pl -g "programa3(X, [a, b, c, d, e], 3), write('El 3-esimo elemento es: '), write(X), nl, halt."

# Regla para ejecutar programa4
run_programa4: programa4.pl
	swipl -s programa4.pl -g "programa4([a, b, c, d, e], N), write('La longitud de la lista es: '), write(N), nl, halt."

# Regla para ejecutar programa5
run_programa5: programa5.pl
	swipl -s programa5.pl -g "programa5([a, b, c, d, e], R), write('La lista invertida es: '), write(R), nl, halt."

# Regla para ejecutar programa6
run_programa6: programa6.pl
	swipl -s programa6.pl -g "programa6([a, b, c, b, a]), write('La lista es un palíndromo: true'), nl, halt."

# Regla para ejecutar programa7
run_programa7: programa7.pl
	swipl -s programa7.pl -g "programa7([1, [2, 3], 4, [5, [6, 7]]], Flat), write('Lista aplanada: '), write(Flat), nl, halt."

# Regla para ejecutar programa8
run_programa8: programa8.pl
	swipl -s programa8.pl -g "programa8([a, a, b, b, c, a, a, d], R), write('Lista sin duplicados consecutivos: '), write(R), nl, halt."

# Regla para ejecutar programa9
run_programa9: programa9.pl
	swipl -s programa9.pl -g "programa9([a, a, b, b, c, a, a, d], R), write('Lista agrupada: '), write(R), nl, halt."

# Regla para ejecutar programa11
run_programa11: programa11.pl
	swipl -s programa11.pl -g "programa11([a, a, b, c, c, a, d], R), write('Lista modificada: '), write(R), nl, halt."

# Regla para ejecutar programa12
run_programa12: programa12.pl
	swipl -s programa12.pl -g "programa12([[2,a], [1,b], [3,c], [1,a], [2,d]], R), write('Lista decodificada: '), write(R), nl, halt."

# Regla para ejecutar programa13
run_programa13: programa13.pl
	swipl -s programa13.pl -g "programa13([a,a,a,b,c,c,a], R), write('Lista codificada: '), write(R), nl, halt."

# Regla para ejecutar programa14
run_programa14: programa14.pl
	swipl -s programa14.pl -g "programa14([1, 2, 3], R), write('Lista duplicada: '), write(R), nl, halt."

# Regla para ejecutar programa15
run_programa15: programa15.pl
	swipl -s programa15.pl -g "programa15([1, 2, 3], 2, R), write('Lista duplicada 2 veces: '), write(R), nl, halt."

# Limpiar archivos compilados (en caso de que existan)
clean:
	rm -f *.o
