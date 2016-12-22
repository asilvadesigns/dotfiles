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
"   ~helper commands to make new files
command! Newhtml execute 'vnew' | execute 'Sethtml'
command! Newcss execute 'vnew' | execute 'Setcss'
command! Newscss execute 'vnew' | execute 'Setscss'
command! Newjs execute 'vnew' | execute 'Setjs'

"   Set Syntax
"   ~helper commands to set syntax
command! Sethtml execute 'set ft=html'
command! Setcss execute 'set ft=css'
command! Setscss execute 'set ft=scss'
command! Setjs execute 'set ft=javascript'

"   Vimrc
"   ~quickly open vimrc
command! Vimrc execute 'e $HOME/.vimrc'

""""""""""""""""""""""""
"   $FUNCTIONS
"   ~detect syntax
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""
"   $GENERAL

"   Backups
"   ~set swap file directory
set dir=$HOME/.vim-swp/

"   Errors
"   ~disable audio errors
set noerrorbells
"   ~disable visual errors
set visualbell t_vb=

"   Files
"   ~load plugins for file types
filetype plugin on
"   ~if file changes: reload
set autoread
"   ~set file encoding to UTF8
set encoding=utf8

"   Search
"   ~show search pattern as I type it
set incsearch
"   ~allow case insensitive search
set ignorecase
"   ~if caps use caps etc
set smartcase
"   ~don't highlight search results
set nohlsearch

"   Shell
"   ~set default shell to bash
set shell=/bin/bash


"   Syntax
"   ~omnicomplete defaults
syntax on
augroup omnicomplete
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=tern#Complete
    autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

"   Tabs & Indents
"   ~use spaces for tab key
set expandtab
set smarttab
"   ~num spaces for autoindent
set shiftwidth=4
"   ~num spaces for tab key
set tabstop=4
"   ~copy indent from previous line
set autoindent
"   ~do smart autoindenting on new line
set smartindent

"   Text
"   ~no text wrapping
set nowrap

""""""""""""""""""""""""
"   $HOTKEYS

"   ~define hotkey lead command
let g:mapleader = ','

"   Code : HTML
"   ~paste tag below
map <leader>pb vatygv<c-[>o<cr><c-[>pvat=kdd
"   ~join tag
map <leader>jt JxJx<c-[>0w
"   ~prepend attribute
map <leader>pa 0wea<Space>
"   ~append attribute
map <leader>aa 0w%i<Space>
"   ~append class
map <leader>ac 0/class<cr>/"<~cr>ni<Space>
"   remove first attribute
map <leader>ra 0wewdt"da"<Esc>

"   General
"   ~exit current buffer
map <leader>e :bd<cr>
"   ~reload current buffer
map <leader>r :e<cr>
"   ~quit current buffer
map <leader>q :q<cr>
"   ~open file explorer
map <leader>x :Explore<cr>

"   Plugins : Nerdtree
"   ~toggle nerd tree
map <leader>nt :NERDTreeToggle<cr>

"   Plugins : Indent Guides
"   ~toggle indent guides
nnoremap <leader>ig :IndentGuidesToggle<cr>

"   Selection
"   ~quickly select all
map <leader>va ggVGo

"   Tabs & Indents
"   ~make tabs work like they should
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"   Text
"   ~line below on enter
nnoremap <cr> o<Esc>
"   ~line above on shift enter
nnoremap <S-cr> O<Esc>

"   Windows
"   ~quickly move between and resize buffers
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
nnoremap <C-[> <C-W>10<
nnoremap <C-]> <C-W>10>
map <leader>v :vsplit<cr>
map <leader>v :vsplit<cr>

""""""""""""""""""""""""
"   $PLUGINS : INIT

call plug#begin('~/.vim/plugged')

"   Completion
Plug 'jiangmiao/auto-pairs'             " Autopairs
Plug 'mattn/emmet-vim'                	" Emmet
Plug 'othree/jspc.vim'                  " JS Parameter Complete
Plug 'shougo/neocomplete.vim'           " Neocomplete
Plug 'ternjs/tern_for_vim'              " TernJS - npm install plugged directory

"   Git
Plug 'tpope/vim-fugitive'				" Git

"   Navigation
Plug 'scrooloose/nerdtree'              " Nerd tree
Plug 'scrooloose/nerdcommenter'         " Nerd commenter

"   Search
Plug 'FelikZ/ctrlp-py-matcher'          " CtrlP performance
Plug 'ctrlpvim/ctrlp.vim'               " CtrlP

"   Snippets
Plug 'honza/vim-snippets'               " Snippets manager
Plug 'sirver/ultisnips'                 " Ultisnips

"   Syntax
Plug 'ap/vim-css-color'                 " CSS color
Plug 'cakebaker/scss-syntax.vim'        " SCSS
Plug 'hail2u/vim-css3-syntax'           " CSS
Plug 'othree/html5.vim'                 " HTML
Plug 'pangloss/vim-javascript'          " Javascript
Plug 'scrooloose/syntastic'             " Syntastic

"   Text
Plug 'godlygeek/tabular'                " Align text
Plug 'ntpeters/vim-better-whitespace'	" Remove whitespace
Plug 'tpope/vim-surround'               " Surround

"   UI
Plug 'altercation/vim-colors-solarized' " Solarized
Plug 'bling/vim-airline'                " Airline
Plug 'nathanaelkane/vim-indent-guides'  " Indent guides

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
"   ~Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"   ~____add description
let g:neocomplete#auto_completion_start_length = 1
"   ~____add description
let g:neocomplete#sources#buffer#cache_limit_size = 50000
"   ~____add description
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
"   ~Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"   ~Use smartcase.
let g:neocomplete#enable_smart_case = 1
"   ~Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
"   ~____add description
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
"   ~____add description
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

"   Nerdtree
"   ~show line numbers
let NERDTreeShowLineNumbers = 1
"   ~expandable icon
let g:NERDTreeDirArrowExpandable = '+'
"   ~collapsible icon
let g:NERDTreeDirArrowCollapsible = '-'

"   Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode = "passive"

"   TernJS
let g:tern_show_argument_hints='on_hold'

"   Ultisnips
"   ~use tab to expand snippet
let g:UltiSnipsExpandTrigger='<tab>'

""""""""""""""""""""""""
"   $UI

"   Cursor
"   ~highlight cursor line
set cursorline

"   Editing
"   ~enable moving accurately through whitespace
set virtualedit=all

"   Font
"   ~use source code pro
set guifont=Source_Code_Pro:h16
"   ~set lineheight
set linespace=2

"   Numbers
"   ~show relative line numbers
set relativenumber
set number
autocmd ColorScheme * hi LineNr guibg=NONE
autocmd ColorScheme * hi CursorLineNr guifg=#eee8d5

"   Status line
"   ~show status line && show airline
set laststatus=2

"   Theme
"   ~use solarized
colorscheme solarized
"   ~dark version of solarized
set background=dark

"   Toolbars
"   ~no toolbar
set guioptions-=T
"   ~no menu bar
set guioptions-=m
"   ~no right scroll bar
set guioptions-=r
"   ~no left scroll bar
set guioptions-=L

"   Windows
"   ~blank space between buffers
set fillchars=""
hi VertSplit ctermbg=NONE guibg=NONE

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

"   On comments within vimrc.
"   Sometimes it won't interpret a command correctly or will break
"   commands becuase of a comment on the same line. To force vim to
"   interpret the command separately use the (|) immediately after
"   the command and you're good to go.

"   On default shell.
"   Not setting the (set shell=/bin/bash) option correctly was
"   breaking syntastic, and a few others things making non-issues
"   issues, note for future vim install to set this correctly.

"   On multiple cursors.
"   You actually don't need them... try this. Visually select some
"   text, then hit (cgn), meaning change (whatever g means) next.
"   Once you've typed the change, hit (.) to repeat the command.
"   awesome sauce! (cgN) would go backwards, and it works with undos.
