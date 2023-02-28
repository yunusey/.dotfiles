local notify = require('notify')

local isValidData = function (data)

    if data == nil or data == {} or data == '' then
	return false
    end

    if type(data) == "table" then
	for _, i in pairs(data) do
	    if i ~= nil and i ~= {} and i ~= '' then
		return true
	    end
	end
	return false

    elseif type(data) == "string" then
	return data ~= string.match(data, "%s+")
    end

    return true

end

local function runCpp(file_name)
    local command = {"g++", file_name .. '.cpp', "-o", file_name, "-DLOCAL"}
    local compile_error = false
    vim.fn.jobstart(command, {
	on_stderr = function (_, data)
	    if isValidData(data) then
		compile_error = true
	    end
	end,

	on_exit = function ()
	    if compile_error then
		notify("Compile unsuccessful")
	    else
		local str = file_name
		vim.cmd ('TermExec cmd="' .. str .. '"')
	    end
	end
    })
end

vim.api.nvim_create_user_command("CppRun", function ()
    local s = vim.fn.expand("%:p")
    local ind = string.find(s, "%.") - 1
    local file_name = string.sub(s, 1, ind)
    runCpp(file_name)
end, {})

local group = vim.api.nvim_create_augroup("CppSave", { clear = true })
vim.api.nvim_create_autocmd ("BufWritePost", {
    pattern = "*.cpp",
    callback = function ()
	vim.cmd (":CppRun")
    end,
    group = group
})
