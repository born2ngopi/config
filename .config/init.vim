"---------------------------- Plugins ---------------------------------
call plug#begin('~/.vim/pluged')
" Tools
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/goyo.vim'
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'alfredodeza/posero.vim' "presentation
"syntax
    Plug 'jwalton512/vim-blade'
    Plug 'rust-lang/rust.vim'   "rust
    Plug 'vim-ruby/vim-ruby'    "ruby
    Plug 'tpope/vim-markdown'   "markdown
    Plug 'ap/vim-css-color'     "css
    Plug 'vim-scripts/fountain.vim'
"color scheme
    Plug 'morhetz/gruvbox'
call plug#end()

"---------------------------- General Settings ------------------------
set encoding=UTF-8
filetype plugin indent on
syntax on
set autoread
set autowrite
set wildmenu
set number relativenumber
set nu rnu
set spelllang=en_us
set spell
set backspace=indent,eol,start
set noruler
set confirm
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set hls is
set ic
set laststatus=2
set cmdheight=1
set noemoji
set cursorline
set path+=**
set wildmenu
set list listchars=tab:»·,trail:·,nbsp:·
set mouse=a

" status-line
set statusline=
set statusline+=%#Title#
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#Folded#
set statusline+=\ %F
set statusline+=%= "Right side
set statusline+=%#MoreMsg#
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=%#Question#
set statusline+=\ [%n]

"tag jumping
command! Maketags !ctags -R .
"Use ctrl+] jump to tag under cursor
"Use ctrl+t jump back ip the tag stack
"Use g ctrl+] for ambiguous tags

"---------------------------- Syntax Mappings ---------------------------
au BufRead,BufNewFile *.fountain set filetype=fountain

"---------------------------- Key Mapping -------------------------------
map <Space> :EditVifm .<CR>
map <ENTER> :Goyo<CR>
map <C-s> :source ~/.config/nvim/init.vim<CR>
map <C-l> :set background=light<CR>
map <C-d> :set background=dark<CR>

imap jj <esc>

nmap <space> :
nmap zz :w<CR>
nmap qq :q<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2 <CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>


"----------------------------- Color Settings ---------------------------
colorscheme gruvbox
set background=dark

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"limelight
let g:limelight_conceal_ctermfg= 'gray'
let g:limelight_conceal_ctermfg= 240

"goyo
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=999
    set nocursorline
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set scrolloff=5
    set cursorline
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"----------------------------- posero --------------------------------------
let g:posero_default_mappings = 1

"----------------------------- file browsing -------------------------------
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize = 20
let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

function! OpenToRight() 
    :normal v 
    let g:path=expand('%:p') 
    :q! 
    execute 'belowright vnew' g:path 
    :normal <C-l> 
endfunction 

function! OpenBelow() 
    :normal v 
    let g:path=expand('%:p')
    :q!
    execute 'belowright new' g:path
    :normal <C-l>
endfunction

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout" . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

function! NetrwMappings()
    noremap <buffer> <C-l> <C-w>l
    noremap <silent> <C-f> :call ToggleNetrw()<CR>
    noremap <buffer> <Tab> :call OpenToRight()<CR>
    noremap <buffer> H :call OpenBelow()<CR>
endfunction

"close netrw if's the only buffer open
"autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == "quickfix" |q|endif

let g:NetrwIsOpen = 1

augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

"---------------------------- snippets -------------------------------------
"read an empty HTML
nnoremap ,html :-1read $HOME/.config/nvim/snippets/html-skeleton.html<CR>3jwf>a
