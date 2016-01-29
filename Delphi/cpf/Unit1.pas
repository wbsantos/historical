unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
a :array[1..11] of byte;
i:integer;
begin
// ramdomize;
 edit1.clear;
 for i:=1 to 8 do
 begin
   a[i]:=random(9);
 end;
 a[9]:=8;
 a[10]:=((a[1]*1)+(a[2]*2)+(a[3]*3)+(a[4]*4)+(a[5]*5)+(a[6]*6)+(a[7]*7)+(a[8]*8)+(a[9]*9)) mod 11;
 a[11]:=((a[1]*0)+(a[2]*1)+(a[3]*2)+(a[4]*3)+(a[5]*4)+(a[6]*5)+(a[7]*6)+(a[8]*7)+(a[9]*8)+(a[10]*9)) mod 11;
 if a[10]>=10 then
  a[10]:=0;
 if a[11]>=10 then
  a[11]:=0;
 edit1.text:=inttostr(a[1])+inttostr(a[2])+inttostr(a[3])+'.'+inttostr(a[4])+inttostr(a[5])+inttostr(a[6])+'.'+inttostr(a[7])+inttostr(a[8])+inttostr(a[9])+'-'+inttostr(a[10])+inttostr(a[11]);
end;

end.
