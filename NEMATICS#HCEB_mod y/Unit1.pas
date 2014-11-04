unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, ExtCtrls, TeeProcs, Chart, Buttons, StdCtrls,math, Series,
  Spin, Menus, jpeg,ShellAPI;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Chart1: TChart;
    SpeedButton2: TSpeedButton;
    LabeledEdit5: TLabeledEdit;
    SpeedButton3: TSpeedButton;
    PopupMenu1: TPopupMenu;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    SpeedButton6: TSpeedButton;
    Timer2: TTimer;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    SpeedButton11: TSpeedButton;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    About1: TMenuItem;
    Developer1: TMenuItem;
    Chart2: TChart;
    SpeedButton4: TSpeedButton;
    Timer1: TTimer;
    SpeedButton10: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    ScrollBar2: TScrollBar;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Series1: TLineSeries;
    Series2: TLineSeries;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Developer1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  atw: double;
  atz: double;
  Ener: double;
  Pd: double;
c: double;
  den : double;
  InTem,hl,Pu: double;
  stat,t8,p7: integer;
  pause: integer;
  rt: double;
  atime,dtime,atimep: double;
  type mas= array of array of double;
 var at3,upm1,upm,upm0: mas;
 sX: array of array of double;   //    energy-release container[stat+1,2];


 ye: integer;
 implementation

uses Unit2, Unit3,Global_Var, Unit4, Unit6, Unit72;
const el: double=1.6021773e-19;
const Current: double= 2000;
const time : double= 5e-6;
const area: double=9.55e-4;//9.55e-4;
var  Qlm,Qlev,Qsum,Q1668,Q3260,Qab,Q882,elnum: double;
 at1,at2: mas;
 tm: integer;
 timeT1,uok: double;
 vt: double;//variable temperature;
 vm: array of array of double;
 ksi,tc: integer;
{$R *.dfm}


Function AreaA(): double;
begin
  result:=area/ye;
end;

Function dens():double;
Begin
  result:=1e3*den-vt/3.4;
End;
   function cC( t: double): double;
begin
  result:=(0.5175+2.524e-4*t)*1000;
end;
  Function thcr():double;
Begin
  result:=18.85/(cc(vt)*dens());
End;
{Function Ampz(cor: double):double;
var Am,ro: double;
begin
 Am:=0; ro:=cor*1000;
 Am:=0.98*Exp(((-Power(ro-4.1,2))/(1.44*4)));
 Am:=Am+1.1*(((-Power(ro-4.1,2))/16)+1);
 Am:=Am*Power(4*Sqrt(2*pi),-1)*2000;
 result:=am*1e3;
end;


Function Ampt(cor: double;yt: double): double;
var Am,ro,tim: double;
begin  tim:=yt*1e6;
 Am:=0; ro:=cor*1000;
 Am:=0.98*Exp(((-Power(ro-4.1,2))/(1.44*4)));
 Am:=Am+1.1*(((-Power(ro-4.1,2))/16)+1);
 Am:=Am*Power(4*Sqrt(2*pi),-1)*2000;
 //Am:=Am*(Ln(Power(tim,0.9)+1)/1.65);
// (2*Exp[(-t^2.121 + 2)/3]*t^3*1/13.5)
 Am:=Am*Exp((-Power(tim,2.121)+2)/3)*Power(tim,3)*(1/13.5);
 result:=am*1e3;
end;
 }
 Function A1(ro,at:double): double;
var Am: double;
begin   //ro [ mm  ] beam width, 1 time unit= 1 microsecond;
if (ro>=0)and(ro<=8.19) then  begin
am:= exp((1/1.1)*(1-power(0.24*ro,2.7))) ;
am:=am*2000/(7.7*Power(2*Pi,0.5));
am:=am*ln(Power(ro,2.8)+1);
am:=am*Power(at,2)*0.2*exp(0.25*(2-Power(at,2.1)));
 result:=am; end else result:=0;
end;


Function Sim(cor1,a11,b11: double):double;
Var sum0,hj: double;
I,nm:integer;
begin  //cor1 [ mm  ] beam width, a11,b11 1 time unit= 1 microsecond;
 Nm:=100;sum0:=0;
 hj:=abs(b11-a11)/Nm;
for I := 0 to Nm do  begin

if (i=0)or(i=Nm) then sum0:=sum0+0.5*A1(cor1,a11+i*hj);
if (i<>0)and(i<>Nm)and(i<>Nm-1)then
sum0:=sum0+A1(cor1,a11+i*hj);
if (i<>0)and(i<>Nm)then
 sum0:=sum0+2*A1(cor1,a11+(i-0.5)*hj);

end;
sum0:=(sum0*hj)/3;
result:=sum0;
end;



{function ElnumF(g,dis,yt: double): double;
begin
    result:=(Ampt(g,yt)*dis*time)/el;
end;  }

function ElnumFn(g,dis,yt,ytl: double): double;
begin

    result:=(Sim(1e3*g,1e6*yt,1e6*ytl)*dis*time*1e3)/el;
end;

function ElnumFnew(g,g1,dis,yt,ytl: double): double;
begin
result:=(Sim(1e3*g,1e6*yt,1e6*ytl)+Sim(1e3*g1+dis,1e6*yt,1e6*ytl))*dis*1e3*0.5;
result:=result*abs(ytl-yt)/el;
 //  sum A/mm * delta width * delta time/ 2 electron charge;
    end;


function Ral( En: double): double;
begin
  result:=0.421*Power(En,1.265-0.0954*ln(En));
end;
 function Rp( Z,A,En: double): double;
 begin
      result:=0.482*(A/Z)*Ral(En)/den;
 end;


  function QX( var x: double;En,A,Z: double) :double;
var g: double;
begin
g:= ((En)/Rp(Z,A,En))*(1.437/(Power(cosh(0.95*(2.295*((x)/Rp(Z,A,En))-1)),1.8)*(0.5+(1/(2.7-2.295*(x/Rp(Z,A,En)))))));
if (g<=0)or(c=1) then  begin g:=0;c:=1; end;
result:= g;
 end;


procedure firstUniversal();
    var u1,u2,h,u0, tem,tem0,xx,yy: double;
i: integer;
    sum,amm,etotal,power,erel: double;
   N:integer;
   begin
If trySTRToFloat(Form1.LabeledEdit1.TExt,atw)= false then exit else if  STRToFloat(form1.LabeledEdit1.TExt)=0 then exit;
If trySTRToFloat(form1.LabeledEdit2.TExt,atz)= false then exit else if  STRToFloat(form1.LabeledEdit2.TExt)=0 then exit;
If trySTRToFloat(form1.LabeledEdit3.TExt,Ener)= false then exit else if  STRToFloat(form1.LabeledEdit3.TExt)=0 then exit;
If trySTRToFloat(Form1.LabeledEdit4.TExt,Pd)= false then exit else if  STRToFloat(Form1.LabeledEdit4.TExt)=0 then exit;
If trySTRToFloat(Form1.LabeledEdit5.TExt,yy)= false then exit else if  STRToFloat(form1.LabeledEdit5.TExt)=0 then exit;
 stat:=round(yy);
 If trySTRToFloat(form1.LabeledEdit6.TExt,den)= false then exit else if  STRToFloat(Form1.LabeledEdit6.TExt)=0 then exit;
 If trySTRToFloat(Form1.LabeledEdit7.TExt,Intem)= false then exit else if  STRToFloat(Form1.LabeledEdit7.TExt)=0 then exit;
N:=round(stat);
      hl:=Strtofloat(Form1.LabeledEdit4.Text)*1e-2/(stat);

u1:=0; u2:=0;  Sum:=0;    c:=0;   u0:=0;
h:=Pd;  u2:=qx(u1,Ener,AtW,AtZ);   sum:=sum+u2/2; u0:=u2;  //0;
u1:=Pd;c:=0;   u2:=qx(u1,Ener,AtW,AtZ);
  sum:=sum+u2/2;    c:=0;                             //n;
for i:=1 to n-1 do begin
 u1:=i*h;
 u2:=qx(u1,Ener,AtW,AtZ);
 //Form1.Memo1.Lines.Add('u2= '+FloatToStr(u2));
  sum:=sum+u2;
end;
         c:=0;
  for i:=1 to n do begin
 u1:=((i-1)*h+i*h)/2;
 u2:=2*qx(u1,Ener,ATW,ATZ);
// Form1.Memo1.Lines.Add('u2= '+FloatToStr(u2));
  sum:=sum+u2;
end;
   sum:=(h*sum)/3;
   sum:=sum/Pd;
   Form1.Memo1.Lines.Add('');
Form1.Memo1.Lines.Add('Average released Energy ( per 1e)= '+FloatToStr(sum/u0)+' reduced');
amm:= (Current*time)/el;
elnum:=amm;
Form1.Memo1.Lines.Add('Ammount of e= '+FloatToStr(amm));
etotal:= amm*Ener*1e6*el;
Form1.Memo1.Lines.Add('Energy_total= '+FloatToStr(etotal)+' Joule');
 erel:=Pd*amm*sum*1e6*el;
Form1.Memo1.Lines.Add('Average released Energy= '+FloatToStr(erel)+' Joule');
Form1.Memo1.Lines.Add('delta= '+FloatToStr((etotal-erel)*100/etotal)+'%');
   power:=Ener*1e6*current;
Form1.Memo1.Lines.Add('Speculative Power = '+FloatToStrf(power,ffExponent,12,8)+' W');
form1.Memo1.Lines.Add('Power density= '+FloatToStrf(power/12.56,ffexponent,12,8));
Form1.Memo1.Lines.Add('');

c:=0;

Form1.Chart1.Series[0].Clear;
Form1.Chart2.Series[0].Clear;
u1:=0; u2:=0;  u0:=0;  xx:=0;
h:=Pd/stat;  tem0:=0;
    tem:=0;
SetLength(at1,0,0);
 SetLength(at1,stat+1,2);
 SetLength(at2,0,0);
 SetLength(at2,stat+1,2);
 SetLength(sX,0,0);
  SetLength(sX,stat+1,2);
  i:=0;
 u2:=qx(u1,Ener,Atw,AtZ);
 at1[i,0]:=u1;   at2[i,0]:=u1;
 at1[i,1]:=u2; at2[i,1]:=u2;
u0:=u2;  u1:=u1+h;    xx:=u2;
Form1.Memo1.Lines.Add('Input surface amplityde[MeV/sm]= '+FloatToStr(u0));
 //  form1.Series1.AddXY(u1,1);
while u1<Pd do begin
 u2:=qx(u1,Ener,AtW,AtZ);
     inc(i);
 at1[i,0]:=u1;at1[i,1]:=u2;
 at2[i,0]:=u1;at2[i,1]:=u2;
 tem:=(el*at1[i,1]*1e8*elnum)/(Cc(tem0)*area*den*1e3);
//form1.chart1.Series[0].AddXY(at1[i,0],at1[i,1]/u0);
//form1.chart2.Series[0].AddXY(at1[i,0],tem);
tem0:=tem;
 u1:=u1+h;
 if (tem<=0)and(xx>tem) then xx:=-1;

 end;
   global_atw:=atw;
      global_atz:=atz;
      global_Ener:=Ener;
      global_Pd:=Pd;
      global_Stat:=stat;
      global_Den:=den;
      global_Intem:=Intem;
      global_hl:=hl;

 SetLength(global_at1,length(at1),2);
 SetLength(global_at2,length(at2),2);

 for I := 0 to length(at1)-1 do
   begin
   sX[i,0]:=at1[i,0];
   sX[i,1]:=at1[i,1];
 global_at1[i,0]:=at1[i,0];
global_at1[i,1]:=at1[i,1]; end;

  for I := 0 to length(at2)-1 do
   begin global_at2[i,0]:=at2[i,0];
  global_at2[i,1]:=at2[i,1];end;

 end;


   procedure TemPlot();
 var   temp,tem0: double;
I: Integer;
   begin    tem0:=10;
    temp:=tem0;
   Form1.Chart2.Series[0].Clear;
      if length(at1)=0 then exit;
     if length(at1)<>0 then
     for I := 0 to length(at1)-1 do begin
 temp:=(el*at1[i,1]*1e8*elnum)/(CC(tem0)*area*den*1e3);
  form1.chart2.Series[0].AddXY(at1[i,0]*10,Intem+temp);
  tem0:=temp;end ;
   end;

procedure TForm1.Developer1Click(Sender: TObject);
begin
 ShowMessage('Nematics#Project');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SetLength(at1,0,0);
SetLength(at2,0,0);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
vt:=0;
pause:=0;
 ye:=30;
end;

procedure TForm1.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
FormatSettings.DecimalSeparator:=',';
if not((Key in ['0'..'9'])or(Key=Chr(vk_Back))or((Key=FormatSettings.DecimalSeparator)and(Pos(Key,(Sender As TLabeledEdit).Text)=0) ))
     then
    Key:=#0;
end;




procedure TForm1.SpeedButton1Click(Sender: TObject);
var i: integer;
begin

Form1.Chart1.Series[0].Clear;
Form1.Chart1.Title.Caption:='Energy-release profile';
Form1.Chart1.Axes.Left.Title.Caption:='Released energy,[ MeV / sm ]';
Form1.Chart1.Axes.Bottom.Title.Caption:='Penetration depth,[ sm ]';



 FirstUniversal();
 for i :=0  to length(at1)-1 do
 Form1.Chart1.Series[0].AddXY(sX[i,0],sX[i,1]);


end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Form1.Hide;
Form2.Show;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
Memo1.Clear;
end;

{procedure IntPlot( mi:mas );
var  i,j,p,m,pmax,nmax: integer;
a,tau,ah: double;
upm1,upm: mas;
begin    a:=thc*1e4;
i:=10;  pmax:=1000;
nmax:=length(mi)-1;
 tau:=1e-6; pmax:=1000;
 ah:=mi[i,0]-mi[i-1,0];
  SetLength(upm1,0,0);
 SetLength(upm1,stat+1,2);
 SetLength(upm,0,0);
 SetLength(upm,stat+1,2);

 for I := 0 to length(upm)-1 do
   begin
     upm[i,1]:=mi[i,1];
     upm[i,0]:=mi[i,0];
    end;
  p:=0; m:=0;

  Form1.Label2.Caption:='Time= '+FloattoStr(time- tm*(time/stat))+' s';
  //Form1.Label2.Caption:='Time= '+FloattoStrf(time+tau*p,fffixed,5,3)+' s';
  upm1[0,1]:=a*tau*((-2*upm[i,1]+upm[i+1,1])/Sqr(ah))-upm[i,1];
  for i := 1 to length(upm)-2 do
 upm1[i,1]:=a*tau*((upm[i-1,1]-2*upm[i,1]+upm[i+1,1])/Sqr(ah))-upm[i,1];
 i:=length(upm)-1;
 upm1[i,1]:=a*tau*((upm[i-1,1]-2*upm[i,1])/Sqr(ah))-upm[i,1];


 for j := 0 to length(upm)-1 do
upm[i,1]:=upm1[i,1];
p:=p+1;

 for j := 0 to length(upm)-1 do
Form1.Chart2.Series[0].AddXY(upm[j,0],upm[j,1]);
  if p>=pmax then
  Form1.Timer1.Enabled:=false;

end;     }


procedure TForm1.SpeedButton4Click(Sender: TObject);
var i: integer;
begin   vt:=0;
 Form1.Chart2.Series[0].Clear;
 uok:=0;
 p7:=0;
Timer2.Enabled:=false;
    SetLength(upm0,0,0);
 SetLength(upm0,5*stat+1,2);
  SetLength(upm1,0,0);
 SetLength(upm1,5*stat+1,2);
 SetLength(upm,0,0);
 SetLength(upm,5*stat+1,2);
  for I := 0 to length(at3)-1 do
   begin
upm[i,0]:=at3[i,0];
upm[i,1]:=at3[i,1];
upm0[i,0]:=at3[i,0];
upm0[i,1]:=0;
    end;

Timer1.Enabled:=true;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var i:integer;
x,y,hb,lth:double;
begin       lth:=8.2;
      hb:=0.1;
Form1.Chart1.Series[0].Clear;
Form1.Chart1.Title.Caption:='Current profile';
Form1.Chart1.Axes.Left.Title.Caption:='Surface current density,[ A / m^2 ]';
Form1.Chart1.Axes.Bottom.Title.Caption:='Beam width,[ mm ]';
  I:=0; x:=0; y:=0;
 while x<lth do
 begin
 atime:=5;  ye:=100;
 //y:=Sim(x,0,ScrollBar2.Position*5e-2);
 y:=(Sim(x,0,ScrollBar2.Position*5e-2)+Sim(x+8.2/ye,0,ScrollBar2.Position*5e-2))/2;
 y:=y*8.2/ye;
 y:=y/areaA();
 if y<=0 then  y:=0;////area/30/stat  on 1 surface unite;
 //Form1.Chart1.Series[0].AddXY(x,y*lth/area);
  Form1.Chart1.Series[0].AddXY(x,y);
 x:=x+hb;
 end;

end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var
ti,th: double;
i: integer;
  j: Integer;
begin
ye:=30; vt:=0;   ksi:=10;
atime:=0; atimep:=0;
Form1.Chart2.Series[0].Clear;
Form1.Chart2.Title.Caption:='Temperature field';
Form1.Chart2.Axes.Left.Title.Caption:='Temperature, [C]';
Form1.Chart2.Axes.Bottom.Title.Caption:='Penetration depth,[mm]';

Q882:=0;
Q1668:=0; Q3260:=0;Qab:=0;  pu:=0;
 t8:=0;
pause:=6;
 c:=0;
 FirstUniversal();

  SetLength(at3,0,0);
 SetLength(at3,5*stat+1,2);
  SetLength(vm,0,0);
 SetLength(vm,5*stat+1,5);
 ksi:=100; tc:=0;
 for I :=0 to length(vm)-1 do
  begin
    vm[i,0]:=1;//enabled;
    vm[i,1]:=0;//energy factor;
    vm[i,2]:=0;//temperature;
    vm[i,3]:=4.1;//|(ScrollBar1.Position/100)*8.2;//yes, beam position width;
    vm[i,4]:=1e3*global_hl*i;//penetration depth;
   end;

 {for I := 0 to length(at3)-1 do
begin
at3[i,0]:=0.0001*i;
at3[i,1]:=0.001*Sqrt(i);
end;}
 if length(at1)=0 then exit;
TemPlot();
 tm:=Round(Stat);
     Form1.Chart2.Series[0].Clear;
     Qsum:=0;
    Timer2.Enabled:=true;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin

 if abs(Pause)=6 then begin

  Timer2.Interval:=Timer2.Interval*2;
end;



end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  if tm=0 then exit;

 if abs(Pause)=6 then begin
  if Timer2.Interval>2 then
Timer2.Interval:=round(Timer2.Interval/2);


end;



end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
 if tm=0 then exit;

 if abs(Pause)=6 then begin
  pause:=-pause;
  Timer2.Enabled:=not Timer2.Enabled;
end;

end;

procedure At(numel: double);
var i: integer;
begin
  for I := 0 to round(stat)-1 do
   Form1.Memo1.Lines.Add('at['+InttoStr(i)+',1]= '+FloattoStr(el*at1[i,1]*1e8*elnum*hl));
end;





Procedure UnitemA(Tt,Qt,Qtt: double; s: mas; chartNum,seriesnum: integer);
var i,j,i1,i2: integer;
Qloc,dQ: double;
t2,bet,al,gam,d: double;
begin


 // Визначення меж;
  bet:=0; al:=0; gam:=0;  d:=0;
 i1:=0; i2:=0;
      Qloc:=0; dQ:=0;
 for I := tc to length(vm)-1 do
if  vm[i,2]>=Tt then
begin
 i1:=i;
for j := i1+1 to length(vm)-1 do
if  vm[j,2]<=Tt then
begin
 i2:=j;
//form1.Memo1.Lines.Add('i1= '+Inttostr(i1)+', i2= '+Inttostr(i2) );
  Break;
 end;
  Break;
 end;


 // Плавлення\/;

  if i2<>0 then
   for I := i1 to i2 do
  begin   vt:=vm[i,2];
   Qloc:= vm[i,1]*hl;
dQ:=Qloc-Qtt;
if dQ> Qt then begin
gam:= -((Qloc-qt))/(hl*areaA()*dens());
  bet:=(0.4465)*1000;
   al:=2.523e-1;
  d:=bet*bet-4*al*gam;
 t2:=(bet+sqrt(d))/(2*al)-pu;
 vm[i,2]:=t2;

end else begin vm[i,2]:=Tt;

end;
 end;       // Плавлення/\;

 //Кипіння\/;


for I := 0 to length(at3)-1 do begin
if ChartNum=2 then
if vm[i,2]>=0 then
begin

 if vm[i,2]>0 then

Form1.Chart2.Series[Seriesnum].AddXY(vm[i,4],vm[i,2]) ;
//if (s[i,1]>1668)and(i mod 10 =0) then
//Form1.Chart2.Series[1].AddXY(s[i,0],s[i,1]);

 end;
//else     Form1.Chart2.Series[Seriesnum].AddXY(vm[i,4],0);
end;

 for I := 0 to length(at3)-1 do
begin
at3[i,0]:=vm[i,4]/10;
at3[i,1]:=vm[i,2];
end;



end;






function UnitemFA(Tt,Qt,Qtt: double; s: mas):mas;
var i,j,i1,i2: integer;
Qloc,dQ: double;
t2,bet,al,gam,d: double;
begin
 // Визначення меж;
  bet:=0; al:=0; gam:=0;  d:=0;
 i1:=0; i2:=0;
      Qloc:=0; dQ:=0;
 for I := tc to length(vm)-1 do
if  vm[i,2]>=Tt then
begin
 i1:=i;
for j := i1+1 to length(vm)-1 do
if  vm[j,2]<=Tt then
begin
 i2:=j;
//form1.Memo1.Lines.Add('i1= '+Inttostr(i1)+', i2= '+Inttostr(i2) );
  Break;
 end;
  Break;
 end;



 // Плавлення\/;

  if i2<>0 then
   for I := i1 to i2 do
  begin    vt:=vm[i,2];
   Qloc:= vm[i,1]*hl;
dQ:=Qloc-Qtt;
if dQ> Qt then begin
gam:= -((Qloc-qt))/(hl*areaA()*dens());
  bet:=(0.4465)*1000;
   al:=2.523e-1;
  d:=bet*bet-4*al*gam;
 t2:=(bet+sqrt(d))/(2*al)-pu;
 vm[i,2]:=t2;

end else  begin vm[i,2]:=Tt;

end;
 end;       // Плавлення/\;

 //Кипіння\/;


result:=s;
end;




procedure TForm1.Timer1Timer(Sender: TObject);
 var  i,j,pmax: integer;
tau,m,sigma,temm: double;
alpha, betta,hd,tr: double;
tester: double;
begin
if p7=0 then atime:=dtime;

 m:=0; temm:=0; tester:=0;
alpha:=18.85; betta:=30; tr:=1;
 Timer2.Enabled:=false;
Form1.Chart2.Series[0].Clear;
 tau:=0.5e-8; pmax:=100000;  tr:=tau/1000;
 atime:=atime+tau;
 Form1.Label2.Caption:='Time= '+FloattoStr(atime)+' s';
 // Form1.Label2.Caption:='Time= '+FloattoStr(time+tau*p7)+' s';
p7:=p7+1;
sigma:=thcr()*tau/Sqr(hl);
hd:=alpha/hl;
for i := 0 to length(upm1)-1 do begin
 if i=0 then   begin
   //  Гранумова;

 //upm1[i,1]:=-1*(hd/(betta-hd))*(sigma*upm[2,1]+ (1-2*sigma)*upm[1,1]+sigma*upm[0,1]);

tester:=-1*(hd/(betta-hd))*(( (Power((SQRT(thcr())*tau)/(hl*Sqrt(tr)),2)*(upm[2,1]-2*upm[1,1]+upm[0,1]))+upm[1,1]*(2+tau/tr)-upm0[i,1] )/(1+tau/tr)) ;
//upm1[i,1]:=-1*(hd/(betta-hd))*(( (Power((SQRT(thc)*tau)/(hl*Sqrt(tr)),2)*(upm[2,1]-2*upm[1,1]+upm[0,1]))+upm[1,1]*(2+tau/tr)-upm0[i,1] )/(1+tau/tr)) ;
 //Гранумова№0;
// upm1[i,1]:=0;//upm[i,1];
//  Гранумова№1;
upm1[i,1]:=-5.67e-8*Power(upm[i,1],4);//+Abs(tester)-7e6*(tau*p7)*(time+tau*p7)/time;
// upm1[i+1,1]:=((hl*hl*tau)/(thc*tr))*(upm1[i,1]*((tr/(tau*tau))+(1/tau)+(2*thc*tr/(hl*hl*tau)))+(upm[i+1,1]+upm[i,1]*((-2*tr/(tau*tau))-(1/tau)+2*(thc/(hl*hl))-2*(thc*tr/(hl*hl*tau)) ) +upm0[i,1]*(tr/(tau*tau)) )  );
               end;
 //upm1[i,1]:=upm1[i,1]+Power(betta-hd,-1)*sigma*20*upm[2,1];
if i=length(upm1)-1 then
 upm1[i,1]:=sigma*0+ (1-2*sigma)*upm[i,1]+sigma*upm[i-1,1];
if (i<>0)and(i<>length(upm1)-1) then begin
 //upm1[i,1]:=sigma*upm[i+1,1]+ (1-2*sigma)*upm[i,1]+sigma*upm[i-1,1];
//upm1[i,1]:=Power(1+tau/tr,-1)*( Power((SQRT(thc)*tau)/(hl*Sqrt(tr)),2)*(upm[i+1,1]-2*upm[i,1]+upm[i-1,1])+upm[i,1]*(2+tau/tr));//-upm0[i,1]);
//upm0[i,1]:=upm[i,1];
upm1[i,1]:=Power(1+tr/tau,-1)*(sigma*(upm[i+1,1]-2*upm[i,1]+upm[i-1,1])+upm[i,1]-(tr/tau)*(upm0[i,1]-2*upm[i,1]));
//upm1[i+1,1]:=((hl*hl*tau)/(thc*tr))*(upm1[i,1]*((tr/(tau*tau))+(1/tau)+(2*thc*tr/(hl*hl*tau)))+(upm[i+1,1]+upm[i-1,1]*((thc*tr/(hl*hl*tau))-thc/(hl*hl))+upm[i,1]*((-2*tr/(tau*tau))-(1/tau)+2*(thc/(hl*hl))-2*(thc*tr/(hl*hl*tau)) ) +upm0[i,1]*(tr/(tau*tau)) )  )-upm1[i-1,1];
upm0[i,1]:=upm[i,1];

                                    end;
  upm1[i,0]:=upm[i,0];
 if upm1[i,1]<=0 then upm1[i,1]:=0;
 vt:=upm1[i,1];
end;

 for j := 0 to length(upm1)-1 do    begin
 upm[j,1]:=upm1[j,1];
 if temm< upm1[j,1] then temm:=upm1[j,1];
Form1.Chart2.Series[0].AddXY(upm1[j,0]*10,upm1[j,1]);
end;
if temm<1 then
Form1.Timer1.Enabled:=false;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var  k,numel,dnumel,d,t2,bet,al,gam,dis,newdis: double;
I,jj: Integer;
  j: Integer;
begin
ye:=30;
if pause=-6 then begin Timer2.Enabled:=false; exit; end;
 pause:=6;
dis :=8.2e-3/ye;
newdis:=(ScrollBar1.Position/100)*0.0082;
if newdis<0 then newdis:=0;

jj:=0;
bet:=0; al:=0; gam:=0;  d:=0;
Form1.Chart2.Series[jj].Clear;
//TAreaSeries (Form1.Chart3.Series[jj]).AreaColor :=$00FFE1DB;
 atimep:=atime;
 atime:=time- tm*(time/stat);
dtime:=atime;
//numel:=elnumF(newdis,dis,atime)- tm*(elnumF(newdis,dis,atime)/stat);
//numel:=numel+elnumFnew(newdis,newdis,dis,atimep,atime);

dnumel:=elnumFnew(newdis,newdis,dis,0,atime)-elnumFnew(newdis,newdis,dis,0,atimep);

Form1.Label2.Caption:='Time= '+FloattoStr(atime)+' s';
//if atime>2e-8 then timer2.Enabled:=false;
for I := 0 to length(at1)-1 do begin
vm[i+tc,1]:=vm[i+tc,1]+el*at1[i,1]*1e8*dnumel;
gam:= -(vm[i+tc,1])/(areaA()*dens());
if gam=0 then begin t2:=0;
  form1.chart2.Series[jj].AddXY(vm[i+tc,4],0);
  at2[i][1]:=0;
  vm[i+tc][2]:=0;
 end else begin
  bet:=(0.4465)*1000;
   al:=2.523e-1;
  d:=bet*bet-4*al*gam;
  //t1:=(bet-sqrt(d))/(2*al);
  //t2:=(bet+sqrt(d))/(2*al)-1769.718;

 if tm=round(stat)-1 then begin
   pu:=(bet+sqrt(d))/(2*al);
   t2:=0; end else t2:=(bet+sqrt(d))/(2*al)-pu;
   vt:=t2;
 at2[i][1]:=t2;
 vm[i+tc][2]:=t2;
if Q1668=0 then
 if vm[i+tc,2]>1667.9 then begin
Qlm:=358000*hl*areaA()*dens();
t8:=i;
Q1668:=Strtofloat(Floattostrf(vm[i+tc,1]*hl,ffFixed,12,3));
form1.Memo1.Lines.Add('i= '+Inttostr(i+tc)+' ,Qlm [J]= '+Floattostr(Qlm));
form1.Memo1.Lines.Add('i= '+Inttostr(i+tc)+' ,Q1668 [J]= '+Floattostr(Q1668));
end;

if Q3260=0 then
 if vm[i+tc,2]>3259.9 then begin
Qlev:=8.971e6*hl*areaA()*dens();
t8:=i;
Q3260:=Strtofloat(Floattostrf(vm[i+tc,1]*hl,ffFixed,12,3));
form1.Memo1.Lines.Add('i= '+Inttostr(i+tc)+' ,Qlev [J]= '+Floattostr(Qlev));
form1.Memo1.Lines.Add('i= '+Inttostr(i+tc)+' ,Q3260 [J]= '+Floattostr(Q3260));
end;


 if Q882=0 then
 if vm[i+tc,2]>=882 then begin
Qab:=87400*hl*areaA()*dens();
Q882:=Strtofloat(Floattostrf(vm[i+tc,1]*hl,ffFixed,12,3));
form1.Memo1.Lines.Add('i= '+Inttostr(i+tc)+' ,Qab [J]= '+Floattostr(Qab));
form1.Memo1.Lines.Add('i= '+Inttostr(i+tc)+' ,Q882 [J]= '+Floattostr(Q882));
end;


   end;
//form1.chart3.Series[0].AddXY(at1[i,0],t2);
 end ;


 for I :=0 to length(vm)-1 do begin

 if (vm[i,2]>1667.9)and(i<ksi) then
  Begin
    for j := 0 to i do  beGin
    tc:=i;
    vm[j,0]:=0;
    eNd;
  End;
  if (vm[i,2]>1667.9)and(i-tc<2) then
  Begin
    for j := tc to i do  beGin
    tc:=i;
    vm[j,0]:=0;
    eNd;
  End;
end;

UnitemA(3260,Qlev,Q3260,UnitemFA(1668,Qlm,Q1668,UnitemFA(882,Qab,Q882,at2)),2,jj);
 if tm<=0 then begin
 Timer2.Enabled:=false;
 end;
timeT1:=time;
tm:=tm-1;
end;



procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
 Form1.Label5.Caption:=InttoStr(Form1.ScrollBar1.Position);
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
 Form1.Label4.Caption:=InttoStr(Form1.ScrollBar2.Position);
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
var i: integer;
begin

Form1.Chart2.Series[0].Clear;
for i:=0 to length(at3)-1 do
Form1.Chart2.Series[0].AddXY(at3[i,0]*10,at3[i,1]);

end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin

firstUniversal();
Form1.Hide;
Form3.Show;

end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
Form1.Chart2.Series[0].Clear;
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
var i: integer;
begin
timer1.Enabled:=not Timer1.Enabled;
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
 FirstUniversal();
 Form1.Hide;
 Form4.Show;
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
Var CurrDir: PChar;
way : string;
begin
//CurrDir:=SysUtils.GetCurrentDir;
//ShowMessage(CurrDir);

  //ShowMessage('Текущая директория = '+GetCurrentDir );
//Form1.Hide;
//Form7.Show;   //;
//ShellExecute(Handle, 'open','c:\Windows\notepad.exe', nil, nil, SW_SHOWNORMAL);

ShellExecute(Handle, 'open','Input_Data.exe', nil, nil,  SW_SHOWNORMAL);
end;

end.
