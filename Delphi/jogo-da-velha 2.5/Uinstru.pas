unit Uinstru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    TabSheet2: TTabSheet;
    Image2: TImage;
    TabSheet3: TTabSheet;
    Image3: TImage;
    Multiplayer: TTabSheet;
    Image4: TImage;
    btnok: TButton;
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.btnokClick(Sender: TObject);
begin
form4.free;
end;

end.
