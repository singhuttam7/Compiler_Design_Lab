%{
#include <stdio.h>
#include <stdlib.h>
int num;
%}

%%
[0-9]+ {num = atoi (yytext);
if(num % 2 == 0)
printf("Even number.");
else
printf("Odd number.");
}

. {printf("Wrong input.");}
\n ;
%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the input: ");
yylex(); 
return 0;
}
