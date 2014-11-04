unit Global_Var;

interface

 type mas= array of array of double;
var global_atw: double;
    global_atz: double;

global_Ener: double;
global_Pd: double;
global_den : double;
global_InTem,global_hl,global_pu: double;
 global_stat: integer;
 global_volume: double;
 global_e,global_dV: double;
 global_f: TextFile;
 global_Xi: integer;
 //melt coordinates;
 mx1,mx2,rm, begdep,maxTem,maxTemC: double;

const sigmaTi: double= 24.5e6;
const thc: double= 7.75e-6;
const global_el: double=1.6021773e-19;
const global_Current: double= 2000;
const global_time : double= 5e-6;
const global_area: double=9.55e-4;//9.55e-4;
var  global_Qlm,global_Qlev,global_Qsum,global_Q1668,
global_Q3260,global_Qab,global_Q882,global_elnum,global_pause: double;

 global_at1,global_at2: mas;




implementation





end.
