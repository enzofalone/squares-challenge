game = {}


function game:init()
   player:init();
end

function game:update(dt)
   player:update(dt);
end

function game:draw()
   player:draw();
end
