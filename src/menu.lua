menu = {
   state = 0,
};

function menu:init()
   self.state = 0;
   self.bg_menu = love.graphics.newImage("assets/bg.png");

   self.buttons = {};
   
   table.insert(self.buttons, {
		   name = "start",
		   active = false,
		   x = love.graphics.getWidth() / 2 - 70,
		   y = love.graphics.getHeight() / 2 - 70,
		   img = love.graphics.newImage("assets/bstart.png"),
		   img_a = love.graphics.newImage("assets/bstart_active.png"),
			 })
   
   table.insert(self.buttons, {
		   name = "quit",
		   active = false,
		   x = self.buttons[1].x,
		   y = self.buttons[1].y + 100,
		   img = love.graphics.newImage("assets/bquit.png"),
		   img_a = love.graphics.newImage("assets/bquit_active.png"),
			 })
end

function menu:update(dt)
   local mouseX, mouseY = love.mouse.getPosition();
   
   for i, b in ipairs(self.buttons) do
      if collision:check(mouseX, mouseY, 1, 1, b.x, b.y, b.img:getWidth()/2, b.img:getHeight()/2) then
	 b.active = true;
      else
	 b.active = false;
      end
   end
end

function menu:draw(t)
  love.graphics.draw(self.bg_menu, -1, -1, 0, 1.5, 1.5);
   
   for i,b in ipairs(self.buttons) do
      if not b.active then
	 love.graphics.draw(b.img, b.x, b.y, 0, 0.5, 0.5);
      else
	 love.graphics.draw(b.img_a, b.x, b.y, 0, 0.5, 0.5);
      end
   end
   love.graphics.setColor(0,0,0,255);
   love.graphics.print("Game made by Enzo Falone", 10, love.graphics.getHeight() - 20);
   love.graphics.setColor(255,255,255,255);
end

function menu:mousepressed(x, y, button, istouch) 
   for i, b in ipairs(self.buttons) do
      if collision:check(x, y, 1, 1, b.x, b.y, b.img:getWidth()/2, b.img:getHeight()/2) then
	 if b.name == "start" then
	    menu.state = 1;
	    game:init();
	    print("state switched!");
	 elseif b.name == "quit" then
	    print("quit!");
	    love.event.push("quit");
	 end
      end
   end
end
