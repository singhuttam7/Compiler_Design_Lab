%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
-?[0-9]+\.[0-9]+ {
float num = atof(yytext);
printf("%f is a fractional number.\n", num);
}

-?[0-9]+ {
int num = atoi(yytext);
if(num > 0){
printf("%d is a positive integer.\n", num);
}else if(num < 0){
printf("%d is a negative integer.\n", num);
}else{
printf("%d is a zero, which is neither positive nor negative.\n", num);
}
}

[\t \n] ;

%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the number to determine the positive, negative or fractional number.\n");
yylex();
return 0;
}
