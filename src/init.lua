G_AddGametype({
    name = "Sonic Kart",
    identifier = "SONICKART",
    typeoflevel = TOL_COOP,
    rules = GTR_FRIENDLYFIRE|GTR_SPAWNINVUL,
    intermissiontype = int_match,
    headerleftcolor = 222,
    headerrightcolor = 84,
	description = "gotta go fast ig"
})

rawset(_G, "SK", {})
rawset(_G, "SKN", {})

/*	SONIC KART BY SAXASHITTER
	THIS CODE IS 100% REUSABLE

	FILE STRUCTURE:
		Data-type (Hooks, Functions, Variables):
			loader.lua (Files and folders in a singular table)

			Scripts (Folder with all relevant scripts):
				Script-type (Script type, whether for the backend or not.)
			
*/

local function load_struct(path)
	local struct = dofile(path.."/loader")

	if not struct then return end

	for _,data in ipairs(struct) do
		for _,file in ipairs(data.files) do
			local content = {dofile(path.."/Scripts/"..data.name.."/"..file)}

			if data.onLoad then
				data.onLoad(unpack(content))
			end

			if struct.addToSK then
				SK[file] = unpack(content)
			end
		end
	end
end

/*	STRUCT: {
		name = "FolderName",
		files = {luaname, luaname, ...},
		onLoad = function
	}
*/

load_struct("Functions")
load_struct("Hooks")