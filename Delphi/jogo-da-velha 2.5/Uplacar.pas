unit Uplacar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Button1: TButton;
    pj: TLabel;
    pa: TLabel;
    pp: TLabel;
    pd: TLabel;
    pn: TLabel;
    pv: TLabel;
    pl: TLabel;
    Label8: TLabel;
    pe: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Ujogo;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
form2.free;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
if inv=1 then
begin
label1.caption:=nome;
pj.Caption:=inttostr(jogador);
pa.Caption:=inttostr(da);
pp.Caption:=inttostr(dp);
pd.Caption:=inttostr(dd);
pn.Caption:=inttostr(dn);
pv.Caption:=inttostr(dv);
pl.Caption:=inttostr(dl);
pe.Caption:=inttostr(empate);
label5.Caption:='Ninja';
label6.caption:='Vampiro';
label7.caption:='Lobisomem';
end
else
begin
label1.caption:=nome;
pj.Caption:=inttostr(jogador);
pa.Caption:=inttostr(da);
pp.Caption:=inttostr(dp);
pd.Caption:=inttostr(dd);
pn.Caption:=inttostr(dn);
pv.Caption:=inttostr(dv);
pl.Caption:=inttostr(dl);
pe.Caption:=inttostr(empate);
label5.Caption:='?????';
label6.caption:='?????';
label7.caption:='?????';
end;
end;

end.
