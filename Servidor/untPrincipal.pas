unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    lblStatus: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses uDmGlobal,
     Horse,
     Horse.Jhonson,
     Horse.CORS,
     Controllers.Usuarios, Controllers.Ceps;

procedure TFrmPrincipal.FormShow(Sender: TObject);

begin
  THorse.Use(Jhonson());
  THorse.Use(CORS);
  Controllers.Usuarios.RegistrarRotas;
  Controllers.Ceps.RegistrarRotas;

  THorse.Listen(3001);
  lblStatus.Text := 'Servidor rodando na porta: ' + THorse.Port.ToString;

end;

end.
