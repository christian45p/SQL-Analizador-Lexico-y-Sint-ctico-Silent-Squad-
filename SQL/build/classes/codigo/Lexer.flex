package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
SELECT |
([sS])([eE])([lL])([eE])([cC])([tT]) {lexeme=yytext(); return Select;}
FROM |
([fF])([rR])([oO])([mM]) {lexeme=yytext(); return From;}
WHERE |
([wW])([hH])([eE])([rR])([eE]) {lexeme=yytext(); return Where;}

int {lexeme=yytext(); return Int;}

if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
while {lexeme=yytext(); return While;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Todo;}
"/" {lexeme=yytext(); return Division;}
"(" {lexeme=yytext(); return Parentesis_a;}
")" {lexeme=yytext(); return Parentesis_c;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
"main" {lexeme=yytext(); return Main;}
";" {lexeme=yytext(); return P_coma;}
"<" {lexeme=yytext(); return Menor;}
"<=" {lexeme=yytext(); return Menor_Igual;}
">" {lexeme=yytext(); return Mayor;}
">=" {lexeme=yytext(); return Mayor_Igual;}


{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
