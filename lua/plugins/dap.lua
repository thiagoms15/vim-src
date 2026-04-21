return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<F5>", function() require("dap").continue() end, desc = "DAP: Continue" },
            { "<F10>", function() require("dap").step_over() end, desc = "DAP: Step Over" },
            { "<F11>", function() require("dap").step_into() end, desc = "DAP: Step Into" },
            { "<F12>", function() require("dap").step_out() end, desc = "DAP: Step Out" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end, desc = "DAP: Continue" },
            { "<leader>dr", function() require("dap").repl.open() end, desc = "DAP: REPL" },
        },
        config = function()
            local dap = require("dap")
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-q", "--interpreter=dap" },
            }
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                    args = function()
                        local args = {}
                        local input = vim.fn.input("args> ")
                        if input ~= "" then
                            args = vim.split(input, " ")
                        end
                        return args
                    end,
                },
                {
                    name = "Attach to process",
                    type = "gdb",
                    request = "attach",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    pid = function()
                        local pid = vim.fn.input("PID: ")
                        return tonumber(pid)
                    end,
                    cwd = "${workspaceFolder}",
                },
            }
            dap.configurations.c = dap.configurations.cpp
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "delve",
                },
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                    delve = function(config)
                        table.insert(config.configurations, 1, {
                            args = function() return vim.split(vim.fn.input("args> "), " ") end,
                            type = "delve",
                            name = "file",
                            request = "launch",
                            program = "${file}",
                            outputMode = "remote",
                        })
                        table.insert(config.configurations, 1, {
                            args = function() return vim.split(vim.fn.input("args> "), " ") end,
                            type = "delve",
                            name = "file args",
                            request = "launch",
                            program = "${file}",
                            outputMode = "remote",
                        })
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })
        end,
    },
}
