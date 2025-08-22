`include "defines.svh"
interface alu_interface( input bit  CLK,RST);
  logic [1:0]INP_VALID;
  logic [`M-1:0]CMD;
  logic CE,CIN,MODE;
  logic [`N-1:0]OPA,OPB;

  logic ERR,OFLOW,COUT,E,G,L;
  logic [`N:0] RES;

  clocking drv_cb @(posedge CLK);
    default input #0 output #0;
    output INP_VALID,CE,CIN,MODE,OPA,OPB,CMD,RST;
  endclocking

  clocking mon_cb @(posedge CLK);
    default input #0 output #0;
    input ERR,OFLOW,COUT,E,G,L,RES;
    input INP_VALID,CMD,CE,CIN,MODE,OPA,OPB;
  endclocking


  modport DRV(clocking drv_cb);
  modport MON(clocking mon_cb);


endinterface
