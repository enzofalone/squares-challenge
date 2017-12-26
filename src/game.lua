game = {}

function game:init()
    game.started = false;
    player:init();
end

function game:update(dt)
    player:update(dt);
end

function game:draw()
    player:draw();
    love.graphics.setColor(255, 255, 255, 80);
    --little box above where we will put all the HUD stuff
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 30);

    if not game.started then
        love.graphics.printf("Press any arrow key to start the game!", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 400, "center");
    end
end
