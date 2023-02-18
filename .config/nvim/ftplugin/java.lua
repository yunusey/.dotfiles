local path_to_jdt = '/home/yucely/build/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls'

local config = {
    cmd = {path_to_jdt},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)

function JRun()
    local package = vim.fn.expand ("%:p:h:t")
    local file    = vim.fn.expand ("%:p:t:r")
    local command = "/usr/bin/env /usr/lib/jvm/java-11-openjdk-amd64/bin/java -cp /tmp/vscodesws_b8651/jdt_ws/jdt.ls-java-project/bin"
    local pfile   = package .. "." .. file
    command = command .. " " .. pfile
    vim.cmd(":TermExec cmd='" .. command .. "'")
end
