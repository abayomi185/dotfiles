-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- NOTE: Normal Mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<M-s>"] = { ":w<cr>", desc = "Save File" }, -- change description but the same command
    -- Terminal
    ["<C-t>"] = { ":ToggleTerm<cr>", desc = "ToggleTerm" },

    -- ["<C-s>"] = ":w<CR>",
    -- ["<M-s>"] = ":w<CR>",

    ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc =
    "Next buffer" },
    ["<S-h>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc =
    "Previous buffer" },

    ["<leader>v"] = { "<C-v>", desc = "Visual Block" },

    -- NOTE: Telescope mappings
    -- ["<leader>sg"] = ":Telescope grep_string<CR>",

    -- NOTE: Custom workaround for vertical resize on macOS
    ["<C-M-l>"] = ":vertical resize -2<CR>",
    ["<C-M-h>"] = ":vertical resize +2<CR>",

    -- NOTE: Copilot mapping
    ["gp"] = ":Copilot panel<CR>",

    -- NOTE: Telescope mappings
    -- ["<leader>ss"] = ":Telescope<CR>",

    -- NOTE: LSP mappings
    ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show hover" },

    -- NOTE: Spell Check
    -- ["zt"] = ":set spell!<CR>"

    -- NOTE: Harpoon
    ["<leader>m"] = { name = "Harpoon" },
    ["<leader>mm"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Quick Menu" },
    ["<leader>mt"] = { "<cmd>lua require('harpoon.ui').toggle_file()<CR>", desc = "Toggle File" },
    ["<leader>ml"] = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Navigate next" },
    ["<leader>mh"] = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Navigate previous" },

    ["<leader>1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon 1" },
    ["<leader>2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon 2" },
    ["<leader>3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon 3" },
    ["<leader>4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon 4" },
    -- ["<leader>5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", desc = "Harpoon 5" },

    -- NOTE: Neotree - built into Astro
    -- ["<leader>e"] = { "<cmd>Neotree toggle<CR>", desc = "Neotree" }

    -- NOTE: Live Grep
    -- lvim.builtin.which_key.mappings["st"] = {
    --   "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "text-with-args"
    -- }

    -- NOTE: Rust
    ["<leader>r"] = { name = "Rust" },
    ["<leader>rj"] = { "<cmd>RustRunnables<Cr>", desc = "Runnables" },
    ["<leader>rt"] = { "<cmd>lua _CARGO_TEST()<cr>", desc = "Cargo Test" },
    ["<leader>rm"] = { "<cmd>RustExpandMacro<Cr>", desc = "Expand Macro" },
    ["<leader>rc"] = { "<cmd>RustOpenCargo<Cr>", desc = "Open Cargo" },
    ["<leader>rp"] = { "<cmd>RustParentModule<Cr>", desc = "Parent Module" },
    ["<leader>rd"] = { "<cmd>RustDebuggables<Cr>", desc = "Debuggables" },
    ["<leader>rv"] = { "<cmd>RustViewCrateGraph<Cr>", desc = "View Crate Graph" },
    ["<leader>rR"] = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      desc = "Reload Workspace",
    },

    -- NOTE: Crates
    ["<leader>R"] = { name = "Crates" },
    ["<leader>Ro"] = { "<cmd>lua require('crates').show_popup()<CR>", desc = "Show popup" },
    ["<leader>Rr"] = { "<cmd>lua require('crates').reload()<CR>", desc = "Reload" },
    ["<leader>Rv"] = { "<cmd>lua require('crates').show_versions_popup()<CR>", desc = "Show Versions" },
    ["<leader>Rf"] = { "<cmd>lua require('crates').show_features_popup()<CR>", desc = "Show Features" },
    ["<leader>Rd"] = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", desc = "Show Dependencies Popup" },
    ["<leader>Ru"] = { "<cmd>lua require('crates').update_crate()<CR>", desc = "Update Crate" },
    ["<leader>Ra"] = { "<cmd>lua require('crates').update_all_crates()<CR>", desc = "Update All Crates" },
    ["<leader>RU"] = { "<cmd>lua require('crates').upgrade_crate<CR>", desc = "Upgrade Crate" },
    ["<leader>RA"] = { "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", desc = "Upgrade All Crates" },
    ["<leader>RH"] = { "<cmd>lua require('crates').open_homepage()<CR>", desc = "Open Homepage" },
    ["<leader>RR"] = { "<cmd>lua require('crates').open_repository()<CR>", desc = "Open Repository" },
    ["<leader>RD"] = { "<cmd>lua require('crates').open_documentation()<CR>", desc = "Open Documentation" },
    ["<leader>RC"] = { "<cmd>lua require('crates').open_crates_io()<CR>", desc = "Open Crate.io" },
  },

  -- NOTE: Visual Mode
  v = {
    ["<leader>d"] = '"_d', -- register
  },

  -- NOTE: Terminal Mode
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<leader><esc>"] = "<C-\\><C-n>",
    ["<C-space>"] = "<C-\\><C-n>"
  },
}
