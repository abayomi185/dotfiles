--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "tokyonight"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

lvim.colorscheme = "onedark"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["<M-s>"] = ":w<CR>"
lvim.keys.visual_mode["<leader>d"] = '"_d'
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>v"] = "<C-v>"
-- nnoremap <silent> <C-z> :ToggleTerminal<Enter>
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm<CR>"
-- NOTE: Telescope mappings
lvim.keys.normal_mode["<leader>sg"] = ":Telescope grep_string<CR>"
-- NOTE: Custom workaround for vertical resize on macOS
lvim.keys.normal_mode["<C-M-l>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<C-M-h>"] = ":vertical resize +2<CR>"
-- NOTE: Copilot mapping
lvim.keys.normal_mode["gp"] = ":Copilot panel<CR>"
-- NOTE: Telescope mappings
lvim.keys.normal_mode["<leader>ss"] = ":Telescope<CR>"
-- NOTE: LSP mappings
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" }
-- NOTE: Harpoon
lvim.builtin.which_key.mappings["m"] = {
  name = "Harpoon",
  m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Quick Menu" },
  t = { "<cmd>lua require('harpoon.ui').toggle_file()<CR>", "Toggle File" },
  l = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Navigate next" },
  h = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Navigate previous" }
}
lvim.builtin.which_key.mappings["1"] = {
  "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon 1"
}
lvim.builtin.which_key.mappings["2"] = {
  "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon 2"
}
lvim.builtin.which_key.mappings["3"] = {
  "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon 3"
}
lvim.builtin.which_key.mappings["4"] = {
  "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon 4"
}
lvim.builtin.which_key.mappings["5"] = {
  "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Harpoon 5"
}
-- NOTE: Neotree
lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<CR>", "Neotree" }
-- NOTE: Terminal
-- lvim.keys.term_mode[]
lvim.keys.term_mode["<leader><esc>"] = "<C-\\><C-n>"
lvim.keys.term_mode["<C-space>"] = "<C-\\><C-n>"
-- NOTE: Spell Check
lvim.keys.normal_mode["zt"] = ":set spell!<CR>"
-- NOTE: Live Grep
lvim.builtin.which_key.mappings["st"] = {
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "text-with-args"
}
-- NOTE: Rust
lvim.builtin.which_key.mappings["r"] = {
  name = "Rust",
  j = { "<cmd>lua require('rust-tools').join_lines.join_lines()<CR>", "Join Lines" },
  r = { "<cmd>RustRunnables<Cr>", "Runnables" },
  t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
  m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
  c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
  p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
  d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
  v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
  R = {
    "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
    "Reload Workspace",
  },
}
lvim.builtin.which_key.mappings["R"] = {
  name = "Crates",
  o = { "<cmd>lua require('crates').show_popup()<CR>", "Show popup" },
  r = { "<cmd>lua require('crates').reload()<CR>", "Reload" },
  v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" },
  f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Show Features" },
  d = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies Popup" },
  u = { "<cmd>lua require('crates').update_crate()<CR>", "Update Crate" },
  a = { "<cmd>lua require('crates').update_all_crates()<CR>", "Update All Crates" },
  U = { "<cmd>lua require('crates').upgrade_crate<CR>", "Upgrade Crate" },
  A = { "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", "Upgrade All Crates" },
  H = { "<cmd>lua require('crates').open_homepage()<CR>", "Open Homepage" },
  R = { "<cmd>lua require('crates').open_repository()<CR>", "Open Repository" },
  D = { "<cmd>lua require('crates').open_documentation()<CR>", "Open Documentation" },
  C = { "<cmd>lua require('crates').open_crates_io()<CR>", "Open Crate.io" },
}

-- lvim.builtin.which_key.mappings["ds"] = {
--   "<cmd>lua if vim.bo.filetype == 'rust' then vim.cmd[[RustDebuggables]] else require'dap'.continue() end<CR>",
--   "Start",
-- }

-- lvim.keys.normal_mode["<C-t>"] = ":ToggleTabTerminal<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- NOTE: Macros
-- 'quote' a word
vim.api.nvim_set_keymap('n', 'qw', ":silent! normal mpea'<Esc>bi'<Esc>`pl<CR>", { noremap = true })
-- Double "quote" a word
vim.api.nvim_set_keymap('n', 'qd', ':silent! normal mpea"<Esc>bi"<Esc>`pl<CR>', { noremap = true })
-- Remove quotes from a word
vim.api.nvim_set_keymap('n', 'wq', ':silent! normal mpeld bhd `ph<CR>', { noremap = true })

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- lvim.builtin.which_key.mappings["d"] = {
--     "delete"
-- }
-- lvim.builtin.which_key.mappings["gd"] = {
--     "copilot panel"
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
-- lvim.builtin.nvimtree.setup.view.side = "right"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.cmp.cmdline.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "svelte",
  "java",
  "yaml",
}

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  -- "%.lock",
  "node_modules/",
  "node_modules/*",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- NOTE: Monorepo workaroud
-- Default patterns:
-- patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" }
-- lvim.builtin.project.active = false
lvim.builtin.project.patterns = { ".git" }
lvim.builtin.project.manual_mode = true

-- CodeLLDB paths
local codelldb_path = vim.fn.stdpath('data') .. "/mason/packages/codelldb/extension/adapter/codelldb"
local liblldb_path = vim.fn.stdpath('data') .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib"

lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
  dap.configurations.rust = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- Seems to be deprecated - @me
-- lvim.lsp.diagnostics.float.focusable = true

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" }, extra_args = { "--profile", "black" } },
  { command = "taplo", filetypes = { "toml" } },
  --   {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "prettier",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--print-with", "100" },
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettierd",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte", "json", "jsonc" }
  },
  -- { command = "fixjson", filetypes = { "json" } }
  -- eslint_d as a formatter
  -- {
  --   command = "eslint_d",
  --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
  -- }
  -- {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "eslint",
  --     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "jsonls", filetypes = { "json" } }
  -- { command = "eslint", filetypes = { "typescript", "typescriptreact" } },
  -- {
  --   command = "eslint_d",
  --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
  -- },
  -- {
  --   command = "flake8",
  --   filetypes = { "python" },
  --   extra_args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-", "--count", "--max-line-length",
  --     "115", "--exclude=snapshots" },
  -- },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

-- Additional Plugins
lvim.plugins = {
  -- Themes
  -- { "folke/tokyonight.nvim" },
  -- { "marko-cerovac/material.nvim" },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        colors = {
          cursorline = "#22252b"
        },
        options = {
          cursorline = true
        }
      }
    end
  },
  -- { "navarasu/onedark.nvim",
  --   config = function()
  --     require('onedark').setup {
  --       style = "dark",
  --       toggle_style_list = {
  --         'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  --       },
  --       -- plugins = {
  --       --   nvim_ts_rainbow = false
  --       -- }
  --       -- colors = {
  --       --   purple = "#bd86ce",
  --       -- }
  --     }
  --   end
  -- },
  -- { "rakr/vim-one",
  -- config = function()
  --   require("vim-one").setup {
  --     -- one#highlight(group, fg, bg, attribute)
  --   }
  -- end
  -- },
  -- {
  --   "catppuccin/nvim",
  --   as = "catppuccin"
  -- },
  -- { "EdenEast/nightfox.nvim" },
  -- { "projekt0n/github-nvim-theme" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "lourenci/github-colors" },
  -- { "Th3Whit3Wolf/one-nvim" },
  -- { "lunarvim/colorschemes" }, -- This causes onedarkpro to fail

  -- Discord presence
  {
    'andweeb/presence.nvim',
    config = function()
      require("presence"):setup {
        main_image = "file",
      }
    end
  },

  -- Other
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  -- {
  --   "p00f/nvim-ts-rainbow",
  --   config = function()
  --     require("nvim-treesitter.configs").setup {
  --       -- highlight = {
  --       --   -- ...
  --       -- },
  --       rainbow = {
  --         enable = true,
  --         -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  --         disable = { "html" },
  --         extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --         -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --         colors = {
  --           "#689d6a", --green
  --           "#cc241d", --red
  --           "#a89984", --grey
  --           "#b16286", --Magenta
  --           "#d79921", --yellow
  --           "#d65d0e", --orange
  --           "#458588", --cyan
  --         },           -- table of hex strings
  --         --   -- termcolors = {
  --         --   --   "Red",
  --         --   --   "Green",
  --         --   -- } -- table of colour name strings
  --       }
  --     }
  --   end
  -- },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     local rainbow_delimiters = require("rainbow-delimiters")
  --     vim.g.rainbow_delimiters = {
  --       strategy = {
  --         [""] = rainbow_delimiters.strategy["global"],
  --         html = rainbow_delimiters.strategy["local"],
  --         vim = rainbow_delimiters.strategy["local"],
  --         tsx = rainbow_delimiters.strategy["global"],
  --         -- javascript = rainbow_delimiters.strategy["local"],
  --         -- typescript = rainbow_delimiters.strategy["local"]
  --       },
  --       query = {
  --         [""] = "rainbow-delimiters",
  --         -- lua = "rainbow-blocks",
  --         tsx = 'rainbow-delimiters-react',
  --         -- javascript = 'rainbow-delimiters-react',
  --         -- typescript = 'rainbow-delimiters-react'
  --       },
  --       highlight = {
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterOrange',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterCyan',
  --         'RainbowDelimiterViolet',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterRed',
  --       },
  --     }
  --   end,
  -- },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- This is included in Lvim now
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  -- },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        tools = {
          inlay_hints = {
            parameter_hints_prefix = "  ",
            other_hints_prefix = "  ",
          },
          autoSetHints = true,
          -- hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
          -- deprecated
          -- hover_actions = {
          --   auto_focus = true,
          -- },
        },
        server = {
          -- cmd_env = requested_server._default_options.cmd_env,
          -- on_attach = require("lvim.lsp").common_on_attach, -- old implementation
          on_init = require("lvim.lsp").common_on_init,
          on_attach = require("lvim.lsp").common_on_attach,
          -- Seems to be a manual way below
          -- on_attach = function(client, bufnr)
          --   require("lvim.lsp").common_on_attach(client, bufnr)
          --   local rt = require "rust-tools"
          --   -- Hover actions
          --   vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          --   -- Code action groups
          --   vim.keymap.set("n", "<leader>la", rt.code_action_group.code_action_group, { buffer = bufnr })
          -- end,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                enable = true,
                command = "clippy",
              },
            }
          },
        },
        dap = {
          adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
        }
      })
    end,
    ft = { "rust", "rs" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    end
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   config = function()
  --     require("telescope").load_extension("live_grep_args")
  --   end
  -- },
  -- { "rcarriga/nvim-dap-ui",
  --   requires = { "mfussenegger/nvim-dap" }
  -- },
  -- Copilot section
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
  --       }
  --       -- require("copilot.suggestion").toggle_auto_trigger()
  --     end, 100)
  --   end,
  --   }
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "InsertEnter" },
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end
  },
  -- End of Copilot section
  -- Start of tabnine section
  -- {
  --   "tzachar/cmp-tabnine",
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  -- }
  -- End of tabnine section
  {
    'fgheng/winbar.nvim',
    config = function()
      require('winbar').setup {
        enabled = true,
      }
    end
  },
  { 'caenrique/nvim-toggle-terminal' },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        source_selector = {
          winbar = true,
        },
        window = {
          position = "right",
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },
  -- {
  --   "SmiteshP/nvim-navic",
  --   requires = "neovim/nvim-lspconfig"
  -- },
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {
          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  -- {
  --   'wfxr/minimap.vim',
  --   run = "cargo install --locked code-minimap",
  --   cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  --   config = function()
  --     vim.cmd("let g:minimap_width = 10")
  --     vim.cmd("let g:minimap_auto_start = 1")
  --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
  --   end
  -- },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
  },
  -- {
  --   'xbase-lab/xbase',
  --   run = 'make install', -- make free_space (not recommended, longer build time)
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "neovim/nvim-lspconfig"
  --   },
  --   config = function()
  --     require 'xbase'.setup({}) -- see default configuration bellow
  --   end
  -- }
  { "nvim-treesitter/playground" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("telescope").load_extension('harpoon')
      require("harpoon").setup()
    end
  },
  {
    "hrsh7th/cmp-cmdline",
  }
}


-- More Copilot required options
-- vim.g.copilot_no_tab_map = true
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
