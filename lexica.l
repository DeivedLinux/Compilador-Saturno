%{
#include <string>

%}

TAB [ \t]
DIGIT [0-9]
LETTER [A-Za-z_]
HEXA 0x[0-9A-Fa-f]+

DELIM {TAB}+
NUM {DIGIT}+
REAL {NUM}+("."{NUM}+)?
CHAR \'({LETTER}|{NUM})\'
ID {LETTER}({LETTER}|{NUM})*

%%

"\n"		{}

{DELIM} 	{}

"main"			{return TK_MAIN;}
"Integer"		{return TK_TIPO_INT;}
"Real"			{return TK_TIPO_REAL;}
"String"		{return TK_TIPO_STRING;}


[(){}[\];,]	{ return *yytext; }

[+\-*/]		{ return *yytext; }

{NUM}		{ yylval.label = yytext; return TK_NUM; }
{ID}		{ yylval.label = yytext; return TK_ID; }

.			{ *yytext; }

%%
