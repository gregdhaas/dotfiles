local phpcs_configs = { "phpcs.xml", ".phpcs.xml", "phpcs.xml.dist", ".phpcs.xml.dist" }

local function has_phpcs_config(dirname)
	return vim.fs.find(phpcs_configs, { path = dirname, upward = true })[1] ~= nil
end

return {
	{
		-- Only lint with phpcs (e.g. WPCS) when the project ships a phpcs config.
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = { php = { "phpcs" } },
			linters = {
				phpcs = {
					condition = function(ctx)
						return has_phpcs_config(ctx.dirname)
					end,
				},
			},
		},
	},
	{
		-- Pint for Laravel projects, phpcbf for projects with a phpcs config.
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = { php = { "pint", "phpcbf" } },
			formatters = {
				pint = {
					condition = function(_, ctx)
						return vim.fs.find("vendor/bin/pint", { path = ctx.dirname, upward = true })[1] ~= nil
					end,
				},
				phpcbf = {
					condition = function(_, ctx)
						return has_phpcs_config(ctx.dirname)
					end,
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Laravel-aware routes, views, config, Inertia, Livewire. Install: composer global require laravel/lsp
				laravel_lsp = { mason = false },
				intelephense = {
					filetypes = { "php", "blade" },
					settings = {
						intelephense = {
							-- Intelephense's default stubs plus WordPress (Woo: composer require --dev php-stubs/woocommerce-stubs).
							stubs = {
								"apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
								"dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd",
								"gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml",
								"mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO",
								"pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix",
								"pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
								"sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg",
								"sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc",
								"xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
								"wordpress",
							},
						},
					},
				},
			},
		},
	},
	{ "mason-org/mason.nvim", opts = { ensure_installed = { "phpcbf" } } },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "blade", "php_only" } },
	},
	{
		-- Pest test runner.
		"nvim-neotest/neotest",
		dependencies = { "V13Axel/neotest-pest" },
		opts = { adapters = { "neotest-pest" } },
	},
}
