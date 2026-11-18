# dotfiles

## Additional install

```bash
# HTML/JS/Blade Formatting
brew install prettierd

# Searching files
brew install fzf
brew install ripgrep
brew install fd

# Laravel LSP (the install script does this when Composer is present)
composer global require laravel/lsp
```

Composer's global bin (`~/.composer/vendor/bin`) must be on `PATH` for Neovim to find `laravel-lsp`.

## Neovim

LazyVim on Neovim 0.12+. AI tools (Claude Code, Antigravity) run in a tmux pane, not inside Neovim.

Everything else (language servers, formatters, linters, Treesitter parsers) installs through Mason and Lazy on first start. Run `:Lazy sync` and `:TSUpdate` after pulling changes.

### What runs where

| Project | Detected by | LSP | Format on save | Lint |
| --- | --- | --- | --- | --- |
| Laravel | `artisan` | Intelephense + Laravel LSP | Pint (if `vendor/bin/pint` exists) | — |
| WordPress / plain PHP | `phpcs.xml` or `.phpcs.xml.dist` | Intelephense (WordPress stubs) | phpcbf | phpcs |
| Vite+ front end (Laravel starter kits) | `vite.config.ts` with `lint:` | vtsls, Svelte, Tailwind, oxlint | `vp fmt` | oxlint |
| Blade | `*.blade.php` | Intelephense + Laravel LSP | prettierd | — |

Notes:

- Laravel LSP completes routes, views, config, `.env`, translations, Inertia pages and Livewire components in PHP and Blade files.
- WooCommerce stubs aren't bundled with Intelephense. Run `composer require --dev php-stubs/woocommerce-stubs` in Woo projects.
- `vp fmt` takes about 1.5s per save. It's used because only the `vp` CLI reads the `fmt` settings in `vite.config.ts`.
- oxfmt doesn't format `.svelte` files yet, so they're left as is (the starter kit's `vp fmt` skips them too).
- Pest tests run through neotest: `<leader>tt` for the file, `<leader>tr` for the nearest test.

## Project config files

### Blade + Prettier

The following files should be placed in the project root.

#### /pint.json

```json
{
    "preset": "psr12"
}
```

#### .prettierrc

```json
{
    "plugins": [
        "prettier-plugin-blade",
        "prettier-plugin-tailwindcss"
    ],
    "overrides": [
        {
            "files": [
                "*.blade.php"
            ],
            "options": {
                "parser": "blade"
            }
        }
    ]
}
```

#### .blade.format.json

```json
{
    "useLaravelPint": true
}
```
