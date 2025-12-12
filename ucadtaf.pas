unit ucadtaf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ComCtrls, PngBitBtn, PngSpeedButton, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Samples.Calendar;

type
  TFcadtaf = class(TForm)
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    PngBitBtn3: TPngBitBtn;
    MonthCalendar1: TMonthCalendar;
    CHAMADAS: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure PngBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadtaf: TFcadtaf;
  dt: Tdate;

implementation

{$R *.dfm}

uses udados;

procedure TFcadtaf.DBGrid1DrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
dt := date();
  with dbgrid1 do
    begin
        if DataSource.DataSet.FieldByName('data').AsDateTime > dt then
          begin
            if (gdSelected in State) then
            Canvas.Brush.Color:= clRed
              else
               begin
                Canvas.Font.Style := [fsBold];
                Canvas.Font.Color := clblue;
              end
         end;
            Canvas.FillRect(Rect);
            DefaultDrawColumnCell(Rect,DataCol,Column,State);
     end;
end;

procedure TFcadtaf.FormClose(Sender: TObject; var Action: TCloseAction);

begin
 // dados.Ttaf.Active:= false;
 // dados.Dtaf.Enabled:= false;
  dados.Tord.Active:= false;
  dados.Dord.Enabled:= false;
  dados.Tchamada.Active:= false;
  dados.Dchamada.Enabled:= false;
end;

procedure TFcadtaf.FormCreate(Sender: TObject);
////t: string;
begin
//// DateToStr(Date());
//edit1.Text:= (dt);
  dados.Ttaf.Active:= true;
  dados.Dtaf.Enabled:= true;
  dados.Tord.Active:= true;
  dados.Dord.Enabled:= true;
  dados.Tchamada.Active:= true;
  dados.Dchamada.Enabled:= true;
  dados.tano.Active:= true;
  dados.dano.Enabled:= true;
  MonthCalendar1.Date:= date();
end;

procedure TFcadtaf.MonthCalendar1Click(Sender: TObject);
begin
// Edit1.Text:= FormatDateTime('dd/mm/yyyy', MonthCalendar1.Date);
  Dbedit2.Text:= FormatDateTime('dd/mm/yyyy', MonthCalendar1.Date);
end;

procedure TFcadtaf.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin
      dados.Ttaf.Append;
      DBLookupComboBox3.SetFocus;
      //Dbedit1.Field.value:= strtodatetime((formatDateTime('YYYY', date)));
     // Dbedit1.Field.AsString:= ((formatDateTime('YYYY', date)));
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure TFcadtaf.PngBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFcadtaf.PngBitBtn3Click(Sender: TObject);
begin
  try
    begin
      dados.Ttaf.Post;
      showmessage('Cadastro efetuado');
      pngBitbtn1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      pngBitbtn1.SetFocus;
    end;
  end;
end;

procedure TFcadtaf.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dados.Ttaf.Cancel;
      showmessage('Operação Cancelada');
      pngBitbtn1.SetFocus;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

end.
