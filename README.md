## Configuration Files
- `.neoconf.json` - Neoconf configuration
- `stylua.toml` - Lua formatter configuration  
- `init.lua` - Main Neovim initialization file
- `lazy-lock.json` - Lazy.nvim plugin lockfile
- `lazyvim.json` - LazyVim configuration
- `.gitignore` - Git ignore rules

## Documentation
- `README.md` - Project documentation
- `LICENSE` - License file

## Core Configuration (`lua/config/`)
- `lazy.lua` - Plugin manager setup
- `options.lua` - Neovim options
- `keymaps.lua` - Key mappings
- `autocmds.lua` - Auto commands

## Plugin Configurations (`lua/plugins/`)
- `lsp.lua` - Language Server Protocol setup
- `treesitter.lua` - Syntax highlighting and parsing
- `telescope.lua` - Fuzzy finder
- `dap.lua` - Debug Adapter Protocol
- `conform.lua` - Code formatting
- `gitsigns.lua` - Git integration
- `copilot.lua` - GitHub Copilot
- `cchat.lua` - Copilot Chat
- `colorscheme.lua` - Color themes
- `mini-diff.lua` - Diff visualization
- `cmake-tools.lua` - CMake integration
- `comment.lua` - Comment utilities
- `render-markdown.lua` - Markdown rendering
- `hlslens.lua` - Search highlighting
- `scrollbar.lua` - Scrollbar enhancements
- `dash-board.lua` - Dashboard/start screen

## Test Files
- `test/test.go` - Go test file

## Nested Configuration
- `nvim/.neoconf.json` - Additional neoconf config
