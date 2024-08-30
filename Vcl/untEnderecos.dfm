object frmEnderecos: TfrmEnderecos
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Endere'#231'os'
  ClientHeight = 619
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object gridEnderecos: TDBGrid
    Left = 0
    Top = 80
    Width = 893
    Height = 539
    Align = alClient
    BorderStyle = bsNone
    Color = clWhite
    DataSource = dsEnderecos
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridEnderecosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_ceps'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cep'
        Title.Caption = 'Cep'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'logradouro'
        Title.Caption = 'Logradouro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'complemento'
        Title.Caption = 'Complemento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Title.Caption = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'localidade'
        Title.Caption = 'Localidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Title.Caption = 'Uf'
        Visible = True
      end>
  end
  object pHeader: TPanel
    Left = 0
    Top = 0
    Width = 893
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = 16051947
    ParentBackground = False
    TabOrder = 1
    object Label4: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 15
      Width = 177
      Height = 50
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 15
      Align = alLeft
      AutoSize = False
      Caption = 'Endere'#231'os'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -29
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 768
      Top = 20
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 6906591
      ParentBackground = False
      TabOrder = 0
      object btnAcessar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnAcessarClick
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 518
      Top = 20
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Inserir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitLeft = 72
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 643
      Top = 20
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 2
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Editar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
        ExplicitLeft = 3
      end
    end
    object pBusca: TPanel
      AlignWithMargins = True
      Left = 177
      Top = 0
      Width = 261
      Height = 80
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 80
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 3
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 136
        Top = 20
        Width = 110
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 16475988
        ParentBackground = False
        TabOrder = 0
        object btnBusca: TSpeedButton
          Left = 0
          Top = 0
          Width = 110
          Height = 40
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Filtrar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnBuscaClick
          ExplicitLeft = 72
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object edtBusca: TEdit
        AlignWithMargins = True
        Left = 0
        Top = 20
        Width = 136
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitHeight = 38
      end
    end
  end
  object tbEnderecos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id_ceps'
        DataType = ftInteger
      end
      item
        Name = 'cep'
        DataType = ftInteger
      end
      item
        Name = 'logradouro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'complemento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'localidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'uf'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    DetailFields = 'uf;logradouro;localidade;id_ceps;complemento;cep;bairro'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 832
    Top = 152
    Content = {
      414442531000000030030000FF00010001FF02FF030400160000007400620045
      006E00640065007200650063006F0073000500160000007400620045006E0064
      0065007200650063006F007300060000000000070000080032000000090000FF
      0AFF0B04000E000000690064005F00630065007000730005000E000000690064
      005F0063006500700073000C00010000000E000D000F00011000011100011200
      0113000114000115000E000000690064005F006300650070007300FEFF0B0400
      060000006300650070000500060000006300650070000C00020000000E000D00
      0F0001100001110001120001130001140001150006000000630065007000FEFF
      0B0400140000006C006F0067007200610064006F00750072006F000500140000
      006C006F0067007200610064006F00750072006F000C00030000000E00160017
      00140000000F00011000011100011200011300011400011500140000006C006F
      0067007200610064006F00750072006F00180014000000FEFF0B040016000000
      63006F006D0070006C0065006D0065006E0074006F0005001600000063006F00
      6D0070006C0065006D0065006E0074006F000C00040000000E00160017001400
      00000F000110000111000112000113000114000115001600000063006F006D00
      70006C0065006D0065006E0074006F00180014000000FEFF0B04000C00000062
      0061006900720072006F0005000C000000620061006900720072006F000C0005
      0000000E0016001700140000000F000110000111000112000113000114000115
      000C000000620061006900720072006F00180014000000FEFF0B040014000000
      6C006F00630061006C00690064006100640065000500140000006C006F006300
      61006C00690064006100640065000C00060000000E0016001700140000000F00
      011000011100011200011300011400011500140000006C006F00630061006C00
      69006400610064006500180014000000FEFF0B04000400000075006600050004
      000000750066000C00070000000E0016001700140000000F0001100001110001
      12000113000114000115000400000075006600180014000000FEFEFF19FEFF1A
      FEFF1BFEFEFEFF1CFEFF1DFF1EFEFEFE0E004D0061006E006100670065007200
      1E00550070006400610074006500730052006500670069007300740072007900
      12005400610062006C0065004C006900730074000A005400610062006C006500
      08004E0061006D006500140053006F0075007200630065004E0061006D006500
      0A0054006100620049004400240045006E0066006F0072006300650043006F00
      6E00730074007200610069006E00740073001E004D0069006E0069006D007500
      6D0043006100700061006300690074007900180043006800650063006B004E00
      6F0074004E0075006C006C00140043006F006C0075006D006E004C0069007300
      74000C0043006F006C0075006D006E00100053006F0075007200630065004900
      44000E006400740049006E007400330032001000440061007400610054007900
      700065001400530065006100720063006800610062006C006500120041006C00
      6C006F0077004E0075006C006C000800420061007300650014004F0041006C00
      6C006F0077004E0075006C006C0012004F0049006E0055007000640061007400
      650010004F0049006E00570068006500720065001A004F007200690067006900
      6E0043006F006C004E0061006D00650018006400740041006E00730069005300
      7400720069006E0067000800530069007A006500140053006F00750072006300
      6500530069007A0065001C0043006F006E00730074007200610069006E007400
      4C00690073007400100056006900650077004C006900730074000E0052006F00
      77004C006900730074001800520065006C006100740069006F006E004C006900
      730074001C0055007000640061007400650073004A006F00750072006E006100
      6C000E004300680061006E00670065007300}
    object tbEnderecosid_ceps: TIntegerField
      FieldName = 'id_ceps'
    end
    object tbEnderecoscep: TIntegerField
      FieldName = 'cep'
    end
    object tbEnderecoslogradouro: TStringField
      FieldName = 'logradouro'
    end
    object tbEnderecoscomplemento: TStringField
      FieldName = 'complemento'
    end
    object tbEnderecosbairro: TStringField
      FieldName = 'bairro'
    end
    object tbEnderecoslocalidade: TStringField
      FieldName = 'localidade'
    end
    object tbEnderecosuf: TStringField
      FieldName = 'uf'
    end
  end
  object dsEnderecos: TDataSource
    DataSet = tbEnderecos
    Left = 832
    Top = 216
  end
end
