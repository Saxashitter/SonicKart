local data = SK.require("Modules/Variables/game")
local copy = SK.require("Modules/Libraries/copy")

return function(self, p)
	SKN = copy(data)

	for p in players.iterate do
		SK:playerInit(p)
	end
end