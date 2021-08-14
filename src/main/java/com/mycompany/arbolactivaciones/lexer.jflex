package com.mycompany.arbolactivaciones;

import java_cup.runtime.*;
import static com.mycompany.arbolactivaciones.ParserSym.*;
%%

%class Lexer
%unicode
%line
%column
%cup
%public

/*expresiones regulares*/
ESPECIAL = [ \t\r\n]+
NUMERO = [0-9]+
LETRAS = [a-zA-z]+


%%

<YYINITIAL> {
    "programa"                              { return new Symbol(PR_PROGRAMA, yyline, yycolumn, yytext()); }
    "procedimiento"                         { return new Symbol(PR_PROCEDIMIENTO, yyline, yycolumn, yytext()); }
    "end"                                   { return new Symbol(PR_END, yyline, yycolumn, yytext()); }
    "integer"                               { return new Symbol(PR_INTEGER, yyline, yycolumn, yytext()); }
    {LETRAS}({LETRAS}|{NUMERO}|_)*          { return new Symbol(ID, yyline, yycolumn, yytext()); }
    {NUMERO}                                { return new Symbol(ENTERO, yyline, yycolumn, yytext()); }
    ","                                     { return new Symbol(COMA, yyline, yycolumn, yytext()); }
    ":"                                     { return new Symbol(DOS_PUNTOS, yyline, yycolumn, yytext()); }
    ";"                                     { return new Symbol(PUNTO_Y_COMA, yyline, yycolumn, yytext()); }
    ":="                                    { return new Symbol(ASIGNACION, yyline, yycolumn, yytext()); }
    "("                                     { return new Symbol(PAR_A, yyline, yycolumn, yytext()); }
    ")"                                     { return new Symbol(PAR_C, yyline, yycolumn, yytext()); } 
}



//caracteres especiales
<YYINITIAL>{
	{ESPECIAL}	{	/* Ignorar */	}
}







