package com.mycompany.analizadorescompi;

import java_cup.runtime.*;

%%//separador de areas

//macros
%class LexerMarkdown
%cup
%public
%line
%column

%{//codigo java que se agrega a la clase .java
    private Symbol symbol(int type) {
        return new Symbol(type, yyline+1, yycolumn+1);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
    }

    private void error(String message) {
        System.out.println("Error en linea "+(yyline+1)+", columna "+(yycolumn+1) +"caracter: "+ (yytext()) +": " +message);
    }


%}

//declaraciones
SALTOS = \r|\n|\r\n

WhiteSpace =    [ \t\f]

//ENTERO = [0-9]+
PALABRA = [a-zA-Z]+



%%  // separador de areas

//"#"		{ return symbol(sym.NUMERAL); }
//"*"		{ return symbol(sym.ASTERISCO);}
//"."		{ return symbol(sym.PUNTO);}
//"+"		{ return symbol(sym.MAS);}

//{ENTERO}    { return symbol(sym.ENTERO, yytext());}
{PALABRA}   { return symbol(sym.PALABRA, yytext());}
{SALTOS}    { return symbol(sym.SALTOS);}

{WhiteSpace} 	    {/* ignoramos */}
[^]                 { error("Simbolo invalido <"+ yytext()+">"); }
<<EOF>>             { return symbol(sym.EOF); }


