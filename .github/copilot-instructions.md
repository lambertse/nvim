# Copilot Instructions

This repository is a personal Neovim configuration built on top of **LazyVim** (which itself uses **lazy.nvim** as the plugin manager). It is not an application — every change here is config code that Neovim loads at startup.

## Entry point and load order

- `init.lua` does only `require("config.lazy")`.
- `lua/config/lazy.lua` bootstraps `lazy.nvim`, then loads two plugin specs:
  1. `LazyVim/LazyVim` with `import = "lazyvim.plugins"` (provides the LazyVim baseline).
  2. `{ import = "plugins" }` — every file in `lua/plugins/` is auto-imported as a plugin spec.
- `lua/config/{options,keymaps,autocmds}.lua` are loaded by LazyVim conventions (do not `require` them manually from `init.lua`).
- `defaults.lazy = false` and `version = false` in `lazy.lua`: custom plugins under `lua/plugins/` load eagerly at startup and always track the latest git commit. Keep this in mind when adding heavy plugins.
- `lazyvim.json` controls LazyVim "extras" (e.g. `lazyvim.plugins.extras.ui.dashboard-nvim`); add extras there rather than re-implementing them as custom plugin specs.
- `lazy-lock.json` is git-ignored (see `.gitignore`); do not commit it.

## Adding / modifying plugins

- Each file in `lua/plugins/` returns either a single spec table or a list of spec tables, in the lazy.nvim format. Follow the existing one-plugin-per-file convention (e.g. `telescope.lua`, `lsp.lua`, `conform.lua`).
- To override a LazyVim default plugin, return a spec with the same plugin name and your `opts`/`config` — lazy.nvim merges it with the LazyVim baseline.
- Filetype-specific setup goes in `ftplugin/<filetype>.lua` (e.g. `ftplugin/java.lua` for jdtls). Do not put filetype-only logic in `lua/plugins/`.

## LSP, formatting, linting

- LSP servers are configured manually via `nvim-lspconfig` in `lua/plugins/lsp.lua` (clangd, rust_analyzer, gopls, jdtls, ts_ls). When adding a server, set `capabilities` from `vim.lsp.protocol.make_client_capabilities()` with `offsetEncoding = { "utf-16" }` to match the existing convention (clangd requires this for consistency).
- `clangd` is configured with `--compile-commands-dir=./build` — projects are expected to emit `compile_commands.json` into `./build`.
- Formatting is via `conform.nvim` (`lua/plugins/conform.lua`). `clang-format` uses `-style=Google`. Add new filetypes to `formatters_by_ft` there, not via autocmds.
- `vim.g.autoformat = false` is set in `options.lua` — format-on-save is intentionally disabled. The `<leader>cF` mapping (→ `:ConformFormat`) is the manual entry point.
- Mason / linting / DAP each have their own file in `lua/plugins/`; keep concerns separated.

## Style and tooling

- Lua is formatted by **StyLua** using `stylua.toml` (2-space indent, 120-column width). All Lua under the repo root must pass `stylua --check .`.
- A pre-commit hook lives at `.githooks/pre-commit` and runs `stylua .` then `git add .`. Enable it locally with `git config core.hooksPath .githooks`. Run `stylua .` before committing if the hook is not active.
- `lua_ls` is enabled via `.neoconf.json` with `neodev` library support — type annotations for the Neovim API are available; prefer the LazyVim `Util` helpers (already used in `keymaps.lua`) over reimplementing.

## Keymap conventions (`lua/config/keymaps.lua`)

- Leader-prefixed groups: `<leader>cc*` = Copilot/CopilotChat, `<leader>b*` = buffers, `<leader>f*` (and `<space>f*`) = telescope, `<leader>z*` = LSP navigation. Match these prefixes when adding mappings.
- Delete operations (`d`, `D`, `dw`, `<C-x>`) are remapped to the black-hole register `"_` to preserve the unnamed register; cut-to-clipboard uses `"+`. Do not "fix" these as bugs.
- `jj` in insert/terminal mode is the escape sequence.
- Custom user command `:W` performs a sudo-write.

## Repository layout notes

- `test/` contains tiny sample files (`test.go`, `test.java`, `cpp/`) used to manually exercise LSP/formatter setup — they are not an automated test suite. There is no `npm test` / `go test` / CI to run.
- `nvim/`, `ghostty/`, `github-copilot/`, `assets/` are auxiliary (nested neoconf, terminal config, screenshots). Avoid touching them for Neovim-config changes unless explicitly asked.
- `build/`, `**/build/`, `**/.cache/` are git-ignored.
