unit ucadmil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ComCtrls, PngBitBtn, PngSpeedButton, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Mask;

type
  TFcadmil = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    PngBitBtn3: TPngBitBtn;
    procedure PngBitBtn2Click(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadmil: TFcadmil;

implementation

{$R *.dfm}

uses udados;

procedure TFcadmil.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin
      dbedit1.SetFocus;
      dados.Tcaduser.Append;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure TFcadmil.PngBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFcadmil.PngBitBtn3Click(Sender: TObject);
begin
  try
    begin
      dados.Tcaduser.Post;
      showmessage('Cadastro efetuado');
      dbedit1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      dbedit1.SetFocus;
    end;
  end;
end;

procedure TFcadmil.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dbedit1.SetFocus;
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
