%{
#include <stdio.h>

void yyerror (const char *str) {
	fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
	return 1;
}



%}


%token SELECT FROM ID NUM WHERE DISTINCT LE GE EQ NE OR AND LIKE GROUP HAVING ORDER ASC DESC ;
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%%

line: ST1 '\n' { printf("----------SYNTAX CORRECT---------\n"); };

ST1     : SELECT attributeList FROM tableList ST2 | SELECT DISTINCT attributeList FROM tableList ST2;

ST2     : WHERE COND ST3 | ST3;

ST3     : GROUP attributeList ST4 | ST4;

ST4     : HAVING COND ST5 | ST5;

ST5     : ORDER attributeList ST6 |;

ST6     : DESC |ASC |;

attributeList :     ID','attributeList | '*' | ID;

tableList    : ID',' tableList | ID;

COND    : COND OR COND | COND AND COND | E;

E         : F '=' F | F '<' F | F '>' F | F LE F | F GE F | F EQ F | F NE F | F OR F | F AND F | F LIKE F;

F         : ID | NUM;
%%
int main() {
    printf("====================SELECT SQL Query Parser===================\n ");
    printf("Enter select sql query:-\n");
	yyparse();
    return 0;
}
