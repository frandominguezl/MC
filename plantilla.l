/* 
    Modelos de Computación - Práctica 2 (Lex)

    Autores:
        - Pablo Cordero Romero
        - Francisco Domínguez Lorente
        - David Gómez Hernández
    
    Problema:
        - Identificar, desde un fichero con direcciones de correo electrónico, cuáles de esas direcciones son correctas y cuáles no.
    
    Metodología:
        - Una secuencia de letras y números y algunos caracteres especiales
        - Un símbolo @
        - Una secuencia de letras
        - Un punto
        - Una secuencia de letras, como mucho de longitud 5
*/

/* Sección de Declaraciones */

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
%}

correo    [a-zA-Z0-9._%+-]+@[a-z]+\.[a-z]{2,5}

%%
{correo}    {printf("El correo %s es correcto", yytext);}
.*          {printf("El correo %s no es correcto", yytext);}
%%

/* Sección de Procedimientos */

int main(int argc, char* argv[])
{
    if(argc == 2){
        yyin = fopen(argv[1], "r");

        if(yyin == NULL){
            printf("El fichero %s no se puede abrir\n", argv[1]);
            exit(-1);
        }
    }

    else if(argc == 1){
        printf("Introduzca correos electrónicos por terminal. Pulse CTRL+D para finalizar.\n");
        yyin = stdin;
    }

    else{
        printf("Número de parámetros incorrecto. Prueba con ./prog o con ./prog <Nombre_Archivo>\n");
        exit(-1);
    }

    yylex();

    return 0;
}