unit UFatualizadn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFatualizadn = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const [Ref] Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fatualizadn: TFatualizadn;

implementation

{$R *.dfm}

Uses  udados;


procedure TFatualizadn.DBGrid1DrawDataCell(Sender: TObject;
  const [Ref] Rect: TRect; Field: TField; State: TGridDrawState);
begin
//dbgrid1.Fields[2].Value:= 2025;
// dbgrid1.Fields[2].Value.AsInteger:= 2025;


end;

procedure TFatualizadn.FormActivate(Sender: TObject);
begin
dados.qaltemil.Active:= true;
dados.dqaltera.Enabled:= true;

  with dados.qaltemil do
  begin
    close;
    sql.Clear;
    sql.Add('select id,dn, DateDiff(''yyyy'',dn,now()) as ano from tbmil');
   //sql.Add('select id, db, (now()) as  ',
    open;
  end;


end;

procedure TFatualizadn.FormCreate(Sender: TObject);
begin
      with DBGrid1.Columns.Add do // adiciona uma coluna no "fim" da grade (ULTIMA coluna)
begin
    FieldName := 'ano';
    Title.Caption := 'ano';
end;
end;

end.
