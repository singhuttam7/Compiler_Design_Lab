%{
#include "y.tab.h"
%}
%%
[0-9]+ {return NUMBER; }
"+" {return '+';}
[ \t\n] ;
. {return yytext[0];}
%%
