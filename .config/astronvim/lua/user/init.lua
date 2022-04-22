local config = {

	-- Set colorscheme
	colorscheme = "default_theme",

	-- Default theme configuration
	default_theme = {
		diagnostics_style = { italic = true },
		-- Modify the color table
		colors = {
			fg = "#abb2bf",
		},
		-- Modify the highlight groups
		highlights = function(highlights)
			local C = require("default_theme.colors")

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
	},

	-- Disable default plugins
	enabled = {
		bufferline = true,
		neo_tree = true,
		lualine = true,
		gitsigns = true,
		colorizer = true,
		toggle_term = true,
		comment = true,
		symbols_outline = true,
		indent_blankline = true,
		dashboard = true,
		which_key = true,
		neoscroll = true,
		ts_rainbow = true,
		ts_autotag = true,
	},

	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Configure plugins
	plugins = {
		-- Add plugins, the packer syntax without the "use"
		init = {
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			-- Conquer of Completion
			-- {'neoclide/coc.nvim', branch = 'release'},
			-- GiHub Copilot
			-- {'github/copilot.vim', branch = 'release'},
			-- DAP:
			-- { "mfussenegger/nvim-dap" },
			-- Rust support
			-- {
			--   'simrat39/rust-tools.nvim',
			--   -- requires = {"nvim-lspconfig"}
			--   -- Is configured via the server_registration_override installed below!
			-- },
			{
				"simrat39/rust-tools.nvim",
				requires = { "nvim-lspconfig", "nvim-lsp-installer", "Comment.nvim", "plenary.nvim" },
			},
			{ "folke/trouble.nvim" },
			{
				"f-person/git-blame.nvim",
				event = "BufRead",
				config = function()
					vim.cmd("highlight default link gitblame SpecialComment")
					vim.g.gitblame_enabled = 0
				end,
			},
			{
				"pwntester/octo.nvim",
				event = "BufRead",
			},
			{
				"iamcco/markdown-preview.nvim",
				run = "cd app && yarn install",
				ft = "markdown",
				config = function()
					vim.g.mkdp_auto_start = 1
				end,
			},
			{
				"ethanholz/nvim-lastplace",
				event = "BufRead",
				config = function()
					require("nvim-lastplace").setup({
						lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
						lastplace_ignore_filetype = {
							"gitcommit",
							"gitrebase",
							"svn",
							"hgcommit",
						},
						lastplace_open_folds = true,
					})
				end,
			},
			{
				"folke/todo-comments.nvim",
				event = "BufRead",
				config = function()
					require("todo-comments").setup()
				end,
			},
			-- {'JoosepAlviste/nvim-ts-context-commentstring'},
			-- {
			--   'zbirenbaum/copilot.lua',
			--   event = {"VimEnter"},
			--   config = function()
			--     vim.defer_fn(function()
			--       require("copilot").setup {
			--         ft_disable = {"rust"}
			--       }
			--     end, 100)
			--   end,
			-- },
			-- {"zbirenbaum/copilot-cmp", after = { "copilot.lua", "nvim-cmp" }}
		},
		-- All other entries override the setup() call for default plugins
		treesitter = {
			ensure_installed = { "lua" },
			autotag = {
				enable = true,
			},
		},
		packer = {
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},

		-- cmp = function(opts)
		--   -- opts parameter is the default options table
		--   -- the function is lazy loaded so cmp is able to be required
		--   local cmp = require "cmp"
		--   local luasnip = require "luasnip"
		--
		--   opts.mapping['<Tab>'] = cmp.mapping(function(fallback)
		--     if cmp.visible() then
		--       cmp.select_next_item()
		--     elseif require('luasnip').expand_or_jumpable() then
		--       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
		--     elseif vim.b._copilot_suggestion ~= nil then
		--       vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
		--     else
		--       fallback()
		--     end
		--   end, {
		--     'i',
		--     's',
		--   })
		--
		--   opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
		--   if cmp.visible() then
		--       cmp.select_prev_item()
		--     elseif luasnip.jumpable(-1) then
		--       luasnip.jump(-1)
		--     else
		--       fallback()
		--     end
		--   end, {
		--     "i",
		--     "s",
		--   })
		--
		-- end
	},

	-- Add paths for including more VS Code style snippets in luasnip
	luasnip = {
		vscode_snippet_paths = {},
	},

	-- Modify which-key registration
	["which-key"] = {
		-- Add bindings to the normal mode <leader> mappings
		register_n_leader = {
			-- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			copilot = 1000,
			nvim_lsp = 900,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Extend LSP configuration
	lsp = {
		-- add to the server on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the lsp installer server-registration function
		server_registration = function(server, opts)
			-- Special code for rust.tools.nvim!
			if server.name == "rust_analyzer" then
				require("rust-tools").setup({
					-- server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
					-- server = { cmd = server._default_options.cmd },
					server = server._default_options.cmd,
					tools = {
						inlay_hints = {
							parameter_hints_prefix = "  ",
							other_hints_prefix = "  ",
						},
					},
				})
				server:attach_buffers()
				return
			end
			server:setup(opts)
		end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = {
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- null-ls configuration
	["null-ls"] = function()
		-- Formatting and linting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim
		local status_ok, null_ls = pcall(require, "null-ls")
		if not status_ok then
			return
		end

		-- Check supported formatters
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting

		-- Check supported linters
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			debug = false,
			sources = {
				-- Set a formatter
				formatting.rufo,

				-- custom formatters
				formatting.prettierd,
				formatting.rustfmt,
				formatting.stylua,

				-- Set a linter
				diagnostics.rubocop,
			},
			-- NOTE: You can remove this on attach function to disable format on save
			on_attach = function(client)
				if client.resolved_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.formatting_sync,
					})
				end
			end,
		})
	end,

	-- This function is run last
	-- good place to configure mappings and vim options
	polish = function()
		local map = vim.keymap.set
		local set = vim.opt
		-- Set options
		set.relativenumber = true

		-- Set key bindings
		map("n", "<C-s>", ":w!<CR>")

		-- Move line
		map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
		map("v", "<A-Up>", ":m '>-2<CR>gv=gv")
		map("v", "<S-j>", ":m '>+1<CR>gv=gv")
		map("v", "<S-k>", ":m '>-2<CR>gv=gv")

		-- Resize windows
		map("n", "<A-Up>", function()
			require("smart-splits").resize_up()
		end)
		map("n", "<A-Down>", function()
			require("smart-splits").resize_down()
		end)
		map("n", "<A-Left>", function()
			require("smart-splits").resize_left()
		end)
		map("n", "<A-Right>", function()
			require("smart-splits").resize_right()
		end)

		-- Copilot accept suggestion
		-- vim.g.copilot_no_tab_map = true
		-- vim.g.copilot_assume_mapped = true
		-- map("i", "<C-j>", function()
		--   vim.fn['copilot#Accept']()
		-- end)
		-- map("i", "<C-J", "copilot#Accept('<CR>')", {expr=true, silent=true})

		-- Change Neotree toggle location
		-- map("n", "<leader>e", "<cmd>Neotree toggle right<CR>")

		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", {})
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})
	end,
}

return config
