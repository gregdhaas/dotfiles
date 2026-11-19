# LazyVim cheat sheet

Leader is Space. If you can't remember a key, press Space and wait: the which-key popup lists every key that can come next. Press `<leader>sk` to search all keymaps.

## Finding things

| Key | Does |
|---|---|
| `<leader><space>` | Find files in the project |
| `<leader>/` | Search the project's text (ripgrep) |
| `<leader>,` | Switch between open buffers |
| `<leader>fr` | Recent files |
| `<leader>e` | File explorer |
| `<leader>sw` | Search for the word under the cursor |
| `<leader>ss` | Symbols in the current file |
| `<leader>sh` | Help pages |

## Code (LSP)

| Key | Does |
|---|---|
| `gd` / `gr` / `gI` | Go to definition / references / implementation |
| `K` | Hover docs. This is where WordPress and Laravel docs show up. |
| `<leader>ca` | Code actions |
| `<leader>cr` | Rename the symbol everywhere |
| `<leader>cf` | Format now |
| `]d` / `[d` | Next/previous diagnostic |
| `<leader>cd` | Show the diagnostic for the current line |
| `<leader>xx` | List all diagnostics (Trouble) |

## Buffers and windows

| Key | Does |
|---|---|
| `H` / `L` | Previous/next buffer |
| `<leader>bd` | Close the buffer |
| `<leader>bo` | Close every other buffer |
| `<leader>-` / `<leader>\|` | Split the window below / to the right |
| `Ctrl-h/j/k/l` | Move between windows. This also crosses into tmux panes, through the tmux config. |

## Editing

| Key | Does |
|---|---|
| `s` | Flash jump: type 2 characters, then the label shown |
| `gcc` / `gc` | Comment out a line / a selection |
| `Alt-j` / `Alt-k` | Move a line or selection down/up (custom) |
| `;;` / `,,` in insert mode | Add `;` or `,` to the end of the line (custom) |
| `<leader>k` | Clear search highlighting (custom) |
| `<leader>x` | Open the current file in the default app (custom) |

## Tests (Pest)

| Key | Does |
|---|---|
| `<leader>tr` | Run the nearest test |
| `<leader>tt` | Run the current file |
| `<leader>tT` | Run all test files |
| `<leader>tl` | Rerun the last test |
| `<leader>ts` | Summary panel |
| `<leader>to` | Output |

## Git

| Key | Does |
|---|---|
| `]h` / `[h` | Next/previous changed hunk |
| `<leader>ghs` / `<leader>ghr` | Stage / reset a hunk |
| `<leader>ghp` | Preview a hunk |
| `<leader>gb` | Blame for the current line |
| `<leader>gg` | Lazygit. Needs `brew install lazygit`. |

## Toggles (`<leader>u…`)

| Key | Does |
|---|---|
| `<leader>uf` / `<leader>uF` | Turn format-on-save on or off everywhere / for this buffer only. Useful when the 1.5s `vp fmt` delay gets in the way. |
| `<leader>uw` | Line wrap |
| `<leader>us` | Spell check (on by default) |
| `<leader>ul` | Line numbers |

## Sessions

| Key | Does |
|---|---|
| `<leader>qs` | Restore the session for the current folder |
| `<leader>ql` | Restore the last session |

## Maintenance

| Key / command | Does |
|---|---|
| `<leader>l` or `:Lazy` | Plugin manager. Press `S` to sync. |
| `<leader>cm` or `:Mason` | Manage language servers and tools |
| `:LazyExtras` | Turn extras on or off. Saves to `lazyvim.json`, so commit it afterwards. |
| `:checkhealth` | Show what's broken |
| `:LspInfo` | Show which language servers are attached |

## Quirk

`<leader>x` shares a prefix with LazyVim's `<leader>x…` diagnostics keys. When you press it, Neovim waits briefly in case you're typing a longer key.
