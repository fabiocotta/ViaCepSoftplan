program ViaCepSoftplan;

uses
  Vcl.Forms,
  untLogin in 'untLogin.pas' {frmLogin},
  DataModule.Usuario in 'DataModules\DataModule.Usuario.pas' {DmUsuario: TDataModule},
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  Vcl.Loading in 'Utils\Vcl.Loading.pas',
  Vcl.Navigation in 'Utils\Vcl.Navigation.pas',
  Vcl.Session in 'Utils\Vcl.Session.pas',
  untEnderecos in 'untEnderecos.pas' {frmEnderecos},
  untEnderecosCad in 'untEnderecosCad.pas' {FrmCadEndereco},
  DataModule.Enderecos in 'DataModules\DataModule.Enderecos.pas' {DmEnderecos: TDataModule},
  uFormat in 'uFormat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
