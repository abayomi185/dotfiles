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

lvim.colorscheme = "onedark_vivid"
require("onedarkpro").setup {
  -- theme = "onedark",
  colors = {
    -- red = "#e06c75",
    -- purple = "#c678dd"
    fg = "#abb2bf",
    bg = "#282c34",
    black = "#282c34",
    white = "#abb2bf",
    red = "#e06c75",
    orange = "#d19a66",
    purple = "#c678dd",
    gray = "#5c6370",
    blue = "#61afef",
    cyan = "#56b6c2",
    yellow = "#e5c07b",
    green = "#98c379",

    comment = "#7f848e",
    highlight = "#e2be7d",
    selection = "#414858",
    indentline = "#383d48",
    cursorline = "#2d313b",
    color_column = "#2d313b",

    diff_add = "#003e4a",
    diff_delete = "#501b20",
    diff_text = "#005869",

    fg_gutter_inactive = "#abb2bf",
    fg_gutter = "#3d4350",
    bg_statusline = "#22262d",
    float_bg = "#21252b",

    virtual_text_error = "#e8939a",
    virtual_text_warning = "#edd2a1",
    virtual_text_information = "#90c7f4",
    virtual_text_hint = "#7ec7d1",
  },
  styles = {
    functions = "italic",
    keywords = "italic",
    virtual_text = "italic,underline",
  },
  -- options = {
  --   bold = true,
  --   italic = true,
  --   underline = true,
  --   undercurl = true,
  --   cursorline = true,
  -- },
  options = {
    terminal_colors = false
  }
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<M-s>"] = ":w<cr>"
lvim.keys.visual_mode["<leader>d"] = '"_d'
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- nnoremap <silent> <C-z> :ToggleTerminal<Enter>
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm<CR>"
-- Custom workaround for vertical resize on macOS
lvim.keys.normal_mode["<C-M-l>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<C-M-h>"] = ":vertical resize +2<CR>"
-- Copilot mapping
lvim.keys.normal_mode["gp"] = ":Copilot panel<CR>"
-- Telescope mappings
lvim.keys.normal_mode["<leader>ss"] = ":Telescope<CR>"
-- Harpoon
lvim.keys.normal_mode["<leader>mh"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"
lvim.keys.normal_mode["<leader>mj"] = ":lua require('harpoon.mark').add_file()<CR>"
lvim.keys.normal_mode["<leader>mm"] = ":lua require('harpoon.ui').nav_next()"
lvim.keys.normal_mode["<leader>mM"] = ":lua require('harpoon.ui').nav_prev()"
lvim.keys.normal_mode["<leader>1"] = ":lua require('harpoon.ui').nav_file(1)"
lvim.keys.normal_mode["<leader>2"] = ":lua require('harpoon.ui').nav_file(2)"
lvim.keys.normal_mode["<leader>3"] = ":lua require('harpoon.ui').nav_file(3)"
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

lvim.builtin.which_key.mappings["d"] = {
  "delete"
}
lvim.builtin.which_key.mappings["gd"] = {
  "copilot panel"
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

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

lvim.lsp.diagnostics.float.focusable = true

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
  { command = "isort", filetypes = { "python" } },
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
  -- {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "eslint",
  --     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
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
-- }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

-- Additional Plugins
lvim.plugins = {
  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },
  -- Themes
  -- { "folke/tokyonight.nvim" },
  -- { "marko-cerovac/material.nvim" },
  { "olimorris/onedarkpro.nvim" },
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
  { "lunarvim/colorschemes" },

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
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        -- highlight = {
        --   -- ...
        -- },
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          disable = { "html" },
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
          colors = {
            "#689d6a", --green
            "#cc241d", --red
            "#a89984", --grey
            "#b16286", --Magenta
            "#d79921", --yellow
            "#d65d0e", --orange
            "#458588", --cyan
          }, -- table of hex strings
          --   -- termcolors = {
          --   --   "Red",
          --   --   "Green",
          --   -- } -- table of colour name strings
        }
      }
    end
  },
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
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    -- commit = "e29fb47326093fb197f17eae5ac689979a9ce191",
    config = function()
      -- local lsp_installer_servers = require "nvim-lsp-installer.servers"
      -- local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
      -- require("nvim-lsp-installer").setup {} -- Potentially reemove this, does not seem to work
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
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          -- cmd_env = requested_server._default_options.cmd_env,
          -- on_attach = require("lvim.lsp").common_on_attach, -- old implementation
          on_init = require("lvim.lsp").common_on_init,
          on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            local rt = require "rust-tools"
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
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
  { "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" }
  },
  -- Copilot section
  { "github/copilot.vim" },
  { "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        }
        -- require("copilot.suggestion").toggle_auto_trigger()
      end, 100)
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
  { 'fgheng/winbar.nvim',
    config = function()
      require('winbar').setup {
        enabled = true,
      }
    end
  },
  { 'caenrique/nvim-toggle-terminal' },
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
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup()
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
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
  { "ThePrimeagen/harpoon",
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("telescope").load_extension('harpoon')
      require("harpoon").setup()
    end
  }
}

-- More Copilot required options
vim.g.copilot_no_tab_map = true
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

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
