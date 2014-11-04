object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Input Data'
  ClientHeight = 358
  ClientWidth = 557
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 322
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 136
      Top = 16
      Width = 121
      Height = 21
      EditLabel.Width = 101
      EditLabel.Height = 13
      EditLabel.Caption = 'A[Atomic mass, au]='
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object LabeledEdit2: TLabeledEdit
      Left = 136
      Top = 56
      Width = 121
      Height = 21
      EditLabel.Width = 109
      EditLabel.Height = 13
      EditLabel.Caption = 'Z[Atomic charge, eu]='
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object LabeledEdit3: TLabeledEdit
      Left = 136
      Top = 96
      Width = 121
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'En[MeV]='
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object LabeledEdit4: TLabeledEdit
      Left = 136
      Top = 143
      Width = 121
      Height = 21
      EditLabel.Width = 126
      EditLabel.Height = 13
      EditLabel.Caption = 'x[penetration depth,sm]='
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object LabeledEdit5: TLabeledEdit
      Left = 136
      Top = 192
      Width = 121
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 13
      EditLabel.Caption = 'Integral statistics ='
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object LabeledEdit6: TLabeledEdit
      Left = 136
      Top = 232
      Width = 121
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Density='
      LabelPosition = lpLeft
      TabOrder = 5
    end
    object LabeledEdit7: TLabeledEdit
      Left = 136
      Top = 272
      Width = 121
      Height = 21
      EditLabel.Width = 131
      EditLabel.Height = 13
      EditLabel.Caption = 'Initial temperature T(0,C)='
      LabelPosition = lpLeft
      TabOrder = 6
    end
  end
end
