local ls = require("luasnip")

vim.keymap.set({"i", "s"}, "<C-k>", function ()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-j>", function ()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, {silent = true})

-- Not using anymore..
-- ls.add_snippets("all",{
-- 	ls.parser.parse_snippet("{}(functional)", "{\n\t$1\n}$0"),
-- 	ls.parser.parse_snippet("{}(vectoral)", "{$1}$0"),
-- })

