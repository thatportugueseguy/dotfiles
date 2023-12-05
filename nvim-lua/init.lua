if not vim.g.vscode then
	-- nvChad
	require "core"

	local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

	if custom_init_path then
		dofile(custom_init_path)
	end

	require("core.utils").load_mappings()

	local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

	-- bootstrap lazy.nvim!
	if not vim.loop.fs_stat(lazypath) then
		require("core.bootstrap").gen_chadrc_template()
		require("core.bootstrap").lazy(lazypath)
	end

	dofile(vim.g.base46_cache .. "defaults")
	vim.opt.rtp:prepend(lazypath)

	require "plugins"
else
	-- case insensitive search
	vim.opt.ignorecase = true

	-- space as the leader key
  vim.g.mapleader = " "

  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup({"tpope/vim-surround"})

  -- Custom mappings
  -- Map semicolon to colon
  vim.keymap.set('n', ';', ':')

  -- Movement to start/end of line
  vim.keymap.set({'n', 'v'}, 'H', '^')
  vim.keymap.set({'n', 'v'}, 'L', '$')

  -- Yank to end of line
  vim.keymap.set('n', 'Y', 'y$')

  -- Paste over the selection without overwriting the default register
  vim.keymap.set('v', 'p', 'pgvy')

  -- Remove highlight
  vim.keymap.set('n', '<CR>', ':nohl<CR>')

  -- VSCode
  -- Visual Mode
  vim.keymap.set('v', '<leader>u', ":call VSCodeNotify('git.revertSelectedRanges')<CR>")

  -- Normal Mode
  vim.keymap.set('n', '<leader>w', ":call VSCodeNotify('workbench.action.files.save')<CR>")
  vim.keymap.set('n', '<leader>W', ":call VSCodeNotify('workbench.action.files.saveAll')<CR>")
  vim.keymap.set('n', 'u', ":call VSCodeNotify('undo')<CR>")
  vim.keymap.set('n', 's', ":call VSCodeNotify('extension.aceJump.multiChar')<CR>")
  vim.keymap.set('n', '<C-r>', ":call VSCodeNotify('redo')<CR>")
  vim.keymap.set('n', '<leader>O', ":call VSCodeNotify('workbench.action.gotoSymbol')<CR>")
  vim.keymap.set('n', '<leader>b', ":call VSCodeNotify('gitlens.toggleLineBlame')<CR>")
  vim.keymap.set('n', '<leader>r', ":call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>")
  vim.keymap.set('n', '<leader>h', ":call VSCodeNotify('workbench.action.previousEditor')<CR>")
  vim.keymap.set('n', '<leader>l', ":call VSCodeNotify('workbench.action.nextEditor')<CR>")
  vim.keymap.set('n', '<leader>j', ":call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>")
  vim.keymap.set('n', '<leader>k', ":call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
  vim.keymap.set('n', '<leader>K', ":call VSCodeNotify('workbench.action.closeAllEditors')<CR>")
  vim.keymap.set('n', '<leader>f', ":call VSCodeNotify('editor.action.formatDocument')<CR>")
  vim.keymap.set('n', '<leader>e', ":call VSCodeNotify('editor.action.rename')<CR>")
  vim.keymap.set('n', '<leader>d', ":call VSCodeNotify('editor.action.goToDeclaration')<CR>")
  vim.keymap.set('n', '<leader>t', ":call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")
  vim.keymap.set('n', '<leader>o', ":call VSCodeNotify('workbench.action.quickOpen')<CR>")
  vim.keymap.set('n', '<leader>n', ":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
  vim.keymap.set('n', '<leader>p', ":call VSCodeNotify('editor.action.peekImplementation')<CR>")
end
