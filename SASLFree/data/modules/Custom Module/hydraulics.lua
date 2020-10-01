--A220 By TAP Designs--
--DATAREF CREATION--

local hydraulic_2A = createGlobalPropertyf( "TAP/hydraulics/HYD_2A", 0)
local hydraulic_2B = createGlobalPropertyf( "TAP/hydraulics/HYD_2B", 0)
local hydraulic_3A = createGlobalPropertyf( "TAP/hydraulics/HYD_3A", 0)
local hydraulic_3B = createGlobalPropertyf( "TAP/hydraulics/HYD_3B", 0)
local hydraulic_1A = createGlobalPropertyi( "TAP/hydraulics/HYD_1A", 0)
local HYD_1_Temp = createGlobalPropertyf( "TAP/hydraulics/HYD_1_Temp", 0)
local HYD_2_Temp = createGlobalPropertyf( "TAP/hydraulics/HYD_2_Temp", 0)
local HYD_3_Temp = createGlobalPropertyf( "TAP/hydraulics/HYD_3_Temp", 0)
local HYD_1_Press = createGlobalPropertyf( "TAP/hydraulics/HYD_1_Press", 0)
local HYD_2_Press = createGlobalPropertyf( "TAP/hydraulics/HYD_2_Press", 0)
local HYD_3_Press = createGlobalPropertyf( "TAP/hydraulics/HYD_3_Press", 0)
local HYD_3_PERCENT = createGlobalPropertyf( "TAP/hydraulics/HYD_3_PERCENT", 0)
local HYD_2_PERCENT = createGlobalPropertyf( "TAP/hydraulics/HYD_2_PERCENT", 0)
local HYD_1_PERCENT = createGlobalPropertyf( "TAP/hydraulics/HYD_1_PERCENT", 0)
local PTU = createGlobalPropertyf( "TAP/hydraulics/PTU", 0)

--VARIABLE CREATION--
local HYD_2 = get(hydraulic_2A) + get(hydraulic_2B)
local HYD_3 = get(hydraulic_3A) + get(hydraulic_3B)
local elevator1 = globalPropertyf("sim/controls/mwing01_elv1def")
local elevator2 = globalPropertyf("sim/controls/mwing01_elv2def")

--FUNCTIONS--

function onModuleStart()
if get(hydraulic_1A) == 0 then
  while true do
  set(elevator1, 0.0) 
  set(elevator2, 0.0)
  end
 end
 end