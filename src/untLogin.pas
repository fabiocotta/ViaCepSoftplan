unit untLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    imgFundo: TImage;
    pnlLogin: TPanel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    StyleBook: TStyleBook;
    lblEmail: TLabel;
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

  private

    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses DataModule.Usuario, untPrincipal;






procedure TfrmLogin.btnAcessarClick(Sender: TObject);
begin


    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    FrmPrincipal.Show;



end;

end.
