%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <signal.h>
    
    extern int yylex();
    extern int yyparse();
    extern FILE* yyin;
    
	void yyerror(const char *s);
    void oc_touch(char *s);
    void oc_kill(int s);
    void oc_newline();
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
%token OC_STRING
%token OC_KILL

%token <oc_int> 	OC_INT
%token <oc_float>	OC_FLOAT

%token OC_PLUS
%token OC_MINUS
%token OC_TIMES
%token OC_DIVIDED

%left OC_PLUS OC_MINUS
%left OC_TIMES OC_DIVIDED

%type<oc_int>		expr_int
%type<oc_float>		expr_float
%type<oc_int>		term_int
%type<oc_float>		term_float
%type<oc_string>    OC_STRING

%start ShellFish

%%

ShellFish:
| ShellFish newline { oc_newline(); }
;

newline: OC_NEWLINE
    | command  OC_NEWLINE           { printf(""); }
	| expr_int OC_NEWLINE 		{
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

expr_float: term_float                      { $$ = $1; }
	| expr_float OC_PLUS expr_float 		{ $$ = $1 + $3; }
	| expr_float OC_MINUS expr_float 		{ $$ = $1 - $3; }
	| expr_float OC_TIMES expr_float 		{ $$ = $1 * $3; }
	| expr_float OC_DIVIDED expr_float 		{ $$ = $1 / $3; }
;

term_int: OC_INT 		{ $$ = $1; }
;

term_float: OC_FLOAT 	{ $$ = $1; }
;

command: OC_LS                  { system("ls"); }
    | OC_PS                     { system("ps"); }
    | OC_MKDIR OC_STRING        { mkdir($2, 0700); }
    | OC_RMDIR OC_STRING        { rmdir($2); }
    | OC_CD OC_STRING           { chdir($2); }
    | OC_TOUCH OC_STRING        { oc_touch($2); }
    | OC_IFCONFIG               { system("ifconfig"); }
    | OC_START OC_STRING        { popen($2, "r"); }
    | OC_KILL  OC_INT           { oc_kill($2); }
    | OC_QUIT                   { exit(0); }
;

%%

int main() {
    yyin = stdin;
    oc_newline();
    do {
        yyparse();
    } while (!feof(yyin));
    
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Comando invalido %s\n", s);
}

void oc_touch(char *s) {
    char command[256];
    snprintf(command, sizeof command, "touch -am -t 200005050000 %s", s);
    system(command);
}

void oc_kill(int s) {
    char command[256];
    snprintf(command, sizeof command, "kill %d", s);
    system(command);
}

void oc_newline() {
    char path[256];
    getcwd(path, sizeof(path));
    printf("🔺 ShellFish%s>> ", path);
}





