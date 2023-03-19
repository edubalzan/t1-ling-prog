Letter=[a-zA-Z]
Digit=[0-9]
Symbol=[!"#$%&'()*+,-./:;<=>?@[]\^`{}~]

Character='{Letter}'|'{Symbol}'|'{Digit}'
Integer=0|[1-9]{Digit}*
Float={Integer}(.{Digit})?
Rational={Integer}"/"{Digit}{Digit}|({Integer}){Digit}"/"{Digit}{Digit}*
Number={Integer}|{Rational}|{Float}
Boolean=true|false
String="(\.|[^"])*"
Key=else|if|int|return|void|while
Space=' '

%{
    #define YY_DECL extern "C" int yylex()
    #include<string>
    #include<iostream>
    using namespace std;
    
    FILE *out;
    int linha;
%}

%option yylineno
%x COMMENT

%%

Letter {fprintf(out,"(%d,Letter,\"%s\")\n",yylineno,yytext);}
Digit {fprintf(out,"(%d,Digit,\"%s\")\n",yylineno,yytext);}
Symbol {fprintf(out,"(%d,Symbol,\"%s\")\n",yylineno,yytext);}
Character {fprintf(out,"(%d,Character,\"%s\")\n",yylineno,yytext);}
Integer {fprintf(out,"(%d,Integer,\"%s\")\n",yylineno,yytext);}
Float {fprintf(out,"(%d,Float,\"%s\")\n",yylineno,yytext);}
Rational {fprintf(out,"(%d,Rational,\"%s\")\n",yylineno,yytext);}
Number {fprintf(out,"(%d,Number,\"%s\")\n",yylineno,yytext);}
Boolean {fprintf(out,"(%d,Boolean,\"%s\")\n",yylineno,yytext);}
String {fprintf(out,"(%d,String,\"%s\")\n",yylineno,yytext);}
Key {fprintf(out,"(%d,Key,\"%s\")\n",yylineno,yytext);}
Space {fprintf(out,"(%d,Space,\"%s\")\n",yylineno,yytext);}

%%

int yywrap();

int main(int argc, char *argv[]){
    FILE *arquivo = fopen(argv[1],"r");
    if (!arquivo) {
        cout << "Arquivo inexistente" << endl;
        return -1;
    }
    yyin = arquivo;
    out = fopen(argv[2],"w");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}