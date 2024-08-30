unit Controllers.Usuarios;


interface

uses Horse, System.SysUtils, System.JSON;

procedure RegistrarRotas;
procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);



implementation

uses uDmGlobal;

procedure RegistrarRotas;
begin
  //Rotas
  THorse.get('/usuarios', Login);

end;


procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 body: TJsonObject;
 email, senha: string;
begin
  Try
    Try
      DmGlobal := TDmGlobal.Create(nil);
      body := Req.Body<TJsonObject>;

      email := body.GetValue<string>('email', email);
      senha := body.GetValue<string>('senha', senha);

      Res.Send<TJsonObject>(DmGlobal.UsuarioLogin(email, senha)).Status(200);

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;

  end;




end.
