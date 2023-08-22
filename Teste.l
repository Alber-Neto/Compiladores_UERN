%{
#include <string.h>
#include "print.tab.h"
int yyerror(char* erro){
 printf("Erro na linha %d: %s\nEm %s\n", yylineno, erro, yytext);
}
%}

%option noyywrap
BRANCO [ ]
ESPACO {BRANCO}+
DIGITO [0-9]
NUMERO {DIGITO}+
LETRA [A-Za-z]
STRING \"[^"]*\"
IDENTIFICADOR {LETRA}+
IDERNTACAO {BRANCO}{BRANCO}{BRANCO}{BRANCO}
COMPARACAO ==|!= |< | > | >= | <=
OPERADORES \+ | \- | \* | \/

%%

"print" { return PRINT;}
"if" {return IF;}
"while" {return WHILE;}
"=" {return IGUAL;}
"(" { return ABREP; }
")" { return FECHAP; }
"," {return VIRGULA;}
":" {return DOISP;}
{IDENTIFICADOR} { yylval.str = strdup(yytext); return ID;}
{STRING} { yylval.str = strdup(yytext); return STR;}
{NUMERO} { yylval.str = strdup(yytext); return NUM; }
{COMPARACAO} { yylval.str = strdup(yytext); return COMPARACAO;}
{OPERADORES} { yylval.str = strdup(yytext); return OPERADORES;}
{ESPACO} { }
. { yyerror("Token desconhecido."); }
"\n" { yylineno++; return FIM_DE_LINHA; }
<<EOF>>	{ return FIM_DE_ENTRADA; }

%%