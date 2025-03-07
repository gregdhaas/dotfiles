# dotfiles

## Additional install

```bash
# HTML/JS/Blade Formatting
brew install prettierd

# Searching files
brew install fzf
brew install ripgrep
brew install fd
```

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
