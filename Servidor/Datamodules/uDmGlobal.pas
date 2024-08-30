unit uDmGlobal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.DB, FireDAC.Comp.Client,

  DataSet.Serialize.Config, System.JSON,
  FireDAC.DApt, DataSet.Serialize;

type
  TDmGlobal = class(TDataModule)
    Conn: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
  private
    procedure CarregarConfigDB(Connection: TFDConnection);



    { Private declarations }
  public
    { Public declarations }
    function UsuarioLogin(email, senha: string): TJSONObject;
    function CepsListar(filtro: string): TJSONArray;
    function CepsListarId(id_ceps: integer): TJSONObject;
    function CepsInserir(cep: integer;  logradouro, complemento, bairro,
                         localidade, uf: string): TJsonObject;
    function CepsEditar(id_ceps, cep: integer; logradouro, complemento, bairro,
      localidade, uf: string): TJsonObject;
    function CepsExcluir(id_ceps: integer): TJsonObject;


  end;

var
  DmGlobal: TDmGlobal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uMD5;

{$R *.dfm}

// funcao para carregar dados do aquivo ini
procedure TDmGlobal.CarregarConfigDB(Connection: TFDConnection);
begin
    Connection.DriverName := 'SQLite';

    with Connection.Params do
    begin
        Clear;
        Add('DriverID=SQLite');

        // Mudar para sua pasta!!!!!!!!
        Add('C:\dev\ViaCepSoftplan\Servidor\DB\banco.db');

        Add('User_Name=');
        Add('Password=');
        Add('Port=');
        Add('Server=');
        Add('Protocol=');
        Add('LockingMode=Normal');
    end;
end;

function TDmGlobal.UsuarioLogin(email, senha: string): TJSONObject;
var
  qry: TFDQuery;
begin
  try

    qry := TFDQuery.Create(nil);

    qry.Connection := Conn;

    qry.SQL.Add('select id_usuario, nome, email from usuario');
    qry.SQL.Add('where email=:email and senha=:senha');
    qry.ParamByName('email').Value := email;
    qry.ParamByName('senha').Value := senha;


    qry.Active := true;

    Result := qry.ToJSONObject;


  finally
    FreeAndNil(qry);
  end;
end;

function TDmGlobal.CepsListar(filtro: string): TJSONArray;
var
  qry: TFDQuery;
begin
  try

    qry := TFDQuery.Create(nil);

    qry.Connection := Conn;

    qry.SQL.Add('select * from ceps');


    if filtro <> '' then
    begin
      qry.SQL.Add('where logradouro like :filtro');
      qry.ParamByName('filtro').Value := '%' + filtro + '%';
    end;

    qry.SQL.Add('order by id_ceps');
    qry.Active := true;

    Result := qry.ToJSONArray;


  finally
    FreeAndNil(qry);
  end;
end;

function TDmGlobal.CepsListarId(id_ceps: integer): TJSONObject;
var
  qry: TFDQuery;
begin
  try

    qry := TFDQuery.Create(nil);

    qry.Connection := Conn;

    qry.SQL.Add('select * from ceps');
    qry.SQL.Add('where id_ceps = :id_ceps');
    qry.ParamByName('id_ceps').Value := id_ceps;


    qry.Active := true;

    Result := qry.ToJSONObject;


  finally
    FreeAndNil(qry);
  end;
end;

function TDmGlobal.CepsInserir(cep: integer; logradouro, complemento,
                            bairro, localidade, uf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try

    qry := TFDQuery.Create(nil);

    qry.Connection := Conn;

    qry.SQL.Add('insert into ceps(cep, logradouro, complemento,');
    qry.SQL.Add('bairro, localidade, uf)');
    qry.SQL.Add('values(:cep, :logradouro, :complemento,');
    qry.SQL.Add(':bairro, :localidade, :uf);');
    qry.SQL.Add('select last_insert_rowid() as id_cep');

    qry.ParamByName('cep').Value := cep;
    qry.ParamByName('logradouro').Value := logradouro;
    qry.ParamByName('complemento').Value := complemento;
    qry.ParamByName('bairro').Value := bairro;
    qry.ParamByName('localidade').Value := localidade;
    qry.ParamByName('uf').Value := uf;


    qry.Active := true;

    Result := qry.ToJSONObject;


  finally
    FreeAndNil(qry);
  end;
end;

function TDmGlobal.CepsEditar(id_ceps, cep: integer;
                              logradouro, complemento, bairro, localidade,
                              uf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try

    qry := TFDQuery.Create(nil);

    qry.Connection := Conn;

    qry.SQL.Add('update ceps set cep=:cep,');
    qry.SQL.Add('logradouro=:logradouro, complemento=:complemento, bairro=:bairro,');
    qry.SQL.Add('localidade=:localidade, uf=:uf');
    qry.SQL.Add('where id_ceps = :id_ceps');


    qry.ParamByName('id_ceps').Value := id_ceps;
    qry.ParamByName('cep').Value := cep;
    qry.ParamByName('logradouro').Value := logradouro;
    qry.ParamByName('complemento').Value := complemento;
    qry.ParamByName('bairro').Value := bairro;
    qry.ParamByName('localidade').Value := localidade;
    qry.ParamByName('uf').Value := uf;


    qry.ExecSQL;

    Result := qry.ToJSONObject.Create(TJsonPair.Create('id_ceps', id_ceps));


  finally
    FreeAndNil(qry);
  end;
end;

function TDmGlobal.CepsExcluir(id_ceps: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try

    qry := TFDQuery.Create(nil);

    qry.Connection := Conn;


    qry.SQL.Add('delete from ceps');
    qry.SQL.Add('where id_ceps = :id_ceps');
    qry.ParamByName('id_ceps').Value := id_ceps;
    qry.ExecSQL;


    qry.ExecSQL;

    Result := qry.ToJSONObject.Create(TJsonPair.Create('id_ceps', id_ceps));


  finally
    FreeAndNil(qry);
  end;
end;




end.
