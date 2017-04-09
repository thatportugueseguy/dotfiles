let NERDTreeHijackNetrw=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0

" close nerdtree panel if all tabs are closed and it's the only one left
" should look into github.com/jistr/vim-nerdtree-tabs?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
