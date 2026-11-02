%{
#include<stdio.h>
%}

%%
">"|"<"|">="|"<="|"=="|"!=" {printf("%s is a relational operator.\n", yytext);}
.* {printf("This is not the relational operator");}
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter the string: \n");
yylex();
return 0;
}
