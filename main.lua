require "src/collision"
require "src/menu"
require "src/ents/player"
require "src/game"

function love.load()
   
   menu:init();
   print(menu.state);
   love.graphics.setBackgroundColor(162,231,177);
end

function love.update(dt)
   if(menu.state == 0) then
      menu:update(dt);
   elseif (menu.state == 1) then
      game:update(dt);
   end
end

function love.draw(t)
   if menu.state == 0 then
      menu:draw(t);
   elseif menu.state == 1 then
      game:draw(t);
   end
end

function love.mousepressed(x, y, button, istouch) 
   if menu.state == 0 then
      menu:mousepressed(x, y, button, istouch);
   end
end
