unit uano;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  Tfano = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    PngBitBtn3: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    procedure PngBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fano: Tfano;

implementation

{$R *.dfm}

uses udados;

procedure Tfano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.tano.Active:= true;
  dados.dano.Enabled:= true;
  dados.qano.Active:= true;
  dados.dqano.Enabled:= true;
end;

procedure Tfano.FormCreate(Sender: TObject);
begin
  dados.tano.Active:= true;
  dados.dano.Enabled:= true;
  dados.qano.Active:= true;
  dados.dqano.Enabled:= true;
end;

procedure Tfano.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin
      dados.tano.Append;
      Dbedit1.SetFocus;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure Tfano.PngBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfano.PngBitBtn3Click(Sender: TObject);
begin
  try
    begin
      dados.tano.Post;
      showmessage('Cadastro efetuado');
      PngBitBtn1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure Tfano.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dados.tano.Cancel;
      PngBitBtn1.SetFocus;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

end.
