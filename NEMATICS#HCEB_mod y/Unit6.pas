unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series;

type
  TForm6 = class(TForm)
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ScrollBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form6.Hide;
Form1.Show;
end;

procedure TForm6.ScrollBar1Change(Sender: TObject);
begin
 Chart1.View3DOptions.Zoom:= ScrollBar1.Position;
Chart1.View3DOptions.Rotation:= ScrollBar2.Position;
Chart1.View3DOptions.Elevation:= ScrollBar3.Position;
Chart1.Repaint;
end;

procedure TForm6.ScrollBar2Change(Sender: TObject);
begin
 Chart1.View3DOptions.Zoom:= ScrollBar1.Position;
Chart1.View3DOptions.Rotation:= ScrollBar2.Position;
Chart1.View3DOptions.Elevation:= ScrollBar3.Position;
Chart1.Repaint;
end;

end.
