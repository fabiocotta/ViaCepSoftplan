unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, uFormat,
  REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.TabControl;



type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    lyTop: TLayout;
    Rectangle1: TRectangle;
    Image2: TImage;
    lyFooter: TLayout;
    lyBox: TLayout;
    lyBusca: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Image5: TImage;
    rectBusca: TRectangle;
    Label1: TLabel;
    edtCEP: TEdit;
    lblEndereco: TLabel;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    TabControl: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image3: TImage;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Image4: TImage;
    Layout2: TLayout;
    Layout3: TLayout;
    Label3: TLabel;
    Image6: TImage;
    Layout4: TLayout;
    Rectangle4: TRectangle;
    Image7: TImage;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    procedure edtCEPExit(Sender: TObject);
    procedure edtCEPTyping(Sender: TObject);
    procedure rectBuscaClick(Sender: TObject);
  private
    procedure ConsultarCEP(cep: string);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}



procedure TfrmPrincipal.edtCEPExit(Sender: TObject);
begin
    if SomenteNumero(edtCep.Text) <> ''  then
        ConsultarCEP(edtCep.Text);
end;

procedure TfrmPrincipal.edtCEPTyping(Sender: TObject);
begin
    Formatar(edtCEP, TFormato.CEP);
end;

procedure TfrmPrincipal.rectBuscaClick(Sender: TObject);
begin
  ConsultarCEP(edtCep.Text);

end;

procedure TfrmPrincipal.ConsultarCEP(cep: string);
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
                lblEndereco.Text := 'CEP: ' + FieldByName('cep').AsString + sLineBreak +
                                    'End: ' + FieldByName('logradouro').AsString + sLineBreak +
                                    'Compl: ' + FieldByName('complemento').AsString + sLineBreak +
                                    'Bairro: ' + FieldByName('bairro').AsString + sLineBreak +
                                    'Cidade: ' + FieldByName('localidade').AsString + sLineBreak +
                                    'UF: ' + FieldByName('uf').AsString + sLineBreak +
                                    'Cod. IBGE: ' + FieldByName('ibge').AsString;
            end;
        end;
    end
    else
        ShowMessage('Erro ao consultar CEP');
end;


end.
