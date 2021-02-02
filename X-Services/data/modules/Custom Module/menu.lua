--X-Services by TAP 2020--

--Creating Menu--


PFD_WHITE = {1.0, 1.0, 1.0, 1.0}
UI_Home = sasl.gl.loadImage("images/UI_Home.dds", 0, 0, 2480, 3169)

function draw()
  sasl.gl.drawTexture(UI_Home, 0, 0, 620, 792, PFD_WHITE)
  
end




