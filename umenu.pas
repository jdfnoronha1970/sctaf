unit umenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons,ShellApi;

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
    procedure SAIR1Click(Sender: TObject);
    procedure SUBUNIDADE1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmenu: TFmenu;

implementation

{$R *.dfm}

uses Ucadsu, Ucaduser;



procedure TFmenu.BitBtn1Click(Sender: TObject);
begin
ShellExecute(0, 'open', ('C:\Program Files (x86)\SCTAF\arquivos\EB20-D-03.053.pdf'), nil, nil, SW_SHOW);;

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
