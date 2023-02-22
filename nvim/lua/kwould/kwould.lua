
-- just adding in slice 
function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

-- split
function table.split(arr, delim)
	local newArr = {}
	for value in string.gmatch(arr, "([^"..delim.."]+)") do
		table.insert(newArr, value)
	end
	return newArr
end 

local M  = {}

M.search_source_repo = function()
	local prefix = "https://github.com"
	local full_filepath = vim.fn.expand('%:p')
	local fileArr = table.split(full_filepath, "/")
	local repo = fileArr[4]
	-- print("here")
	-- print(unpack(fileArr, 5, table.getn(fileArr)))
	local filename = table.concat(table.slice(fileArr, 5, #fileArr), "/")
	local gitBranch = "master"
	local configurl = os.getenv("WORK_GH_URL")
	local url = string.format("%s/%s/%s/blob/%s/%s", prefix, configurl, repo, gitBranch, filename)
	local finalUrl = url .. "#" .. "L" .. vim.fn.line(".")
	-- print(finalUrl)
	print('silent exec "!open \'' .. finalUrl .. '\'"')
	vim.cmd('silent exec "!open \'' .. finalUrl .. '\'"')
end

return M
