%{
	#include <stdio.h>
	int yylex();
	void yyerror(char *);
%}

%union {
	int 	oc_int;
	float 	oc_float;
	char 	oc_char;
	char*	oc_string;
}

%token OC_LS
%token OC_PS
%token OC_MKDIR
%token OC_RMDIR
%token OC_CD
%token OC_TOUCH
%token OC_IFCONFIG
%token OC_START
%token OC_QUIT
%token OC_NEWLINE

%token <oc_int> 	INT
%token <oc_float>	FLOAT

%token OC_PLUS
%token OC_MINUS
%token OC_TIMES
%token OC_DIVIDED

%left '-' '+'
%left '*' '/'

%type<oc_char> 		c
%type<oc_float> 	f
%type<oc_string> 	s
%type<oc_int>		expr_int
%type<oc_float>		expr_float
%type<oc_int>		term_int
%type<oc_float>		term_float	


%start ShellFish

%%

ShellFish:
	| ShellFish newline { printf("=D\n"); }
;

newline: OC_NEWLINE
	| oc_char OC_NEWLINE 		{ printf("olá"); }
	| expr OC_NEWLINE 			{
									printf("%d\n", $1);
								}
	| expr_float				{
									printf("%f\n", $1);
								}
;

expr_int: term_int 						{ $$ = $1; }
	| expr_int OC_PLUS expr_int 		{ $$ = $1 + $3; }
	| expr_int OC_MINUS expr_int 		{ $$ = $1 - $3; }
	| expr_int OC_TIMES expr_int 		{ $$ = $1 * $3; }
	| expr_int OC_DIVIDED expr_int 		{ $$ = $1 / $3; }
;

expr_float: term_float 					{ $$ = $1; }
	| expr_float OC_PLUS expr_float 		{ SS = $1 + $3; }
	| expr_float OC_MINUS expr_float 		{ SS = $1 - $3; }
	| expr_float OC_TIMES expr_float 		{ SS = $1 * $3; }
	| expr_float OC_DIVIDED expr_float 		{ SS = $1 / $3; }
;

term_int: OC_INT 		{ $$ = $1; }
;

term_float: OC_FLOAT 	{ $$ = $1; }
;



















