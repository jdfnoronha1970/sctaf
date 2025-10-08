program sctaf;

uses
  Vcl.Forms,
  umenu in 'umenu.pas' {Fmenu},
  Ucadsu in 'Ucadsu.pas' {Fcadsu},
  ucaduser in 'ucaduser.pas' {Fcaduser},
  udados in 'udados.pas' {dados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmenu, Fmenu);
  Application.CreateForm(Tdados, dados);
  Application.Run;
end.
