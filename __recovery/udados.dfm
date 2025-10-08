object dados: Tdados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 505
  Width = 303
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\Program Files (x86)\SCTAF\dados\sctaf.mdb'
      'DriverID=MSAcc')
    Connected = True
    LoginPrompt = False
    Left = 144
    Top = 8
  end
  object Tcaduser: TFDTable
    IndexFieldNames = 'Id'
    Connection = conn
    UpdateOptions.UpdateTableName = 'tbusuario'
    TableName = 'tbusuario'
    Left = 48
    Top = 72
    object TcaduserId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Tcaduserusuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 30
    end
    object Tcaduseracesso: TIntegerField
      FieldName = 'acesso'
      Origin = 'acesso'
    end
    object Tcadusernacesso: TStringField
      FieldKind = fkLookup
      FieldName = 'nacesso'
      LookupDataSet = Tnacesso
      LookupKeyFields = 'id'
      LookupResultField = 'nivel'
      KeyFields = 'acesso'
      Lookup = True
    end
    object Tcadusersenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
  end
  object Dcaduser: TDataSource
    AutoEdit = False
    DataSet = Tcaduser
    Enabled = False
    Left = 104
    Top = 72
  end
  object Tnacesso: TFDTable
    IndexFieldNames = 'id'
    Connection = conn
    UpdateOptions.UpdateTableName = 'tnacesso'
    TableName = 'tnacesso'
    Left = 48
    Top = 128
    object Tnacessoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Tnacessonivel: TWideStringField
      FieldName = 'nivel'
      Origin = 'nivel'
      Size = 100
    end
  end
  object Dacesso: TDataSource
    AutoEdit = False
    DataSet = Tnacesso
    Enabled = False
    Left = 104
    Top = 128
  end
  object Tsu: TFDTable
    IndexFieldNames = 'id'
    Connection = conn
    UpdateOptions.UpdateTableName = 'tbsu'
    TableName = 'tbsu'
    Left = 48
    Top = 176
    object Tsuid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Tsusu: TWideStringField
      FieldName = 'su'
      Origin = 'su'
      Size = 50
    end
  end
  object Dsu: TDataSource
    AutoEdit = False
    DataSet = Tsu
    Enabled = False
    Left = 104
    Top = 176
  end
  object Tcadtaf: TFDTable
    IndexFieldNames = 'Id;id'
    Connection = conn
    UpdateOptions.UpdateTableName = 'tbtaf'
    TableName = 'tbtaf'
    Left = 184
    Top = 72
    object Tcadtafid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Tcadtafordtaf: TSmallintField
      FieldName = 'ordtaf'
      Origin = 'ordtaf'
    end
    object Tcadtafchamada: TSmallintField
      FieldName = 'chamada'
      Origin = 'chamada'
    end
    object Tcadtafdata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
    end
    object Tcadtafano: TSQLTimeStampField
      FieldName = 'ano'
      Origin = 'ano'
    end
  end
  object Dcadtaf: TDataSource
    AutoEdit = False
    DataSet = Tcadtaf
    Enabled = False
    Left = 240
    Top = 72
  end
end
