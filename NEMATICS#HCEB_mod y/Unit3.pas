unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Buttons,math,
  Gauges;

type
  TForm3 = class(TForm)
    Chart3: TChart;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    Memo1: TMemo;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    CheckBox1: TCheckBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Gauge1: TGauge;
    CheckBox2: TCheckBox;
    LabeledEdit4: TLabeledEdit;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    Series18: TLineSeries;
    Series19: TLineSeries;
    Series20: TLineSeries;
    Series21: TLineSeries;
    Series22: TLineSeries;
    Series23: TLineSeries;
    Series24: TLineSeries;
    Series25: TLineSeries;
    Series26: TLineSeries;
    Series27: TLineSeries;
    Series28: TLineSeries;
    Series29: TLineSeries;
    Series30: TLineSeries;
    Series31: TLineSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  tn:integer;
  intj:integer;
  wd: array of array of array of double;
  iface: array of array of double;
implementation
uses Unit1,Global_Var;
Var  f: TextFile;
 view: integer;
 filenameX:string[100];
 ht: double;
 arc: integer;
 time3,atime3,dtime3: double;
 sc: integer;
 ang,arc1,arc2: integer;
 yes: integer;
 vt3: double;
{$R *.dfm}


{Function Ampx(cor: double):double;
var Am,ro: double;
begin
  Am:=0; ro:=cor*1000;
 Am:=0.98*Exp(((-Power(ro-4.1,2))/(1.44*4)));
 Am:=Am+1.1*(((-Power(ro-4.1,2))/16)+1);
 Am:=Am*Power(4*Sqrt(2*pi),-1)*2000;
 result:=am*1e3;
end;
Function Ampt(cor: double): double;
var Am,ro,tim: double;
begin  tim:=atime3*1e6;
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

{
function ElnumF(g,dis: double): double;
begin
    result:=(Ampt(g)*dis*global_time)/global_el;
end;   }

function ElnumFn(g,dis,yt,ytl: double): double;
begin

    result:=(Sim(1e3*g,1e6*yt,1e6*ytl)*dis*ytl*1e3)/global_el;
end;


function ElnumFnew(g,g1,dis,yt,ytl: double): double;
begin
result:=(Sim(1e3*g,1e6*yt,1e6*ytl)+Sim(1e3*g1+dis,1e6*yt,1e6*ytl))*dis*1e3*0.5;
result:=result*abs(ytl-yt)/global_el;
 //  sum A/mm * delta width * delta time/ 2 electron charge;
    end;

  Function AreaA(): double;
begin
  result:=global_area/yes;
end;
 Function dens():double;
Begin
  result:=1e3*den-vt3/3.4;
End;
   function cC( t: double): double;
begin
  result:=(0.5175+2.524e-4*t)*1000;
end;

  Function thcr():double;
Begin
  result:=18.85/(cc(vt3)*dens());
End;


{
function ER(cor: double;iyes: integer): double;
var ifin: integer;
 sun1,sun2: double;

begin
sun1:=abs(sX[0,0]-sx[1,0]);
ifin:=round((cor-iface[iyes,1])/sun1);
if sun2> length(Sx)-1 then result:=0;
if sun2<= length(Sx)-1 then result:=sX[ifin,1];

       end;

       function EC(cor: double;iyes: integer): double;
var ifin: integer;
 sun1,sun2: double;
begin
sun1:=abs(sX[0,0]-sx[1,0]);
//ifin:=round((cor-iface[iyes,1])/sun1);
ifin:=round((cor)/sun1);
result:=wd[iyes,ifin,0]/10;
end;  }


function icor(iyes: integer): integer;
begin
    result:=round(iface[iyes,0]);
end;


Procedure UnitemA(Tt,Qt,Qtt,numel: double; s: mas; chartNum,seriesnum: integer);
var i,j,i1,i2: integer;
Qloc,dQ: double;
t2,bet,al,gam,d: double;
sg: string;
arc: integer;


begin


 // Визначення меж;
  bet:=0; al:=0; gam:=0;  d:=0;
 i1:=0; i2:=0;     arc:=0;
      Qloc:=0; dQ:=0;
 for I := icor(seriesnum) to length(wd[seriesnum])-1 do
if  wd[seriesnum,i,2]>=Tt then
begin
 i1:=i;
for j := i1+1 to length(wd[seriesnum])-1 do
if  wd[seriesnum,j,2]<=Tt then
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
  begin

if wd[seriesnum,i,2]>1667.9 then
   wd[seriesnum,i,0]:=0;
    vt3:=wd[seriesnum,i,2];
Qloc:= global_el*Sx[i,1]*1e8*numel*global_hl;
dQ:=Qloc-Qtt;
if dQ> Qt then begin
gam:= -((Qloc-qt))/(global_hl*areaA()*dens());
  bet:=(0.4465)*1000;
   al:=2.523e-1;
  d:=bet*bet-4*al*gam;
 t2:=(bet+sqrt(d))/(2*al)-global_pu;
 wd[seriesnum,i,2]:=t2;
end else wd[seriesnum,i,2]:=Tt;
 end;       // Плавлення/\;

 //Кипіння\/;




{ for I := 0 to length(s)-1 do begin
if ChartNum=3 then
Form3.Chart3.Series[Seriesnum].AddXY(s[i,0],wd[seriesnum,i,2]);
end;}


for I := 0 to round(length(wd[seriesnum])/1.005)-1 do begin
if ChartNum=3 then
 if i mod 2=0 then
 Form3.Chart3.Series[Seriesnum].AddXY((wd[seriesnum,i,4]),wd[seriesnum,i,2]);
 end;


if (Form3.CheckBox1.Checked)then
begin
FormatSettings.DecimalSeparator:='.';
AssignFile(global_f,filenamex);
Append(global_f);

if (not form3.CheckBox2.Checked) then
for arc:=0 to 360 do begin
sg:='';
sg:=floattoStrf((1.5+intj*(0.82/yes))*cos(DegtoRad(arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf((1.5+intj*(0.82/yes))*sin(DegtoRad(arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(abs(s[view,1]),ffFixed,12,8);
Writeln(global_f,sg);end

else beGin
if (form3.CheckBox2.Checked) then
for arc:=0 to 180 do begin    //spatial depth deferentiation;
sg:='';
sg:=floattoStrf((1.5+intj*(0.82/yes))*cos(DegtoRad(arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf((1.5+intj*(0.82/yes))*sin(DegtoRad(arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(abs(s[Round(5.5*arc),1]),ffFixed,12,8);
Writeln(global_f,sg);
sg:='';
sg:=floattoStrf((1.5+intj*(0.82/yes))*cos(DegtoRad(360-arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf((1.5+intj*(0.82/yes))*sin(DegtoRad(360-arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(abs(s[Round(5.5*arc),1]),ffFixed,12,8);
Writeln(global_f,sg);
end;

eNd;
 intj:=intj+1;
     if intj=yes then begin intj:=0;
  Form3.CheckBox1.Checked:= not Form3.CheckBox1.Checked;
  Form3.Timer1.Enabled:=false;
  Form3.LabeledEdit1.Color:=clBlue;
  Form3.LabeledEdit2.Color:=clBlue;
  Form3.Memo1.Lines.Add('Data were written in '+filenameX);
  end;

      CloseFile(global_f);
      FormatSettings.DecimalSeparator:=',';
      end;

  {if Form3.CheckBox3.Checked then
begin
DecimalSeparator:='.';
AssignFile(global_f,filenamex);
Append(global_f);
if arc2<=360 then
for arc:=arc1 to arc2 do begin
sg:='';
sg:=floattoStrf((1.5+intj*(0.82/30))*cos(DegtoRad(arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf((1.5+intj*(0.82/30))*sin(DegtoRad(arc)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(abs(s[view,1]),ffFixed,12,8);
Writeln(global_f,sg);
end else form3.timer1.Enabled:=false;
  intj:=intj+1;

if intj=30 then begin
   intj:=0;
 arc1:=arc2;
 arc2:=arc2+1;ang:=ang+1;end;
      CloseFile(global_f);
      DecimalSeparator:=',';
      end;   }

      if Form3.CheckBox3.Checked then
          if ang mod 5 =0 then
begin
FormatSettings.DecimalSeparator:='.';
AssignFile(global_f,filenamex);
Append(global_f);


if arc2<=360 then
for arc:=arc1 to arc2 do begin
sg:='';
sg:=floattoStrf((1.5+intj*(0.82/yes))*cos(DegtoRad(arc*0.4)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf((1.5+intj*(0.82/yes))*sin(DegtoRad(arc*0.4)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(abs(s[view,1]),ffFixed,12,8);
Writeln(global_f,sg);
sg:='';
sg:=floattoStrf((1.5+intj*(0.82/yes))*cos(DegtoRad(360-arc*0.4)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf((1.5+intj*(0.82/yes))*sin(DegtoRad(360-arc*0.4)),ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(abs(s[view,1]),ffFixed,12,8);
Writeln(global_f,sg);
end else form3.timer1.Enabled:=false;
  intj:=intj+1;

if intj=yes then begin
   intj:=0;
 arc1:=arc2;
 arc2:=arc2+1;ang:=ang+1;end;
      CloseFile(global_f);
      FormatSettings.DecimalSeparator:=',';
      end else ang:=ang+1;


   { if (Form3.CheckBox4.Checked)then
beGin
DecimalSeparator:='.';
AssignFile(global_f,filenamex);
Append(global_f);
for i := 0 to stat-1 do begin
   begin
sg:='';
sg:=floattoStrf(wd[intj,i,3],ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(wd[intj,i,4],ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(wd[intj,i,2],ffFixed,12,8);
Writeln(global_f,'');
end;
 intj:=intj+1;
     if intj=yes then begin intj:=0;
  Form3.CheckBox4.Checked:= not Form3.CheckBox4.Checked;
  Form3.Timer1.Enabled:=false;
  Form3.LabeledEdit2.Color:=clBlue;
  Form3.Memo1.Lines.Add('Data WD were written into '+filenameX);
  end;

      CloseFile(global_f);
      DecimalSeparator:=',';
      end;
      
eNd;  }




if (Form3.CheckBox4.Checked)then
beGin
FormatSettings.DecimalSeparator:='.';
AssignFile(global_f,filenamex);
Append(global_f);
for i := 0 to 4*stat-1 do
begin
if ((i mod 5 =0)and(i<=stat-1))or(i=0)or(i=stat-1) then begiN
sg:='';
sg:=floattoStrf(wd[intj,i,3],ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(wd[intj,i,4],ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(wd[intj,i,2],ffFixed,12,8);
 writeln(global_f,sg) ;
      end;

if (i>stat-1)and (i<4*stat-1) then
if (i=4*stat-1)or (i mod 25 = 0) then
begiN
sg:='';
sg:=floattoStrf(wd[intj,i,3],ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(wd[intj,i,4],ffFixed,12,8);
sg:=sg+'  '+ floattoStrf(wd[intj,i,2],ffFixed,12,8);
writeln(global_f,sg) ;
end;


 end;
       intj:=intj+1;
       if intj=yes then begin intj:=0; 
        Form3.Memo1.Lines.Add('Data WD were added into '+filenameX);
      
      end;
      CloseFile(global_f);
      FormatSettings.DecimalSeparator:=',';
      Form3.Timer1.Enabled:=false;
      
eNd;  

     
end;


function UnitemFA(Tt,Qt,Qtt,numel: double;cJJ: integer; s: mas ):mas;
var i,j,i1,i2: integer;
Qloc,dQ: double;
t2,bet,al,gam,d: double;

begin


 // Визначення меж;
  bet:=0; al:=0; gam:=0;  d:=0;
 i1:=0; i2:=0;
      Qloc:=0; dQ:=0;
 for I := icor(cJJ) to length(wd[cJJ])-1 do
if  wd[cJJ,i,2]>=Tt then
begin
 i1:=i;
for j := i1+1 to length(wd[cJJ])-1 do
if  wd[cJJ,j,2]<=Tt then
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
  begin    vt3:=wd[cJJ,i,2];
  {if Tt>1668 then                             //width;       //length;
global_volume:=
 global_volume+global_hl*(i2-i1)*(8.2e-3/30)*2*Pi*(2.5e-3);
   }
   Qloc:= global_el*Sx[i,1]*1e8*numel*global_hl;
dQ:=Qloc-Qtt;
if dQ> Qt then begin
gam:= -((Qloc-qt))/(global_hl*areaA()*dens());
  bet:=(0.4465)*1000;
   al:=2.523e-1;
  d:=bet*bet-4*al*gam;
 t2:=(bet+sqrt(d))/(2*al)-global_pu;
 wd[cJJ,i,2]:=t2;
 ///global_at2[i,1]:=t2;

   if (Tt=1668)and(t2>1668) then begin  //width;       //length;
global_volume:=global_volume+global_hl*(8.2e-3/yes)*2*Pi*(2e-3);
global_e:=global_e+ Qloc;
  global_Dv:=global_dV+global_volume*8.9e-6*t2;

  if mx1=0 then mx1:=cJJ*(8.2e-3/yes);  //melting coordinates;
  mx2:= cJJ*(8.2e-3/yes);

 /// if begdep=0 then  begdep:=1e-2*global_at2[i1,0];
///if  1e-2*global_at2[i1,0] <=begdep then begdep:=1e-2*global_at2[i1,0];

end;
end else begin wd[cJJ,i,2]:=Tt;

///global_at2[i,1]:=Tt;

 end;
 end;       // Плавлення/\;

 //Кипіння\/;
  //maxTem;

{if length(s)+icor(cJJ)<=length(wd[cJJ]) then
  for I := 0 to length(s)-1 do
 begin
s[i,1]:=wd[cJJ,i+icor(cJJ),2];
s[i,0]:=wd[cJJ,i+icor(cJJ),4]/10;end else
 for I :=0  to length(s)-1 do  begin
s[i,1]:=wd[cJJ,3*stat+i,2];
s[i,0]:=wd[cJJ,3*stat+i,4]/10;    end;      }

{///  if maxTem=0 then begin
  maxTem:=global_at2[i,1];
  maxTemC:=1e-2*global_at2[i,0];
  end;
   if global_at2[i,1]>maxTem then begin
   maxTem:=global_at2[i,1];
   maxTemC:=1e-2*global_at2[i,0];
   end; }


result:=s;
end;



procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form3.Hide;
Form1.Show;
end;

procedure TForm3.FormCreate(Sender: TObject);
var a1,a2,a3,a4,a5:double;
ti,th: double;
i,j: integer;
begin

vt3:=0;
yes:=30;
 mx1:=0;
 mx2:=0;
 rm:=0;
 begdep:=0;
global_pause:=31;
globaL_Q882:=0;
global_Q1668:=0; globaL_Q3260:=0;globaL_Qab:=0;  global_pu:=0;
pause:=31;
c:=0;
 tn:=Round(global_Stat);

{ for i := 0 to yes-1 do
for j :=0 to stat*3-1 do begin
  wd[i,j,0]:=1;
  wd[i,j,1]:=0;
  wd[i,j,2]:=0;
  wd[i,j,4]:=i*(8.2e-3/yes);
  wd[i,j,5]:=j*(global_pd/globAL_stat);
  Form3.Memo1.Lines.Add(InttoStr(i)+' '+Inttostr(j)+' '+Floattostr(1e3*wd[i,j,5]));
end;   }

end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
var ty,ty1: double;
std: string;
i,j: integer;
begin
global_Xi:=round(global_stat/7);
    yes:=30;
SetLength(wd,yes,4*stat+1,5);
SetLength(iface,yes,2);
for i := 0 to yes-1 do   begin   form3.Memo1.Clear;
for j :=0 to 4*stat-1 do begin
  wd[i,j,0]:=1; //enabled;
  wd[i,j,1]:=0; //energy factor;
  wd[i,j,2]:=0; // temperature;
  wd[i,j,3]:=i*(8.2/yes);//width;
  wd[i,j,4]:=1e3*global_hl*j;//10*global_at1[j,0]; // depth;
  end;
 end;

 for I := 0 to yes-1 do
   begin
   iface[i,0]:=0;   // number of the abl. element;
   iface[i,1]:=0;  //coordinate of an ablation interface;
   end;

atime3:=0; dtime3:=0;
if form3.CheckBox3.Checked then begin
arc1:=5;
ang:=1;
arc2:=2;
if (trystrtofloat(Form3.LabeledEdit1.Text,ty))then  begin
 view:=round(strtofloat(Form3.LabeledEdit1.Text)) ;
 Form3.LabeledEdit1.Color:=clBlack;
end
  else
begin
Timer1.Enabled:=false;
Form3.LabeledEdit1.Color:=clRed;
exit;
end;
 if (trystrtofloat(Form3.LabeledEdit4.Text,ty))then  begin
 Ht:=round(strtofloat(Form3.LabeledEdit4.Text)) ;
 Form3.LabeledEdit4.Color:=clBlack;
end
  else
begin
Timer1.Enabled:=false;
Form3.LabeledEdit4.Color:=clRed;
exit;
end;
std:=  Form3.LabeledEdit2.Text;
 if std<>'' then  begin
 filenamex:=std;
 Assignfile(global_f,std);
 rewrite(global_f);
 closefile(global_f);
 Form3.LabeledEdit4.Color:=clBlack;
end
  else
begin
Timer1.Enabled:=false;
Form3.LabeledEdit2.Color:=clRed;
exit;
end;

end;



if (Form3.CheckBox1.Checked) then
if (trystrtofloat(Form3.LabeledEdit1.Text,ty))then  begin
 view:=round(strtofloat(Form3.LabeledEdit1.Text)) ;
 Form3.LabeledEdit1.Color:=clBlack;
end
else
begin    Form3.LabeledEdit1.Color:=clRed;
  Form3.LabeledEdit1.Color:=clRed; exit;
end;




global_volume:=0;
global_e:=0;
global_pause:=31;
globaL_Q882:=0; globaL_Q1668:=0; globaL_Q3260:=0;
globaL_Qab:=0;  globaL_pu:=0;
 c:=0;

if length(global_at1)=0 then exit;
 tn:=Round(global_Stat);
Timer1.Enabled:=true;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
var ty,ty1:double;
std: string;
begin
if form3.CheckBox3.Checked then begin
arc1:=5;
ang:=1;
arc2:=2;
if (trystrtofloat(Form3.LabeledEdit1.Text,ty))then  begin
 view:=round(strtofloat(Form3.LabeledEdit1.Text)) ;
 Form3.LabeledEdit1.Color:=clBlack;
end
  else
begin
Timer1.Enabled:=false;
Form3.LabeledEdit1.Color:=clRed;
exit;
end;
 if (trystrtofloat(Form3.LabeledEdit4.Text,ty))then  begin
 Ht:=round(strtofloat(Form3.LabeledEdit4.Text)) ;
 Form3.LabeledEdit4.Color:=clBlack;
end
  else
begin
Timer1.Enabled:=false;
Form3.LabeledEdit4.Color:=clRed;
exit;
end;
std:=  Form3.LabeledEdit2.Text;
 if std<>'' then  begin
 filenamex:=std;
 Assignfile(global_f,std);
 rewrite(global_f);
 closefile(global_f);
 Form3.LabeledEdit4.Color:=clBlack;
end
  else
begin
Timer1.Enabled:=false;
Form3.LabeledEdit2.Color:=clRed;
exit;
end;
end;

Form3.LabeledEdit1.Color:=clBlack;
Form3.LabeledEdit2.Color:=clBlack;
if (Form3.CheckBox1.Checked) then
if (trystrtofloat(Form3.LabeledEdit1.Text,ty)) then  begin
 view:=round(strtofloat(Form3.LabeledEdit1.Text)) ;
 filenameX:=Form3.LabeledEdit2.Text;
 Form3.LabeledEdit1.Color:=clBlack;
  Form3.LabeledEdit2.Color:=clBlack;
end
else
begin  Form3.LabeledEdit2.Color:=clRed;
  Form3.LabeledEdit1.Color:=clRed; exit;
end;
if abs(Global_pause)=31 then
begin
 global_pause:=-global_pause;
 Timer1.Enabled:=not Timer1.Enabled;
end;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
if abs(Global_pause)=31 then

Timer1.Interval:=Timer1.Interval*2;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
if abs(Global_pause)=31 then
if Timer1.Interval>5 then

Timer1.Interval:=Round(Timer1.Interval/2);
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
Form3.Memo1.Clear;
end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
var i,j: integer;
yna: string;
begin
Assignfile(global_f,'hl.dat');
rewrite(global_f);
closefile(global_f);

Assignfile(global_f,'hl.dat');
Append(global_f);

for i := 0 to yes-1 do
for j :=0 to 4*stat-1 do
if j mod 10 =0 then  begin
yna:=floattoStrf(wd[i,j,3],ffFixed,12,8);
yna:=yna+'  '+ floattoStrf(wd[i,j,4],ffFixed,12,8);
 yna:=yna+'  '+ floattoStrf(wd[i,j,2],ffFixed,12,8);
 writeln(global_f,yna);
end;
closefile(global_f);


end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
Form3.Memo1.Lines.Add(Floattostr(global_pd));
end;

procedure TForm3.Timer1Timer(Sender: TObject);
var  vol_m,k,numel,d,t2,bet,al,gam,dis,newdis: double;
I,jj,intjj: Integer;
bx1,bx2,bdp,ty:double;
std:string;
begin
 intj:=0;

if (Form3.CheckBox1.Checked) then
if (trystrtofloat(Form3.LabeledEdit1.Text,ty)) then  begin
 view:=round(strtofloat(Form3.LabeledEdit1.Text)) ;
 filenameX:=Form3.LabeledEdit2.Text;
 Form3.LabeledEdit1.Color:=clBlack;
 Form3.LabeledEdit2.Color:=clBlack;
 Form3.LabeledEdit3.Color:=clBlack;
 Form3.LabeledEdit4.Color:=clBlack;
end
else
begin  Form3.LabeledEdit2.Color:=clRed;
  Form3.LabeledEdit1.Color:=clRed; exit;
end;
if checkBox1.Checked then begin
AssignFile(global_f,filenamex);
reWrite(global_f);
Closefile(global_f);   end;
Form3.LabeledEdit1.Color:=clBlack;
Form3.LabeledEdit2.Color:=clBlack;
Form3.LabeledEdit3.Color:=clBlack;
Form3.LabeledEdit4.Color:=clBlack;

  if Form3.CheckBox4.Checked then begiN
std:=  Form3.LabeledEdit2.Text;
 if std<>'' then  begin
 filenamex:=std;
 Assignfile(global_f,std);
 rewrite(global_f);
 closefile(global_f);
 Form3.LabeledEdit2.Color:=clBlue;
 Form3.Memo1.Lines.Add('File was created : '+filenameX);
end
  else
begin
Form3.LabeledEdit2.Color:=clRed;
Timer1.Enabled:=false;
exit;
end;
enD;


bx1:=0; bx2:=0; bdp:=0;
 global_volume:=0;
 Global_dV:=0;
 global_e:=0; vol_m:=0;
if globaL_pause=-31 then
begin Timer1.Enabled:=false; exit; end;
 Global_pause:=31;
dis :=8.2e-3/yes;   newdis:=0.00;   jj:=0;
 for I := 0  to yes-1 do
 Form3.Chart3.Series[i].Clear;

   mx1:=0;
   mx2:=0;
   rm:=0;
   begdep:=0;

for jj := 0 to yes-1 do begin
intjj:=jj;
bet:=0; al:=0; gam:=0;  d:=0;
Form3.Chart3.Series[jj].Clear;
time3:= globaL_time- tn*(globaL_time/globaL_stat);
Form3.Label1.Caption:='Time= '+FloattoStr(time3);
atime3:=time3;
numel:=elnumFnew(newdis,newdis,dis,0,atime3);
if trystrtofloat(form3.LabeledEdit3.Text,ty) then
 beGin
 Form3.Gauge1.Progress:=Round(100*time3/ty);
if (ty-globaL_time+tn*(globaL_time/globaL_stat))<=1e-9 then
timer1.Enabled:=false;

eNd;

for I := 0 to length(sX)-1 do begin
gam:= -(globaL_el*Sx[i,1]*1e8*numel)/(areaA()*dens());
if gam=0 then begin t2:=0;
wd[jj,i+icor(intjj),2]:=0;
  form3.chart3.Series[jj].AddXY(wd[jj,i+icor(intjj),4],wd[jj,i+icor(intjj),2]);
  globaL_at2[i][1]:=0;
 end else begin
  bet:=(0.4465)*1000;
   al:=2.523e-1;
  d:=bet*bet-4*al*gam;
  //t1:=(bet-sqrt(d))/(2*al);
  //t2:=(bet+sqrt(d))/(2*al)-1769.718;

 if tn=round(globaL_stat)-1 then begin
   globaL_pu:=(bet+sqrt(d))/(2*al);
   t2:=0; end else t2:=(bet+sqrt(d))/(2*al)-globaL_pu;
 globaL_at2[i][1]:=t2;
 wd[intjj,i+icor(intjj),2]:=t2;

 if wd[jj,i+icor(intjj),2]>1667.9 then
   wd[jj,i+icor(intjj),0]:=0;

if globaL_Q1668=0 then
if wd[jj,i+icor(intjj),2]>1667.9 then begin
globaL_Qlm:=358000*globaL_hl*areaA()*globaL_den*1e3;
t8:=i;
globaL_Q1668:=Strtofloat(Floattostrf(globaL_el*Sx[i,1]*1e8*numel*globaL_hl,ffFixed,12,3));
form3.Memo1.Lines.Add('i= '+Inttostr(i)+' ,Qlm [J]= '+Floattostr(global_Qlm));
form3.Memo1.Lines.Add('i= '+Inttostr(i)+' ,Q1668 [J]= '+Floattostr(global_Q1668));
end;

if globaL_Q3260=0 then
 if wd[jj,i+icor(intjj),2]>3259.9 then begin
globaL_Qlev:=8.971e6*globaL_hl*areaA()*globaL_den*1e3;
global_Q3260:=Strtofloat(Floattostrf(globaL_el*Sx[i,1]*1e8*numel*global_hl,ffFixed,12,3));
form3.Memo1.Lines.Add('i= '+Inttostr(i)+' ,Qlev [J]= '+Floattostr(global_Qlev));
form3.Memo1.Lines.Add('i= '+Inttostr(i)+' ,Q3260 [J]= '+Floattostr(global_Q3260));
end;


 if globaL_Q882=0 then
 if wd[jj,i+icor(intjj),2]>881.99 then begin
globaL_Qab:=87400*globaL_hl*areaA()*globaL_den*1e3;
globaL_Q882:=Strtofloat(Floattostrf(globaL_el*Sx[i,1]*1e8*numel*globaL_hl,ffFixed,12,3));
form3.Memo1.Lines.Add('i= '+Inttostr(i)+' ,Qab [J]= '+Floattostr(globaL_Qab));
form3.Memo1.Lines.Add('i= '+Inttostr(i)+' ,Q882 [J]= '+Floattostr(globaL_Q882));
end;


   end;
//form1.chart3.Series[0].AddXY(at1[i,0],t2);
 end ;
UnitemA(3260,globaL_Qlev,globaL_Q3260,numel,UnitemFA(1668,globaL_Qlm,globaL_Q1668,numel,intjj,UnitemFA(882,globaL_Qab,globaL_Q882,numel,intjj,globaL_at2)),3,intjj);


 if tn<=0 then Timer1.Enabled:=false;
 Chart3.View3DOptions.Zoom:= ScrollBar1.Position;
Chart3.View3DOptions.Rotation:= ScrollBar2.Position;
Chart3.View3DOptions.Elevation:= ScrollBar3.Position;
Chart3.Repaint;

newdis:=newdis+dis;
end;
  tn:=tn-1;
// if tn=0 then

 ///if global_volume<>0 then  begin

///Form3.Memo1.Lines.Add('global_volume= '+FloattoStr(global_volume));
//Form3.Memo1.Lines.Add('global_e= '+FloattoStr(global_e));
//bx2:= 0.2*global_e/global_volume;
//Form3.Memo1.Lines.Add('global_pressure1 = '+FloattoStr(bx2));
//vol_m:=(global_AtW)/(5.917*Power(1-(3700/9040),0.5984)+1);
//Form3.Memo1.Lines.Add('global_pressure2 = '+FloattoStr(((8.31451*3660)/(vol_m-1.028e-5))- (3040/Power(vol_m,1.338))));
///bx2:=((8.31451*3660*global_volume*den*1e3)/(global_volume*AtW*1e3-1.028e-5*global_volume*den*1e3))- 3040/Power(AtW/den,1.338);
//Form3.Memo1.Lines.Add('global_pressure3 = '+FloattoStr(((8.31451*3660*global_volume*den*1e3)/(global_volume*AtW*1e3-1.028e-5*global_volume*den*1e3))- (3040)/Power(AtW/den,1.338)));
//vol_m:=0;

///bx1:=Pi*Power((begdep)/2,2);
///if bx1<>0 then begin
///Form3.Memo1.Lines.Add(' begdep= '+Floattostr(begdep) );

///Form3.Memo1.Lines.Add('prX= '+Floattostr(bx1*sigmaTi*9.8));
//if (bx1*sigmaTi*9.8 < bx2){and((begdep/maxTemc)<0.1)} then  begin
//Form3.Memo1.Lines.Add('Ablation'); Form3.Timer1.Enabled:=False; end;

///end;
///end;

end;

end.

