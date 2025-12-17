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
    PngBitBtn3: TPngBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Label7: TLabel;
    procedure PngBitBtn2Click(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2Exit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadmil: TFcadmil;
  dt: Tdate;

implementation

{$R *.dfm}

uses udados;

procedure TFcadmil.DBEdit2Exit(Sender: TObject);
begin
dt:=date();
//edit2.Text:= datetostr(dbedit2.Field.AsDateTime-dt);
end;

procedure TFcadmil.FormActivate(Sender: TObject);
begin
  dados.Tpg.Active:= true;
  dados.Dpg.enabled:= true;
  dados.Tsu.Active:= true;
  dados.Dsu.Enabled:= true;
  dados.Tgen.Active:= true;
  dados.Dgen.Enabled:= true;
  dados.qmil.Active:= true;
  dados.dqmil.Enabled:= true;
  dados.qpd.Active:= true;
  dados.dqpd.Enabled:= true;
  dados.Tcadmil.Active:= false;
  dados.Dcadmil.Enabled:= false;
  dados.qle.Active:= true;
  dados.dle.Enabled:= true;

end;

procedure TFcadmil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.Tpg.Active:= false;
  dados.Dpg.enabled:= false;
  dados.Tsu.Active:= false;
  dados.Dsu.Enabled:= false;
  dados.Tgen.Active:= false;
  dados.Dgen.Enabled:= false;

end;

procedure TFcadmil.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin
      dados.Tcadmil.Active:= true;
      dados.Dcadmil.Enabled:= true;
      dados.Tcadmil.Append;
      dbedit1.SetFocus;
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
      dados.Tcadmil.Post;
      showmessage('Cadastro efetuado');
      dados.qmil.Refresh;
      dados.Tcadmil.Close;
      PngBitBtn1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure TFcadmil.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dados.Tcadmil.Cancel;
      showmessage('Cadastro cancelado');
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
