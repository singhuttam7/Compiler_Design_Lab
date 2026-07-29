%{
#include <stdio.h>
int count = 0;
%}

%%
[0-9]+ {
int i = 0;
while(yytext[i] != '\0'){
count ++;
i++;
}
}
\n {printf("The total number of digit: %d\n", count);
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
