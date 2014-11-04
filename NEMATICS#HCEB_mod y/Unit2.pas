unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart,math, StdCtrls,
  Menus;

type
  TForm2 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Chart2: TChart;
    Chart1: TChart;
    PopupMenu1: TPopupMenu;
    LabeledEdit5: TLabeledEdit;
    Series1: TLineSeries;
    Series2: TLineSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}
 var den: double;
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm2.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
FormatSettings.DecimalSeparator:=',';
if not((Key in ['0'..'9'])or(Key=Chr(vk_Back))or((Key=FormatSettings.DecimalSeparator)and(Pos(Key,(Sender As TLabeledEdit).Text)=0) ))
     then
    Key:=#0;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
Form2.Hide;
Form1.Show;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var n,g,z,h,a,t,r,en,x,k,s0,s1,ds,t0,t1:double;
begin
Form2.Chart1.Series[0].Clear; Form2.Chart2.Series[0].Clear;
If trySTRToFloat(LabeledEdit1.TExt,a)= false then exit else if  STRToFloat(LabeledEdit1.TExt)=0 then exit;
If trySTRToFloat(LabeledEdit2.TExt,z)= false then exit else if  STRToFloat(LabeledEdit2.TExt)=0 then exit;
If trySTRToFloat(LabeledEdit3.TExt,en)= false then exit else if  STRToFloat(LabeledEdit3.TExt)=0 then exit;
If trySTRToFloat(LabeledEdit4.TExt,x)= false then exit else if  STRToFloat(LabeledEdit4.TExt)=0 then exit;
If trySTRToFloat(LabeledEdit5.TExt,den)= false then exit else if  STRToFloat(LabeledEdit5.TExt)=0 then exit;
s0:=0;s1:=0; ds:=0;
t1:=0;t0:=0;
t:=0;
r:=0.482*(A/Z)*0.421*Power(En,1.265-0.0954*ln(En));
r:=r/den;
g:=9.2*power(z,-0.2)+16*power(z,-2.2);
h:= 0.63*(z/a)+0.27;
k:=x/1000;
 n:=(1+exp(-g*h))/(1+exp(g*(t/r-h)));
s0:=n*En*(r-t); t0:=t;
   while  t<=x do begin
   t:=t+k;
n:=(1+exp(-g*h))/(1+exp(g*(t/r-h)));
Chart1.Series[0].AddXY(t,n);
s1:=n*En*(r-t); t1:=t;
 ds:= -(s1-s0)/(t1-t0);
 Chart2.Series[0].AddXY((t),ds);
 s0:=s1;  t0:=t1;
end;

end;


end.
