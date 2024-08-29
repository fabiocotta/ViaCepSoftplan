unit Controllers.Ceps;

interface

uses Horse, System.SysUtils, System.JSON;

procedure RegistrarRotas;
procedure CepsListar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure CepsListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);



implementation

uses uDmGlobal;



procedure RegistrarRotas;
begin
  //Rotas
  THorse.Get('/ceps', CepsListar);
  THorse.Get('/ceps/:id_cep', CepsListarId);

end;


procedure CepsListarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
 DmGlobal: TDmGlobal;
 id_cep: Integer;
begin
  Try
    Try
      DmGlobal := TDmGlobal.Create(nil);

        try
          id_cep := Req.Params['id_cep'].ToInteger;
        except
          id_cep := 0;

        end;

      Res.Send<TJsonObject>(DmGlobal.CepsListarId(id_cep));

    Except on ex:exception do
      Res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    End;
  Finally
  FreeAndNil(DmGlobal);
  End;
end;

procedure CepsListar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
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

end.
