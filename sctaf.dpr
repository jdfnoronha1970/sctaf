program sctaf;

uses
  Vcl.Forms,
  Ucadsu in 'Ucadsu.pas' {Fcadsu},
  udados in 'udados.pas' {dados: TDataModule},
  ucadmil in 'ucadmil.pas' {Fcadmil},
  umenu in 'umenu.pas' {Fmenu},
  ucaduser in 'ucaduser.pas' {Fcaduser},
  ucadtaf in 'ucadtaf.pas' {Fcadtaf};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmenu, Fmenu);
  Application.CreateForm(Tdados, dados);
  Application.CreateForm(TFcadmil, Fcadmil);
  Application.CreateForm(TFmenu, Fmenu);
  Application.CreateForm(TFcaduser, Fcaduser);
  Application.CreateForm(TFcadtaf, Fcadtaf);
  Application.Run;
end.
