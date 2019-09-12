call plug#begin('~/.config/nvim/plugins')
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }

  " Visual
  Plug 'philpl/vim-adventurous'
	Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'sjl/vitality.vim'
  Plug 'sts10/vim-zipper'
  Plug 'roman/golden-ratio'
	Plug 'Yggdroot/indentLine'
  Plug 'jordwalke/vim-taste'

  " Navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-dirvish'
	Plug 'scrooloose/nerdtree'
	Plug 'Shougo/vimfiler.vim'
	Plug 'Shougo/unite.vim'

  " Tools
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/ListToggle'
	Plug 'scrooloose/nerdcommenter'

	" Undo Tree
	Plug 'mbbill/undotree'
	Plug 'sjl/gundo.vim'

  " JS Syntax
	Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
	Plug 'fleischie/vim-styled-components'
  Plug 'mxw/vim-jsx'
  Plug 'ianks/vim-tsx'

	" Reason
  " Plug 'reasonml-editor/vim-reason-plus'
  Plug 'jordwalke/vim-reasonml', { 'rev': 'WIP', 'on_ft': ['reason', 'ocaml'] }
  Plug 'lifepillar/vim-mucomplete'

  " Language server
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  " (Optional) Multi-entry selection UI.
  " Plug 'junegunn/fzf'
  " (testing) Multi-entry selection UI.
  " Plug 'Shougo/denite.nvim'
  " Showing function signature and inline doc.
  " Plug 'Shougo/echodoc.vim'

  " Ocaml
  Plug 'rgrinberg/vim-ocaml', { 'on_ft': ['ocaml', 'opam', 'dune'] }

  " TypeScript
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

  " Syntax
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'haskell.vim', { 'for': 'haskell' }
  Plug 'elixir-lang/vim-elixir'
  Plug 'keith/swift.vim'
  Plug 'vim-syntastic/syntastic'

  " Motions
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'bronson/vim-visual-star-search'

  " Linting
  " Plug 'w0rp/ale' // conflicts with syntastic

  " Completion
  Plug 'ervandew/supertab'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern', 'for': 'javascript' }

call plug#end()

let g:javascript_plugin_flow = 1
" Activate JSX for JS files
let g:jsx_ext_required = 0

" Import all .vim files in config
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
  exe 'source' f
endfor

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" Add merlin support
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif


