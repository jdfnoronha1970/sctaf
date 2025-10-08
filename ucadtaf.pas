unit ucadtaf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ComCtrls, PngBitBtn, PngSpeedButton, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Mask;

type
  TFcadtaf = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    PngBitBtn3: TPngBitBtn;
    procedure PngBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadtaf: TFcadtaf;

implementation

{$R *.dfm}

uses udados;

procedure TFcadtaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dados.Tcaduser.Active:= false;
 dados.Dcaduser.Enabled:= false;
end;

procedure TFcadtaf.FormCreate(Sender: TObject);
begin
 dados.Tcaduser.Active:= true;
 dados.Dcaduser.Enabled:= true;

end;

procedure TFcadtaf.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin

      dados.Tcaduser.Append;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure TFcadtaf.PngBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFcadtaf.PngBitBtn3Click(Sender: TObject);
begin
  try
    begin
      dados.Tcaduser.Post;
      showmessage('Cadastro efetuado');
      ;
    end;
  except
    begin
      showmessage('Operação inválida');

    end;
  end;
end;

procedure TFcadtaf.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin

      dados.Tcaduser.Cancel;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

end.
