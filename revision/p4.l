%{
#include <stdio.h>
#include <stdlib.h>
int num;
%}

%%
[0-9]+ {
num = atoi(yytext);
if(num % 2 == 0){
printf("%d is a Even number.", num);
}else{
printf("%d is an odd number.", num);
}
}
[^0-9\n]+ {printf("Invalid entry.\n");}
\n ;
%%

int main(){
printf("Enter the number to check it is even or odd.\n");
yylex();
return 0;
}
