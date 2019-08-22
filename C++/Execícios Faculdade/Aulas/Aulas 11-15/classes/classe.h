#ifndef _CLASSE_H_
#define _CLASSE_H_

class classe
{
  private:
    int x, y, z, t; 
    void conta(){t=x+y*z;} 

  public:    
             
    classe(int x1, int y1, int z1);
    void altx(int x) 
    {this->x=x;
      conta();}
    void alty(int y) 
    {this->y=y;
      conta();}
    void altz(int z) 
    {this->z=z;
     conta();}
      
    void altval(int x, int y, int z);
    
    
    int verx() {return x;}
    int very() {return y;}
    int verz() {return z;}
    int vert() {return t;}
    
    classe& operator + (classe incla)
    {
      classe temp(0,0,0);
      temp.x=x+incla.x;
      temp.y=y+incla.y;
      temp.z=z+incla.z;
      temp.conta();
      return temp;       
    }
    
    classe operator * (classe incla)
    {
      classe temp(0,0,0);
      temp.x=x*incla.x;
      temp.y=y*incla.y;
      temp.z=z*incla.z;
      temp.conta();
      return temp;       
    }
    
    classe operator / (classe incla)
    {
      classe temp(0,0,0);
      temp.x=x/incla.x;
      temp.y=y/incla.y;
      temp.z=z/incla.z;
      temp.conta();
      return temp;       
    }
    
    classe operator - (classe incla)
    {
      classe temp(0,0,0);
      temp.x=x-incla.x;
      temp.y=y-incla.y;
      temp.z=z-incla.z;
      temp.conta();
      return temp;       
    }
    
    classe& operator = (classe incla)
    {
      x=incla.x;
      y=incla.y;
      z=incla.z;
      t=incla.t;
      return *this;       
    }  
};

#endif
