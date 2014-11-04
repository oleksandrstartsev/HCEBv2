object Form2: TForm2
  Left = 255
  Top = 245
  Caption = 'Energy Dissipation Profile'
  ClientHeight = 396
  ClientWidth = 624
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
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 8
    Width = 145
    Height = 22
    Caption = '<= Energy-release  pofile'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 248
    Top = 8
    Width = 161
    Height = 22
    Caption = 'Plot'
    OnClick = SpeedButton2Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 52
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 101
    EditLabel.Height = 13
    EditLabel.Caption = 'A[Atomic mass, au]='
    PopupMenu = PopupMenu1
    TabOrder = 0
    Text = '47,88'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit2: TLabeledEdit
    Left = 52
    Top = 85
    Width = 121
    Height = 21
    EditLabel.Width = 109
    EditLabel.Height = 13
    EditLabel.Caption = 'Z[Atomic charge, eu]='
    PopupMenu = PopupMenu1
    TabOrder = 1
    Text = '22'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit3: TLabeledEdit
    Left = 260
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'En[MeV]='
    PopupMenu = PopupMenu1
    TabOrder = 2
    Text = '0,35'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit4: TLabeledEdit
    Left = 260
    Top = 85
    Width = 121
    Height = 21
    EditLabel.Width = 126
    EditLabel.Height = 13
    EditLabel.Caption = 'x[penetration depth,sm]='
    PopupMenu = PopupMenu1
    TabOrder = 3
    Text = '0,13'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object Chart2: TChart
    Left = 319
    Top = 112
    Width = 290
    Height = 255
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Font.Color = clBlack
    Title.Font.Height = -15
    Title.Text.Strings = (
      'Energy-dissipation profile')
    BottomAxis.Title.Caption = 'penetration depth,[sm]'
    LeftAxis.Title.Caption = '-d(nE(R-t))\dt,  [MeV/sm]'
    LeftAxis.Title.Font.Height = -15
    View3D = False
    Color = clWhite
    TabOrder = 4
    ColorPaletteIndex = 13
    object Series2: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.ShapeStyle = fosRoundRectangle
      Marks.Visible = False
      SeriesColor = clRed
      Brush.BackColor = clDefault
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Chart1: TChart
    Left = 8
    Top = 112
    Width = 305
    Height = 255
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Font.Color = clBlack
    Title.Font.Height = -15
    Title.Text.Strings = (
      'Penetration coefficient/ depth')
    BottomAxis.Title.Caption = 'penetration depth,[sm]'
    LeftAxis.Title.Caption = 'penetration coefficient'
    View3D = False
    Color = clWhite
    TabOrder = 5
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.ShapeStyle = fosRoundRectangle
      Marks.Visible = False
      SeriesColor = clRed
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      LinePen.Width = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object LabeledEdit5: TLabeledEdit
    Left = 424
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Density='
    TabOrder = 6
    Text = '4,5'
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 48
  end
end
