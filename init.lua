require("whichkey")





    require("plugins")
    require('gitsigns').setup()
    require("autoclose").setup()
    require("null-ls").get_sources()
-- b
    vim.opt.termguicolors = true
    local line_ok, feline = pcall(require, "feline")
    if not line_ok then
        return
    end

-- Required for operations modifying multiple buffers like rename.

-- Language server configurations
local server_commands = {
    rust = { '~/.cargo/bin/rustup', 'run', 'stable', 'rls' },
    javascript = { '/usr/local/bin/javascript-typescript-stdio' },
    ['javascript.jsx'] = { 'tcp://127.0.0.1:2089' },
    python = { '/usr/local/bin/pyls' },
    ruby = { '~/.rbenv/shims/solargraph', 'stdio' },
    ocaml = { 'ocamllsp' },
}
vim.g.barbar_auto_setup = false -- disable auto-setup
vim.opt.termguicolors = true
require("bufferline").setup{}
--require'barbar'.setup {
--  -- WARN: do not copy everything below into your config!
--  --       It is just an example of what configuration options there are.
--  --       The defaults are suitable for most people.
--
--  -- Enable/disable animations
--  animation = true,
--
--  -- Automatically hide the tabline when there are this many buffers left.
--  -- Set to any value >=0 to enable.
--  auto_hide = 0,
--
--  -- Enable/disable current/total tabpages indicator (top right corner)
--  tabpages = true,
--
--  -- Enables/disable clickable tabs
--  --  - left-click: go to buffer
--  --  - middle-click: delete buffer
--  clickable = true,
--
--  -- Excludes buffers from the tabline
--  exclude_ft = {'javascript'},
--  exclude_name = {'package.json'},
--
--  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
--  -- Valid options are 'left' (the default), 'previous', and 'right'
--  focus_on_close = 'left',
--
--  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
--  hide = {extensions = true, inactive = true},
--
--  -- Disable highlighting alternate buffers
--  highlight_alternate = false,
--
--  -- Disable highlighting file icons in inactive buffers
--  highlight_inactive_file_icons = false,
--
--  -- Enable highlighting visible buffers
--  highlight_visible = true,
--
--  icons = {
--    -- Configure the base icons on the bufferline.
--    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
--    buffer_index = false,
--    buffer_number = false,
--    button = '',
--    -- Enables / disables diagnostic symbols
--    diagnostics = {
--      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
--      [vim.diagnostic.severity.WARN] = {enabled = false},
--      [vim.diagnostic.severity.INFO] = {enabled = false},
--      [vim.diagnostic.severity.HINT] = {enabled = true},
--    },
--    gitsigns = {
--      added = {enabled = true, icon = '+'},
--      changed = {enabled = true, icon = '~'},
--      deleted = {enabled = true, icon = '-'},
--    },
--    filetype = {
--      -- Sets the icon's highlight group.
--      -- If false, will use nvim-web-devicons colors
--      custom_colors = false,
--
--      -- Requires `nvim-web-devicons` if `true`
--      enabled = true,
--    },
--    separator = {left = '▎', right = ''},
--
--    -- If true, add an additional separator at the end of the buffer list
--    separator_at_end = true,
--
--    -- Configure the icons on the bufferline when modified or pinned.
--    -- Supports all the base icon options.
--    modified = {button = '●'},
--    pinned = {button = '', filename = true},
--
--    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
--    preset = 'default',
--
--    -- Configure the icons on the bufferline based on the visibility of a buffer.
--    -- Supports all the base icon options, plus `modified` and `pinned`.
--    alternate = {filetype = {enabled = false}},
--    current = {buffer_index = true},
--    inactive = {button = '×'},
--    visible = {modified = {buffer_number = false}},
--  },
--
--  -- If true, new buffers will be inserted at the start/end of the list.
--  -- Default is to insert after current buffer.
--  insert_at_end = false,
--  insert_at_start = false,
--
--  -- Sets the maximum padding width with which to surround each tab
--  maximum_padding = 1,
--
--  -- Sets the minimum padding width with which to surround each tab
--  minimum_padding = 1,
--
--  -- Sets the maximum buffer name length.
--  maximum_length = 30,
--
--  -- Sets the minimum buffer name length.
--  minimum_length = 0,
--
--  -- If set, the letters for each buffer in buffer-pick mode will be
--  -- assigned based on their name. Otherwise or in case all letters are
--  -- already assigned, the behavior is to assign letters in order of
--  -- usability (see order below)
--  semantic_letters = true,
--
--  -- Set the filetypes which barbar will offset itself for
--  sidebar_filetypes = {
--    -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
--    NvimTree = true,
--    -- Or, specify the text used for the offset:
--    undotree = {
--      text = 'undotree',
--      align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
--    },
--    -- Or, specify the event which the sidebar executes when leaving:
--    ['neo-tree'] = {event = 'BufWipeout'},
--    -- Or, specify all three
--    Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
--  },
--
--  -- New buffer letters are assigned in this order. This order is
--  -- optimal for the qwerty keyboard layout but might need adjustment
--  -- for other layouts.
--  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
--
--  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
--  -- where X is the buffer number. But only a static string is accepted here.
--  no_name_title = nil,
--
--  -- sorting options
--  sort = {
--    -- tells barbar to ignore case differences while sorting buffers
--    ignore_case = true,
--  },
--}
vim.g.LanguageClient_serverCommands = server_commands
    require('lualine').setup {
      options = {
        icons_enabled = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
    local one_monokai = {
        fg = "#abb2bf",
        bg = "#1e2024",
        green = "#98c379",
        yellow = "#e5c07b",
        purple = "#c678dd",
        orange = "#d19a66",
        peanut = "#f6d5a4",
        red = "#e06c75",
        aqua = "#61afef",
        darkblue = "#282c34",
        dark_red = "#f75f5f",
    }


    require('reach').setup({
      notifications = true
    })
    local vi_mode_colors = {
        NORMAL = "green",
        OP = "green",
        INSERT = "yellow",
        VISUAL = "purple",
        LINES = "orange",
        BLOCK = "dark_red",
        REPLACE = "red",
        COMMAND = "aqua",
    }
    local c = {
        vim_mode = {
            provider = {
                name = "vi_mode",
                opts = {
                    show_mode_name = true,
                    -- padding = "center", -- Uncomment for extra padding.
                },
            },
            hl = function()
                return {
                    fg = require("feline.providers.vi_mode").get_mode_color(),
                    bg = "darkblue",
                    style = "bold",
                    name = "NeovimModeHLColor",
                }
            end,
            left_sep = "block",
            right_sep = "block",
        },
        gitBranch = {
            provider = "git_branch",
            hl = {
                fg = "peanut",
                bg = "darkblue",
                style = "bold",
            },
            left_sep = "block",
            right_sep = "block",
        },
        gitDiffAdded = {
            provider = "git_diff_added",
            hl = {
                fg = "green",
                bg = "darkblue",
            },
            left_sep = "block",
            right_sep = "block",
        },
        gitDiffRemoved = {
            provider = "git_diff_removed",
            hl = {
                fg = "red",
                bg = "darkblue",
            },
            left_sep = "block",
            right_sep = "block",
        },
        gitDiffChanged = {
            provider = "git_diff_changed",
            hl = {
                fg = "fg",
                bg = "darkblue",
            },
            left_sep = "block",
            right_sep = "right_filled",
        },
        separator = {
            provider = "",
        },
        fileinfo = {
            provider = {
                name = "file_info",
                opts = {
                    type = "relative-short",
                },
            },
            hl = {
                style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        diagnostic_errors = {
            provider = "diagnostic_errors",
            hl = {
                fg = "red",
            },
        },
        diagnostic_warnings = {
            provider = "diagnostic_warnings",
            hl = {
                fg = "yellow",
            },
        },
        diagnostic_hints = {
            provider = "diagnostic_hints",
            hl = {
                fg = "aqua",
            },
        },
        diagnostic_info = {
            provider = "diagnostic_info",
        },
        lsp_client_names = {
            provider = "lsp_client_names",
            hl = {
                fg = "purple",
                bg = "darkblue",
                style = "bold",
            },
            left_sep = "left_filled",
            right_sep = "block",
        },
        file_type = {
            provider = {
                name = "file_type",
                opts = {
                    filetype_icon = true,
                    case = "titlecase",
                },
            },
            hl = {
                fg = "red",
                bg = "darkblue",
                style = "bold",
            },
            left_sep = "block",
            right_sep = "block",
        },
        file_encoding = {
            provider = "file_encoding",
            hl = {
                fg = "orange",
                bg = "darkblue",
                style = "italic",
            },
            left_sep = "block",
            right_sep = "block",
        },
        position = {
            provider = "position",
            hl = {
                fg = "green",
                bg = "darkblue",
                style = "bold",
            },
            left_sep = "block",
            right_sep = "block",
        },
        line_percentage = {
            provider = "line_percentage",
            hl = {
                fg = "aqua",
                bg = "darkblue",
                style = "bold",
            },
            left_sep = "block",
            right_sep = "block",
        },
        scroll_bar = {
            provider = "scroll_bar",
            hl = {
                fg = "yellow",
                style = "bold",
            },
        },
    }

    local left = {
        c.vim_mode,
        c.gitBranch,
        c.gitDiffAdded,
      c.gitDiffRemoved,
        c.gitDiffChanged,
        c.separator,
    }

    local middle = {
        c.fileinfo,
        c.diagnostic_errors,
        c.diagnostic_warnings,
        c.diagnostic_info,
        c.diagnostic_hints,
    }

    local right = {
        c.lsp_client_names,
        c.file_type,
        c.file_encoding,
        c.position,
        c.line_percentage,
        c.scroll_bar,
    }

    local components = {
        active = {
            left,
            middle,
            right,
        },
        inactive = {
            left,
            middle,
            right,
        },
    }

    -- Feline statusline definition.
    --
    -- Note: This statusline does not define any colors. Instead the statusline is
    -- built on custom highlight groups that I define. The colors for these
    -- file: `lua/eden/modules/ui/colors.lua` to see how they are defined.
    require('gitsigns').setup {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },

}
require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    },
})
vim.cmd('set guifont=JetBrains\\ Mono:h10')  -- Adjust the font size as needed
-- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
require("conform").setup({
	formatters_by_ft = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
	},
})

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			vim.api.nvim_create_autocmd(event, {
				buffer = bufnr,
				group = group,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = async })
				end,
				desc = "[lsp] format on save",
			})
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
})
vim.cmd("map <Leader>ln :NullLsInfo<CR>")
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- confiruing lsp and setting up language servers
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {    on_attach = function(_, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        -- Mappings.
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n','<leader>k','<cmd>lua vim.lsp.buf.format()<CR>',opts)
        
        -- Add your custom bindings here
    end,},
  },
}


-- Index Merlin documentation
vim.g.opamshare = vim.fn.substitute(vim.fn.system('opam var share'), '\n$', '', '')
vim.cmd('set rtp+=' .. vim.g.opamshare .. '/merlin/vim')
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
-- adding a config for bufferline changing some styles , adding vertical lines in between buffers tabs and adding few keybindings 

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}
-- Now don't forget to initialize lualine


require("nvim-cmp")
require("toggleterm-config")
require("telescope")
require("git").setup()
-- Mason Setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})
vim.o.clipboard = "unnamedplus"




-- ANSI escape sequences for text coloring
local colors = {
    reset = "\27[0m",
    green = "\27[32m",
    yellow = "\27[33m",
}

-- Define your header and footer with colors

require("mini.starter").setup(
    {
        autoopen = true,
        evaluate_single = false,
        header = "Perpendicular lines are parallel in the 3D world.",
        footer = "I Still Think I am the Greatest -  Ye West",
        content_hooks = nil,
        query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
        silent = false,
    }
)


-- Lua
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.background = dark
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 0


-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])

vim.cmd("set guifont=SpaceMono\\ Nerd\\ Font:h20")
require("mason-lspconfig").setup()
vim.cmd("set number")
vim.cmd("set noshowmode")
vim.cmd("set mouse=a")
vim.cmd("set showmatch")
vim.cmd("set list")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set tabstop=4")
vim.cmd("set signcolumn=no")
-- Map a key to run Python files
vim.api.nvim_set_keymap('n', '<F5>', [[:w<CR>:!python3 %<CR>]], { noremap = true, silent = true })

vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set wrap")
vim.cmd("set linebreak")
vim.cmd("set breakindent")
vim.cmd("set showbreak=↳")
vim.cmd("highlight Normal guibg=#1e2024")
-- LSP Diagnostics Options Setup
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "i"})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd([[
set signcolumn=no
set relativenumber
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
-- Completion Plugin Setup
local cmp = require("cmp")
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- Add tab support
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	-- Installed sources:
	sources = {
		{ name = "path" }, -- file paths
		{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
		{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
		{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = "buffer", keyword_length = 2 }, -- source current buffer
		{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = "calc" }, -- source for math calculation
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
			nvim_lsp = "λ",
				vsnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})
-- Treesitter Plugin Setup
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "toml" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
local prettier = {
	formatCommand = 'prettierd "${INPUT}"',
	formatStdin = true,
	env = {
		string.format(
			"PRETTIERD_DEFAULT_CONFIG=%s",
			vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")
		),
	},
}
vim.cmd([[colorscheme monokai]])
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.yaml", "*.yml" },
    desc = "Auto-format YAML files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":!yamlfmt " .. fileName)
    end,
    group = autocmd_group,
})
-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end
-- The setup config table shows all available config options with their default values:
-- empty setup using defaults
require("nvim-tree").setup()
