%{
#include "y.tab.h"
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}
%%
[01]+ {yylval.str = strdup(yytext); return STRING;}
[ \t] ;
\n {return '\n';}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}
