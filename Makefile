# Makefile para compilar y ejecutar programas en Prolog

# Variables
SWI_PROLOG=swipl
PROGRAMS=programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl programa6.pl programa7.pl programa8.pl programa9.pl programa10.pl programa11.pl programa12.pl programa13.pl programa14.pl programa15.pl programa16.pl programa17.pl programa18.pl programa19.pl programa20.pl programa21.pl programa22.pl programa23.pl programa24.pl programa25.pl programa26.pl programa27.pl programa28.pl programa29.pl programa30.pl programa31.pl programa32.pl programa33.pl programa34.pl programa35.pl programa36.pl programa37.pl programa38.pl programa39.pl programa40.pl programa41.pl programa42.pl programa43.pl programa45.pl programa46.pl programa47.pl programa48.pl programa49.pl programa50.pl

# Objetivo por defecto
all: run

# Ejecutar todos los programas
run:
	@echo "Ejecutando programas en Prolog..."
	@for program in $(PROGRAMS); do \
		echo "Ejecutando $$program:"; \
		$(SWI_PROLOG) -s $$program -g main -t halt; \
	done

# Limpieza (opcional)
clean:
	@echo "Limpiando archivos generados..."
