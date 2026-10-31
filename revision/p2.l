%{
# include<stdio.h>
%}

%%
">"|"<"|">="|"<="|"=="|"!=" {printf("Relational operators = %s", yytext);
 printf("Yes");
 }

.* {printf("NO"); }
%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the relational opetrators\n");
yylex();
return 0;
}
