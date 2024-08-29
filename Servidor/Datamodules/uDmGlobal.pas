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
    qry.SQL.Add('where email = :email and senha = :senha');
    qry.ParamByName('email').Value := email;
    qry.ParamByName('senha').Value := SaltPassword(senha);


    qry.Active := true;

    Result := qry.ToJSONObject;


  finally
    FreeAndNil(qry);
  end;
end;

end.
