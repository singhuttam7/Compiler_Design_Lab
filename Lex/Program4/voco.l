%{
#include<stdio.h>
#include<string.h>
int count = 0;
int concount = 0;
%}

%%
[a-zA-Z]+ {
 yytext;
for(int i = 0; yytext[i] != '\0'; i++){
if(yytext[i] == 'a' || yytext[i] == 'e' || yytext[i] == 'i' ||yytext[i] == 'o' || yytext[i] == 'u' 
||yytext[i] == 'A' || yytext[i] == 'E' || yytext[i] == 'I' ||yytext[i] == 'U' || yytext[i] == 'U'){
count ++;
}else{
concount++;
}
}
}
\n {printf("The total number of vowels: %d and consonants: %d\n", count, concount);
return 0;}
. ;

%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the string: \n");
yylex();
return 0;
}
