%{
	int i;
	int estat = 0;
	int num_estats;
	int simbol = 0;
%}

alfabeto	[Aa][Ll][Ff][Aa][Bb][Ee][Tt][Oo]
estados		[Ee][Ss][Tt][Aa][Dd][Oo][Ss]
transiciones	[Tt][Rr][Aa][Nn][Ss][Ii][Cc][Ii][Oo][Nn][Ee][Ss]
inicial		[Ii][Nn][Ii][Cc][Ii][Aa][Ll]
final		[Ff][Ii][Nn][Aa][Ll][Ee][Ss]
ABRIR		"{"
CERRAR		"}"
SIMBOLO		[a-zA-Z0-9]
NUMERO		0|[1-9][0-9]*
COMENTARIO	"%"
LINIA		"\n"
TAB			"\t"
ESPACIO		" "
ESPACIOS	({ESPACIO}|{TAB})*
COMA		","
TRANSICION	"("{ESPACIOS}{NUMERO}{ESPACIOS}","{ESPACIOS}{SIMBOLO}{ESPACIOS}";"{ESPACIOS}{NUMERO}{ESPACIOS}")"

%%
{alfabeto}			{printf("Alfabet"); simbol = 1;}
{estados}			{printf("Estats"); estat = 1; simbol = 0;}
{transiciones}			{printf("Transicions"); simbol = 0;}
{inicial}			{printf("Estat Inicial"); simbol = 0;}
{final}				{printf("Estats Finals"); simbol = 0;}
{COMENTARIO}(.)*{LINIA}		{printf("S'ha detectat un Comentari \n");}
{TRANSICION}			{printf("Transició");}
{NUMERO}			{
if(simbol == 0){
	printf("Número");
	if( estat == 1 )
	{ 
		for(i=0; i<yyleng; i++) num_estats=num_estats*10+(yytext[i]-48); 
		estat=0;
	}
}
else{printf("Símbol");}
}
{SIMBOLO}				{printf("Símbol");}
{COMA}					{printf(",");}
{ABRIR}					{printf("{");}
{CERRAR}				{printf("}");}
{ESPACIOS}|LINIA		{}

%%
main(argc, argv)
int argc;
char **argv;
{
	if(argc > 1) {
		if(!(yyin = fopen(argv[1], "r"))) {
			perror(argv[1]);
			return (1);
		}
	}
	yylex();
	printf("\nNúmero d'estats: %i\n", num_estats);
}
