# Makefile para ejecutar múltiples programas Prolog

.PHONY: all clean

# Lista de programas Prolog
PROLOG_FILES = programa1.pl

# Objetivo por defecto: compilar y ejecutar programa1
all: run_programa1

# Regla para ejecutar programa1
run_programa1: programa1.pl
	swipl -s programa1.pl -g "programa1(X, [a, b, c, d]), write('El ultimo elemento es: '), write(X), nl, halt."

# Limpiar archivos compilados (en caso de que existan)
clean:
	rm -f *.o

