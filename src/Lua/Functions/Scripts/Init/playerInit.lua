local data = SK.require("Modules/Variables/player")
local copy = SK.require("Modules/Libraries/copy")

return function(self, p)
	p.sk = copy(data)

	if not p.sk_save then
		p.sk_save = {}
	end
end