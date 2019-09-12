set encoding=utf8
set list

" Invisibles
set listchars=tab:▸\ ,eol:⨼

" Enable true color support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Enable cursor shape switching
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Syntax highlighting
set nowrap
set textwidth=0
syntax enable
set background=dark
colorscheme taste

let g:airline_theme="solarized"

" Some theming for ALE
hi ALEWarningSign ctermfg=70 ctermbg=NONE cterm=NONE guifg=#4BAE16 guibg=NONE gui=NONE
hi ALEErrorSign ctermfg=166 ctermbg=NONE cterm=NONE guifg=#D3422E guibg=NONE gui=NONE

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
