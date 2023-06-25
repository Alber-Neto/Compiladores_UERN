%option noyywrap
%option nodefault
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}


NOME [a-zA-Z]+
NUM [0-9]+
TAGABERTURA <h[1-6]>|<{NOME}[\ ]{NOME}([_]{NOME})?\=\".+?\">|<{NOME}>
TAGFECHAMENTO <\/h[1-6]>|<\/{NOME}>
TAGISOLADA <{NOME}[\ ]\/>
CONTEUDO \/{NOME}\/|{NOME}\/|NUM|[/,_\.]|{NOME}
CONTEUDOPAGINA ((<?[\ ]?{CONTEUDO}+[\ ]{CONTEUDO}+[\ ]?>?)[\ ]?)*|<{NOME}\/>


%%

{TAGFECHAMENTO} printf("TAGFECHAMENTO encontrado: %s\n", yytext);
{TAGABERTURA} printf("TAGABERTURA encontrado: %s\n", yytext);
{TAGISOLADA} printf("TAGISOLADA encontrado: %s\n", yytext);
{CONTEUDOPAGINA} printf("CONTEUDOPAGINA encontrado: %s\n", yytext);

<<EOF>>	exit(0);

.	;

"\n"	;

%%

int main(){
	yyin = fopen("exemplo.txt", "r");
	yylex();
	return 0;
}

