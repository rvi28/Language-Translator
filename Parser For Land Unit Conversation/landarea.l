%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+                 {
		                 yylval.integer=atoi(yytext);
		                 return NUMBER;
		               }
[0-9]*\.[0-9]+         {
		                  yylval.real=(float)atof(yytext); 
		                  return FLOAT;
		               }
convert                {return convert;}
of                     {return of;}
to                     {return to;}
hectare                {return Hectare;} 
"square mile" 	       {return Square_Mile;}
feet                   {return Feet;}
"square centimeter"    {return Square_Centimeter;}
"square inch" 	       {return Square_Inch;}
"square kilometer" 	   {return Square_Kilometer;}
inch        	       {return Inch;}
"square feet" 	       {return Square_Feet;}
acre		           {return Acre;}
cent		           {return Cent;}
"square yard" 		   {return Square_Yard;}
"square meter"		   {return Square_Meter;}
[\n]	               {return yytext;}
[/t]	               ;
%%
int yywrap()
{
    return 1;
}
