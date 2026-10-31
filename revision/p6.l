%{
#include<stdio.h>
int vowCount = 0;
int consCount = 0;
%}

%%
[a-zA-Z]+ {

for(int i = 0; i < yyleng; i++){
if (yytext[i] == 'a'||yytext[i] == 'e'||yytext[i] == 'i'||yytext[i] == 'o'||yytext[i] == 'u'||yytext[i] == 'A'
||yytext[i] == 'E'||yytext[i] == 'I'||yytext[i] == 'O'||yytext[i] == 'U'){
vowCount ++;

}else{
consCount ++;
}
}
}
\n {printf("The total number of vowels = %d\n", vowCount); 
printf("The total number of consonants = %d\n", consCount);
 }
%%
 
int yywrap(){
return 1; 
}


int main(){
printf("Enter the string....\n");
yylex();
return 0;
}
