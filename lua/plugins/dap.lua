return {

    -- Main DAP plugin
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go", "rcarriga/nvim-dap-ui", -- "theHamsta/nvim-dap-virtual-text", 
            "nvim-neotest/nvim-nio"
        },
        config = function()
            local dap = require "dap"
            local ui = require "dapui"

            require("dapui").setup()
            require("dap-go").setup()

            -- require("nvim-dap-virtual-text").setup {
            --     -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
            --     display_callback = function(variable)
            --         local name = string.lower(variable.name)
            --         local value = string.lower(variable.value)
            --         if name:match "secret" or name:match "api" or
            --             value:match "secret" or value:match "api" then
            --             return "*****"
            --         end
            --
            --         if #variable.value > 15 then
            --             return " " .. string.sub(variable.value, 1, 15) ..
            --                        "... "
            --         end
            --
            --         return " " .. variable.value
            --     end
            -- }

            -- Additional manual GDB configuration (if you prefer pure GDB alongside mason configs)
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = {"-i", "dap"}
            }

            -- Manual GDB configurations (will be added to existing mason configurations)
            local gdb_configs = {
                {
                    name = "Launch (Pure GDB)",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ',
                                            vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false
                }, {
                    name = "Attach to process (Pure GDB)",
                    type = "gdb",
                    request = "attach",
                    program = function()
                        return vim.fn.input('Path to executable: ',
                                            vim.fn.getcwd() .. '/', 'file')
                    end,
                    pid = function()
                        local name = vim.fn.input('Executable name (filter): ')
                        return
                            require("dap.utils").pick_process({filter = name})
                    end,
                    cwd = '${workspaceFolder}'
                }
            }

            -- Add manual GDB configs to existing mason configurations for C++
            vim.defer_fn(function()
                if dap.configurations.cpp then
                    vim.list_extend(dap.configurations.cpp, gdb_configs)
                else
                    dap.configurations.cpp = gdb_configs
                end

                -- Ensure C uses the same configurations
                dap.configurations.c = dap.configurations.cpp
            end, 100) -- Small delay to ensure mason configs are loaded first

            -- Elixir configuration (preserved from your original)
            local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
            if elixir_ls_debugger ~= "" then
                dap.adapters.mix_task = {
                    type = "executable",
                    command = elixir_ls_debugger
                }

                dap.configurations.elixir = {
                    {
                        type = "mix_task",
                        name = "phoenix server",
                        task = "phx.server",
                        request = "launch",
                        projectDir = "${workspaceFolder}",
                        exitAfterTaskReturns = false,
                        debugAutoInterpretAllModules = false
                    }
                }
            end

            -- DAP signs
            vim.fn.sign_define('DapBreakpoint', {
                text = '🔴',
                texthl = 'DapBreakpoint',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapBreakpointCondition', {
                text = '🟡',
                texthl = 'DapBreakpointCondition',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapLogPoint', {
                text = '💬',
                texthl = 'DapLogPoint',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapStopped', {
                text = '▶',
                texthl = 'DapStopped',
                linehl = 'DapStoppedLine',
                numhl = ''
            })
            vim.fn.sign_define('DapBreakpointRejected', {
                text = '❌',
                texthl = 'DapBreakpointRejected',
                linehl = '',
                numhl = ''
            })
            -- Eval var under cursor
            vim.keymap.set("n", "<space>i", function()
                require("dapui").eval(nil, {enter = true})
            end)

            -- Visual Studio compatible debug keymaps
            vim.keymap.set("n", "<F5>", dap.continue,
                           {desc = "Debug: Start/Continue"})
            vim.keymap.set("n", "<S-F5>", dap.terminate, {desc = "Debug: Stop"}) -- Shift+F5
            vim.keymap.set("n", "<C-S-F5>", dap.restart,
                           {desc = "Debug: Restart"}) -- Ctrl+Shift+F5
            vim.keymap.set("n", "<F9>", dap.toggle_breakpoint,
                           {desc = "Debug: Toggle Breakpoint"})
            vim.keymap.set("n", "<F10>", dap.step_over,
                           {desc = "Debug: Step Over"})
            vim.keymap.set("n", "<F11>", dap.step_into,
                           {desc = "Debug: Step Into"})
            vim.keymap.set("n", "<S-F11>", dap.step_out,
                           {desc = "Debug: Step Out"}) -- Shift+F11

            -- Additional useful VS-style keymaps
            vim.keymap.set("n", "<C-F10>", dap.run_to_cursor,
                           {desc = "Debug: Run to Cursor"}) -- Ctrl+F10
            vim.keymap.set("n", "<C-F9>", function()
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end, {desc = "Debug: Conditional Breakpoint"}) -- Ctrl+F9

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end
    }
}
