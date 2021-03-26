%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n        { chars++; lines++; }  
.         { chars++; } 

%%

int main(int argc, char **argv[]){

	extern FILE *yyin, *yyout;

        yyin=fopen("wc.flex", "r");
        yylex();   

    printf("O arquivo wc.flex possui %d linhas, %d palavras e %d caracteres\n", lines, words,chars);
}