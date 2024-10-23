# Makefile para ejecutar múltiples programas Prolog

.PHONY: all clean

# Lista de programas Prolog
PROLOG_FILES = programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl \
               programa6.pl programa7.pl programa8.pl programa9.pl programa11.pl

# Objetivo por defecto: compilar y ejecutar todos los programas
all: run_programa1 run_programa2 run_programa3 run_programa4 run_programa5 \
     run_programa6 run_programa7 run_programa8 run_programa9 run_programa11

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

# Regla para ejecutar programa
