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
  THorse.Post('/usuarios', Login);

end;


procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 body, valida: TJsonObject;
 email, senha: string;
begin
  Try
    Try
      DmGlobal := TDmGlobal.Create(nil);
      body := Req.Body<TJsonObject>;

      email := body.GetValue<string>('email', '');
      senha := body.GetValue<string>('senha', '');

      valida := DmGlobal.UsuarioLogin(email, senha);

      if valida.Size = 0 then
        begin
          Res.Send('Email ou senha inválida').Status(401);
          FreeAndNil(valida);
        end
        else
          Res.Send<TJsonObject>(valida);

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;

  end;


end.
