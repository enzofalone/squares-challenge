player = {}

function player:init()

   self.w = 16;
   self.h = self.w;
   
   self.x = love.graphics.getWidth() / 2 - self.w/2;
   self.y = love.graphics.getHeight() / 2 - self.w/2;

   self.xd = 0;
   self.yd = 0;
end

function player:update(dt)
   
end

function player:draw()
   love.graphics.setColor(25,25,200,255);
   love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);

   love.graphics.setColor(0,0,0,255);
   love.graphics.rectangle("line", self.x, self.y, self.w, self.h);
end
