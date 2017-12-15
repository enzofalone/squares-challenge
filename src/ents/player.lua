player = {}

function player:init()

   self.w = 16;
   self.h = self.w;

   self.x = love.graphics.getWidth() / 2 - self.w/2;
   self.y = love.graphics.getHeight() / 2 - self.w/2;

   self.xd = 0;
   self.yd = 0;

   self.spd = 400
end

function player:update(dt)
    --move the player in four directions
   left = love.keyboard.isDown("left");
   right = love.keyboard.isDown("right");
   up = love.keyboard.isDown("up");
   down = love.keyboard.isDown("down");

   if(left) then
      self.xd = -self.spd * dt;
   end

   if(right) then
      self.xd = self.spd * dt;
   end

   if(up) then
      self.yd = -self.spd * dt;
   end

   if(down) then
      self.yd = self.spd * dt;
   end

   self.x = self.x + self.xd;
   self.y = self.y + self.yd;
   --set next positions to 0 to make sure the object won't move while the keys aren't pressed
   self.yd = 0;
   self.xd = 0;
end

function player:draw()
   love.graphics.setColor(25,25,200,255);
   love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);

   love.graphics.setColor(0,0,0,255);
   love.graphics.rectangle("line", self.x, self.y, self.w, self.h);
end
