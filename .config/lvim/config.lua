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
-- lvim.log.level = "debug"
lvim.format_on_save = true
-- lvim.colorscheme = "one"
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "onedarkpro"
-- Theme options
require("onedarkpro").setup {
  theme = "onedark",
  -- colors = {
  --   red = "#d1d1d1"
  -- },
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
}

-- Rainbow colors for parenthesis - nvim-ts-rainbow
-- local rainbow = { "#FFFFFF", "#CCCC88", "#88CC88", "#88CCCC", "#8888CC", "#CC88CC" }
-- require "nvim-treesitter.configs".setup {
--   enable = true,
--   rainbow = { colors = rainbow }
-- }
-- for i, c in ipairs(rainbow) do -- p00f/rainbow#81
--   vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
-- end

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<M-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>d"] = '"_d'

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

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

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
lvim.builtin.which_key.mappings["d"] = {
  "delete"
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
-- lvim.builtin.nvimtree.show_icons.git = 0

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
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.telescope.on_config_done = function(telescope)
  -- any other extensions loading
  pcall(telescope.load_extension, "ui-select")
end

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
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

-- set a formatter, this will override the language server formatting capabilities (if it exists)
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
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
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
    "lukas-reineke/indent-blankline.nvim",
  },
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
            parameter_hints_prefix = "???  ",
            other_hints_prefix = "???  ",
          },
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          -- cmd_env = requested_server._default_options.cmd_env,
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
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
  -- Copilot section
  { "github/copilot.vim" },
  { "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
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
}

-- More Copilot required options
vim.g.copilot_no_tab_map = true
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
