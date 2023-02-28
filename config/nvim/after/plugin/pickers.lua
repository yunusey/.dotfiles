local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function act(bufnr)
    local selected = action_state.get_selected_entry()
    print(vim.inspect(selected))
    actions.close(bufnr)
end

local opts = {
    finder = finders.new_table {"Yunus", "Meryem", "Fatih", "Yusuf", "Metin"},
    sorter = sorters.get_generic_fuzzy_sorter({}),
    attach_mappings = function (_, map)
        map('i', "<CR>", act)
        return true
    end
}

local sel = pickers.new(opts, {})
local function f()
    sel:find()
end

vim.api.nvim_create_user_command("FamilyMems", f, {})
