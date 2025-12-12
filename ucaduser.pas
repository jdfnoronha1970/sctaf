unit ucaduser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ComCtrls, PngBitBtn, PngSpeedButton, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Mask;

type
  TFcaduser = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    PngBitBtn3: TPngBitBtn;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
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
  Fcaduser: TFcaduser;

implementation

{$R *.dfm}

uses udados;

procedure TFcaduser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dados.Tcaduser.Active:= false;
 dados.Dcaduser.Enabled:= false;
end;

procedure TFcaduser.FormCreate(Sender: TObject);
begin
 dados.Tcaduser.Active:= true;
 dados.Dcaduser.Enabled:= true;
 dados.Tnacesso.Active:= true;
 dados.Dacesso.Enabled:= true;

end;

procedure TFcaduser.PngBitBtn1Click(Sender: TObject);
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

procedure TFcaduser.PngBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFcaduser.PngBitBtn3Click(Sender: TObject);
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

procedure TFcaduser.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dados.Tcaduser.Cancel;
      showmessage('Cadastro cancelado');
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
