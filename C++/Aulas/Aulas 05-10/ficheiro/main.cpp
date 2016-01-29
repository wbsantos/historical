#include <fstream>
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    ofstream doc_out ("save.txt");
    ifstream doc_in ("save.txt");
    char aux[50],linha[50];
    while (aux[0]!=';')
    {
      cin.getline(aux,50);
      doc_out << aux << endl;
    }
    doc_out.close();
    while (doc_in.getline(linha,50))
      cout << linha << endl;
    cin.get();
    return 0;
}
