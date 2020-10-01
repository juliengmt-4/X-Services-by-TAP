--A220 By TAP Designs--

position = {1070, 680, 470, 420}
size = {240, 220}

--white color
local white = {1.0, 1.0, 1.0, 1.0}

--functions

Rectangle = {area = 0, length = 0, breadth = 0}

function Rectangle:new (o,length,breadth)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.length = length or 0
    self.breadth = breadth or 0
    self.area = length*breadth;
    return o
end

function Rectangle:printArea ()
print("The area of Rectangle is ",self.area)
end

function draw()
    sasl.gl.drawRectangle(0,0,240,220, white)
end

function update()

end