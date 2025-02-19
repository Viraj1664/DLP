%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int lowercase = 0, uppercase = 0, digit = 0, symbol = 0;
%}

%%
[a-z]    { lowercase = 1; }
[A-Z]    { uppercase = 1; }
[0-9]    { digit = 1; }
[*;#$@]  { symbol = 1; }
.        { }  /* Ignore other characters */
\n       { 
    if (yyleng >= 9 && yyleng <= 15 && lowercase && uppercase && digit && symbol) {
        printf("Valid password\n");
    } else {
        printf("Invalid password\n");
    }
    /* Reset counters for next input */
    lowercase = uppercase = digit = symbol = 0;
}
%%

int main() {
    printf("Enter password: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}