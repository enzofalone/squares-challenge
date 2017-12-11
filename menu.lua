local menu = {};

bg_menu = nil;
buttons = {};

state = {
	current = 0,
}

function menu:init()
    bg_menu = love.graphics.newImage("assets/menu_bg.png");
    
	table.insert(buttons, {
		name = "start",
		active = false,
		x = love.graphics.getWidth() / 2 - 70,
		y = love.graphics.getHeight() / 2 - 70,
		img = love.graphics.newImage("assets/bstart.png"),
		img_a = love.graphics.newImage("assets/bstart_active.png"),
	})
	
	table.insert(buttons, {
		name = "quit",
		active = false,
		x = buttons[1].x,
		y = buttons[1].y + 100,
		img = love.graphics.newImage("assets/bquit.png"),
		img_a = love.graphics.newImage("assets/bquit_active.png"),
	})
end

function menu:update(dt)
    local mouseX, mouseY = love.mouse.getPosition();
	
	for i, b in ipairs(buttons) do
		if collision:check(mouseX, mouseY, 1, 1, b.x, b.y, b.img:getWidth()/2, b.img:getHeight()/2) then
			b.active = true;
		else
			b.active = false;
		end
	end
end

function menu:draw(t)
    love.graphics.draw(bg_menu, -1, -1, 0, 1.01, 1.01);
    
    for i,b in ipairs(buttons) do
		if not b.active then
			love.graphics.draw(b.img, b.x, b.y, 0, 0.5, 0.5);
		else
			love.graphics.draw(b.img_a, b.x, b.y, 0, 0.5, 0.5);
		end
	end
end

function love.mousepressed(x, y, button, istouch) 
	for i, b in ipairs(buttons) do
		if collision:check(x, y, 1, 1, b.x, b.y, b.img:getWidth()/2, b.img:getHeight()/2) then
			if b.name == "start" then
				
			end
		end
	end
end