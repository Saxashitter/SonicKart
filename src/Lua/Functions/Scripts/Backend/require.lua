local files = {}

return function(path)
	if not (files[path]) then
		files[path] = dofile(path)
	end

	return files[path]
end