%{
#include<stdio.h>

%}
%%
-?[0-9]+\.[0-9]+ {
int count = 0;
for( int i = 0; i < yyleng; i++){
if(yytext[i] == '.'){
printf("Yes, this is a decimal number.\n");
i++;
while(yytext[i] != '\0'){
count++;
i++;
}
printf("The total number of decimal digits alter '.' = %d.", count);
}
}
}
[\t\n] ;
.* ;
%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the number to check the precision...\n");
yylex();
return 0;
}

