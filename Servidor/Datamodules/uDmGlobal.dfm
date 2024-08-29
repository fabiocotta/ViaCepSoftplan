object DmGlobal: TDmGlobal
  Height = 261
  Width = 303
  object Conn: TFDConnection
    ConnectionName = 'Conn'
    Params.Strings = (
      'Database=C:\dev\ViaCepSoftplan\Servidor\DB\banco'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 72
    Top = 24
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 112
  end
end
