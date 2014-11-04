library dllSrep;
uses
  SysUtils,
  Classes,math;

{$R *.res}
Function AreaA(area: double): double;register;    export;
begin
  result:=area/30;
end;


 Function Amp(cor: double):double;  export;
 stdcall;
var Am,ro: double;
begin
  Am:=0; ro:=cor*1000;
 Am:=0.98*Exp(((-Power(ro-4.1,2))/(1.44*4)));
 Am:=Am+1.1*(((-Power(ro-4.1,2))/16)+1);
 Am:=Am*Power(4*Sqrt(2*pi),-1)*2000;
 result:=am*1e3;
end;


function ElnumF(g,dis,el: double): double;    export;
register;
begin
    result:=(Amp(g)*dis*time)/el;
end;
exports ElnumF,Amp, AreaA;



begin
end.
