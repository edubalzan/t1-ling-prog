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
KEY=else|if|int|return|void|while|main

%%

{NUM} {System.out.print("(" + (yyline + 1) + ", NUM, \"" + yytext() + "\")\n");}
{BOOL} {System.out.print("(" + (yyline + 1) + ", BOOL, \"" + yytext() + "\")\n");}
{CHAR} {System.out.print("(" + (yyline + 1) + ", CHAR, \"" + yytext() + "\")\n");}
{KEY} {System.out.print("(" + (yyline + 1) + ", KEY, \"" + yytext() + "\")\n");}