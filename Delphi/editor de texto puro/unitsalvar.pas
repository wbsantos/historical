unit unitsalvar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrmfecharaba = class(TForm)
    btnsalvar: TBitBtn;
    naosalvar: TBitBtn;
    cancelar: TBitBtn;
    Label1: TLabel;
    saveall: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure naosalvarClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure saveallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmfecharaba: Tfrmfecharaba;

implementation

uses unitblocow;

{$R *.dfm}

procedure Tfrmfecharaba.cancelarClick(Sender: TObject);
begin
salvar:=3;
end;

procedure Tfrmfecharaba.FormShow(Sender: TObject);
begin
 if testesalvartudo=false then
 begin
  saveall.Visible:=false;
  frmfecharaba.Width:=326;
 end
 else
 begin
   saveall.visible:=true;
   frmfecharaba.Width:=425;
 end;
 salvar:=3;
 label1.Caption:='Salvar as alterações em "'+aba[j,i].caption+'" ?';
end;

procedure Tfrmfecharaba.naosalvarClick(Sender: TObject);
begin
salvar:=2;
end;

procedure Tfrmfecharaba.saveallClick(Sender: TObject);
begin
 salvar:=4;
end;

procedure Tfrmfecharaba.btnsalvarClick(Sender: TObject);
begin
salvar:=1;
end;

end.
