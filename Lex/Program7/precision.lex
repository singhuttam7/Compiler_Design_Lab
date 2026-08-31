%{
#include <stdio.h>
%}

%%
[0-9]+\.[0-9]+ {
int count = 0;
for(int i = 0; yytext[i] != '\0'; i++){

if(yytext[i] == '.'){
i++;
while(yytext[i] != '\0'){
count ++;
i++;
}
printf("The total number of decimal digits after '.' is %d\n", count);
}
}
}
[\n\t]+ ;
. {printf("Invalid input\n");};
%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the decimal numbers to know the precision\n");
yylex();
return 0;
}
