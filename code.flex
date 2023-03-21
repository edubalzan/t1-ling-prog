%%

%public
%standalone
%class Code
%line

Letter=[a-zA-Z]
Digit=[0-9]
Symbol=[!\"#$%&'()*+,-./:;<=>?@[]\^`{}~]
Integer=0|[1-9]{Digit}*
Float={Integer}(.{Digit})?
Rational={Integer}"/"{Digit}{Digit}|({Integer}){Digit}"/"{Digit}{Digit}*

NUM={Integer}|{Rational}|{Float}
BOOL=true|false
CHAR={Letter}|{Symbol}|{Digit}
KEY=else|if|int|return|void|while

%%

{NUM} {System.out.println("(" + (yyline + 1) + ", NUM, " + yytext() + ")");}
{BOOL} {System.out.println("(" + (yyline + 1) + ", BOOL, " + yytext() + ")");}
{CHAR} {System.out.println("(" + (yyline + 1) + ", CHAR, " + yytext() + ")");}
{KEY} {System.out.println("(" + (yyline + 1) + ", KEY, " + yytext() + ")");}