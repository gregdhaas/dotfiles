-- Vite+ projects (the Laravel starter kits) keep their oxlint/oxfmt config in vite.config.ts,
-- which only the `vp` CLI reads.
local function vp(ctx)
	return vim.fs.find("node_modules/.bin/vp", { path = ctx.dirname, upward = true })[1]
end

return {
	{
		-- LazyVim's oxc extra only roots oxlint on .oxlintrc/oxlint.config.ts. Drop its override so
		-- lspconfig's default also finds Vite+ projects (vite.config.ts `lint:`).
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			opts.servers.oxlint.root_dir = nil
		end,
	},
	{
		-- Format through `vp fmt` when present so vite.config.ts `fmt` settings apply.
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				oxfmt = {
					command = function(_, ctx)
						return vp(ctx) or require("conform.util").from_node_modules("oxfmt")(_, ctx)
					end,
					args = function(_, ctx)
						return vp(ctx) and { "fmt", "--stdin-filepath", "$FILENAME" } or { "--stdin-filepath", "$FILENAME" }
					end,
				},
			},
		},
	},
}
