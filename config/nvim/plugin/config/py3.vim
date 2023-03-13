python3 << END

import vim, math

def pytry ():
	print(vim.current.window)
	file_path = "matext"
	vim.command(f"lua require('notify')(\"{file_path}\")")

END

function! py3#try() abort
	:py3 pytry()
endfunction

