
function newTrail(x, y)
    local trail = {};
    trail.delayMax =  2--0.02;
    trail.delay = trail.delayMax;
    trail.x = x;
    trail.y = y;
    trail.canDraw = true;
    trail.canKill = false;
    trail.alpha = 200;
    function trail:update(dt)
        if(trail.delay <= 0) then
            -- trail.canDraw = false;
            trail.canKill = true;
        end

        trail.delay = trail.delay - 1 * dt;
        trail.alpha = trail.alpha - 80;--util:map(trail.alpha, 255, 0, trail.delayMax, 0);
        print(tostring(trail.delay))
    end

    function trail:draw()
        if(trail.canDraw) then
            love.graphics.setColor(150, 150, 255, trail.alpha)
            love.graphics.rectangle("fill", x, y, player.w, player.h);
            print("working");
        end
    end

    return trail;
end
