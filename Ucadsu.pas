unit Ucadsu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ComCtrls, PngBitBtn;

type
  TFcadsu = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngBitBtn3: TPngBitBtn;
    PngBitBtn4: TPngBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure PngBitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadsu: TFcadsu;

implementation

{$R *.dfm}

procedure TFcadsu.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFcadsu.PngBitBtn4Click(Sender: TObject);
begin
  close;
end;

end.
