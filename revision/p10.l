%{
#include <stdio.h>
int spaces = 0;
int tabs = 0;
int newlines = 0;
%}

%%
" " {spaces ++;}
\t {tabs++;}
\n {newlines++;}

. ;
%%
int yywrap(){
return 1;
}

int main(){
printf("Enter the text: \n");
yylex();
printf("The total number of spaces = %d\n", spaces);
printf("The total number of tabs = %d\n", tabs);
printf("The total number of newlines = %d\n", newlines);
return 0;
}
