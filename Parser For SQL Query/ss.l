%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
select					return SELECT;
from					return FROM;
where					return WHERE;
distinct                return DISTINCT;
and						return AND;
like                    return LIKE;
desc                    return DESC;
asc                     return ASC;
"group by"              return GROUP;
having                  return HAVING;
"order by"              return ORDER;
or                      return OR;
"<="                    return LE;
">="                    return GE;
"=="                    return EQ;
"!="                    return NE;
[*]						return *yytext;
[,]						return *yytext;
[=]						return *yytext;
[<]						return *yytext;
[>]						return *yytext;
[LE]					return *yytext;
[GE]					return *yytext;
[(]                     return *yytext;
[)]                     return *yytext;
[a-zA-Z][a-zA-Z0-9]+	return ID;
[0-9]+                  return NUM;
\n						return *yytext;
[ \t]+					/* ignore whitespace */;
%%
