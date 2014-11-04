unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls,math, TeeProcs, Chart, Buttons, StdCtrls;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Chart1: TChart;
    Series1: TFastLineSeries;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

 Function A1(ro,at:double): double;
var Am: double;
begin
if (ro>=0)and(ro<=8.19) then  begin
am:= exp((1/1.1)*(1-power(0.24*ro,2.7))) ;
am:=am*2000/(7.7*Power(2*Pi,0.5));
am:=am*ln(Power(ro,2.8)+1);
am:=am*Power(at,2)*0.2*exp(0.25*(2-Power(at,2.1)));
 result:=am; end else result:=0;

end;

Function Sim(cor,a,b: double):double;
Var sum0,hj: double;
I,nm:integer;
begin
 Nm:=1000;sum0:=0;
 hj:=abs(b-a)/Nm;
for I := 0 to Nm do  begin
if (i=0)or(i=Nm) then sum0:=sum0+0.5*A1(cor,a+i*hj);
if (i<>0)and(i<>Nm)and(i<>Nm-1)then
sum0:=sum0+A1(cor,a+i*hj);
if (i<>0)and(i<>Nm)then
 sum0:=sum0+2*A1(cor,a+(i-0.5)*hj);
end;
sum0:=(sum0*hj)/3;
result:=sum0;

end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin  Form4.Hide;
Form1.Show;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
Var  I:integer;
zz: double;
begin
if tryStrtofloat(Form4.Edit1.Text,zz) then begin
   Edit1.Color:=clMenuBar;
  Form4.Chart1.Series[0].Clear;
    for I := 0 to 50 do begin
  Chart1.Series[0].AddXY(i*1e-1,A1(zz,i*1e-1));
    end;  end else Edit1.Color:=clRed;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
var I: Integer;
zz: double;
begin
if tryStrtofloat(Form4.Edit1.Text,zz) then begin
   Edit1.Color:=clMenuBar;
Chart1.Series[0].Clear;
    for I := 0 to 50 do begin
    /// Amper/microsec;
Chart1.Series[0].AddXY(i*1e-1,Sim(zz,0,i*1e-1));
    end;  end else Edit1.Color:=clRed;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
var i: integer;
begin
Form4.Chart1.Series[0].Clear;
for i :=0  to length(sX)-1 do
 Form4.Chart1.Series[0].AddXY(sX[i,0],sX[i,1]);

end;

end.
