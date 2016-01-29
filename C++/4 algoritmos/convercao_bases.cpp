/*Esse programa converte um número de uma base para outra
a base deve ser no minimo 2 e no máximo 36*/

#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include <string.h>
#include<math.h>

char resul[40];
int resul2;

char* num_alf(int num);
int alf_num(char num);
void dec_out(int num,int base);
void out_dec(char num[40],int base);
int check(char num[40], int base);

char* num_alf(int num) 
//recebe um numero decimal inteiro e retorna um caracter string
{
  switch(num)
  {
    case 0:
      return "0";
      break;
    case 1:
      return "1";
      break;
    case 2:
      return "2";
      break;  
    case 3:
      return "3";
      break;
    case 4:
      return "4";
      break;  
    case 5:
      return "5";
      break;
    case 6:
      return "6";
      break;  
    case 7:
      return "7";
      break;
    case 8:
      return "8";
      break;
    case 9:
      return "9";
      break;
    case 10:
      return "A";
      break;    
    case 11:
      return "B";
      break;
    case 12:
      return "C";
      break;
    case 13:
      return "D";
      break;
    case 14:
      return "E";
      break;
    case 15:
      return "F";
      break;
    case 16:
      return "G";
      break;
    case 17:
      return "H";
      break;
    case 18:
      return "I";
      break;
    case 19:
      return "J";
      break;
    case 20:
      return "K";
      break;
    case 21:
      return "L";
      break;
    case 22:
      return "M";
      break;
    case 23:
      return "N";
      break;     
    case 24:
      return "O";
      break;
    case 25:
      return "P";
      break;
    case 26:
      return "Q";
      break;
    case 27:
      return "R";
      break;
    case 28:
      return "S";
      break;
    case 29:
      return "T";
      break;
    case 30:
      return "U";
      break;
    case 31:
      return "V";
      break;
    case 32:
      return "W";
      break;
    case 33:
      return "X";
      break;
    case 34:
      return "Y";
      break;
    case 35:
      return "Z";
      break;    
  }      
}

int alf_num(char num) 
//recebe um caracter string e retorna um numero decimal inteiro
{
  switch(num)
  {
    case '0':
      return 0;
      break;
    case '1':
      return 1;
      break;
    case '2':
      return 2;
      break;  
    case '3':
      return 3;
      break;
    case '4':
      return 4;
      break;  
    case '5':
      return 5;
      break;
    case '6':
      return 6;
      break;  
    case '7':
      return 7;
      break;
    case '8':
      return 8;
      break;
    case '9':
      return 9;
      break;
    case 'A':
      return 10;
      break;    
    case 'B':
      return 11;
      break;
    case 'C':
      return 12;
      break;
    case 'D':
      return 13;
      break;
    case 'E':
      return 14;
      break;
    case 'F':
      return 15;
      break;
    case 'G':
      return 16;
      break;
    case 'H':
      return 17;
      break;
    case 'I':
      return 18;
      break;
    case 'J':
      return 19;
      break;
    case 'K':
      return 20;
      break;
    case 'L':
      return 21;
      break;
    case 'M':
      return 22;
      break;
    case 'N':
      return 23;
      break;     
    case 'O':
      return 24;
      break;
    case 'P':
      return 25;
      break;
    case 'Q':
      return 26;
      break;
    case 'R':
      return 27;
      break;
    case 'S':
      return 28;
      break;
    case 'T':
      return 29;
      break;
    case 'U':
      return 30;
      break;
    case 'V':
      return 31;
      break;
    case 'W':
      return 32;
      break;
    case 'X':
      return 33;
      break;
    case 'Y':
      return 34;
      break;
    case 'Z':
      return 35;
      break;
    default: 
      return 40;
  }      
}

void dec_out(int num,int base) 
//transforma um numero decimal para a base informada pelo sistema
{
  int y; //variavel para receber o resto das divisões
  char w[40];//variavel auxiliar para agregar resultados a variavel resul
  strcpy(resul,"");//zera a variavel resul
  do//inicio do laço
  {
    y=num % base;/*y recebe o resto da divisão do numero pela base 
    10 % 2, nesse exemplo quero transformar o numero decimal 10 em binario
    como 10/2=5, o resto da divisão é nulo, então y recebe 0*/
    num=num/base; /*aproveitando o exemplo acima, 
                 substituo o valor da variavel 10 por 10 div 2, que retorna 5*/
    strcpy(w,num_alf(y));/*transformo o valor de y em string, no exemplo, y é 0,
                          então estou atribuindo "0" para w*/
    strcat(w,resul);/*concateno resul com w, no primeiro loop resul é nulo, 
    mas na segunda vez terei y= 5%2=1, w recebe 1 transformado em string "1" 
    e depois o conteudo guardado em resul, w=w+resul, ou seja w="1"+"0"
    como os restos das divisões devem ser apresentados ao inverso, 
    o ultimo resultado vai na frente de todos*/
    strcpy(resul,w);/*resul recebe o valor de w para que w seja utilizado 
                      novamente no proximo loop sem perca de dados*/
  } while (num>=base);/*fim do laço, o loop acaba quando a divisão retornar 
                       um numero que não estoure a base desejada*/
  strcpy(w,num_alf(num));/*aqui é realizada a mesma operação acima descrita, 
                          mas utilizando o resultado da ultima divisão*/
  strcat(w,resul);
  strcpy(resul,w);
}

void out_dec(char num[40],int base)
//transforma um numero de qualquer base para a base decimal
{
  int i; //variavel de indice para o laço
  resul2=0; //zera a variavel resul2
  i=0; //zera o indice
  while(i!=strlen(num))/*repeti até i ser igual ao numero de caracteres 
                        do numero que se vai transformar*/
  {
    resul2=pow(base,i)*alf_num(num[strlen(num)-i-1])+resul2;
    /*resul2=base^i*(ultimo numero da cadeia de caracteres)+resul2
    se eu tiver o numero 64 da base 8, na primeira vez do loop 
    eu teria como equação:  resul2=8^0*4+0=1*4=4
    ja na segunda vez do laço eu teria: resul=8^1*6+4=8*6+4=48+4=52*/
    ++i;//simples incremento no indice para não criar um loop infinito
  }
}

int check(char num[40], int base)
//checa se o numero que o usuario digitou é compativel com a base informada
{
  int i,w; /*i é uma variavel indice para o loop e w vai retornar o valor final
             da função (0 para numero compativel e 1 para incompativel)*/
  w=0;     //zera w
  i=0;     //zera indice
  while(i!=strlen(num))//repeti uma vez para cada caracter
  {
    if (alf_num(num[i])>=base)/*transforma a string em caracter e verifica 
                                se é maior ou igual a base*/
      w=1;//caso seja então temos um valor imcompativel com a base então w=1
    ++i;                      //simples incremento no indice
  }
  return w;                   //retorna w como sendo o valor da função
}

main() //corpo principal do programa
{
  int b1,b2,resp; /*b1 é a base do numero que o usuario irá informar
                  b2 é a base para qual o numero será transformado
                  resp para saber se o programa será encerrado ou reiniciado*/
  char n1[40];  //n1 recebe o valor
  do{//incio do primeiro laço, esse é utilizado para repetição do programa
    do{/*inicio do segundo laço, esse é utilizado para garantir que a 
          base informada pelo usuário seja válida*/
      system("cls");
      printf("Digite qual a base que voce quer converter");
      printf("\n(maximo 36, bases menores que 2 sao invalidas): ");
      scanf("%d",&b1);//le a base de entrada
    }while((b1>36)||(b1<=1));
    dec_out(2147483647,b1);/*alguns teste apontaram esse valor como sendo 
                            o limite, numeros maiores que esse dão problema
                           no caso é transformado para a base que o usuario
                           informou somente como questão de visualização*/
    printf("\nDigite qual o numero que voce quer converter");
    printf("\n(numero maximo suportado: %s): ",resul);
    scanf("%s",n1);//le o numero de entrada
    if (check(n1,b1)==0)//checa se o numero é compativel com a base
    {
      out_dec(n1,b1);/*transforma o numero para decimal e de string para numero, 
                      processo nessario para a proxima etapa*/
      do{ //terceiro laço, esse verifica se a base de saída é válida
        printf("\nInforme a base que desja visualizar o numero: ");
        scanf ("%d",&b2);
      }while((b2>36)||(b2<=1));
      dec_out(resul2,b2);//transforma de decimal para a base de saída
      printf("\n%s",resul);//apresenta o resultado
    }
    else //se o numero não é compativel com a base informada
    {
      printf("\nCaracteres invalidos\nnao digite valores acima da base");
      printf("\nutilizar letras maiusculas");
    }
    printf("\n\nDigite 1 para repetir ou 0 para sair?\n");
    scanf("%d",&resp);    //le resposta para respetir o programa ou reinicia-lo
  }while(resp==1);
}
