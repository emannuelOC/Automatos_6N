%{
	#include <stdio.h>
	#define YY_DECL int yylex()
	#include "carvalho.tab.h"
%}

%option noyywrap

%%

\n				{ return OC_NEWLINE; }

"ls"			{ return OC_LS; }
"ps"			{ return OC_PS; }
"mkdir"			{ return OC_MKDIR; }
"rmdir"			{ return OC_RMDIR; }
"cd"			{ return OC_CD; }
"touch"			{ return OC_TOUCH; }
"ifconfig"		{ return OC_IFCONFIG; }
"start"			{ return OC_START; }
"quit"			{ return OC_QUIT; }
"kill"          { return OC_KILL; }

"+"             { return OC_PLUS; }
"-"             { return OC_MINUS; }
"*"             { return OC_TIMES; }
"/"             { return OC_DIVIDED; }

[+-]?[0-9]+				{ yylval.oc_int    = atoi(yytext); return OC_INT; }
[+-]?[0-9]+\.[0-9]+ 		{ yylval.oc_float  = atof(yytext); return OC_FLOAT; }
[a-zA-Z0-9().\/]+	{ yylval.oc_string = (yytext); return OC_STRING; }

%%