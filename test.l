%{
    #include <stdio.h>
%}

%%
"a"             { printf("Found: a\n"); }
"("             { printf("Found: (\n"); }
")"             { printf("Found: )\n"); }
","             { printf("Found: ,\n"); }
[ \t\n]+        ;   // Skip whitespace
.               { printf("Invalid character: %s\n", yytext); }
%%
    
    int main() {
        printf("Enter input string: ");
        yylex();
        return 0;
    }