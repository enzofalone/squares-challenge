player = {}

function player:init()

    self.w = 16;
    self.h = self.w;

    self.x = love.graphics.getWidth() / 2 - self.w / 2;
    self.y = love.graphics.getHeight() / 2 - self.w / 2;

    self.xd = 0;
    self.yd = 0;

    self.spd = 400;

    self.tail = {};
    self.tailTimerMax = 2;
    self.tailTimer = self.tailTimerMax;
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
    --start game when the user touch the arrow keys
    if not game.started then
        if left or right or up or down then
            game.started = true;
        end
    end

    --trail stuff
    if(self.tailTimer <= 0) then
        self.tailTimer = self.tailTimerMax;

        table.insert(self.tail, newTrail(self.x, self.y));
    else
        self.tailTimer = self.tailTimer - 5;
    end

    for i, trail in ipairs(self.tail) do
        trail:update(dt);
        if(trail.canKill) then
            table.remove(self.tail, i);
        end
    end
end

function player:draw()
    love.graphics.print(#self.tail, 20, 20);
    for i, trail in ipairs(self.tail) do
        trail:draw();
    end

    love.graphics.setColor(25, 25, 200, 255);
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);

    love.graphics.setColor(0, 0, 0, 255);
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h);
    love.graphics.setColor(255, 255, 255, 255);
end
