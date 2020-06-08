%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
void yyerror (const char *str) {
	fprintf(stderr, "error: %s\n", str);
}
%} 
%union{
int integer;
float real;
}
%token <integer> NUMBER <real>	FLOAT
%token convert of to  Square_Mile Acre Hectare Square_Yard Cent Square_Meter Feet Square_Centimeter Square_Inch Square_Kilometer Inch Square_Feet
%type <real> A B C D E F G H I J K L 

%%
//ResultExpression:S{printf("Your Answer is %f",$$);};
A: convert B{$$=$2;};
B: Square_Mile to  C {$$=$3;}
   |Acre to D            {$$=$3;}
   |Hectare to E           {$$=$3;}
   |Feet to F           {$$=$3;}
   |Square_Feet to G           {$$=$3;}
   |Square_Centimeter to H           {$$=$3;}
   |Square_Inch to I           {$$=$3;}
   |Square_Kilometer to J           {$$=$3;}
   |Square_Meter to K           {$$=$3;}
   |Square_Yard to L           {$$=$3;}
   ;
C: Acre of FLOAT      {$$=($3*(640)); printf("=>Acre of %f  is %f\n",$3,$$);};
  |Hectare of FLOAT      {$$=($3*(259)); printf("=>Hectare of %f  is %f\n",$3,$$);};
  
D: Square_Yard of FLOAT          {$$=(($3)*(4840)); printf("=>Square Yard of %f  is %f\n",$3,$$);};
  |Cent of FLOAT      {$$=((($3)*(100.40))); printf("=>Cent of %f  is %f\n",$3,$$);};
  
E: Square_Meter of FLOAT          {$$=($3*(10000)); printf("=>Square Meter of %f  is %f\n",$3,$$);};
  |Acre of FLOAT      {$$=((($3)*(2.49))); printf("=>Acre of %f  is %f\n",$3,$$);};

F: Inch of FLOAT      {$$=($3*(12)); printf("=> Inch of %f  is %f\n",$3,$$);};

G: Square_Inch of FLOAT      {$$=($3*(144)); printf("=> Square Inch of %f  is %f\n",$3,$$);};

H: Square_Feet of FLOAT      {$$=($3*(0.00107639)); printf("=> Square Feet of %f  is %f\n",$3,$$);};

I: Square_Feet of FLOAT      {$$=($3*(0.0069444)); printf("=> Square Feet of %f  is %f\n",$3,$$);};

J: Acre of FLOAT      {$$=($3*(247.1)); printf("=> Acre of %f  is %f\n",$3,$$);};

K: Square_Feet of FLOAT      {$$=($3*(10.76391042)); printf("=> Square Feet of %f  is %f\n",$3,$$);};

L: Square_Feet of FLOAT      {$$=($3*(9)); printf("=> Square Feet of %f  is %f\n",$3,$$);};
  

%%

int main(int argc, char *argv[]) 
{
    printf("--------------LAND MEASUREMENT Unit Conversion-----------------------\n");
    yyin=fopen(argv[1],"r");
    int i;
    for(i=1;i<=6;i++)
    {
        yyparse();
    }
    fclose(yyin);
    return 0;
}
