object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Sphere'
  ClientHeight = 395
  ClientWidth = 578
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBar1: TScrollBar
    Left = 432
    Top = 280
    Width = 121
    Height = 11
    PageSize = 0
    TabOrder = 0
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 432
    Top = 311
    Width = 121
    Height = 11
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar2Change
  end
  object ScrollBar3: TScrollBar
    Left = 432
    Top = 344
    Width = 121
    Height = 11
    PageSize = 0
    TabOrder = 2
    OnChange = ScrollBar1Change
  end
  object Chart1: TChart
    Left = 26
    Top = 41
    Width = 400
    Height = 314
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    View3DOptions.Elevation = 360
    View3DOptions.Orthogonal = False
    View3DOptions.Rotation = 300
    Color = clWhite
    TabOrder = 3
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
    object Series2: TFastLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = 3513587
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
end
