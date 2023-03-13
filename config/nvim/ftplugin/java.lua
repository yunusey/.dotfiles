local path_to_jdt = '/home/yucely/build/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls'

local config = {
    cmd = {path_to_jdt},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)

function JRun(args)
    print(args)
    local package = vim.fn.expand ("%:p:h:t")
    local file    = vim.fn.expand ("%:p:t:r")
    local arg     = package .. '.' .. file
    local command ='~/yunusey/APCSA/.config/run.sh ' .. arg .. ' ' .. args
    vim.cmd("TermExec cmd='" .. command .. "'")
end

vim.api.nvim_create_user_command("JavaRun", function (args)
    JRun(args["args"])
end, {nargs='?'})

vim.api.nvim_set_keymap('i', '<F5>', '<ESC>:JavaRun<CR>', {
    desc = "Run the current Java program in terminal",
})

vim.api.nvim_set_keymap('n', '<F5>', ':JavaRun<CR>', {
    desc = "Run the current Java program in terminal",
})
