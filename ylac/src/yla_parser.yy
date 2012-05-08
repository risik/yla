%{

#include <stdio.h>

#define YYERROR_VERBOSE 1
void yyerror(char *s);

%}

%start list

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

list:
	| list stat '\n'
	| list error '\n'
		{
			yyerrok;
		}
	| list '\n'
	;

stat:	expr
	;

expr:	'(' expr ')'
	| expr '+' expr
	| expr '-' expr
	| expr '*' expr
	| expr '/' expr
	| NUMBER
	;

%%

extern void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
	exit(-1);
}
