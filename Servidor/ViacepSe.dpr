program ViacepSe;

uses
  System.StartUpCopy,
  FMX.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  uMD5 in 'Utils\uMD5.pas',
  uDmGlobal in 'Datamodules\uDmGlobal.pas' {DmGlobal: TDataModule},
  Controllers.Usuarios in 'Controllers\Controllers.Usuarios.pas',
  Controllers.Ceps in 'Controllers\Controllers.Ceps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmGlobal, DmGlobal);
  Application.Run;
end.
