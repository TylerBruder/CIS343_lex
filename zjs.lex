%{
#include <stdio.h>
void printLexeme();
int lineNum = 1;
%}

%%
%{ /* This statement exits the interpreter */ %}
(END) { printf("END\t"); printLexeme();}
%{ /* All commands should end with a semicolon */ %}
(END_STATEMENT) { printf("END_STATEMENT:Semicolon \t"); printLexeme();}
%{ /* The command should plot a point */ %}
(POINT) { printf("POINT\t"); printLexeme(); }
%{ /* The command should draw a line */ %}
(LINE) { printf("LINE\t"); printLexeme(); }
%{ /* The command should draw a circle */ %}
(CIRCLE) { printf("CIRCLE\t"); printLexeme(); }
%{ /* The command should draw a rectangle */ %}
(RECTANGLE) { printf("RECTANGLE\t"); printLexeme(); }
%{ /* The command should set a color */ %}
(SET_COLOR) { printf("SET_COLOR\t"); printLexeme(); }
%{ /* The command should match an integer value */ %}
[0-9]+ { printf("INT"); printLexeme(); }
%{ /* The command should match a floating point value */ %}
[0-9]+?\.[0-9]+? { printf("FLOAT"); printLexeme(); }
%{ /* The command should match tabs, spaces, or newlines and ignore them */ %}
[ \t]+ ;
%{ /* Catch anything not listed previously, and locate the error / match */ %}
(\n) { lineNum++; }
. {printf("Error occured at line:  %d", lineNum); 
	printLexeme(); } 

%%
//Help From Justin
void printLexeme(){
printf("(%s)\n", yytext);
}
