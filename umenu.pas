unit umenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons,ShellApi, Vcl.ExtDlgs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFmenu = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    SUBUNIDADE1: TMenuItem;
    SAIR1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    USURIO1: TMenuItem;
    TreeView1: TTreeView;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Memo1: TMemo;
    Image2: TImage;
    BitBtn1: TBitBtn;
    MILITAR1: TMenuItem;
    AF1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Image4: TImage;
    SavePictureDialog1: TSavePictureDialog;
    DBGrid1: TDBGrid;
    RESULTADOS1: TMenuItem;
    RELATRIOS1: TMenuItem;
    RESULTADOS2: TMenuItem;
    GERAL1: TMenuItem;
    ANO1: TMenuItem;
    EDITAR1: TMenuItem;
    MILITARES1: TMenuItem;
    ATUALIZAR1: TMenuItem;
    procedure SAIR1Click(Sender: TObject);
    procedure SUBUNIDADE1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MILITAR1Click(Sender: TObject);
    procedure AF1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RESULTADOS1Click(Sender: TObject);
    procedure GERAL1Click(Sender: TObject);
    procedure ANO1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MILITARES1Click(Sender: TObject);
    procedure ATUALIZAR1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmenu: TFmenu;
  dt:    Tdate;

implementation

{$R *.dfm}

uses Ucadsu, Ucaduser, ucadmil, ucadtaf, udados, ucadresultado, urelgeral, uano, uedcadmil,
  UFatualizadn;



procedure TFmenu.AF1Click(Sender: TObject);
begin
  Fcadtaf:= TFcadtaf.create (application);
  Fcadtaf.showmodal;
  Fcadtaf.free;
end;

procedure TFmenu.ANO1Click(Sender: TObject);
begin
fano:=tfano.create (application);
fano.showmodal;
fano.free;
end;

procedure TFmenu.ATUALIZAR1Click(Sender: TObject);
begin
Fatualizadn:= tFatualizadn.create (application);
Fatualizadn.showmodal;
Fatualizadn.free;
end;

procedure TFmenu.BitBtn1Click(Sender: TObject);
begin
ShellExecute(0, 'open', ('C:\Program Files (x86)\SCTAF\arquivos\EB20-D-03.053.pdf'), nil, nil, SW_SHOW);;

end;

procedure TFmenu.DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
ShowScrollBar(DBGrid1.Handle,SB_VERT,False);
ShowScrollBar(DBGrid1.Handle,SB_HORZ,False);
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

procedure TFmenu.FormActivate(Sender: TObject);
begin
  dados.Ttaf.Active:= true;
  dados.Dtaf.Enabled:= true;
end;

procedure TFmenu.FormCreate(Sender: TObject);
begin
  Image4.Picture.LoadFromFile('C:\Program Files (x86)\SCTAF\arquivos\om.png');
end;

procedure TFmenu.GERAL1Click(Sender: TObject);
begin
  fresgeral:= tfresgeral.create (application);
  fresgeral.showmodal;
  fresgeral.free;
end;

procedure TFmenu.Image4Click(Sender: TObject);
begin
 OpenPictureDialog1.Execute();
 Image4.Picture.LoadFromFile(OpenPictureDialog1.FileName);
 SavePictureDialog1.Execute();
 Image4.Picture.SaveToFile(SavePictureDialog1.FileName);

end;

procedure TFmenu.MILITAR1Click(Sender: TObject);
begin
Fcadmil := TFcadmil.create (application);
Fcadmil.showmodal;
Fcadmil.free;
end;

procedure TFmenu.MILITARES1Click(Sender: TObject);
begin
Fedcadmil:= tFedcadmil.create (application);
Fedcadmil.showmodal;
Fedcadmil.free;
end;

procedure TFmenu.RESULTADOS1Click(Sender: TObject);
begin
Fcadresultados:= TFcadresultados.create (application);
Fcadresultados.Showmodal;
Fcadresultados.free;
end;

procedure TFmenu.SAIR1Click(Sender: TObject);
begin
close;
end;

procedure TFmenu.SUBUNIDADE1Click(Sender: TObject);
begin
Fcadsu:= TFcadsu.Create(application);
Fcadsu.Showmodal;
Fcadsu.free;
end;

procedure TFmenu.Timer1Timer(Sender: TObject);
begin
 statusbar1.Panels[1].Text:= 'HORA:  '+timetostr(Now)+ '  -  ' + datetostr(now);
end;

procedure TFmenu.USURIO1Click(Sender: TObject);
begin
Fcaduser:= TFcaduser.create (application);
Fcaduser.showmodal;
Fcaduser.free;
end;

end.
