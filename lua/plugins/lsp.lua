return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Create consistent capabilities with utf-16 encoding
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { "utf-16" }

      -- C / C++ / Objective-C / Objective-C++
      -- On macOS, prefer Apple's clangd from Xcode: it understands the
      -- iOS/macOS SDKs, frameworks and Objective-C best. Fall back to PATH.
      local clangd_bin = "clangd"
      if vim.fn.has("mac") == 1 then
        local xcode_clangd = vim.fn.trim(vim.fn.system({ "xcrun", "--find", "clangd" }))
        if vim.v.shell_error == 0 and vim.fn.executable(xcode_clangd) == 1 then
          clangd_bin = xcode_clangd
        end
      end

      lspconfig.clangd.setup({
        -- No --compile-commands-dir: clangd searches every parent directory
        -- (and its build/ subfolder) for compile_commands.json, so both
        -- CMake projects (./build) and Xcode projects (repo root) work.
        cmd = {
          clangd_bin,
          "--background-index",
          "--header-insertion=never",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".clangd", ".git"),
        capabilities = capabilities,
      })

      -- Treat .h files inside Xcode projects as Objective-C instead of C/C++
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("ObjcHeaderFiletype", { clear = true }),
        pattern = "*.h",
        callback = function(args)
          local in_xcode_project = vim.fs.root(args.buf, function(name)
            return name:match("%.xcodeproj$") ~= nil or name:match("%.xcworkspace$") ~= nil
          end)
          if in_xcode_project then
            vim.bo[args.buf].filetype = "objc"
          end
        end,
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        cmd = { "rust-analyzer" },
        capabilities = capabilities,
      })

      -- Go
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      })

      -- NOTE: jdtls is configured via nvim-jdtls in ftplugin/java.lua,
      -- not via lspconfig, to avoid duplicate clients.

      -- JavaScript / TypeScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        cmd = { "typescript-language-server", "--stdio" },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
            },
          },
        },
      })
    end,
  },
}
