object Form1: TForm1
  Left = -37
  Top = 0
  BorderStyle = bsNone
  Caption = 'Energy-Release Profile'
  ClientHeight = 532
  ClientWidth = 1036
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 14
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 328
    Top = 448
    Width = 89
    Height = 42
    Caption = 'Profile'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 840
    Top = 0
    Width = 163
    Height = 22
    Caption = 'Energy dissipation profile =>'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 312
    Top = 28
    Width = 46
    Height = 88
    Caption = 'Clear'
    OnClick = SpeedButton3Click
  end
  object SpeedButton6: TSpeedButton
    Left = 966
    Top = 316
    Width = 49
    Height = 113
    Caption = 'Tem_Un'
    OnClick = SpeedButton6Click
  end
  object SpeedButton7: TSpeedButton
    Left = 968
    Top = 174
    Width = 15
    Height = 90
    Caption = '-'
    OnClick = SpeedButton7Click
  end
  object SpeedButton8: TSpeedButton
    Left = 1001
    Top = 174
    Width = 16
    Height = 90
    Caption = '+'
    OnClick = SpeedButton8Click
  end
  object SpeedButton9: TSpeedButton
    Left = 981
    Top = 174
    Width = 22
    Height = 90
    Caption = 'X'
    OnClick = SpeedButton9Click
  end
  object SpeedButton5: TSpeedButton
    Left = 231
    Top = 448
    Width = 91
    Height = 42
    Caption = 'Beam_Pr[A/m^2]'
    OnClick = SpeedButton5Click
  end
  object Label2: TLabel
    Left = 755
    Top = 462
    Width = 48
    Height = 19
    Caption = 'Time='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton11: TSpeedButton
    Left = 840
    Top = 24
    Width = 163
    Height = 21
    Caption = 'Global_3D=>'
    OnClick = SpeedButton11Click
  end
  object Label1: TLabel
    Left = 472
    Top = 462
    Width = 87
    Height = 19
    Caption = 'Beam_width'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 968
    Top = 114
    Width = 47
    Height = 63
    Caption = 'Diffusion'
    OnClick = SpeedButton4Click
  end
  object SpeedButton10: TSpeedButton
    Left = 920
    Top = 88
    Width = 33
    Height = 22
    Caption = 'at3'
    OnClick = SpeedButton10Click
  end
  object SpeedButton12: TSpeedButton
    Left = 920
    Top = 60
    Width = 33
    Height = 22
    Caption = 'Clear'
    OnClick = SpeedButton12Click
  end
  object SpeedButton13: TSpeedButton
    Left = 1001
    Top = 60
    Width = 23
    Height = 22
    Caption = 'X'
    OnClick = SpeedButton13Click
  end
  object Label3: TLabel
    Left = 52
    Top = 454
    Width = 28
    Height = 14
    Caption = 'Time='
  end
  object Label4: TLabel
    Left = 88
    Top = 435
    Width = 6
    Height = 14
    Caption = '0'
  end
  object Label5: TLabel
    Left = 616
    Top = 447
    Width = 6
    Height = 14
    Caption = '0'
  end
  object SpeedButton14: TSpeedButton
    Left = 3
    Top = 473
    Width = 206
    Height = 17
    Caption = 'Beam[ A/microsec  ]'
    OnClick = SpeedButton14Click
  end
  object SpeedButton15: TSpeedButton
    Left = 637
    Top = 0
    Width = 166
    Height = 22
    Caption = 'Input Data<<'
    OnClick = SpeedButton15Click
  end
  object Memo1: TMemo
    Left = 11
    Top = 28
    Width = 311
    Height = 88
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object LabeledEdit1: TLabeledEdit
    Left = 364
    Top = 48
    Width = 121
    Height = 22
    EditLabel.Width = 100
    EditLabel.Height = 14
    EditLabel.Caption = 'A[Atomic mass, au]='
    PopupMenu = PopupMenu1
    TabOrder = 1
    Text = '47,88'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit2: TLabeledEdit
    Left = 364
    Top = 87
    Width = 121
    Height = 22
    EditLabel.Width = 107
    EditLabel.Height = 14
    EditLabel.Caption = 'Z[Atomic charge, eu]='
    PopupMenu = PopupMenu1
    TabOrder = 2
    Text = '22'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit3: TLabeledEdit
    Left = 491
    Top = 48
    Width = 121
    Height = 22
    EditLabel.Width = 46
    EditLabel.Height = 14
    EditLabel.Caption = 'En[MeV]='
    PopupMenu = PopupMenu1
    TabOrder = 3
    Text = '0,35'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit4: TLabeledEdit
    Left = 491
    Top = 87
    Width = 121
    Height = 22
    EditLabel.Width = 119
    EditLabel.Height = 14
    EditLabel.Caption = 'x[penetration depth,sm]='
    PopupMenu = PopupMenu1
    TabOrder = 4
    Text = '0,03'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object Chart1: TChart
    Left = 8
    Top = 122
    Width = 455
    Height = 307
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Font.Color = clBlack
    Title.Font.Height = -15
    Title.Text.Strings = (
      'Energy-release profile')
    BottomAxis.Title.Caption = 'penetration depth,[sm]'
    LeftAxis.Title.Caption = 'Energy, [MeV/Sm]'
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
    Left = 637
    Top = 48
    Width = 96
    Height = 20
    Ctl3D = False
    EditLabel.Width = 90
    EditLabel.Height = 14
    EditLabel.Caption = 'Integral statistics ='
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 6
    Text = '1000'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit6: TLabeledEdit
    Left = 637
    Top = 87
    Width = 96
    Height = 22
    EditLabel.Width = 42
    EditLabel.Height = 14
    EditLabel.Caption = 'Density='
    TabOrder = 7
    Text = '4,5'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit7: TLabeledEdit
    Left = 755
    Top = 87
    Width = 121
    Height = 22
    EditLabel.Width = 123
    EditLabel.Height = 14
    EditLabel.Caption = 'Initial temperature T(0,C)='
    TabOrder = 8
    Text = '1'
    OnKeyPress = LabeledEdit1KeyPress
  end
  object ScrollBar1: TScrollBar
    Left = 589
    Top = 466
    Width = 121
    Height = 15
    PageSize = 0
    Position = 50
    TabOrder = 9
    OnChange = ScrollBar1Change
  end
  object Chart2: TChart
    Left = 469
    Top = 114
    Width = 476
    Height = 315
    Legend.Visible = False
    Title.Font.Color = 8388863
    Title.Text.Strings = (
      '')
    BottomAxis.Title.Caption = 'Depth, [sm]'
    LeftAxis.Title.Caption = 'Temperature, [c]'
    View3D = False
    ParentColor = True
    TabOrder = 10
    ColorPaletteIndex = 2
    object Series2: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.ShapeStyle = fosRoundRectangle
      Marks.Visible = False
      SeriesColor = 8388863
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
  object ScrollBar2: TScrollBar
    Left = 88
    Top = 454
    Width = 121
    Height = 12
    PageSize = 0
    TabOrder = 11
    OnChange = ScrollBar2Change
  end
  object PopupMenu1: TPopupMenu
    Left = 472
    Top = 65528
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer2Timer
    Left = 984
    Top = 272
  end
  object MainMenu1: TMainMenu
    Left = 16
    object About1: TMenuItem
      Caption = 'About'
      object Developer1: TMenuItem
        Caption = 'Developer'
        OnClick = Developer1Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 968
    Top = 64
  end
end
