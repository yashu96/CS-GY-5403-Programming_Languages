/* recognize tokens for the calculator and print them out */

%{
   enum yytokentype {
     INT_LIT = 10,
     ASSIGN_OP = 20,
     ADD_OP = 21,
     SUB_OP = 22,
     MULT_OP = 23,
     DIV_OP = 24,
     LEFT_PAREN = 25,
     RIGHT_PAREN = 26,
     FOR_CODE =30,
     IF_CODE =31,
     ELSE_CODE=32,
     WHILE_CODE=33,
     DO_CODE=34,
     INT_CODE=35,
     FLOAT_CODE=36,
     SWITCH_CODE=37,
     UNKNOWN=99,
     END_OF_FILE_CODE=-1
   };
   int yylval;
%}

%%
"+"    { return ADD_OP; }
"-"    { return SUB_OP; }
"*"    { return MULT_OP; }
"/"    { return DIV_OP; }
"("    { return LEFT_PAREN; }
")"    { return RIGHT_PAREN; }
"for"  { return FOR_CODE; }
"if"   { return IF_CODE; }
"else" { return ELSE_CODE; }
"while" { return WHILE_CODE; }
"do"   { return DO_CODE; }
"int"  { return INT_CODE; }
"float" { return FLOAT_CODE; }
"switch" {return SWITCH_CODE; }
[0-9]+ { yylval = atoi(yytext); return INT_LIT; }
[a-zA-Z]+ {return ASSIGN_OP; }
[ \t] {}
.      { return UNKNOWN; }
%%

main(int argc, char **argv)
{
  int tok;
  FILE *myfile = fopen("input.txt","r");
  if(!myfile){
	printf("ERROR-cannot open file \n");
}
else{
  yyin=myfile;
  while(tok = yylex()) {
    printf("\nNext token is: %d", tok);
    printf(" Next lexeme is: %s",yytext);
  }
  printf("Next token is: %d Next lexeme is: EOF \n", END_OF_FILE_CODE);
}
}
