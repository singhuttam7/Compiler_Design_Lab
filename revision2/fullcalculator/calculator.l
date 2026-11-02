%{
#include "y.tab.h"
#include<stdlib.h>
%}
%%
[0-9]+ {
yylval.value = atoi(yytext);
return NUMBER;
}
[+\-*/()] {return yytext[0];}

[ \t] ;
\n {return 0;}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}
