unit Uatualizar;

interface

uses classes;

type
  Tversao = class
    versao : String;
  end;

var
  vers : Tversao;

implementation
// 13/03/2009

begin
  vers := Tversao.Create;
  vers.versao := ' 1.7';
end.
