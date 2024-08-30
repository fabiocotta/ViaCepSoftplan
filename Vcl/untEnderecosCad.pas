unit untEnderecosCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation,
  Vcl.Loading;

type
  TFrmCadEndereco = class(TForm)
    lblTitulo: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtLogradouro: TEdit;
    edtCep: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtLocalidade: TEdit;
    edtUf: TEdit;
    tbEnderecoCad: TFDMemTable;
    tbEnderecoCadid_ceps: TIntegerField;
    tbEnderecoCadcep: TIntegerField;
    tbEnderecoCadlogradouro: TStringField;
    tbEnderecoCadcomplemento: TStringField;
    tbEnderecoCadbairro: TStringField;
    tbEnderecoCadlocalidade: TStringField;
    tbEnderecoCaduf: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure TerminateLoad(Sender: TObject);
    procedure TerminateSalvar(Sender: TObject);

    { Public declarations }
  end;

var
  FrmCadEndereco: TFrmCadEndereco;

implementation

{$R *.dfm}

uses DataModule.Enderecos, untLogin;

procedure TFrmCadEndereco.btnSalvarClick(Sender: TObject);
begin
  TLoading.Show;

  TLoading.ExecuteThread(procedure
  begin
    sleep(400);

    if TNavigation.ParamInt = 0  then
        DmEnderecos.Inserir(edtCep.Text, edtLogradouro.Text, edtComplemento.Text,
                          edtBairro.Text, edtLocalidade.Text, edtUf.Text)
    else
        DmEnderecos.Editar(TNavigation.ParamStr, edtCep.Text, edtLogradouro.Text, edtComplemento.Text,
                          edtBairro.Text, edtLocalidade.Text, edtUf.Text);

  end, TerminateSalvar);
end;

procedure TFrmCadEndereco.btnCancelarClick(Sender: TObject);
begin
   TNavigation.CloseAndCancel(Self);
end;

procedure TFrmCadEndereco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmCadEndereco := nil;
end;

procedure TFrmCadEndereco.TerminateLoad(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
      begin
        showmessage(Exception(TThread(sender).FatalException).Message);
        exit;
      end;

  edtCep.Text := tbEnderecoCad.FieldByName('cep').AsString;
  edtLogradouro.Text := tbEnderecoCad.FieldByName('logradouro').AsString;
  edtComplemento.Text := tbEnderecoCad.FieldByName('complemento').AsString;
  edtBairro.Text := tbEnderecoCad.FieldByName('bairro').AsString;
  edtLocalidade.Text := tbEnderecoCad.FieldByName('localidade').AsString;
  edtUf.Text := tbEnderecoCad.FieldByName('uf').AsString;


end;

procedure TFrmCadEndereco.TerminateSalvar(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
      begin
        showmessage(Exception(TThread(sender).FatalException).Message);
        exit;
      end;

  TNavigation.Close(Self);


end;

procedure TFrmCadEndereco.FormShow(Sender: TObject);
begin

  if TNavigation.ParamInt > 0  then
    begin
      lblTitulo.Caption := 'Editar Endere�o';
    end;

  //fazendo a req para o servidor para carregar os dados para o form
  TLoading.Show;

  //executamos a thread paralela
  TLoading.ExecuteThread(procedure
    begin
      sleep(400);
      DmEnderecos.ListarEnderecosId(tbEnderecoCad, TNavigation.ParamInt);
    end, TerminateLoad);

end;


end.
