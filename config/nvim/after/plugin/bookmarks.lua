local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local Bookmarks = {
    APCSA     = "~/yunusey/APCSA",
    stapcsa   = "~/yunusey/APCSA/stapcsa/",
    dotfiles  = "~/yunusey/.dotfiles",
    bash      = "~/yunusey/.dotfiles/bash/",
    tmux      = "~/yunusey/.dotfiles/tmux/",
    quicklint = "~/yunusey/quick-lint-js",
}

local function getKeys()
    local keys = {}
    for i, _ in pairs(Bookmarks) do
        table.insert(keys, i)
    end
    return keys
end

local function act(bufnr)
    local selected  = action_state.get_selected_entry()
    local file_path = Bookmarks[selected[1]]
    actions.close(bufnr)
    vim.cmd("tabnew")
    vim.cmd("Ex " .. file_path)
end

local opts = {
    finder = finders.new_table(getKeys()),
    sorter = sorters.get_generic_fuzzy_sorter({}),
    prompt_title = "Bookmarks",
    prompt_prefix = "⭐: ",
    attach_mappings = function (_, map)
        map('i', "<CR>", act)
        return true
    end
}

local function f()
    pickers.new({}, require('telescope.themes').get_dropdown(opts)):find()
end

vim.api.nvim_create_user_command("Bookmarks", f, {})
