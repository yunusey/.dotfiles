

local path_to_jdt = '/home/yucely/build/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls'

local config = {
    cmd = {path_to_jdt},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
