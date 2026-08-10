%{
#include <stdio.h>
#include <string.h>
int count = 0;
%}

%%
[a-zA-Z]+ {
if(strlen(yytext) > 5 && strlen(yytext) < 10){
count++;
}
}
\n {printf("The total number of words: %d\n", count);
return 0;
}
.;
 
%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the strings: \n");
yylex();
return 0;
}
