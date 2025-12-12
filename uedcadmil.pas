unit uedcadmil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TFedcadmil = class(TForm)
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormDeactivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fedcadmil: TFedcadmil;
  pnome: String;
  pedita: integer;

implementation

{$R *.dfm}

uses udados;

procedure TFedcadmil.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFedcadmil.BitBtn2Click(Sender: TObject);
begin
  with dados.qmil do
  begin
    close;
    sql.Clear;
    sql.Add('select * from tbmil where nguerra =:pnome');
    Params.ParamValues['pnome']:= Edit1.Text;
    open;
  end;

end;

procedure TFedcadmil.BitBtn3Click(Sender: TObject);
begin
 dados.Tcadmil.Edit;
 dbedit1.SetFocus;
end;

procedure TFedcadmil.BitBtn4Click(Sender: TObject);
begin
  try
    begin
      dados.Tcadmil.cancel;
      showmessage('Alteração cancelada');
      edit1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      edit1.SetFocus;
    end;
  end;
end;

procedure TFedcadmil.BitBtn5Click(Sender: TObject);
begin
  try
    begin
      dados.Tcadmil.Post;
      dados.Tcadmil.Refresh;
      dados.qmil.Refresh;
      showmessage('Registro alterado');
      edit1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      edit1.SetFocus;
    end;
  end;


end;

procedure TFedcadmil.DBGrid1CellClick(Column: TColumn);
begin
  pedita:= dados.qmilid.Value;
  dados.Tcadmil.FindKey([pedita]);
end;

procedure TFedcadmil.Edit1Change(Sender: TObject);
begin
  pnome:= edit1.Text;
  with dados.qmil do
  begin
    close;
    sql.Clear;
    sql.Add('select * from tbmil where nguerra like :pnome');
    Params.ParamByName('pnome').AsString:= Edit1.Text+'%';
    open;
  end;
end;

procedure TFedcadmil.FormCreate(Sender: TObject);
begin
  dados.Tcadmil.Active:= true;
  dados.Dcadmil.Enabled:= true;
  dados.qmil.Active:= true;
  dados.dqmil.Enabled:= true;
  dados.Tpg.Active:= true;
  dados.Dpg.Enabled:= true;
  dados.Tsu.Active:= true;
  dados.Dsu.Enabled:= true;
  dados.Tgen.Active:= true;
  dados.Dgen.Enabled:= true;
  dados.qpd.Active:= true;
  dados.dqpd.Enabled:= true;
end;

procedure TFedcadmil.FormDeactivate(Sender: TObject);
begin
  dados.Tcadmil.Active:= false;
  dados.Dcadmil.Enabled:= false;
  dados.qmil.Active:= false;
  dados.dqmil.Enabled:= false;
  dados.Tpg.Active:= false;
  dados.Dpg.Enabled:= false;
  dados.Tsu.Active:= false;
  dados.Dsu.Enabled:= false;
  dados.Tgen.Active:= false;
  dados.Dgen.Enabled:= false;
  dados.qpd.Active:= false;
  dados.dqpd.Enabled:= false;
end;

end.
