--A220 By TAP Designs--
--DATAREF CREATION--

battery1 = createGlobalPropertyi( "TAP/electrical/batt_1", 0.0)
battery2 = createGlobalPropertyi( "TAP/electrical/batt_2", 0.0)
L_Disc = createGlobalPropertyi( "TAP/electrical/L_Disc", 0)
R_Disc = createGlobalPropertyi( "TAP/electrical/R_Disc", 0)
Bus_Isol = createGlobalPropertyi( "TAP/electrical/Bus_Isol", 0)
Cabin_Pwr = createGlobalPropertyi( "TAP/electrical/Cabin_Pwr", 0)
Rat_Gen = createGlobalPropertyi( "TAP/electrical/Rat_Gen", 0)
L_Gen =  createGlobalPropertyi("TAP/electrical/L_Gen", 0)
R_Gen =  createGlobalPropertyi("TAP/electrical/R_Gen", 0)
Ext_Pwr =  createGlobalPropertyi("TAP/electrical/Ext_Pwr", 0)
APU_Gen =  createGlobalPropertyi("TAP/electrical/APU_Gen", 0)


--DEFINE DATAREFS--
num_bats = globalPropertyi( "sim/aircraft/electrical/num_batteries" , 2)

--IF--
