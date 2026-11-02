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
if (num > 0){
printf("%d is a positive number.\n", num);
}else if(num < 0){
printf("%d is a negative number.\n", num);
}else{
printf("%d is zero, neither negative nor positive.\n", num);
}
}
[\t \n] ;
.* {printf("Invalid entry\n");}

%%

int yywrap(){
return 1;
}
int main(){
printf("Enter the number.\n");
yylex();
return 0;
}
