%{
# include <stdio.h>
%}

%%
">"|"<"|">="|"<="|"=="  {printf("The relational Operator is %s", yytext);
printf("Yes, valid Relational operator");
 }

.* {printf("This is not the relational operator"); }
%%

int yywrap(){
return 1;
}

int main(){
printf("Enter the relational operator: \n");
yylex();
return 0;
}
