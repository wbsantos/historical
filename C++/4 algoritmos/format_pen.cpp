/*Esse programa formata uma unidade, como um pen drive ou cartão de memória
sem perca de dados, primeiro é copiado o conteudo da unidade para o HD e depois
a unidade é formatada em NTFS e por ultimo os arquivos são copiados de volta
para a unidade e deletados do HD*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
main()
{
  char control[50],unidade[5]; //var de controle para concatenar com var unidade
  int resp; // variavel resp para confirmar formatação
  printf("Informe a letra da unidade: "); 
  scanf("%s",unidade);//ler letra da unidade a ser formatada
  system("md c:\pastatemp");//cria pasta temporaria q recebe arquivos da unidade
  
  strcat(control,"xcopy ");//comando para copiar tudo da unidade para pasta temp
  strcat(control,unidade);  //concatenar letra da unidade com o comando xcopy
  strcat(control,":\*.* c:\pastatemp /h /e /k"); //concatena resto do comando
  system(control);  //realiza a cópia dos arquivos da unidade para a pasta
  
  printf("\n\n Arquivos copiados com sucesso\nTem certeza que deseja ");
  printf("formatar a unidade? (Digite 1 para sim ou 0 para não)\n");
  scanf("%d",&resp);//le a resposta
  if (resp==1) //se o usuario responde sim
  {
    strcpy(control,"");//zera a variavel de controle
    strcat(control,"format ");//comando para formatar
    strcat(control,unidade); //concatena o comando format com a letra da unidade
    strcat(control,":\ /fs:ntfs");//defini o formato da unidade
    system(control);  //formata a unidade
    
    printf("\n\nUnidade formatada com sucesso"); 
    printf("\nAguarde a copia de seus arquivos\n");
    strcpy(control,"");//zera a variavel
    strcat(control,"xcopy c:\pastatemp\*.* ");//copiar da pasta temp p/ unidade
    strcat(control,unidade);//concatena letra da unidade
    strcat(control,":\ /h /e /k");//concatena final do comando
    system(control);  //finalmente realiza a cópia de volta para a unidade
    system("rd /s /q c:\pastatemp"); //apaga a pasta temporária
  }
}
