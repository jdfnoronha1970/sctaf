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
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const [Ref] Rect: TRect;
      Field: TField; State: TGridDrawState);
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

procedure Tfresgeral.DBGrid1DrawDataCell(Sender: TObject;
  const [Ref] Rect: TRect; Field: TField; State: TGridDrawState);
begin

//  anoa:=  dados.qrelgeralidade.AsDateTime;
 // anob:= decodedate(anoa, year, month, day);
 // anob:= anoa;
 // anob:= decodedate(anoa, year, month, day);
end;

procedure Tfresgeral.DBLookupComboBox1Click(Sender: TObject);
var
  pesq : string;
begin
  pesq:= DBLookupComboBox1.Text;
  with dados.qrelgeral do
    begin
      close;
      sql.Clear;
      sql.Add('select * from tbresultados where ano=:"pesq"');
     // Params.ParamByName('pesq').AsString:= pesq;
      Params.ParamValues['pesq']:=pesq;
      open;
 //     while not eof do
 //       begin
 //         anoa:= decodedate(dados.qmildn.AsDateTime, year, month, day);
 //       end;
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

{
    with dados.Tcadmil do
     begin
        while not eof do
          begin
            decodedate(dados.Tcadmildn.AsDateTime, ano, mes, dia);
           end;
     end;
}
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
