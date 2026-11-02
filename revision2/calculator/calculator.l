%{
#include "y.tab.h"
%}

%%
[0-9]+ {return NUMBER;}
"*" {return '*';}
"+" {return '+';}
"-" {return '-';}
"/" {return '/';}
[ \t] ;
\n {return '\n';}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}
