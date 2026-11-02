%{
#include "y.tab.h"
#include<stdlib.h>
%}

%%
[0-9]+ {return ID; }
"+" {return '+';}
"*" {return '*';}
"(" {return '(';}
")" {return ')';}
[ \t] ;
\n {return '\n';}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}
