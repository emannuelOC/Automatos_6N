%{
	#include <stdio.h>
	#define YY_DECL int yylex()
	#include	
%}

%option noyywrap

%%

\n 				{ return OC_NEWLINE; }

"ls"			{ return OC_LS; }
"ps"			{ return OC_PS; }
"mkdir"			{ return OC_MKDIR; }
"rmdir"			{ return OC_RMDIR; }
"cd"			{ return OC_CD; }
"touch"			{ return OC_TOUCH; }
"ifconfig"		{ return OC_IFCONFIG; }
"start"			{ return OC_START; }
"quit"			{ return OC_QUIT; }

[0-9]+				{ yyval.int = atoi(yytext); return OC_INT; }
[0-9]+\.[0-9]+ 		{ yyval.float = atoi(yytext); return OC_FLOAT; }
[a-zA-Z0-9().\/]+	{ yyval.text = (yytext); return OC_STRING; }

%%