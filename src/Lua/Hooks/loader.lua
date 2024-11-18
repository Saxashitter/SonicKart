local player_scripts = {
	ingame = {},
	spectator = {},
	global = {}
}

addHook("MapChange", do
	SK:gameInit()
end)

addHook("PlayerThink", function(p)
	if not SK.isSK() then return end

	if not p.sk then
		SK:playerInit(p)
	end

	for k,v in ipairs(player_scripts.global) do
		v(p)
	end

	if SK:isPlayerAlive(p) then
		for k,v in ipairs(player_scripts.ingame) do
			v(p)
		end
		return
	end
end)

local function loadPlayerScript(func, type)
	type = type or "ingame"

	if not player_scripts[type] then
		return
	end

	table.insert(player_scripts[type], func)
end

return {
	{
		name = "Game",
		files = {}
	},
	{
		name = "Player",
		files = {
			"Movement"
		},
		onLoad = loadPlayerScript
	},
	{
		name = "HUD",
		files = {}
	}
}