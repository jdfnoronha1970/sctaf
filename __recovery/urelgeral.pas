unit urelgeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, PngBitBtn;

type
  Tfresgeral = class(TForm)
    FlowPanel1: TFlowPanel;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    PngBitBtn2: TPngBitBtn;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fresgeral:          Tfresgeral;
  anoa:                    tdate;
  anob:               tdatetime;
//   ano, mes, dia:      integer;
  year, month, day:   word;
//   year, month, day:   integer;
//   ano, mes, dia:      word;
//   year, month, day:   double;

implementation

{$R *.dfm}
uses udados;

procedure Tfresgeral.DBLookupComboBox1Click(Sender: TObject);
var
  pesq : string;
begin
  pesq:= DBLookupComboBox1.Text;
  with dados.qrelgeral do
    begin
      close;
      sql.Clear;
//      sql.Add('select * from tbresultados where ano=:"pesq"');
      sql.Add('SELECT m.nguerra, m.genero, m.dn, m.pd, dateDiff(''yyyy'', dn,now()) as idade, r.taf as taf, r.chamada as chamada, r.corrida, r.flexao, r.abdominal, r.barra, r.ppm, r.ano, s.su, p.pg, pd.padrao as padrao');
      sql.Add('FROM (((tbresultados AS r LEFT JOIN tbmil AS m ON r.[mil] = m.[id]) LEFT JOIN tbsu AS s ON s.[id] = m.[su]) LEFT JOIN tbpg AS p ON p.[id] = m.[pg]) LEFT JOIN tbpd as pd ON pd.[id] = m.[pd]  where r.ano=:"pesq"');
     // Params.ParamByName('pesq').AsString:= pesq;
      Params.ParamValues['pesq']:=pesq;
      open;
    end;
end;

procedure Tfresgeral.FormActivate(Sender: TObject);
begin
 anoa := now();
end;

procedure Tfresgeral.FormCreate(Sender: TObject);
begin
  dados.dqrelgeral.Enabled:= true;
  dados.qrelgeral.active:= true;
  dados.Ttaf.Active:= true;
  dados.Dtaf.Enabled:= true;
  dados.tano.Active:= true;
  dados.dano.Enabled:= true;
  dados.qmil.Active:= true;
  dados.dqmil.Enabled:= true;
  with DBGrid1.Columns[2] do // adiciona uma coluna no "fim" da grade (ULTIMA coluna)
    begin
      FieldName := 'idade';
      Title.Caption := 'IDADE';
    end;

  with DBGrid1.Columns[3] do // adiciona uma coluna no "fim" da grade (ULTIMA coluna)
    begin
      FieldName := 'padrao';
      Title.Caption := 'P DES';
    end;

  with DBGrid1.Columns[4] do // adiciona uma coluna no "fim" da grade (ULTIMA coluna)
    begin
      FieldName := 'taf';
      Title.Caption := 'TAF';
    end;
  with DBGrid1.Columns[5] do // adiciona uma coluna no "fim" da grade (ULTIMA coluna)
    begin
      FieldName := 'chamada';
      Title.Caption := 'CHAMADA';
    end;

  with dados.qrelgeral do
    begin
      close;
      sql.Clear;
      //sql.Add('select dtnas, Datediff(''yyyy'', dtnas, now() ) as idade from tbresultados');
    //  sql.Add('select a.id,a.nguerra, a.dn,b.mil, b.taf from tbmil as a RIGHT JOIN tbresultados as b on a.id = b.mil');
     ///sql.Add('select a.id from tbsu as a right join tbmil as m on m.su=a.id right join tbresultados as r on m.id = r.mil');
      sql.Add('SELECT m.nguerra, m.genero, m.dn, m.pd, dateDiff(''yyyy'', dn,now()) as idade, r.taf as taf, r.chamada as chamada, r.corrida, r.flexao, r.abdominal, r.barra, r.ppm, r.ano, s.su, p.pg, pd.padrao as padrao');
      sql.Add('FROM (((tbresultados AS r LEFT JOIN tbmil AS m ON r.[mil] = m.[id]) LEFT JOIN tbsu AS s ON s.[id] = m.[su]) LEFT JOIN tbpg AS p ON p.[id] = m.[pg]) LEFT JOIN tbpd as pd ON pd.[id] = m.[pd]');

      dbgrid2.Columns[0].Field:= dados.qmilnguerra;
      dbgrid2.Columns[1].Field:= dados.qmilsu;
      dbgrid1.Columns[0].Field:= dados.qmilnguerra;
      dbgrid1.Columns[1].Field:= dados.qmilsu;

     // sql.Add('select dtnas from tbresultados');
      open;
    end;




end;

procedure Tfresgeral.PngBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfresgeral.PngBitBtn2Click(Sender: TObject);
begin
close;
end;

end.
