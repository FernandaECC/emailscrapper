%{
#include <stdio.h>
#include <string.h>

    void fim_de_frase(char* string) { 

	int tam;
	tam = strlen(string);

  	int count = 0;

	while(count < (tam-1)) {
	    printf("%c", string[count]);
	    count++;
	}

	printf("\n");
    
    }	

%}
 
 
%%

([a-z0-9A-Z\.\-\_\,\!]+) ; /*qualquer palavra ou pontuacao deve ser ignorada*/

\@([a-z0-9A-Z\.\-\_]+) ; /*nome de usuario nulo*/
([a-z0-9A-Z\.\-\_]+)\@ ; /*dominio nulo*/

(([\.\-\_])([a-z0-9A-Z\.\-\_]+)\@([a-z0-9A-Z\.\-\_]+)) ; /*nome de usuario com pontuacao no comeco*/

(([a-z0-9A-Z\.\-\_]+)([\.\-\_])\@([a-z0-9A-Z\.\-\_]+)) ; /*nome de usuario com pontuacao no final*/

(([a-z0-9A-Z\.\-\_]+)\@(([\.\-\_])[a-z0-9A-Z\.\-\_]+)) ; /*dominio com pontuacao no comeco*/

(([a-z0-9A-Z\.\-\_]+)\@([a-z0-9A-Z\.\-\_]+)\.) {fim_de_frase(yytext);} /*email valido no fim de frase*/

(([a-z0-9A-Z\.\-\_]+)\@([a-z0-9A-Z\.\-\_]+)([\.\-\_])) ; /*dominio com pontuacao no final*/

(([a-z0-9A-Z\.\-\_]+)\@([a-z0-9A-Z\.\-\_]+)) {printf("%s\n", yytext);} /*email valido*/

[[:space:]]+ ;

 
%%
 
int main() {
  yylex();
  return 0;
}

