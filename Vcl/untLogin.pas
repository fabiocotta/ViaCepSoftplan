unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    imgFundo: TImage;
    Panel1: TPanel;
    lblEmail: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlEmail: TPanel;
    edtEmail: TEdit;
    lblSenha: TLabel;
    pnlSenha: TPanel;
    edtSenha: TEdit;
    pnlAcessar: TPanel;
    btnAcessar: TSpeedButton;
    TabUsuario: TFDMemTable;
    TabUsuarioid_usuario: TIntegerField;
    TabUsuarionome: TStringField;
    TabUsuarioemail: TStringField;
    TabUsuariosenha: TStringField;
    procedure btnAcessarClick(Sender: TObject);
    procedure TerminateLogin(Sender: TObject);
  private


    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses DataModule.Usuario, untPrincipal, Vcl.Loading, Vcl.Navigation, Vcl.Session;



procedure TfrmLogin.btnAcessarClick(Sender: TObject);
begin
      TLoading.Show(Self);

    TLoading.ExecuteThread(procedure
    begin
        // Criar a requisicao para o servidor...
        Sleep(400);

        DmUsuario.Login(TabUsuario, edtEmail.Text, edtSenha.Text);
    end,
    TerminateLogin);
end;



procedure TFrmLogin.TerminateLogin(Sender: TObject);
begin
    TLoading.Hide;

    if Sender is TThread then
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;

    // Dados de acesso...
    TSession.ID_USUARIO := TabUsuario.FieldByName('id_usuario').AsInteger;
    TSession.EMAIL := TabUsuario.FieldByName('email').AsString;
    TSession.NOME := TabUsuario.FieldByName('nome').AsString;


    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    FrmPrincipal.Show;
end;


end.
