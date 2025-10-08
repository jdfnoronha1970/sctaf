unit udados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tdados = class(TDataModule)
    conn: TFDConnection;
    Tcaduser: TFDTable;
    TcaduserId: TFDAutoIncField;
    Tcaduserusuario: TWideStringField;
    Tcaduseracesso: TIntegerField;
    Dcaduser: TDataSource;
    Tnacesso: TFDTable;
    Dacesso: TDataSource;
    Tnacessoid: TFDAutoIncField;
    Tnacessonivel: TWideStringField;
    Tcadusernacesso: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dados: Tdados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdados.DataModuleCreate(Sender: TObject);
begin
 dados.conn.Connected:= true;
end;

end.
