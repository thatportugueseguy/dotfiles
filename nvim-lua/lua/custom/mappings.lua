local M = {}

-- function! TmuxMove(direction)
--         let wnr = winnr()
--         silent! execute 'wincmd ' . a:direction
--         " If the winnr is still the same after we moved, it is the last pane
--         if wnr == winnr()
--                 call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
--         end
-- endfunction
--
-- nnoremap <silent> <C-Left> :call TmuxMove('h')<cr>
-- nnoremap <silent> <C-Down> :call TmuxMove('j')<cr>
-- nnoremap <silent> <C-Up> :call TmuxMove('k')<cr>
-- nnoremap <silent> <C-Right> :call TmuxMove('l')<cr>
--
-- nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
-- nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
-- nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
-- nnoremap <silent> <C-l> :call TmuxMove('l')<cr>

	local function tmux_move(direction)
		local wnr = vim.fn.winnr()
		vim.cmd('wincmd ' .. direction)

		-- If the winnr is still the same after we moved, it is the last pane
		if wnr == vim.fn.winnr() then
			vim.fn.system('tmux select-pane -' .. string.gsub(direction, '[phjkl]', {l='l', h='L', j='D', k='U', p='l'}))
		end
	end
M.general = {
  n = {
    ["<CR>"] = { ":noh <CR>", "Clear highlights" },
    ["<leader>w"] = { ":w <CR>", "Save file" },
    -- TODO mudar isto em baixo para usar vim.buf (ver outros mappings dos buffers)
    ["<leader>k"] = { ":bdelete <CR>", "Close buffer" },

    -- splits
    ["<C-w>."] = { ":vsp<CR>" },
    ["<C-w>,"] = { ":sp<CR>" },

    -- Movement to start/end of line
    ["H"] = { "^", "Move cursor to the start of the line" },
    ["L"] = { "$", "Move cursor to the end of the line" },

		-- Movement between windows
    ["<C-h>"] = { function() tmux_move('h') end, "Window left" },
    ["<C-l>"] = { function() tmux_move('l') end, "Window right" },
		-- TODO fix below
		-- Disabling the vertical tmux move for now, as it's not working
		-- with the integrated terminal. It's rare to break into tmux vertically
    -- ["<C-j>"] = { function() tmux_move('h') end, "Window down" },
    -- ["<C-k>"] = { function() tmux_move('k') end, "Window up" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    ["Y"] = { "y$", "Yank til the end of the line" },
    [";"] = { ":", "Enter command mode" },
    ["s"] = { "<Plug>(easymotion-s)", "Search char" },
    ["/"] = { "<Plug>(easymotion-sn)", "Search" },
    -- TODO pouco a pouco retirar as bindings abaixo de <leader>f, para poder ter este como format
    -- ["<leader>f"] = {
    --   function()
    --     vim.lsp.buf.format { async = true }
    --   end,
    --   "LSP formatting",
    --   { opts = { nowait = true } },
    -- },
  },
  v = {
    -- Movement to start/end of line
    ["H"] = { "^", "Move cursor to the start of the line" },
    ["L"] = { "$", "Move cursor to the end of the line" },

    -- Paste over the selection without overwriting the default register
    ["p"] = { "pgvy", "Paste over the selection without overwriting the default register" },
		-- Movement between windows
    ["<C-h>"] = { function() tmux_move('h') end, "Window left" },
    ["<C-l>"] = { function() tmux_move('l') end, "Window right" },
    ["<C-j>"] = { function() tmux_move('h') end, "Window down" },
    ["<C-k>"] = { function() tmux_move('k') end, "Window up" },
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gd"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["<leader>d"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>t"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>e"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic (linting)",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>o"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>ff"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>j"] = { "<cmd> Telescope buffers sort_mru=true ignore_current_buffer=true<CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

return M
