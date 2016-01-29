unit unitblocow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ComCtrls, ExtDlgs, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    arquivo: TMenuItem;
    Editar: TMenuItem;
    Formatar: TMenuItem;
    Exibir: TMenuItem;
    pgcarquivos: TPageControl;
    NovaAba: TMenuItem;
    mniquebra: TMenuItem;
    FecharAba: TMenuItem;
    AbrirArquivo: TMenuItem;
    openfile: TOpenDialog;
    formatfont: TFontDialog;
    SalvarArquivo: TMenuItem;
    Savefile: TSaveDialog;
    SalvarComo: TMenuItem;
    Sair1: TMenuItem;
    Fonte1: TMenuItem;
    Find: TFindDialog;
    Desfazer1: TMenuItem;
    Refazer1: TMenuItem;
    Copiar1: TMenuItem;
    Recortar1: TMenuItem;
    Excuir1: TMenuItem;
    SelecionarTudo1: TMenuItem;
    Colar1: TMenuItem;
    Status: TStatusBar;
    SalvarTudo: TMenuItem;
    Timer: TTimer;
    SalvamentoAutomtico1: TMenuItem;
    Nunca: TMenuItem;
    m1: TMenuItem;
    m2: TMenuItem;
    m3: TMenuItem;
    m4: TMenuItem;
    m5: TMenuItem;
    m6: TMenuItem;
    m7: TMenuItem;
    m8: TMenuItem;
    m9: TMenuItem;
    m10: TMenuItem;
    Barradestatus: TMenuItem;
    SempreAcima1: TMenuItem;
    DividirTela1: TMenuItem;
    pgcarquivos2: TPageControl;
    nd: TMenuItem;
    dh: TMenuItem;
    dv: TMenuItem;
    Print: TPrintDialog;
    PageSetup: TPageSetupDialog;
    ConfigurarPgina1: TMenuItem;
    Imprimir1: TMenuItem;
    Memo1: TMemo;
    procedure NovaAbaClick(Sender: TObject);
    procedure mniquebraClick(Sender: TObject);
    procedure FecharAbaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AbrirArquivoClick(Sender: TObject);
    procedure SalvarArquivoClick(Sender: TObject);
    procedure SalvarComoClick(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure LocalizarClick(Sender: TObject);
    procedure Refazer1Click(Sender: TObject);
    procedure SelecionarTudo1Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Colar1Click(Sender: TObject);
    procedure Recortar1Click(Sender: TObject);
    procedure Excuir1Click(Sender: TObject);
    procedure SalvarTudoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BarradestatusClick(Sender: TObject);
    procedure NuncaClick(Sender: TObject);
    procedure m1Click(Sender: TObject);
    procedure m2Click(Sender: TObject);
    procedure m3Click(Sender: TObject);
    procedure m4Click(Sender: TObject);
    procedure m5Click(Sender: TObject);
    procedure m6Click(Sender: TObject);
    procedure m7Click(Sender: TObject);
    procedure m8Click(Sender: TObject);
    procedure m9Click(Sender: TObject);
    procedure m10Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SempreAcima1Click(Sender: TObject);
    procedure pgcarquivosEnter(Sender: TObject);
    procedure pgcarquivos2Enter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dhClick(Sender: TObject);
    procedure dvClick(Sender: TObject);
    procedure ndClick(Sender: TObject);
    procedure ConfigurarPgina1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Desfazer1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  contagem:integer;

  memo: array [1..2,1..100] of trichedit;
  local:array [1..2,1..100] of string;
  aba:array [1..2,1..100] of ttabsheet;
  existir:array[1..2,1..100] of boolean;
  desfazer:array[1..2,1..100,1..100] of string;
  i,j,l,salvar,w:byte;
  s:string;
  texto:array[1..2,1..100]of string;
  testesalvartudo:boolean;

implementation

uses Unitsalvar;

{$R *.dfm}

procedure TForm1.m10Click(Sender: TObject);
begin
timer.Interval:=10*60*1000;
timer.Enabled:=true;
m10.Checked:=true;
end;

procedure TForm1.m1Click(Sender: TObject);
begin
timer.Interval:=1*60*1000;
timer.Enabled:=true;
m1.Checked:=true;
end;

procedure TForm1.m2Click(Sender: TObject);
begin
timer.Interval:=2*60*1000;
timer.Enabled:=true;
m2.Checked:=true;
end;

procedure TForm1.m3Click(Sender: TObject);
begin
timer.Interval:=3*60*1000;
timer.Enabled:=true;
m3.Checked:=true;
end;

procedure TForm1.m4Click(Sender: TObject);
begin
timer.Interval:=4*60*1000;
timer.Enabled:=true;
m4.Checked:=true;
end;

procedure TForm1.m5Click(Sender: TObject);
begin
timer.Interval:=5*60*1000;
timer.Enabled:=true;
m5.Checked:=true;
end;

procedure TForm1.m6Click(Sender: TObject);
begin
timer.Interval:=6*60*1000;
timer.Enabled:=true;
m6.Checked:=true;
end;

procedure TForm1.m7Click(Sender: TObject);
begin
timer.Interval:=7*60*1000;
timer.Enabled:=true;
m7.Checked:=true;
end;

procedure TForm1.m8Click(Sender: TObject);
begin
timer.Interval:=8*60*1000;
timer.Enabled:=true;
m8.Checked:=true;
end;

procedure TForm1.m9Click(Sender: TObject);
begin
timer.Interval:=9*60*1000;
timer.Enabled:=true;
m9.Checked:=true;
end;

procedure TForm1.ndClick(Sender: TObject);
begin
nd.Checked:=true;
j:=1;
testesalvartudo:=false;
for i := 1 to 100 do
  begin
  if existir[2,i]=true then
  begin
    if texto[2,i]<>memo[2,i].Lines.Text then
       begin
         pgcarquivos2.ActivePage:=aba[2,i];
         frmfecharaba.ShowModal;
       end;
     if salvar=1 then
      salvararquivo.click;
     if (salvar=3) then
      exit;
     memo[2,i].lines.Text:='';
     texto[2,i]:='';
     local[2,i]:='';
     memo[2,i].destroy;
     aba[2,i].destroy;
     salvar:=0;
     existir[2,i]:=false;
  end;
  end;
pgcarquivos2.Visible:=false;
pgcarquivos.Align:=alclient;
end;

procedure TForm1.NovaAbaClick(Sender: TObject);
begin
 if (pgcarquivos.PageCount=100)and(j=1)or(pgcarquivos2.pagecount=100)and(j=2) then
  showmessage('Máximo 100 abas simultâneas')
 else
 begin
  for i := 1 to 100 do
   begin
    if existir[j,i]=false then
     begin
     contagem:=contagem+1;
     aba[j,i]:=ttabsheet.Create(self);
     if j=1 then
      aba[j,i].create(self).pagecontrol:=pgcarquivos;
     if j=2 then
      aba[j,i].create(self).pagecontrol:=pgcarquivos2;
     existir[j,i]:=true;
     aba[j,i].Caption:='Novo Arquivo ('+inttostr(contagem)+')';
     memo[j,i]:=trichedit.Create(self);
     memo[j,i].parent:=aba[j,i];
     memo[j,i].Align:=alclient;
     if mniquebra.Checked=true then
      memo[j,i].ScrollBars:=ssvertical
     else
      memo[j,i].ScrollBars:=ssboth;
     memo[j,i].Font.Style:=formatfont.Font.Style;
     memo[j,i].Font.name:=formatfont.Font.Name;
     memo[j,i].Font.size:=formatfont.Font.Size;
    if contagem<>1 then
     begin
     if j=1 then
      pgcarquivos.ActivePage:=aba[j,i];
     if j=2 then
      pgcarquivos2.ActivePage:=aba[j,i];
     memo[j,i].SetFocus;
     end;
      local[j,i]:='';
      texto[j,i]:='';
      exit;
   end;
end;
end;
end;

procedure TForm1.NuncaClick(Sender: TObject);
begin
timer.Enabled:=false;
nunca.Checked:=true;
end;

procedure TForm1.pgcarquivos2Enter(Sender: TObject);
begin
j:=2;
end;

procedure TForm1.pgcarquivosEnter(Sender: TObject);
begin
j:=1;
end;

procedure TForm1.Recortar1Click(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
memo[j,i].CutToClipboard;
end;

procedure TForm1.Refazer1Click(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
 memo[j,i].Perform(EM_UNDO,1,1);
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.SalvarArquivoClick(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
i:=i+1;
if local[j,i]<>'' then
begin
 memo1.Lines:=memo[j,i].Lines;
 memo1.Lines.savetofile(local[j,i]);
 texto[j,i]:=memo[j,i].Lines.Text;
end
else
 salvarcomo.click;
end;

procedure TForm1.SalvarComoClick(Sender: TObject);
begin
i:=1;
while aba[j,i].Visible=false do
i:=i+1;
if savefile.Execute then
begin
 memo1.Lines:=memo[j,i].Lines;
 memo1.Lines.savetofile(savefile.FileName);
 aba[j,i].Caption:=extractfilename(savefile.FileName);
 local[j,i]:=(savefile.filename);
 texto[j,i]:=memo[j,i].lines.Text;
 savefile.FileName:='';
end;
end;

procedure TForm1.SalvarTudoClick(Sender: TObject);
begin
for l := 1 to 2 do
  begin
    for i:=1 to 100 do
      begin
        if existir[l,i]=true then
          begin
            if local[l,i]<>'' then
              begin
                memo1.Lines:=memo[j,i].Lines;
                memo1.Lines.savetofile(local[j,i]);
                texto[l,i]:=memo[l,i].Lines.Text;
              end
            else
              begin
                if l=1 then
                  pgcarquivos.activepage:=aba[l,i];
                if l=2 then
                  pgcarquivos2.activepage:=aba[l,i];
                salvarcomo.click;
              end;
          end;
      end;
  end;
end;

procedure TForm1.SelecionarTudo1Click(Sender: TObject);
begin
 i:=1;
 while aba[j,i].Visible=false do
  i:=i+1;
 memo[j,i].SelectAll;
end;

procedure TForm1.SempreAcima1Click(Sender: TObject);
begin
 if sempreacima1.Checked=false then
  form1.FormStyle:=fsnormal
 else
  form1.FormStyle:=fsstayontop;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
 salvartudo.Click;
end;

procedure TForm1.AbrirArquivoClick(Sender: TObject);
var
nomearquivo:string;
begin
if openfile.Execute then
begin
 i:=1;
 while aba[j,i].Visible=false do
 i:=i+1;
 if memo[j,i].lines.Text<>'' then
  novaaba.Click;
 memo[j,i].lines.loadfromfile(openfile.filename);
 aba[j,i].Caption:=extractfilename(openfile.filename);
 local[j,i]:=openfile.FileName;
 texto[j,i]:=memo[j,i].lines.Text;
 openfile.filename:='';
end;
end;

procedure TForm1.BarradestatusClick(Sender: TObject);
begin
if barradestatus.Checked=true then
 status.Visible:=true
else
 status.Visible:=false;
end;

procedure TForm1.Colar1Click(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
memo[j,i].PasteFromClipboard;
end;

procedure TForm1.ConfigurarPgina1Click(Sender: TObject);
begin
 pagesetup.Execute();
 i:=1;
 while aba[j,i].visible=false do
  i:=i+1;
 aba[j,i].SetFocus;
 memo[j,i].SetFocus;
end;

procedure TForm1.Copiar1Click(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
memo[j,i].CopyToClipboard;
end;

procedure TForm1.Desfazer1Click(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
memo[j,i].Undo;
end;

procedure TForm1.dhClick(Sender: TObject);
begin
dh.Checked:=true;
pgcarquivos.Align:=altop;
pgcarquivos2.Align:=albottom;
j:=2;
if pgcarquivos2.Visible=false then
begin
 pgcarquivos2.Visible:=true;
 novaaba.Click;
end;
pgcarquivos.Height:=(form1.Height div 2)-37;
pgcarquivos2.Height:=(form1.Height div 2)-37;
pgcarquivos.width:=form1.width-15;
pgcarquivos2.width:=form1.width-15;
end;

procedure TForm1.dvClick(Sender: TObject);
begin
dv.Checked:=true;
pgcarquivos.Align:=alleft;
pgcarquivos2.Align:=alright;
j:=2;
if pgcarquivos2.Visible=false then
begin
 pgcarquivos2.Visible:=true;
 novaaba.Click;
end;
pgcarquivos.Height:=form1.Height-75;
pgcarquivos2.Height:=form1.Height-75;
pgcarquivos.width:=(form1.width div 2)-6;
pgcarquivos2.width:=(form1.width div 2)-6;
end;

procedure TForm1.Excuir1Click(Sender: TObject);
begin
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
memo[j,i].ClearSelection;
end;

procedure TForm1.FecharAbaClick(Sender: TObject);
begin
testesalvartudo:=false;
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
if j=1 then
 if pgcarquivos.pagecount<>1 then
   begin
     if texto[j,i]<>memo[j,i].Lines.Text then
       begin
         frmfecharaba.ShowModal;
       end;
     if salvar=1 then
       salvararquivo.click;
     if (salvar=3) then
       exit;
     memo[j,i].Lines.Text:='';
     texto[j,i]:='';
     local[j,i]:='';
     memo[j,i].destroy;
     if aba[j,i].TabIndex=pgcarquivos.PageCount-1 then
       begin
         aba[j,i].destroy;
         pgcarquivos.ActivePage:=aba[j,i-1];
       end
     else
       aba[j,i].destroy;
   end;
if j=2 then
 if pgcarquivos2.pagecount<>1 then
   begin
     if texto[j,i]<>memo[j,i].Lines.Text then
       begin
         frmfecharaba.ShowModal;
       end;
     if salvar=1 then
      salvararquivo.click;
     if (salvar=3)and(memo[j,i].Lines.Text<>texto[j,i]) then
      exit;
     memo[j,i].lines.Text:='';
     texto[j,i]:='';
     local[j,i]:='';
     memo[j,i].destroy;
     if aba[j,i].TabIndex=pgcarquivos2.PageCount-1 then
       begin
         aba[j,i].destroy;
         pgcarquivos2.ActivePage:=aba[j,i-1];
       end
     else
       aba[j,i].destroy;
   end;
   salvar:=0;
   existir[j,i]:=false;
end;

procedure TForm1.Fonte1Click(Sender: TObject);
begin
if formatfont.Execute then
 begin
  for l := 1 to 2 do
   begin
    for I := 1 to 100 do
     begin
      if existir[l,i]=true then
       begin
        memo[l,i].Font.Style:=formatfont.Font.Style;
        memo[l,i].Font.name:=formatfont.Font.Name;
        memo[l,i].Font.size:=formatfont.Font.Size;
        memo[l,i].Font.Color:=formatfont.Font.Color;
       end;
     end;
   end;
 end;
i:=1;
while aba[j,i].visible=false do
 i:=i+1;
aba[j,i].SetFocus;
memo[j,i].SetFocus;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
testesalvartudo:=true;
 for l := 1 to 2 do
  begin
   for I := 1 to 100 do
    begin
     if (existir[l,i]=true)and (memo[l,i].Lines.Text<>texto[l,i]) then
      begin
       if l=1 then
        pgcarquivos.ActivePage:=aba[l,i];
       if l=2 then
        pgcarquivos2.ActivePage:=aba[l,i];
       if salvar=4 then
        salvararquivo.Click
       else
        begin
         frmfecharaba.ShowModal;
         if salvar=1 then
          salvararquivo.Click;
         if salvar=3 then
          begin
           salvar:=0;
           canclose:=false;
           exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
for l := 1 to 2 do
for I := 1 to 100 do
existir[l,i]:=false;
testesalvartudo:=false;
pgcarquivos.Align:=alclient;
j:=1;
contagem:=0;
novaaba.Click;
local[1,1]:=(ParamStr(1));
if local[1,1]<>'' then
begin
 memo[1,1].Lines.loadfromfile(local[1,1]);
 aba[1,1].Caption:=extractfilename(local[1,1]);
 texto[1,1]:=memo[1,1].Lines.text;
end;
status.panels[0].text:='Linha: '+IntToStr(1);
status.Panels[1].Text:='Coluna: '+inttostr(1);
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
w:=1;
while aba[j,w].visible=false do
 w:=w+1;
status.panels[0].text:='Linha: '+IntToStr(Memo[j,w].CaretPos.Y+1);
status.Panels[1].Text:='Coluna: '+inttostr(memo[j,w].caretpos.x+1);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
if dh.Checked=true then
begin
 pgcarquivos.Height:=(form1.Height div 2)-37;
 pgcarquivos2.Height:=(form1.Height div 2)-37;
 pgcarquivos.width:=form1.width-15;
 pgcarquivos2.width:=form1.width-15;
end;
if dv.Checked=true then
begin
 pgcarquivos.Height:=form1.Height-75;
 pgcarquivos2.Height:=form1.Height-75;
 pgcarquivos.width:=(form1.width div 2)-6;
 pgcarquivos2.width:=(form1.width div 2)-6;
end;
end;

procedure TForm1.Imprimir1Click(Sender: TObject);
begin
if print.Execute then
  memo[j,i].Print(text);
i:=1;
while aba[j,i].Visible=false do
 i:=i+1;
aba[j,i].SetFocus;
memo[j,i].SetFocus;
end;

procedure TForm1.LocalizarClick(Sender: TObject);
begin
i:=1;
 while aba[j,i].Visible=false do
  i:=i+1;
 find.Execute();
end;

procedure TForm1.mniquebraClick(Sender: TObject);
begin
 for l := 1 to 2 do
 begin
  for I := 1 to 100 do
  begin
   if existir[l,i]=true then
   begin
    if mniquebra.Checked=true then
    memo[l,i].ScrollBars:=ssvertical
    else
    memo[l,i].ScrollBars:=ssboth;
   end;
  end;
 end;
end;

end.
