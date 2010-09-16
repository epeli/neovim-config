colorscheme peachpuff



syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set ai
set modeline

" tab inserts normal tab for makefiles instead of spaces
au BufRead,BufNewFile Makefile* set noexpandtab

" * Search & Replace
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

set pastetoggle=<F2>


set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.


" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Execute file being edited
map <F5> :! %:p <CR>

" Some aliases
command W w
command Q q
command WQ wq
command Wq wq

" :MM to save and make
command MM w|make


" Cooler tab completion for vim commands
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list


" Folding
set foldmethod=indent     
set foldlevel=9999        " initially open all folds
command FoldAll set foldlevel=0
command FoldOne set foldlevel=1


if has("python")
    set statusline=%<%f\ %{TagInStatusLine()}\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
else
    set statusline=%<%f\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
endif
set laststatus=2 


" python stuff
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``


" php
autocmd FileType php set omnifunc=phpcomplete#CompletePHP



" Hilight long lines
autocmd BufRead *.markdown,*.txt,*.py,*.cgi :let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
autocmd BufRead *.markdown,*.txt,*.py,*.cgi :let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)





" Plugins
filetype plugin on

"JSlint
"let g:JSLintHighlightErrorLine = 0