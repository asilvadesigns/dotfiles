"""""""""""""""""""""""""""""""
"	Vundle
"
set nocompatible                            " be iMproved, required
set autoread
filetype off                                " required
set shell=/bin/bash
"set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')

" Plug 'terryma/vim-smooth-scroll' 		" Smooth scroll
Plug 'altercation/vim-colors-solarized' " Solarized
"Plug 'blueyed/vim-diminactive'			" Dim inactive buffers

Plug 'bling/vim-airline'                " Airline
Plug 'godlygeek/tabular'                " Align text
Plug 'nathanaelkane/vim-indent-guides'	" Indent guides

Plug 'scrooloose/syntastic'				" Syntax checker
Plug 'ap/vim-css-color'                 " CSS color
Plug 'hail2u/vim-css3-syntax'           " CSS
Plug 'othree/html5.vim'				    " HTML
Plug 'digitaltoad/vim-jade'             " Jade
Plug 'pangloss/vim-javascript'			" JS
Plug 'mxw/vim-jsx'						" JSX
Plug 'cakebaker/scss-syntax.vim'        " SCSS

Plug 'schickling/vim-bufonly'			" Close all but current buffer

Plug 'ctrlpvim/ctrlp.vim'               " CtrlP
Plug 'FelikZ/ctrlp-py-matcher'          " CtrlP performance enhancement

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fzf

Plug 'jiangmiao/auto-pairs'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'                	" Emmet
Plug 'matze/vim-move'					" Vim move
Plug 'ntpeters/vim-better-whitespace'	" Remove whitespace
Plug 'scrooloose/nerdcommenter'			" Nerd commenter
Plug 'scrooloose/nerdtree'				" Nerd tree
Plug 'terryma/vim-multiple-cursors'     " Multi cursors : )
Plug 'tpope/vim-surround'				" Surround tags
Plug 'tyru/open-browser.vim'			" Open in Browser
Plug 'vim-scripts/AutoComplPop'			" AutoComlPop menu
Plug 'wesQ3/vim-windowswap'				" Window swap

call plug#end()            				" required

"""""""""""""""""""""""""""""""
"	Nerd Tree
"
let NERDTreeShowLineNumbers = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

"""""""""""""""""""""""""""""""
"	Open browser current
"
command! OpenBrowserCurrent execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')

"""""""""""""""""""""""""""""""
"	Syntastic
"
set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 0
let g:syntastic_auto_jump = 1
let g:syntastic_enable_signs = 0

"let g:syntastic_mode = "passive"
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

"let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_scss_checkers = ['']
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

"""""""""""""""""""""""""""""""
"	Omnicomplete
"
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""
"	Tern js
"
let g:tern_show_argument_hints='on_hold'
let g:tern_map_prefix = '<leader>'
let g:tern_map_keys=1

"""""""""""""""""""""""""""""""
"	Insert
"
set backspace=2								" Allow backspace to erase in insert mode

"""""""""""""""""""""""""""""""
"	Visual
"
"colorscheme Tomorrow-Night-Eighties			" Set colorscheme
set background=dark						" Options are light/dark
colorscheme solarized
set cpoptions+=$							" show in change mode to mark edit end
set cursorline							    " highlight current line
"set colorcolumn=60						    " color column at 60 characters
syntax sync minlines=256
set foldmethod=indent						" Code folding
set encoding=utf8
"set guifont=Source_Code_Pro:h16
"set guifont=Space_Mono:h16
set guifont=Fira_Code:h16
set guioptions-=T							" Remove toolbar
set guioptions-=m							" Remove menu bar
set guioptions-=r							" Remove right-hand scroll bar
set guioptions-=L							" Remove right-hand scroll bar
set laststatus=2							" Always show status line
set linespace=5                          	" Set line height
set nonu rnu                                " Set Relative Number
set novisualbell t_vb=	                    " Disable errorbell
set nowrap									" Disable text wrap
set linebreak
set scrolloff=5   							" Start scrolling before end
set shiftwidth=4					   	 	" Change indent size. Default: 8
set sidescroll=1							" Scroll sideways 1 char at a time
set sidescrolloff=5                         " Same for side
set tabstop=4						   	 	" Change tab size. Default: 8
set shiftwidth=4
set expandtab
set vb                                      " Disable errorbell
set virtualedit=all							" Enable virtual edit
syntax on

"""""""""""""""""""""""""""""""
"	Multi Cursors
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

"""""""""""""""""""""""""""""""
"	Syntax Colors
"
" hi cssClassName guifg=#f2777a gui=NONE
" hi cssMedia guifg=#cc99cc gui=NONE
" hi cssFontDescriptor guifg=#cc99cc gui=NONE
" hi cssPseudoClassId guifg=#cc99cc gui=NONE
" hi cssPseudoClassLang guifg=#f2777a gui=NONE
" hi cssTagName guifg=#f2777a gui=NONE
" hi cssValueLength guifg=#f99157 gui=NONE
" hi cssValueNumber guifg=#f99157 gui=NONE
" hi cssVendor guifg=#99cccc gui=NONE

" hi htmlArg guifg=#f99157 gui=NONE
" hi htmlSpecialTagName guifg=#f2777a gui=NONE

" hi scssAmpersand guifg=#f2777a gui=NONE
" hi scssDebug guifg=#cc99cc gui=NONE
" hi scssDefinition guifg=#cc99cc gui=NONE
" hi scssEachKeyword guifg=#cc99cc gui=NONE
" hi scssForKeyword guifg=#cc99cc gui=NONE
" hi scssElse guifg=#cc99cc gui=NONE
" hi scssExtend guifg=#cc99cc gui=NONE
" hi scssFunctionBody guifg=#cc99cc gui=NONE
" hi scssFunctionName guifg=#99cccc gui=NONE
" hi scssFunctionParams guifg=#99cccc gui=NONE
" hi scssIf guifg=#cc99cc gui=NONE
" hi scssInclude guifg=#cc99cc gui=NONE
" hi scssMixinParams guifg=#99cccc gui=NONE
" hi scssReturn guifg=#cc99cc gui=NONE
" hi scssVariable guifg=#f99157 gui=NONE

" hi jsFuncName guifg=#99cccc gui=NONE
" hi jsFuncCall guifg=#99cccc gui=NONE
" hi jsFuncArgs guifg=#ffcc66 gui=NONE
" hi jsFunction guifg=#f2777a gui=NONE
" hi jsStringS guifg=#99cc99 gui=NONE
" hi jsGlobalObjects guifg=#ffcc66 gui=NONE
" hi jsNumber guifg=#cc99cc gui=NONE
" hi jsReturn guifg=#f2777a gui=NONE
" hi jsLabel guifg=#f2777a gui=NONE
" hi jsStatement guifg=#f2777a gui=NONE
" hi jsRepeat guifg=#f2777a gui=NONE
" hi jsConditional guifg=#f2777a gui=NONE
" hi jsThis guifg=#f2777a gui=NONE
" hi jsBooleanFalse guifg=#cc99cc gui=NONE
" hi jsBooleanTrue guifg=#cc99cc gui=NONE
" hi jsBraces guifg=#999999 gui=NONE
" hi jsFuncBraces guifg=#999999 gui=NONE
" hi jsParens guifg=#999999 gui=NONE
" hi jsFuncParens guifg=#999999 gui=NONE
" hi jsNoise guifg=#999999 gui=NONE

" Slash after folder names
"hi NERDTreeDirSlash guifg=#99cccc gui=NONE
" Folder open icon color
"hi NERDTreeOpenable guifg=#f99157 gui=NONE
" Folder close icon color
"hi NERDTreeClosable guifg=#99cccc gui=NONE
" Pipes beside folders color
"hi NERDTreePart guifg=#2d2d2d gui=NONE

hi CursorLineNr guifg=#aaaaaa
hi LineNr guibg=NONE
"hi ColorColumn guibg=#292929

"set fillchars+=vert:\|
set fillchars=""
hi VertSplit ctermbg=NONE guibg=NONE

"""""""""""""""""""""""""""""""
"	JSX Syntax
"
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""
"	Detect syntax function
"
function! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"""""""""""""""""""""""""""""""
"	Search
"
set incsearch
set ignorecase
set smartcase
set nohlsearch

"""""""""""""""""""""""""""""""
"	Dim Inactive
"
"let g:diminactive_use_colorcolumn = 0
"let g:diminactive_use_syntax = 1

"""""""""""""""""""""""""""""""
"	Indent Guides
"
set ts=4 sw=4 noet
"	let g:indent_guides_start_level=2
"	let g:indent_guides_guide_size=1

"""""""""""""""""""""""""""""""
"	Hotkeys
"
let mapleader = ','

" Plug install
nnoremap <leader>pi :PlugInstall<cr>

" Plug clean
nnoremap <leader>pc :PlugClean<cr>

" Toggle Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Toggle IndentGuides
nnoremap <leader>ig :IndentGuidesToggle<cr>

" Open vimrc
"nnoremap <leader>v :vsplit $VIM/vimrc<cr>
nnoremap <leader>v :vsplit $HOME/.vimrc<cr>

" Open new file in vsplit
nnoremap <leader>n :vnew<cr>

" Quit current file
nnoremap <leader>q :q<cr>

" Reload current file
nnoremap <leader>r :e!<cr>

" Exit current file
nnoremap <leader>e :bd<cr>

" Open file explorer
nnoremap <leader>x :Explore<cr>

" Format Code - Indent
nnoremap <leader>f gg=G''0

" Format Code - CSS
nnoremap <leader>c :CSScomb<cr>

" Format Code - HTML
nnoremap <leader>h :%s/>\s*</>\r</g<cr> :g/^$/d<cr> ggVGo=<Esc>

" Delete empytlines
nnoremap <leader>rel :g/^$/d<cr>

" Paste all tag below
nnoremap <leader>pb vatygv<c-[>o<cr><c-[>pvat=kdd

" Join tag
nnoremap <leader>jt JxJx<c-[>0w

" Toggle invisible characters
nnoremap <leader>l :set list!<cr>

" Toggle hlsearch
nnoremap <leader>hs :set hlsearch! hlsearch?<cr>

" Strip whitespace
nnoremap <leader>sw :StripWhitespace<cr>

" Insert line below on enter
nnoremap <cr> o<Esc>

" Insert line above on shift enter
nnoremap <S-cr> O<Esc>

" Prepend HTML Attribute
nnoremap <leader>pa 0wea<Space>

" Append HTML Attribute
nnoremap <leader>aa 0w%i<Space>

" Append HTML Class
nnoremap <leader>ac 0/class<cr>/"<cr>ni<Space>

" Remove first HTML Attribute
nnoremap <leader>ra 0wewdt"da"<Esc>

" <CR>                    "Search for text and replace
vnoremap // y/<C-R>

" Visual all
nnoremap <leader>va ggVGo

" Set syntax to HTML
command! Sethtml :set filetype=html syntax=html<cr>

" Set syntax to CSS
command! Setcss :set filetype=css syntax=css<cr>

" Set syntax to SCSS
command! Setscss :set filetype=scss syntax=scss<cr>

" Open current file in browser
nnoremap <leader>oib :OpenBrowserCurrent<cr>

" Tab moves line over
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"""""""""""""""""""""""""""""""
"	Tabularize
"
if exists(":Tabularize")
	nnoremap <leader>a: :Tabularize /:\zs<cr>
	nnoremap <leader>a{ :Tabularize /{<cr>
endif

"  Split and Tab Controls
if bufwinnr(1)
	nnoremap <C-Tab> :bprevious<cr>
	nnoremap <C-S-Tab> :bNext<cr>
	nnoremap <C-k> <C-W>k
	nnoremap <C-j> <C-W>j
	nnoremap <C-h> <C-W>h
	nnoremap <C-l> <C-W>l
	nnoremap <C-[> <C-W>5<
	nnoremap <C-]> <C-W>5>
endif

"""""""""""""""""""""""""""""""
"	Indent Line
"
let g:indentLine_char = '.'

"""""""""""""""""""""""""""""""
"	CtrlP
"
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](\.git|_site|node_modules|\.swp)$'
hi CtrlPMatch ctermbg=235 ctermfg=250 guibg=#99cccc guifg=#333333 cterm=NONE gui=NONE
hi CtrlPPrtBase ctermbg=235 ctermfg=250 guibg=#ffcc66 guifg=#333333 cterm=NONE gui=NONE

" """""""""""""""""""""""""""""""
" "	Smooth Scroll
" "
" noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<cr>
" noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<cr>
" noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 4)<cr>
" noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 4)<cr>

"""""""""""""""""""""""""""""""
"	Airline
"
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep= ''
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""""
""	Open file in browser
""
"command! ViewInBrowser :update<Bar>silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "file://%:p"<cr>
"command! Firefox :update<Bar>silent !start "C:\Program Files (x86)\Firefox Developer Edition\firefox.exe" "file://%:p"<cr>
"command! Chrome :update<Bar>silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "file://%:p"<cr>
"command! InternetExplorer :update<Bar>silent !start "C:\Program Files\Internet Explorer\iexplore.exe" "file://%:p"<cr>
"command! Safari :update<Bar>silent !start "C:\Program Files (x86)\Safari\Safari.exe" "file://%:p"<cr>
"
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"""""""""""""""""""""""""""""""
"	Tabularize
"
if exists(":Tabularize")
	nnoremap <leader>a: :Tabularize /:\zs<cr>
endif
"   function! s:align()
"       let p = '^\s*|\s.*\s|\s*$'
"       if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"           let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"           let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"           Tabularize/|/l1
"           normal! 0
"           call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"       endif
"   endfunction

"""""""""""""""""""""""""""""""
"	Notes
"
"   How to delete everything after X
"   :s/\(X\).*//g
"
"   How to delete text in command line
"   <c-w> or <c-u>
"

execute pathogen#infect()
call pathogen#helptags()
