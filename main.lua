require "src/collision"
require "src/util"
require "src/ents/trail"
require "src/menu"
require "src/ents/player"
require "src/game"

debug = true;

function love.load()

    menu:init();
    print(menu.state);
    love.graphics.setBackgroundColor(0, 0, 0);
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

    if debug then
        love.graphics.setColor(255, 255, 255, 255);
        love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), love.graphics.getWidth() - 50, love.graphics.getHeight() - 20);
    end
end

function love.mousepressed(x, y, button, istouch)
    if menu.state == 0 then
        menu:mousepressed(x, y, button, istouch);
    end
end

function love.keypressed(key, scancode, isrepeat)
    if(key == "escape") then
        love.event.push("quit");
    end
end
