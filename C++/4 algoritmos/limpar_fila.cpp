/*Esse programa apaga a fila de impress�o que as vezes fica travada ou 
imprimindo coisas que n�o deveria*/

#include<stdio.h>
#include<stdlib.h>
main()
{
  system("net stop spooler"); //para o servi�o da impressora
  system("cd c:\windows\system32\spool\PRINTERS"); /*entra na pasta de arquivos 
                                                    de impress�o do windows*/
  system("del /f /s *.shd"); //apaga todos os arquivos *.shd 
  system("del /f /s *.spl"); //apaga todos os arquivos *.spl
  system("net start spooler");//reinicia o servi�o da impressora
  system("cls");//limpa a tela
  printf("Por favor desligue a impressora e aguarde ");
  printf("em torno de 10 a 20 segundos\n");
  //reiniciar a impressora p/ apagar qualquer arquivo que esteja na sua mem�ria
  system("pause");//agurda resposta do usu�rio
  printf("\n\nAgora religue-a\n");
  system("pause");
}
