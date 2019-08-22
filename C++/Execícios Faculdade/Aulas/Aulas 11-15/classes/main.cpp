#include<iostream>
#include "classe.h"
using namespace std;


int main()
{
  classe a(1,2,3), b(1,2,3), c(1,2,3);
  int x, y, z;
  cout << "Digite o valor de a:" << endl;
  cin >> z >> y >> x;
  a.altval(x,y,z);
  cout << endl << "Digite o valor de b:" << endl;
  cin >> z >> y >> x;
  b.altval(x,y,z);
  cout << endl << "A+B";
  c=a+b;
  cout << "\n a.x: " << a.verx() << ", a.y: " << a.very() << ", a.z: " << a.verz() << ", a.t: " << a.vert() << endl;
  cout << " b.x: " << b.verx() << ", b.y: " << b.very() << ", b.z: " << b.verz() << ", b.t: " << b.vert() << endl;
  cout << " c.x: " << c.verx() << ", c.y: " << c.very() << ", c.z: " << c.verz() << ", c.t: " << c.vert() << endl;
  cout << endl << "A*B";
  c=a*b;
  cout << "\n a.x: " << a.verx() << ", a.y: " << a.very() << ", a.z: " << a.verz() << ", a.t: " << a.vert() << endl;
  cout << " b.x: " << b.verx() << ", b.y: " << b.very() << ", b.z: " << b.verz() << ", b.t: " << b.vert() << endl;
  cout << " c.x: " << c.verx() << ", c.y: " << c.very() << ", c.z: " << c.verz() << ", c.t: " << c.vert() << endl;
  cout << endl << "A-B";
  c=a-b;
  cout << "\n a.x: " << a.verx() << ", a.y: " << a.very() << ", a.z: " << a.verz() << ", a.t: " << a.vert() << endl;
  cout << " b.x: " << b.verx() << ", b.y: " << b.very() << ", b.z: " << b.verz() << ", b.t: " << b.vert() << endl;
  cout << " c.x: " << c.verx() << ", c.y: " << c.very() << ", c.z: " << c.verz() << ", c.t: " << c.vert() << endl;
  cout << endl << "A/B";
  c=a/b;
  cout << "\n a.x: " << a.verx() << ", a.y: " << a.very() << ", a.z: " << a.verz() << ", a.t: " << a.vert() << endl;
  cout << " b.x: " << b.verx() << ", b.y: " << b.very() << ", b.z: " << b.verz() << ", b.t: " << b.vert() << endl;
  cout << " c.x: " << c.verx() << ", c.y: " << c.very() << ", c.z: " << c.verz() << ", c.t: " << c.vert() << endl;
  cout << endl << "A";
  c=a;
  cout << "\n a.x: " << a.verx() << ", a.y: " << a.very() << ", a.z: " << a.verz() << ", a.t: " << a.vert() << endl;
  cout << " b.x: " << b.verx() << ", b.y: " << b.very() << ", b.z: " << b.verz() << ", b.t: " << b.vert() << endl;
  cout << " c.x: " << c.verx() << ", c.y: " << c.very() << ", c.z: " << c.verz() << ", c.t: " << c.vert() << endl;
  cin.get();
  cin.get();
  return 0;    
}
