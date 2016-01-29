program Projetoblocow;

uses
  Forms,
  unitblocow in 'unitblocow.pas' {Form1},
  unitsalvar in 'unitsalvar.pas' {frmfecharaba};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrmfecharaba, frmfecharaba);
  Application.Run;
end.
