%{
#include "y.tab.h"
#include<stdlib.h>
%}
%%
[0-9]+ {
yylval.value = atoi(yytext);
return NUMBER;
}
"+" {return '+';}
[ \t\n] ;
. {return yytext[0];}
%%
