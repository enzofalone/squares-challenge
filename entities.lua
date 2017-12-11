ents = {}
ents.objects = {}
ents.objpatch = "entities/"

local register = {}
local id = 0;

function ents.startup()
	
end

function ents.create(name, x, y)
	if not x then
		x = 0;
	end
	
	if not y then
		y = 0;
	end
	
	if register[name] then
		id = id + 1;
		local ent = register[name]();
		ent:load();
		ent:setPos(x, y);
		ent.id = id;
		ents.objects[#ents.objects + 1] = ent;
		return ents.objects(#ents.objects);
	else 
		print("Error: Entity " .. name .. " does not exist!");
		return false
	end
end

function ents:update(dt)
	for i, ent in pairs(ents.objects) do
		if(ent.update) then
			ent:update(dt);
		end
	end
end

