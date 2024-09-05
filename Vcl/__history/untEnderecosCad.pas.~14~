unit untEnderecosCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation,
  Vcl.Loading, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

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
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    Panel3: TPanel;
    btnPesquisar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure ConsultarCEP(cep: string);
    procedure edtCepExit(Sender: TObject);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
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

uses DataModule.Enderecos, untLogin, uFormat;

procedure TFrmCadEndereco.btnPesquisarClick(Sender: TObject);
begin
  ConsultarCEP(edtCEP.Text);
end;

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
        DmEnderecos.Editar(TNavigation.ParamInt, edtCep.Text, edtLogradouro.text,
                           edtComplemento.Text, edtBairro.Text,
                           edtLocalidade.Text, edtUf.Text);

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
      lblTitulo.Caption := 'Editar Endereço';
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

procedure TFrmCadEndereco.ConsultarCEP(cep: string);
begin
    if SomenteNumero(edtCEP.Text).Length <> 8 then
    begin
        ShowMessage('CEP inválido');
        exit;
    end;

    RESTRequest1.Resource := SomenteNumero(edtCEP.Text) + '/json';
    RESTRequest1.Execute;

    if RESTRequest1.Response.StatusCode = 200 then
    begin
        if RESTRequest1.Response.Content.IndexOf('erro') > 0 then
            ShowMessage('CEP não encontrado')
        else
        begin
            with MemTable do
            begin

                edtLogradouro.Text := FieldByName('logradouro').AsString;
                edtComplemento.Text := FieldByName('complemento').AsString;
                edtBairro.Text := FieldByName('bairro').AsString;
                edtLocalidade.Text := FieldByName('localidade').AsString;
                edtUf.Text := FieldByName('uf').AsString;

            end;
        end;
    end
    else
        ShowMessage('Erro ao consultar CEP');
end;



procedure TFrmCadEndereco.edtCepExit(Sender: TObject);
begin
  if SomenteNumero(edtCEP.Text) <> ''  then
    ConsultarCEP(edtCEP.Text);

end;

procedure TFrmCadEndereco.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  Formatar(edtCep, TFormato.CEP);
end;

end.
