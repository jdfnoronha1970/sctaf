unit umenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons,ShellApi, Vcl.ExtDlgs;

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
    procedure SAIR1Click(Sender: TObject);
    procedure SUBUNIDADE1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MILITAR1Click(Sender: TObject);
    procedure AF1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmenu: TFmenu;

implementation

{$R *.dfm}

uses Ucadsu, Ucaduser, ucadmil, ucadtaf;



procedure TFmenu.AF1Click(Sender: TObject);
begin
  Fcadtaf:= TFcadtaf.create (application);
  Fcadtaf.showmodal;
  Fcadtaf.free;
end;

procedure TFmenu.BitBtn1Click(Sender: TObject);
begin
ShellExecute(0, 'open', ('C:\Program Files (x86)\SCTAF\arquivos\EB20-D-03.053.pdf'), nil, nil, SW_SHOW);;

end;

procedure TFmenu.FormCreate(Sender: TObject);
begin
 Image4.Picture.LoadFromFile('C:\Program Files (x86)\SCTAF\arquivos\om.png');
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
