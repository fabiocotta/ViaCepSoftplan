program ViaCepSoftPlan;

uses
  System.StartUpCopy,
  FMX.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untLogin in 'untLogin.pas' {frmLogin},
  DataModule.Usuario in 'DataModules\DataModule.Usuario.pas' {DmUsuario: TDataModule},
  Vcl.Session in 'Utils\Vcl.Session.pas',
  Vcl.Navigation in 'Utils\Vcl.Navigation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
