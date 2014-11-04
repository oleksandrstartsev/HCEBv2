object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Integrator'
  ClientHeight = 413
  ClientWidth = 581
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
    Left = 176
    Top = 8
    Width = 153
    Height = 22
    Caption = 'Plot'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 335
    Top = 8
    Width = 146
    Height = 22
    Caption = 'Integrate'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 487
    Top = 8
    Width = 86
    Height = 22
    Caption = 'sX-matrix'
    OnClick = SpeedButton3Click
  end
  object Edit1: TEdit
    Left = 32
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object Chart1: TChart
    Left = 8
    Top = 48
    Width = 565
    Height = 357
    Legend.Visible = False
    Title.Text.Strings = (
      '')
    View3D = False
    Color = clWhite
    TabOrder = 1
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = 10708548
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
