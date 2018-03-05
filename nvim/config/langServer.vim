" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'javascript': ['/Users/ze/javascript-typescript-langserver/lib/language-server-stdio.js']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

