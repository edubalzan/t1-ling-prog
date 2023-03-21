%{
    #include <iostream>
    #include <string>
    using namespace std;

    int line;
    string token;
    string lex;
%}

%option yylineno
%x COMMENT

Letter=[a-zA-Z]
Digit=[0-9]
Symbol=[!"#$%&'()*+,-./:;<=>?@[]\^`{}~]
Character='{Letter}'|'{Symbol}'|'{Digit}'
String="(\.|[^"])*"
Key=else|if|int|return|void|while
Space=' '

%%

Character {line=yylineno; token="Character"; lex=yytext;}

%%

int main(int argc, char *argv[]){
    FILE *arquivo = fopen("input.txt", "r");
    if (!arquivo) {
        printf("%s", "Arquivo inexistente");
        return -1;
    }
    yyin = arquivo;
    cout << "(" << line << ", " << token << ", " << lex << ")" << endl;
    return 0;
}