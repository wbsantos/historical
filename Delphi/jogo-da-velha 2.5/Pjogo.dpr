program Pjogo;

uses
  Windows,
  Forms,
  Ujogo in 'Ujogo.pas' {Form1},
  Uplacar in 'Uplacar.pas' {Form2},
  Umulti in 'Umulti.pas' {Form3},
  Uinstru in 'Uinstru.pas' {Form4},
  sobre in 'sobre.pas' {Form5},
  Usplash in 'Usplash.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;

  Application.MainFormOnTaskbar := True;
  Application.Title := 'Jogo-da-Velha';
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
