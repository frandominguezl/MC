CXX = gcc
LEX = lex
CFLAGS = -ll


# **** Compilación de módulos ****
prog : lex.yy.c
	$(CXX) lex.yy.c -o prog $(CFLAGS)

lex.yy.c : plantilla.l
	$(LEX) plantilla.l

# **** Ejecucion ****
exec:
	./prog

prueba:
	./prog prueba.txt

# **** Limpieza ****
clean:
	rm -f *.c prog