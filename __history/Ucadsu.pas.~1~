unit Ucadsu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ComCtrls, PngBitBtn, PngSpeedButton, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFcadsu = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    PngBitBtn3: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure PngBitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadsu: TFcadsu;

implementation

{$R *.dfm}

Uses
Udados;

procedure TFcadsu.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFcadsu.FormCreate(Sender: TObject);
begin
  dados.Tsu.Active:= true;
  dados.Dsu.Enabled:= true;
end;

procedure TFcadsu.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin
      dbedit1.SetFocus;
      dados.Tsu.Append;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure TFcadsu.PngBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFcadsu.PngBitBtn3Click(Sender: TObject);
begin
  try
    begin
      dados.Tsu.Post;
      showmessage('Cadastro efetuado');
      dbedit1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      dbedit1.SetFocus;
    end;
  end
end;

procedure TFcadsu.PngBitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TFcadsu.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dados.Tsu.Cancel;
      showmessage('Operação cancelada');
      dbedit1.SetFocus;

    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

end.
