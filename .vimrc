""""""""""""""""""""""""
"   $CONTENTS
"
"   $COMMANDS
"   $FUNCTIONS
"   $GENERAL
"   $HOTKEYS
"   $PLUGINS
"   $UI
"   $WIKI
"
""""""""""""""""""""""""

""""""""""""""""""""""""
"   $COMMANDS

"   New files in split
command! Nhtml execute 'vnew' | execute 'Sethtml'
command! Ncss execute 'vnew' | execute 'Setcss'
command! Nscss execute 'vnew' | execute 'Setscss'
command! Njs execute 'vnew' | execute 'Setjs'

"   Set Syntax
command! Sethtml execute 'set ft=html'
command! Setcss execute 'set ft=css'
command! Setscss execute 'set ft=scss'
command! Setjs execute 'set ft=javascript'

""""""""""""""""""""""""
"   $FUNCTIONS

function! SynStack()        " detec syntax
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""
"   $GENERAL

"   Backups
set dir=$HOME/.vim-swp/     " set swap file directory

"   Errors
set noerrorbells            " disable audio errors
set visualbell t_vb=        " disable visual errors

"   Files
filetype plugin on          " load plugins for file types
set autoread                " if file changes: reload
set encoding=utf8           " set file encoding to UTF8

"   Search
set incsearch               " show search pattern as I type it
set ignorecase              " allow case insensitive search
set smartcase               " if caps use caps etc
set nohlsearch              " don't highlight search results

"   Syntax
set syntax                  " enable syntax highlighting
syntax on

"   Tabs & Indents
set expandtab               " use spaces for tab key
set smarttab
set shiftwidth=4            " num spaces for autoindent
set tabstop=4               " num spaces for tab key
set autoindent              " copy indent from previous line
set smartindent             " do smart autoindenting on new line

""""""""""""""""""""""""
"   $HOTKEYS

let g:mapleader = ','       " define hotkey lead command

"   Code : HTML
map <leader>pb vatygv<c-[>o<cr><c-[>pvat=kdd    " paste tag below
map <leader>jt JxJx<c-[>0w                      " join tag
map <leader>pa 0wea<Space>                      " prepend attribute
map <leader>aa 0w%i<Space>                      " append attribute
map <leader>ac 0/class<cr>/"<cr>ni<Space>       " append class
map <leader>ra 0wewdt"da"<Esc>                  " remove first attribute

"   General
map <leader>e :exit<cr>                         " exit current buffer
map <leader>d :bd<cr>                           " delete current buffer
map <leader>r :e<cr>                            " reload current buffer
map <leader>q :q<cr>                            " quit current buffer
map <leader>x :Explore<cr>                     " open file explorer

"   Plugins : Nerdtree
map <leader>nt :NERDTreeToggle<cr>              " toggle nerdtree

"   Search
map <Space> /                                   " search forwards
map <C-Space> ?                                 " search backwards

"   Selection
map <leader>va ggVGo                            " select all

"   Tabs & Indents
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <cr> o<Esc>                            " line below on enter
nnoremap <S-cr> O<Esc>                          " line above on shift enter

"   Vimrc
map <leader>v :vsplit $HOME/.vimrc<cr>          " open vimrc

"   Windows                                     " use h,j,k,l to move between panes
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

""""""""""""""""""""""""
"   $PLUGINS : INIT

call plug#begin('~/.vim/plugged')

"   Completion
Plug 'mattn/emmet-vim'                	" Emmet
Plug 'shougo/neocomplete.vim'           " Neocomplete

"   Navigation
Plug 'scrooloose/nerdtree'              " Nerd tree

"   Search
Plug 'FelikZ/ctrlp-py-matcher'          " CtrlP performance
Plug 'ctrlpvim/ctrlp.vim'               " CtrlP

"   Snippets
Plug 'honza/vim-snippets'               " Snippets manager
Plug 'sirver/ultisnips'                 " Ultisnips

"   Syntax
Plug 'scrooloose/syntastic'             " Syntastic

"   Text
Plug 'ntpeters/vim-better-whitespace'	" Remove whitespace
Plug 'tpope/vim-surround'               " Surround

"   UI
Plug 'altercation/vim-colors-solarized' " solarized
Plug 'bling/vim-airline'                " Airline

call plug#end()

""""""""""""""""""""""""
"   $PLUGINS : SETTINGS

"   Airline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1

"   Ctrlp
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](\.git|build|dist|_site|node_modules|\.swp)$'

"   Neocomplete
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

"   Nerdtree
let NERDTreeShowLineNumbers = 1         " show line numbers
let g:NERDTreeDirArrowExpandable = '+'  " expandable icon
let g:NERDTreeDirArrowCollapsible = '-' " collapsible icon

"   Syntastic
set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"   Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'    " use tab to expand snippet

""""""""""""""""""""""""
"   $UI

"   Cursor
set cursorline                          " highlight cursor line

"   Editing
set virtualedit=all                     " enable moving accurately through whitespace

"   Font
set guifont=Source_Code_Pro:h16         " use source code pro
set linespace=2                         " set lineheight

"   Numbers
set relativenumber                      " show relative line numbers

"   Status line
set laststatus=2                        " show status line && show airline

"   Theme
colorscheme solarized                   " use solarized
set background=dark                     " dark version of solarized

"   Toolbars
set guioptions-=T                       " no toolbar
set guioptions-=m                       " no menu bar
set guioptions-=r                       " no right scroll bar
set guioptions-=L                       " no left scroll bar

""""""""""""""""""""""""
"   $WIKI

"   On chaining commands.
"   Use 'pipe' (|) to separate do commands in order, like this:
"   command! Newhtml execute 'vnew' | execute 'Sethtml'

"   On hotkeys and delays.
"   If a command delays to execute upon completion, it is because
"   vim is waiting to see if you'll type another key, because th-
"   ere may be another command mapped to it. Use :map <leader>X
"   (where X is the key used to invode command after leader) to
"   check what keys are mapped to that particular combination.
