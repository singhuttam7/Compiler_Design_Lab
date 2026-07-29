%{
#include <stdio.h>
int count = 0;
%}
%%
[a-zA-Z]+ {
int i = 0;
while(yytext[i] != '\0'){
count ++;
i++;

}
}
\n {printf("The total number of letters: %d", count);
return 0;

}
. ;
%%
int yywrap(){
return 1;
}
int main(){
printf("Enter the input: \n");

yylex();
return 0;
}


