" Set leader to space
let mapleader=" "
nnoremap <Space> <nop>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Map <C-w> , to vsp and . to sp
nnoremap <C-w>, :vsp<CR>
nnoremap <C-w>. :sp<CR>

" Save
nnoremap <Leader>w :w<CR>

" Map semicolon to colon
noremap ; :

" Quick/Location list Toggle
let g:lt_location_list_toggle_map = '<leader>p'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" VimFiler
" nnoremap <Leader>n :VimFiler<CR>

" NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" IndentLine
nnoremap <Leader>ig :IndentLinesToggle<CR>

" remove highlight when pressing enter
nnoremap <CR> :nohlsearch<CR>
" fzf
nnoremap <Leader>o :GFiles<CR>


" Easymotion Shortcuts
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Gif config
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remap Arrow keys
map <Up> <Plug>(easymotion-k)
map <Down> <Plug>(easymotion-j)
map <Left> <Plug>(easymotion-linebackward)
map <Right> <Plug>(easymotion-lineforward)

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
" OSX includes wrong terminfo information for xterm-256color(used by iterm)
" needs fix
" https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
" (for c-h
map <C-h> <C-W>h
map <C-l> <C-W>l
" Gif config
nmap s <Plug>(easymotion-s)

" Move to previous/next buffer
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>

" Close a buffer
nnoremap <leader>k :bp <BAR> bd #<CR>

" List buffers
nnoremap <leader>j :Buffers<CR>

" List buffer commits
nnoremap <leader>c :BCommits<CR>

" List git status files
nnoremap <leader>c :GFiles?<CR>

" Blackhole all x commands and make X behave like d
nnoremap X "_d
nnoremap XX "_dd
vnoremap X "_d
vnoremap x "_d
nnoremap x "_x

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" Allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" TypeScript specific keymaps
autocmd FileType typescript nmap <Leader>d :TsuDefinition<CR>
autocmd FileType typescript nmap <Leader>r :TsuReferences<CR>
autocmd FileType typescript nmap <Leader>i :TsuImport<CR>
autocmd FileType typescript nmap <Leader>t :call TsuSearchPrompt()<CR>
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap <buffer> <Leader>p : <C-u>echo tsuquyomi#hint()<CR>

