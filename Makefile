# Makefile para compilar y ejecutar programas Prolog.

# Definición de variables
PROLOG = swipl
PROGRAMAS = programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl programa6.pl programa7.pl programa8.pl programa9.pl programa10.pl

# Regla por defecto
all: run_programas

# Regla para ejecutar todos los programas
run_programas:
	@$(PROLOG) -s programa1.pl -g "programa1([a, b, c]), write('Último elemento: '), write(R), nl, halt."
	@$(PROLOG) -s programa2.pl -g "programa2([a, b, c]), write('Penúltimo elemento: '), write(R), nl, halt."
	@$(PROLOG) -s programa3.pl -g "programa3([a, b, c, d], 2, R), write('Elemento k-ésimo: '), write(R), nl, halt."
	@$(PROLOG) -s programa4.pl -g "programa4([a, b, c]), write('Número de elementos: '), write(R), nl, halt."
	@$(PROLOG) -s programa5.pl -g "programa5([a, b, c, d, e], R), write('Lista invertida: '), write(R), nl, halt."
	@$(PROLOG) -s programa6.pl -g "programa6([a, b, c, b, a]), write('La lista es un palíndromo: true'), nl, halt."
	@$(PROLOG) -s programa7.pl -g "programa7([[a, b], [c, d]]), write('Lista aplana: '), write(R), nl, halt."
	@$(PROLOG) -s programa8.pl -g "programa8([a, a, b, b, c, a, a, d], R), write('Sin duplicados: '), write(R), nl, halt."
	@$(PROLOG) -s programa9.pl -g "programa9([a, a, b, b, c, a, a, d], R), write('Agrupados: '), write(R), nl, halt."
	@$(PROLOG) -s programa10.pl -g "programa10([a, a, b, b, c, a, a, d], R), write('Codificación Run-Length: '), write(R), nl, halt."

# Limpiar archivos generados (si es necesario)
clean:
	rm -f *.o *.pl~
