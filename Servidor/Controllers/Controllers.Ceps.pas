unit Controllers.Ceps;

interface

uses Horse, System.SysUtils, System.JSON;

procedure RegistrarRotas;
procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure ListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);



implementation

uses uDmGlobal;



procedure RegistrarRotas;
begin
  //Rotas
  THorse.Get('/ceps', Listar);
  THorse.Get('/ceps/:id_ceps', ListarId);
  THorse.Post('/ceps', Inserir);
  THorse.Put('/ceps/:id_ceps', Editar);
  THorse.Delete('/ceps/:id_ceps', Excluir);

end;


procedure ListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 id_ceps: Integer;
begin
  Try
    Try
      DmGlobal := TDmGlobal.Create(nil);

        try
          id_ceps := Req.Params['id_ceps'].ToInteger;
        except
          id_ceps := 0;

        end;

      Res.Send<TJsonObject>(DmGlobal.CepsListarId(id_ceps));

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 filtro: String;
begin
  Try
    DmGlobal := TDmglobal.Create(nil);

    filtro := Req.Query['filtro'];

    Res.Send<TJsonArray>(DmGlobal.CepsListar(filtro));

  Finally
    FreeAndNil(DmGlobal);
  end;
end;

procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 body: TJsonObject;
 cep: integer;
 logradouro, complemento, bairro, localidade, uf: string;
begin
  Try
    Try
      DmGlobal := TDmGlobal.Create(nil);
      body := Req.Body<TJsonObject>;

      cep := body.GetValue<integer>('cep', 0);
      logradouro := body.GetValue<string>('logradouro', '');
      complemento := body.GetValue<string>('complemento', '');
      bairro := body.GetValue<string>('bairro', '');
      localidade := body.GetValue<string>('localidade', '');
      uf := body.GetValue<string>('uf', '');


      Res.Send<TJsonObject>(DmGlobal.CepsInserir(cep, logradouro, complemento,
                            bairro, localidade, uf)).Status(201);

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;

end;

procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 body: TJsonObject;
 id_ceps, cep: integer;
 logradouro, complemento, bairro, localidade, uf: string;

begin
  Try
    Try
      DmGlobal := TDmglobal.Create(nil);

         try
          id_ceps := Req.Params['id_ceps'].ToInteger;
        except
          id_ceps := 0;

        end;

      body := Req.Body<TJsonObject>;
      cep := body.GetValue<integer>('cep', 0);
      logradouro := body.GetValue<string>('logradouro', '');
      complemento := body.GetValue<string>('complemento', '');
      bairro := body.GetValue<string>('bairro', '');
      localidade := body.GetValue<string>('localidade', '');
      uf := body.GetValue<string>('uf', '');

      Res.Send<TJsonObject>(DmGlobal.CepsEditar(id_ceps, cep, logradouro,
                                                complemento, bairro,
                                                localidade, uf));

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;


end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 body: TJsonObject;
 id_ceps: integer;

begin
  Try
    Try
      DmGlobal := TDmGlobal.Create(nil);

         try
          id_ceps := Req.Params['id_ceps'].ToInteger;
        except
          id_ceps := 0;

        end;

      body := Req.Body<TJsonObject>;



      Res.Send<TJsonObject>(DmGlobal.CepsExcluir(id_ceps));

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;
end;




end.
