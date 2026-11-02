%{
#include<stdio.h>
int countSpaces = 0;
int countTabs = 0;
int newlines = 0;
%}

%%
" " {countSpaces ++; }
\t {countTabs ++;}
\n {newlines ++;}

. ; 
%%
int yywrap(){
return 1;
}
int main(){
printf("Count the spaces, tabs and newlines: \n");
yylex();
printf("The total number of spaces: %d\n", countSpaces);
printf("The total number of countTabs: %d\n", countTabs);
printf("The total number of newlines: %d\n", newlines);
return 0;
}
