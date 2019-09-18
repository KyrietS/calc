import java_cup.runtime.Symbol;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;

%%

%class Lexer

%cup
%implements sym
%char
%line
%column

// Funkcje pomocnicze (tworzenie symboli z informacją o pozycji)
%{
    private ComplexSymbolFactory symbolFactory = new ComplexSymbolFactory();

    private Symbol symbol(String name, int id) {
        return symbol(name, id, null);
    }
    private Symbol symbol(String name, int id, Object val) {
        Location left = new Location(yyline+1, yycolumn+1, yychar+1);
        Location right = new Location(yyline+1, yycolumn+yylength(), yychar+yylength());
        Symbol complexSymbol = symbolFactory.newSymbol(name, id, left, right, val);
        return (ComplexSymbolFactory.ComplexSymbol)complexSymbol;
    }
%}

%eofval{
     return symbolFactory.newSymbol("EOF", EOF, new Location(yyline+1,yycolumn+1,yychar), new Location(yyline+1,yycolumn+1,yychar+1));
%eofval}

%%

[1-9][0-9]*             { return symbol("number", NUM, Integer.parseInt(yytext())); }
"+"                     { return symbol("plus", PLUS); }
"-"                     { return symbol("minus", MINUS); }
"*"                     { return symbol("mult", MULTIPLY); }
"("                     { return symbol("(", LPAREN); }
")"                     { return symbol(")", RPAREN); }
"="                     { return symbol("=", EQUALS); }
[ \t]                   { /* ignore */ }
.                       { throw new RuntimeException("Unexpected character [" + yytext() + "]"); }
