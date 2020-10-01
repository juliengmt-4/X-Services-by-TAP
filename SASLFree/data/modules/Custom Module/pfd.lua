--A220 By TAP Designs--

position = {1520, 976, 480, 440}
size = {480, 440}

local pitch = globalPropertyf("sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot")
local roll = globalPropertyf("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot")
local battery1 = globalPropertyi( "TAP/electrical/batt_1")
local battery2 = globalPropertyi( "TAP/electrical/batt_2")
local airspeed = globalPropertyf("sim/cockpit2/gauges/indicators/airspeed_kts_pilot")
local altitude = globalPropertyf("sim/cockpit2/gauges/indicators/altitude_ft_pilot")


--get images
local horizon = sasl.gl.loadImage("images/horizonandscale.png", 0, 0, 1024, 2048)
local atitudeindicator = sasl.gl.loadImage("images/attitudeindicator.png", 0, 0, 108, 14)

--get fonts
local AirbusFont = sasl.gl.loadFont("fonts/PanelFont.ttf")

--get colors
local PFD_WHITE = {1.0, 1.0, 1.0, 1.0}

 local PAGE_POS = {
    x = position[1],
    y = position[2],
    w = position[3],
    h = position[4]
}
local PAGE_SIZE = {x = size[1], y = size[2]}

local TAPE_CFG = {
--airspeed
    {
        x = 120,
        y = -200,
        w = 40,
        h = 300, 
        font_size = 16,

        get_data = function () return get(airspeed) end, -- callback to get data
        padding = 0,        -- do not pad
        data_h = 100,       -- 100 knts are displayed in the height

        data_max = 500,     -- 500 knots is the largest number
        data_min = 40,      -- 40 knots is lowest number
        tick_interval = 10, -- tick every 10 knts
        num_interval = 20,  -- number every 10 knts
    },
    --alt
    {
        x = 380,
        y = -190,
        w = 40,
        h = 300, 
        font_size = 16,

        get_data = function () return get(altitude) / 100 end, -- callback to get data
        padding = 3,        -- pad 0 infront of numbers less than 3 digits
        data_h = 100,       -- 100 knts are displayed in the height

        data_max = 500,     -- 500 knots is the largest number
        data_min = 0,      -- 40 knots is lowest number
        tick_interval = 10, -- tick every 10 knts
        num_interval = 20,  -- number every 10 knts
    },
}

local function draw_tapes()
  --speed indicator
  -- trail and error time bOIS
  for i,tape in ipairs(TAPE_CFG) do
    interval = tape.data_h / tape.num_interval

    -- 1 knts is tape.w / tape.data_h
    knt_interval = tape.h / tape.data_h
    knt_interval_offset = knt_interval * (math.max(tape.get_data(), tape.data_min) % tape.num_interval)
    knt_interval_final = knt_interval_offset * -1

    data = math.max(tape.get_data(), tape.data_min)
    data_rounded = math.floor(data / tape.num_interval) * tape.num_interval

    for j = 1,interval do
      j_offset = math.ceil(interval / 2)
      j_final = j - j_offset
      data_offset = data_rounded + (j_final * tape.num_interval)
      data_final = data_offset

      y_offset = (j - 1) * (tape.h / interval)
      y_final = y_offset + knt_interval_final

      if data_final >= tape.data_min then
          --padding
          data_final = tostring(data_final)
          while string.len(data_final) < tape.padding do
              data_final = "0" .. data_final
          end
          --draw
          sasl.gl.drawText(
            AirbusFont,
            tape.x,
            tape.y + y_final,
            data_final,
            tape.font_size,
            false, false, TEXT_ALIGN_LEFT, PFD_WHITE)
        end
    end
  end
end




--artificial horizon
local function draw_attitudeindicator()
  sasl.gl.drawTexture(attitudeindicator, 0, 0, 108, 14, PFD_WHITE)
end


local function draw_horizon()
  sasl.gl.drawRotatedTexture(horizon, 0 - get(roll), 0, ((0- get(pitch)) * 5)  - 650, 512 , 1256, PFD_WHITE)
end
function draw()
    draw_horizon()
    draw_tapes()
    draw_attitudeindicator()
end
