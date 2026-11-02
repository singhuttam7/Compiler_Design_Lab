%{
#include<stdio.h>
int vowcount = 0;
int conscount = 0;
%}
%%
[a-zA-Z]+ {
for(int i = 0; yytext[i] != '\0'; i++){
if(yytext[i] == 'a'||yytext[i] == 'e'||yytext[i] == 'i'||yytext[i] == 'o'||yytext[i] == 'u'||yytext[i] == 'A'||yytext[i] == 'E'||yytext[i] == 'I'||yytext[i] == 'O'||yytext[i] == 'U'){
vowcount++;
}else{
conscount ++;

}
}
}
. ;
\n {printf("The total number of vowels is %d\n ", vowcount);
printf("The total number of consonants is %d\n ", conscount);
}
%%
int yywrap(){
return 1;

}
int main(){
printf("Enter the string: \n");
yylex();
return 0;
}
