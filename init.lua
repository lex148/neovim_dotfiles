-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup()
require("mini.sessions").setup()

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	-- add("fynnfluegge/monet.nvim")
	add("sainnhe/gruvbox-material")
end)

later(function()
	add("nvim-tree/nvim-web-devicons")
end)


-- Safely execute immediately
now(function()
	vim.g.mapleader = ","
	vim.g.maplocalleader = "\\"

	vim.o.relativenumber = true
	vim.o.undodir = vim.fn.stdpath("config") .. "/undo"
	vim.o.backupdir = vim.fn.stdpath("config") .. "/backup"
	vim.o.directory = vim.fn.stdpath("config") .. "/swap"
	vim.o.undolevels = 1000
	vim.o.undoreload = 10000
	vim.o.backupcopy = "yes"
	vim.o.tabstop = 2
	vim.o.shiftwidth = 2
	vim.o.formatprg = "par  -w80"
	vim.o.termguicolors = true
	vim.cmd("let g:gruvbox_material_background = 'soft'")
	vim.cmd("colorscheme gruvbox-material")
	-- vim.cmd("colorscheme monet")
end)

now(function()
	require("mini.ai").setup()
	require("mini.align").setup()
	require("mini.basics").setup({ mappings = { option_toggle_prefix = "t" } })
	require("mini.comment").setup()
	require("mini.completion").setup()
	require("mini.cursorword").setup()
	require("mini.fuzzy").setup()
	require("mini.files").setup()
	require("mini.map").setup()
	require("mini.pairs").setup()
	require("mini.statusline").setup({ use_icons = true })
	require("mini.surround").setup()
	require("mini.trailspace").setup()
	require("mini.visits").setup()

	-- Use <Tab> and <S-Tab> to navigate through popup menu
	vim.api.nvim_set_keymap(
		"i",
		"<Tab>",
		[[pumvisible() ? "\<C-n>" : "\<Tab>"]],
		{ noremap = true, expr = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"i",
		"<S-Tab>",
		[[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
		{ noremap = true, expr = true, silent = true }
	)

	-- Use <CR> (Enter) to confirm selection
	vim.api.nvim_set_keymap("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { noremap = true, expr = true })

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})
	require("mini.indentscope").setup()

	--
	-- We took this from echasnovski's personal configuration
	-- https://github.com/echasnovski/nvim/blob/master/init.lua
	local filterout_lua_diagnosing = function(notif_arr)
		local not_diagnosing = function(notif)
			return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
		end
		notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
		return MiniNotify.default_sort(notif_arr)
	end

	require("mini.notify").setup({
		content = { sort = filterout_lua_diagnosing },
		window = { config = { border = "double" } },
	})
	vim.notify = MiniNotify.make_notify()

	require("mini.starter").setup({
		autoopen = true,
		items = {
			require("mini.starter").sections.builtin_actions(),
			require("mini.starter").sections.recent_files(5, false),
			require("mini.starter").sections.recent_files(5, true),
			require("mini.starter").sections.sessions(5, true),
		},
		header = [[
		]],
	})
end)

now(function()
	add("stevearc/oil.nvim")
	require("oil").setup({
		view_options = {
			show_hidden = true,
		},
	})
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.keymap.set("n", "<leader>n", "<cmd>:Oil<CR>", { desc = "Open Directory" })
end)

later(function()
  add('nvim-lua/plenary.nvim')
	add('nvim-telescope/telescope.nvim')
	vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find" })
end)

now(function()
	add("neovim/nvim-lspconfig")

	require("lspconfig").ruby_lsp.setup({})
	require("lspconfig").solargraph.setup({})
	require("lspconfig").tailwindcss.setup({})
	require("lspconfig").tsserver.setup({})
	require("lspconfig").omnisharp.setup({ cmd = { "OmniSharp" } })
end)

now(function()
	add("editorconfig/editorconfig-vim")
end)

later(function()
	add({ source = "lewis6991/gitsigns.nvim", depends = { "nvim-lua/plenary.nvim" } })
	require("gitsigns").setup()
end)

later(function()
	local miniclue = require("mini.clue")
	miniclue.setup({
		triggrs = {
			-- Leader triggers
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			-- Built-in completion
			{ mode = "i", keys = "<C-x>" },

			-- `g` key
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			-- { mode = "n", keys = "[" },
			-- { mode = "n", keys = "]" },
			-- { mode = "x", keys = "[" },
			-- { mode = "x", keys = "]" },

			-- Marks
			{ mode = "n", keys = "'" },
			{ mode = "n", keys = "`" },
			{ mode = "x", keys = "'" },
			{ mode = "x", keys = "`" },

			-- Registers
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "i", keys = "<C-r>" },
			{ mode = "c", keys = "<C-r>" },

			-- Window commands
			{ mode = "n", keys = "<C-w>" },

			-- `z` key
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },

			{ mode = "n", keys = "t" },
			{ mode = "x", keys = "t" },
		},
		window = {
			delay = 500,
		},
		clues = {
			-- Enhance this by adding descriptions for <Leader> mapping groups
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
		},
	})
end)

later(function()

	vim.cmd [[
	augroup MiniCompletionAdjustments
		autocmd!
		autocmd CompleteDone * lua require'my_completion_adjustments'.handle_complete_done()
	augroup END
]]

end)

now(function()
	vim.opt.spell = true
	vim.opt.autoread = true
	vim.opt.listchars:append({
		trail = "·",
	})
end)

-- later(function()
-- 	-- This is needed for mini.animate to work with mouse scrolling
-- 	vim.opt.mousescroll = "ver:1,hor:1"
-- 	local animate = require("mini.animate")
-- 	animate.setup({
-- 		scroll = {
-- 			-- Disable Scroll Animations, as the can interfer with mouse Scrolling
-- 			enable = true,
-- 		},
-- 		cursor = {
-- 			timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
-- 		},
-- 	})
-- end)

later(function()
	require("mini.extra").setup()

	local hi_words = MiniExtra.gen_highlighter.words
	require("mini.hipatterns").setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
			hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
			todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
			note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		},
	})
end)

later(function()
	-- Centered on screen
	local win_config = function()
		local height = math.floor(0.618 * vim.o.lines)
		local width = math.floor(0.618 * vim.o.columns)
		return {
			anchor = "NW",
			height = height,
			width = width,
			row = math.floor(0.5 * (vim.o.lines - height)),
			col = math.floor(0.5 * (vim.o.columns - width)),
		}
	end

	require("mini.extra").setup()
	require("mini.pick").setup({
		window = {
			config = win_config,
		},
	})
end)

now(function()
	add({ source = "creativenull/efmls-configs-nvim", depends = { "neovim/nvim-lspconfig" } })

	local eslint_d = require("efmls-configs.linters.eslint_d")
	local stylua = require("efmls-configs.formatters.stylua")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local mcs = require("efmls-configs.linters.mcs")
	local uncrustify = require("efmls-configs.formatters.uncrustify")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local stylelint = require("efmls-configs.linters.stylelint")
	local hadolint = require("efmls-configs.linters.hadolint")
	local fnlfmt = require("efmls-configs.formatters.fnlfmt")
	local djlint = require("efmls-configs.linters.djlint")
	local deno_fmt = require("efmls-configs.formatters.deno_fmt")
	local alejandra = require("efmls-configs.formatters.alejandra")
	local buflint = require("efmls-configs.linters.buf")
	local buffmt = require("efmls-configs.formatters.buf")
	local reek = require("efmls-configs.linters.reek")
	local rubocop = require("efmls-configs.linters.rubocop")
	--local rustfmt = require("efmls-configs.formatters.rustfmt")
	local sqlfluff = require("efmls-configs.linters.sqlfluff")
	local sql_formatter = require("efmls-configs.formatters.sql-formatter")
	local taplo = require("efmls-configs.formatters.taplo")
	local yamllint = require("efmls-configs.linters.yamllint")
	local prettier = require("efmls-configs.formatters.prettier")
	local dprint = require("efmls-configs.formatters.dprint")

	local rustfmt = {
		formatCommand = "rustfmt --edition 2021 --emit=stdout",
		formatStdin = true,
	}

	local languages = {
		javascript = { eslint_d, dprint },
		typescript = { eslint_d, dprint },
		typescriptreact = { eslint_d, dprint },
		json = { deno_fmt, dprint },
		lua = { stylua },
		sh = { shellcheck, shfmt },
		cp = { mcs, uncrustify },
		css = { prettier_d, stylelint },
		docker = { hadolint, fnlfmt },
		html = { djlint, prettier_d },
		nix = { alejandra },
		proto = { buflint, buffmt },
		ruby = {
			rubocop,
			{
				formatCommand = "rubyfmt",
				formatStdin = true,
			},
		},
		eruby = {
			{
				formatCommand = "htmlbeautifier --stop-on-errors --keep-blank-lines 2",
				formatStdin = true,
			},
		},
		rust = { rustfmt },
		sql = { sqlfluff, sql_formatter },
		toml = { dprint },
		yaml = { yamllint, prettier },
		markdown = { dprint },
		roslyn = { dprint },
	}

	local efmls_config = {
		filetypes = vim.tbl_keys(languages),
		settings = {
			rootMarkers = { ".git/" },
			languages = languages,
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
	}

	require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))

	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = lsp_fmt_group,
		callback = function(ev)
			local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})

end)

now(function()
	add({
		source = "mrcjkb/rustaceanvim",
		checkout = "4.23.5",
		monitor = "master",
	})

	vim.g.rustaceanvim = {
		server = {
			default_settings = {
				["rust-analyzer"] = {
					cargo = { loadOutDirsFromCheck = true },
					checkOnSave = { command = "clippy" },
					procMacro = { enable = true },
				},
			},
		},
	}
end)



-- Function to show diagnostics on cursor hold
local function lsp_hover_diagnostics()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
end

-- Set up autocmd for showing diagnostics on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        lsp_hover_diagnostics()
    end,
})

-- Set the updatetime option in Lua
vim.opt.updatetime = 300



later(function()
		-- Define custom diagnostic signs
	vim.fn.sign_define("DiagnosticSignError", {text = "✘", texthl = "DiagnosticSignError"})
	vim.fn.sign_define("DiagnosticSignWarn", {text = "▲", texthl = "DiagnosticSignWarn"})
	vim.fn.sign_define("DiagnosticSignHint", {text = "⚑", texthl = "DiagnosticSignHint"})
	vim.fn.sign_define("DiagnosticSignInfo", {text = "ℹ", texthl = "DiagnosticSignInfo"})

end)

now(function()
	add("tpope/vim-rails")
	add("tpope/vim-fugitive")
	add("tpope/vim-dadbod")
	add("kristijanhusak/vim-dadbod-completion")
	add("kristijanhusak/vim-dadbod-ui")
	vim.g.db_ui_use_nerd_fonts = 1
end)

later(function()
	add("nvim-treesitter/nvim-treesitter")

	require("nvim-treesitter.configs").setup({
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = { enable = true },
		query_linter = { enable = true },
		context_commentstring = { enable = true },
	})
end)

require("keybinds")
