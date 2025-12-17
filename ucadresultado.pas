unit ucadresultado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  PngSpeedButton, PngBitBtn, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Mask;

type
  TFcadresultados = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    ToolBar1: TToolBar;
    PngBitBtn1: TPngBitBtn;
    PngSpeedButton1: TPngSpeedButton;
    PngBitBtn3: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    Label2: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    procedure PngBitBtn2Click(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadresultados:                     TFcadresultados;
//  pesqdn:         integer;
  pesqdn:                             TdateTime;
  idade:                              integer;
  pmencao:                            integer;
  rmencao:                            string;
  plensino:                           integer;
  rcorrida:                           integer;
  pgenero:                            integer;
  lmencao:                            integer;
  anoAtual:                           TdateTime;
  anoi, anof, mesi, mesf, diai, diaf: word;

implementation

{$R *.dfm}
uses
udados;


procedure TFcadresultados.DBEdit1Exit(Sender: TObject);
begin

  with dados.qcorrida do
    begin
      close;
      sql.Clear;
      sql.Add('select mencao from tbcorrida  where faixaetaria=:pmencao and lensino=:plensino and genero=:pgenero and :pcorrida between dstmin and dstmax');
      params.ParamValues['pmencao']:= pmencao;
      params.ParamValues['plensino']:=plensino;
      params.ParamValues['pcorrida']:= dbedit1.Field.AsInteger;
      params.ParamValues['pgenero']:=  pgenero;
      open;
    end;
        //edit5.Text:= dados.qcorrida.FieldByName('id').AsString;
        edit5.Text:= dados.qcorrida.FieldByName('mencao').AsString;
       lmencao:= dados.qcorrida.FieldByName('mencao').AsInteger;
       // edit5.Text:= dbedit1.Field.AsString;
       WITH dados.qmencao do
       begin
         close;
         sql.clear;
         sql.Add('select mencao from tbmencoes where id=:lmencao');
         params.ParamValues['lmencao']:= lmencao;
         open;
       end;
//       rmencao:= dados.qmencao.FieldByName('mencao').AsString;
 //       if dados.qmencao.FieldByName('mencao').IsNull then
  //        begin
  //          rmencao:= 'I';
  //        end;
         statictext1.Caption:= dados.qmencao.FieldByName('mencao').AsString;
 //       statictext1.Caption:= rmencao;



end;

procedure TFcadresultados.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
  if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure TFcadresultados.DBLookupComboBox1Click(Sender: TObject);
begin
  anoAtual:= now();
  pesqdn:= dados.qmildn.AsDateTime;
  Dblookupcombobox4.KeyValue:= dados.qmilsu.Value;
  DBLookupComboBox5.KeyValue := dados.qmilpd.Value;
  pgenero:= dados.qmilgenero.Value;
  edit1.Text:= datetostr(pesqdn);
  decodedate(pesqdn, anoi,mesi,diai);
  decodedate(anoAtual, anof, mesf, diaf);
  idade:= anof-anoi;
  edit2.Text:= inttostr(idade);
  edit3.Text:= dados.qmille.AsString;
  plensino:= dados.qmille.AsInteger;


      with dados.qfaixaidade do
        begin
          close;
          sql.Clear;
          sql.Add('select id from tbfaixaetaria where :pcodidade BETWEEN min AND max');
          params.ParamValues['pcodidade']:= idade;
          open;
        end;

        edit4.Text:= dados.qfaixaidade.FieldByName('id').AsString;
        pmencao:=  dados.qfaixaidade.FieldByName('id').AsInteger;
end;

procedure TFcadresultados.PngBitBtn1Click(Sender: TObject);
begin
  try
    begin
      dados.Tresutados.Active:= true;
      dados.dresultados.Enabled:= true;
      dados.qmil.Active:= true;
      dados.dqmil.Enabled:= true;
      dados.qord.Active:= true;
      dados.dqord.Enabled:= true;
      dados.qchamada.Active:= true;
      dados.dqchamada.Enabled:= true;
      dados.Tsu.Active:= true;
      dados.Dsu.Enabled:= true;
      dados.Tresutados.Append;
      dados.qpd.Active:= true;
      dados.dqpd.Enabled:= true;
      dados.qmencao.Active:= true;
      dados.dmencao.Enabled:= true;
     // Dbedit6.Field.Value:= ((formatDateTime('YYYY', date())));
      dados.Tresutados.Append;
      dblookupCombobox1.SetFocus;
    end;
  except
    begin
      showmessage('Operação Inválida');
      PngBitBtn1.SetFocus;
    end;
  end;
end;

procedure TFcadresultados.PngBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFcadresultados.PngBitBtn3Click(Sender: TObject);
begin
  try
    begin
      if (DBLookupComboBox1.Field.AsString='') then
      begin
      showmessage('Há campo vazios, favor verifica');
      dados.Tresutados.Cancel;
      PngBitBtn1.SetFocus;
      end;

      dados.Tresutados.Post;
      showmessage('Cadastro efetuado');
      dados.Tresutados.Close;
      PngBitBtn1.SetFocus;
    end;
  except
    begin
      showmessage('Operação inválida');
      PngBitBtn1.SetFocus;;
    end;
  end
end;

procedure TFcadresultados.PngSpeedButton1Click(Sender: TObject);
begin
  try
    begin
      dados.Tresutados.Cancel;
      PngBitBtn1.SetFocus;
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
