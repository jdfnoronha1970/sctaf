object dados: Tdados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 281
  Width = 303
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\Program Files (x86)\SCTAF\dados\sctaf.mdb'
      'DriverID=MSAcc')
    LoginPrompt = False
    Left = 40
    Top = 16
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
  end
  object Dcaduser: TDataSource
    DataSet = Tcaduser
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
    DataSet = Tnacesso
    Left = 104
    Top = 128
  end
end
