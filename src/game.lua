game = {}

function game:init()
   player:init();
end

function game:update(dt)
   player:update(dt);
end

function game:draw()
   player:draw();
   love.graphics.setColor(0,0,0,124);
   --little box above where we will put all the HUD stuff
   love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 60);
end
