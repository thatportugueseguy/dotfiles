  -- ocaml
  -- Equivalent of "let g:opamshare = substitute(system('opam var share'),'\n$','','''')"
  vim.g.opamshare = vim.fn.substitute(vim.fn.system('opam var share'), '\n$', '', '')

  -- Equivalent of "execute "set rtp+=" . g:opamshare . "/merlin/vim""
  vim.opt.rtp:prepend(vim.g.opamshare .. '/merlin/vim')

  -- ocp-indent config
  vim.opt.rtp:prepend('/Users/ze/.opam/5.1.0/share/ocp-indent/vim')

	-- case insensitive search
	vim.opt.ignorecase = true

	-- autosave..
	local create_cmd = vim.api.nvim_create_user_command

	local function clear_cmdarea()
		vim.defer_fn(function()
			vim.api.nvim_echo({}, false, {})
		end, 800)
	end

	-- Auto save when moving around
	vim.g.autosave = true

	-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
		callback = function()
			if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted and vim.g.autosave then
				vim.cmd "silent w"

				-- print nice colored msg
				-- vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. os.date "%I:%M %p" } }, false, {})

				-- clear msg after 500ms
				-- clear_cmdarea()
			end
		end,
	})

	create_cmd("AsToggle", function()
		vim.g.autosave = not vim.g.autosave

		if vim.g.autosave then
			vim.api.nvim_echo({ { "󰆓 ", "LazyProgressDone" }, { "autosave enabled!" } }, false, {})
		else
			vim.api.nvim_echo({ { "󰚌 ", "LazyNoCond" }, { "autosave disabled" } }, false, {})
		end

		clear_cmdarea()
	end, {})

