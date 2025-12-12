program sctaf;

uses
  Vcl.Forms,
  Ucadsu in 'Ucadsu.pas' {Fcadsu},
  udados in 'udados.pas' {dados: TDataModule},
  ucadmil in 'ucadmil.pas' {Fcadmil},
  umenu in 'umenu.pas' {Fmenu},
  ucaduser in 'ucaduser.pas' {Fcaduser},
  ucadtaf in 'ucadtaf.pas' {Fcadtaf},
  ucadresultado in 'ucadresultado.pas' {Fcadresultados},
  urelgeral in 'urelgeral.pas' {fresgeral},
  uano in 'uano.pas' {fano},
  uedcadmil in 'uedcadmil.pas' {Fedcadmil},
  UFatualizadn in 'UFatualizadn.pas' {Fatualizadn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Controle de TAF';
  Application.CreateForm(TFmenu, Fmenu);
  Application.CreateForm(Tdados, dados);
  Application.CreateForm(TFedcadmil, Fedcadmil);
  Application.CreateForm(TFatualizadn, Fatualizadn);
  Application.Run;
end.
