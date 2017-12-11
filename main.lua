require "collision"
require "menu"
function love.load()
	menu:init();
end

function love.update(dt)
	if(state == 0) then
		menu:update(dt);
	elseif (state == 1) then
	
	end
end

function love.draw(t)
	if(state == 0) then
		menu:update(dt);
	elseif (state == 1) then
		
	end
end

function love.mousepressed(x, y, button, istouch) 
	if(state == 0) then
		menu:mousepressed();
	end
end










