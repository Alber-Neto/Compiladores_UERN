%option noyywrap
%option nodefault
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}


TAGABERTURA <h[1-6]>|<[a-z]+" "[a-z]+(_[a-z]+)?\=\".+?\">
TAGFECHAMENTO <\/h[1-6]>|<\/[a-z]+>
TAGISOLADA <[a-z]+" "\/>
CONTEUDOPAGINA [a-zA-Z]+|<[0-9]+>|<\/[a-z]+.\/>

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

