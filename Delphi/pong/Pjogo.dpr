program Pjogo;

uses
  Forms,
  Uprincipal in 'Uprincipal.pas' {Form1},
  Usobre in 'Usobre.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
