%{
#include <stdio.h>
%}

%%

[0-9]+  { printf("%s\n", yytext); }  // Print each number found on a new line
.|\n    { /* Ignore all non-numeric characters */ }

%%

int main() {
    yylex();  // Start lexical analysis
    return 0;
}

int yywrap() {
    return 1;
}