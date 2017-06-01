""""""""""""""""""""""""
"   $CONTENTS
"
"   $COMMANDS
"   $FUNCTIONS
"   $GENERAL
"   $HOTKEYS
"   $PLUG_INIT
"   $PLUG_SETTINGS
"   $UI
"   $WIKI
"


""""""""""""""""""""""""
"   $COMMANDS
"


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
command! Vimrc execute 'e $MYVIMRC'


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
"


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


"    Help
augroup vimrcHelp
  autocmd!
  "   ~always open help in vsplit
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd H | endif
  "   ~show line numbers in help docs
  autocmd FileType help setlocal rnu
augroup END


"   Search
"   ~show search pattern as I type it
set incsearch
"   ~allow case insensitive search
set ignorecase
"   ~if caps use caps etc
set smartcase
"   ~don't highlight search results
set nohlsearch
"   ~use incremental search
set inccommand=split


"   Shell
"   ~set default shell to bash
set shell=/bin/zsh
"   ~get out of terminal mode
tnoremap kj <C-\><C-n>


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


"   ~fallback if tern not present
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
"   ~allow jsx in normal js files
let g:jsx_ext_required = 0


"   Tabs & Indents
set smarttab
"   ~number of spaces for tab key
set tabstop=2
"   ~number of spaces for autoindent
set shiftwidth=2
"   ~use spaces for tab key
set expandtab
"   ~copy indent from previous line
set autoindent
"   ~do smart autoindenting on new line
set smartindent


"   Text
"   ~no text wrapping
set nowrap
"   ~treat underscores as keywords
"set iskeyword-=_


"   Undo
"   ~limit undo levels
set undolevels=30


""""""""""""""""""""""""
"   $HOTKEYS
"


"   ~define hotkey lead command
let g:mapleader = ','


"   Code : HTML
"   ~paste tag below
map <leader>pb vatygv<c-[>o<cr><c-[>pvat=kdd
"   ~join tag
nnoremap <leader>jt JxJx<c-[>0w
"   ~prepend html attribute
map <leader>pa 0wea<Space>
"   ~append html attribute
map <leader>aa 0w%i<Space>
"   ~append class
map <leader>ac 0/class<cr>/"<~cr>ni<Space>
"   remove first html attribute
map <leader>ra 0wewdt"da"<Esc>


"   General
"   ~show commands
set noshowcmd
"   ~delete current buffer
map <leader>d :bd<cr>
"   ~exit current buffer
map <leader>e :exit<cr>
"   ~quit current window
map <leader>q :q<cr>
"   ~open file explorer
map <leader>x :Explore<cr>
"   ~reload current buffer
map <leader>r :e<cr>
"   ~source current file
map <leader>o :so%<cr>
"   ~save current buffer
map <leader>s :w<cr>
"   ~because lazy
nnoremap ; :
"   ~move normally when text wraps
nnoremap j gj
nnoremap k gk
"   ~get out of insert mode
inoremap jk <esc>
inoremap kj <esc>
"   ~go to end of line in insert mode
inoremap <c-e> <esc>A


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


"   Time
"   ~insert times stamp
inoremap <special> <F3> <c-r>=strftime('%c')<CR>


"   Windows
"   ~quickly move between and resize buffers
nnoremap <C-Tab> :bprevious<cr>
nnoremap <C-S-Tab> :bNext<cr>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-[> <C-W>5<
nnoremap <C-]> <C-W>5>


""""""""""""""""""""""""
"   $PLUG_INIT
"

call plug#begin('~/.config/nvim/plugged')


"   Buffers
Plug 'ap/vim-buftabline'                " buffers as tabs : )
Plug 'BufOnly.vim'                      " Delete all except current buffer


"   Completion
Plug 'jiangmiao/auto-pairs'             " Autopairs
Plug 'mattn/emmet-vim'                	" Emmet
Plug 'othree/jspc.vim'                  " JS Parameter Complete
Plug 'marijnh/tern_for_vim'
Plug 'Shougo/deoplete.nvim',            { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs',        { 'do': 'npm install -g tern' }


"   Files
Plug 'iamcco/markdown-preview.vim'
Plug 'tyru/open-browser.vim'            " Open buffer in browser


"   Git
Plug 'airblade/vim-gitgutter'           " Show diffs in gutter
Plug 'tpope/vim-fugitive'				        " Git


"   Navigation
Plug 'scrooloose/nerdtree'              " Nerd tree
Plug 'scrooloose/nerdcommenter'         " Nerd commenter


"   Search
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'


"   Syntax
Plug 'cakebaker/scss-syntax.vim'        " SCSS
Plug 'csscomb/vim-csscomb'              " CSS Comb
Plug 'hail2u/vim-css3-syntax'           " CSS
Plug 'othree/html5.vim'                 " HTML
Plug 'mxw/vim-jsx'                      " Jsx
Plug 'pangloss/vim-javascript'          " Javascript
Plug 'neomake/neomake'                  " Neomake
Plug 'sbdchd/neoformat'                 " Neoformatter


"   Terminal
Plug 'christoomey/vim-tmux-navigator'   " Use same keys for switching panes in tmux


"   Text
Plug 'easymotion/vim-easymotion'        " Easy motions!
Plug 'godlygeek/tabular'                " Align text
Plug 'matze/vim-move'                   " Move text
Plug 'ntpeters/vim-better-whitespace'	  " Remove whitespace
Plug 'sickill/vim-pasta'                " Paste with proper indents
Plug 'tommcdo/vim-exchange'             " Easily exchange text
Plug 'tpope/vim-surround'               " Surround


"   UI
Plug 'chrisbra/colorizer'               " Show hex colors
Plug 'joshdick/onedark.vim'             " Atom theme
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'     " yes
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yuttie/comfortable-motion.vim'    " Scrolling


call plug#end()


""""""""""""""""""""""""
"   $PLUG_SETTINGS
"
"   Airline
"   ~disable all extensions
"let g:airline_extensions = []
"let g:airline_theme='monochrome'
"
"   Buftabline
"   ~custom colors
augroup buftablineTheme
  autocmd!
  autocmd ColorScheme * hi BufTabLineCurrent guibg=#282c34 guifg=#6494ed
  autocmd ColorScheme * hi BufTabLineActive guibg=#282c34 guifg=#636d83
  autocmd ColorScheme * hi BufTabLineHidden guibg=#282c34 guifg=#636d83
  autocmd ColorScheme * hi BufTabLineFill guibg=#282c34 guifg=#636d83
augroup END
"   ~show modified flag
let g:buftabline_indicators = 1


"   Comfortable Scrolling
"   ~no default mappings
let g:comfortable_motion_no_default_key_mappings = 1
"   ~my defined mappings
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<cr>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<cr>


"    Deoplete
"   ~enable at startup
let g:deoplete#enable_at_startup = 1
"   ~but don't populate unless I say so
let g:deoplete#disable_auto_complete = 1
"   ~autocomplete remove delay
let g:deoplete#auto_complete_delay = 40
"   ~hook into omnifunc
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete',
      \ 'jspc#omni'
      \]

"   ~use ctrl-space to omnifunc complete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>


"   ~use tern.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
"   ~kill that preview section once I'm done typing
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"   ~tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"


"   Devicons
"   ~default file icon
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
"   ~default folder icon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
"   ~custom file icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''
"   ~adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
"   ~remove extra padding after icon
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
"   ~on vimrc source, refresh the devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif


"   Devicons Syntax Highlight
"   ~speed it up
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = [
      \ 'css',
      \ 'html',
      \ 'js',
      \ 'json',
      \ 'jsx',
      \ 'md',
      \ 'php',
      \ 'rb',
      \ 'scss',
      \ 'sql',
      \]


"   Colorizer
"   ~enable show colors
map <leader>ct :ColorToggle<cr>


"   Easy Motion
"   ~use default mapping
"   ~<Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-bd-f)


"   Easy Motion + Incsearch Fuzzy Finder
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzyword#converter()],
        \   'modules': [incsearch#config#easymotion#module()],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


"   FZF
"   ~set runtime path
set rtp+=~/.fzf
"   ~note: use <ctrl-c> to exit the below
"   ~set default usage.
nnoremap <c-p> :FZF<cr>
"   ~look in project files not node modules etc.
nnoremap <c-g> :GFiles<cr>
"   ~search for [query] within buffers
nnoremap <c-b> :Buffers<cr>
"   ~search for [query] within current buffer lines
nnoremap <c-f> :BLines<cr>
"   ~mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"   ~insert mode completion
imap <c-f><c-k> <plug>(fzf-complete-word)
imap <c-f><c-f> <plug>(fzf-complete-path)
imap <c-f><c-j> <plug>(fzf-complete-file-ag)
imap <c-f><c-l> <plug>(fzf-complete-line)


"   Git Gutter
"   ~disable by default
let g:gitgutter_enabled = 0
"   ~always show the column
let g:gitgutter_sign_column_always = 1
"   ~set my own bg color
"let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_modified_removed = '|'


"   Markdown
"   ~set path to chrome
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
"   ~don't close on switch to different buffer
let g:mkdp_auto_close = 0


"    Lightline
""   ~custom options
"let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ }

"   Multiple cursors
"   ~enable custom mapping
let g:multi_cursor_use_default_mapping = 0
"   ~and these are the defaults
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
"   ~and this is mine
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>


"   Nerdtree
"   ~show hidden files by default
let NERDTreeShowHidden = 1
"   ~expandable icon - glyphs from SauceCodePro_Nerd_Font
let g:NERDTreeDirArrowExpandable = ''
"   ~collapsible icon - glyphs from SauceCodePro_Nerd_Font
let g:NERDTreeDirArrowCollapsible = ''
"   ~change working directory
let g:NERDTreeChDirMode = 2
"   ~force minimal UI
let g:NERDTreeMinimalUI = 1
"   ~show line numbers
let g:NERDTreeShowLineNumbers = 0
"   ~hide cursorline
let g:NERDTreeHighlightCursorline = 0
"   ~don't collapse only one child
let g:NERDTreeCascadeSingleChildDir = 0
"   ~toggle nerd tree
map <leader>nt :NERDTreeToggle<cr>
"   ~nerdtree custom colors
augroup nerdtree_theme
  autocmd!
  "   ~file colors can use 5c6370 or 636d83
  autocmd ColorScheme * hi NERDTreeFile guifg=#636d83 gui=NONE
  "   ~folder colors
  autocmd ColorScheme * hi NERDTreeDir guifg=#abb2bf gui=NONE
  "   ~slash after folder names
  autocmd ColorScheme * hi NERDTreeDirSlash guifg=#282c34 gui=NONE
  "   ~folder open icon color
  autocmd ColorScheme * hi NERDTreeOpenable guifg=#abb2bf gui=NONE
  "   ~folder close icon color
  autocmd ColorScheme * hi NERDTreeClosable guifg=#abb2bf gui=NONE
  "   ~current working directory
  autocmd ColorScheme * hi NERDTreeCWD guifg=#636d83 gui=NONE
augroup END


"   Neomake
"   ~use eslint for react
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']


  "      YouCompleteMe
  "  "   ~triggers for html and css
  "  let g:ycm_semantic_triggers = {
  "        \   'html': ['<', '"', '</', ' '],
  "        \   'css': [ 're!^\s{2}', 're!:\s+' ],
  "        \ }
  "  set pumheight=24
  "  set completeopt-=preview


""""""""""""""""""""""""
"   $UI
"
"   ~title
set title
"   ~allow switching through modified buffers
set hidden
"   ~set friendlier mappings
nnoremap ) :bnext<cr>
nnoremap ( :bprevious<cr>
nnoremap <leader>w :bdelete<cr>


"   Comments
"   ~italics for comments
augroup italicsOn
  autocmd!
  autocmd ColorScheme * hi Comment gui=italic cterm=italic
  autocmd ColorScheme * hi htmlArg gui=italic cterm=italic
  autocmd ColorScheme * hi xmlAttrib gui=italic cterm=italic
augroup END


"   Cursor
"   ~highlight cursor line
set cursorline
"   ~keep X lines away from top and bottom
set scrolloff=5
"   ~keep X lines away from left and right
set sidescrolloff=5


"   Editing
"   ~enable moving accurately through whitespace
set virtualedit=all


"   Font
"   ~yea buddy
"set guifont=OperatorMonoSSm_Nerd_Font:h15
"   ~set lineheight
set linespace=5


"   Gutter
"   ~darken gutter color
"augroup guttertheme
"  autocmd!
"  autocmd ColorScheme * hi SignColumn ctermbg=darkgrey
"  autocmd ColorScheme * hi SignColumn guibg=darkgrey
"augroup END
"   ~set number width
set numberwidth=6


"   MatchParen
"   augroup matchparen_theme
"     autocmd!
"     autocmd ColorScheme * hi MatchParen guibg=NONE guifg=NONE gui=underline
"   augroup END


"   Numbers
"   ~show relative line numbers
set rnu
"   ~change color of current line number
augroup linetheme
  autocmd!
  autocmd ColorScheme * hi LineNr guifg=#3a404c gui=NONE
augroup END


"   Status line
"   ~show status line
set laststatus=2
"   ~statusline code from: https://gabri.me/blog/diy-vim-statusline
"   ~from here
let g:currentmode = {
      \ 'n'  : 'normal ',
      \ 'no' : 'n·Operator Pending ',
      \ 'v'  : 'visual ',
      \ 'V'  : 'v·line ',
      \ '' : 'v·block',
      \ 's'  : 'select ',
      \ 'S'  : 'S·line ',
      \ '' : 'S·block',
      \ 'i'  : 'insert ',
      \ 'R'  : 'r ',
      \ 'Rv' : 'v·Replace ',
      \ 'c'  : 'command ',
      \ 'cv' : 'vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'prompt ',
      \ 'rm' : 'more ',
      \ 'r?' : 'confirm ',
      \ '!'  : 'shell ',
      \ 't'  : 'terminal ' }
" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! User2 guibg=#181A1F guifg=#e5c07b'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! User2 guibg=#181A1F guifg=#e5c07b'
  elseif (mode() ==# 'i')
    exe 'hi! User2 guibg=#181A1F guifg=#61afef'
  else
    exe 'hi! User2 guibg=#181A1F guifg=#e5c07b'
  endif
  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head().' '
  else
    return ''
endfunction

function! FileChanged()
  if &modified
    return '  '
  else
    return ''
endfunction

"   ~color for unsaved buffer icon
autocmd ColorScheme * hi User1 guibg=#282C34 guifg=#e5c07b
"   ~color for current buffer mode icon
"autocmd ColorScheme * hi User2 guibg=#282C34 guifg=#61afef
set laststatus=2
set statusline=
"   ~current mode
"set statusline+=%{ChangeStatuslineColor()}
"set statusline+=%0*\ \ \ \ %{toupper(g:currentmode[mode()])}  " OFF
"set statusline+=%*
"   ~buffer number
"set statusline+=%8*\ [%n]
"   ~buffer branch
"   ~buffer filepath
"   ~buffer is modified
"set statusline+=%M
set statusline+=%1*\ \ \ %{FileChanged()}
set statusline+=%*
set statusline+=%0*%f\ %{ReadOnly()}
"set statusline+=%0*\%l:\%c\                       " linenumber : column
"   ~buffer
"set statusline+=%8*\ %w\                                    " File+path
"   ~buffer has syntax errors
"set statusline+=%#warningmsg#                               " Highlight group start
"set statusline+=%{SyntasticStatuslineFlag()}                " Syntastic errors
"set statusline+=%*                                          " Highlight group end
"   ~file type details
set statusline+=%0*\ %=                                      " Space
"set statusline+=%0*\%{(&fenc!=''?&fenc:&enc)}\(%{&ff})\     " Encoding & Fileformat
set statusline+=%0*\%{toupper(&fenc!=''?&fenc:&enc)}\        " Encoding & Fileformat OFF
"set statusline+=%0*\ %y\                                    " FileType
set statusline+=%0*\ %-3(%{FileSize()}%)                     " File size
set statusline+=%0*\ %l:\%c\ %3p%%\ \ \                        " Rownumber/total (%)
"   ~to here
"   ~highlight statusline bg color
"   ~alternate color for bg is #181A1F
"   ~just make it always look like a comment #5c6370
augroup statusline_theme
  autocmd!
  autocmd ColorScheme * hi StatusLine guifg=#636d83 guibg=#282C34 ctermbg=236
  autocmd ColorScheme * hi StatusLineNC guifg=#636d83 guibg=#282C34 ctermbg=236
augroup END

"set termguicolors
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
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
"endif
"   ~use italics on terminal
let g:onedark_terminal_italics = 1
"   ~cursor change shape per modes
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
"   ~use this colorscheme
colorscheme onedark


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
"   ~no borders between panes
set fillchars="vert:|"
autocmd ColorScheme * hi VertSplit guifg=#181A1F cterm=NONE ctermfg=235
"   ~color the tildes so it looks like none
hi EndOfBuffer guifg=#282C34 ctermfg=235
"#181A1F


""""""""""""""""""""""""
"   $WIKI
"   ~collection of temporary notes
"

"   On chaining commands.
"   Use 'pipe' (|) to separate do commands in order, like this:
"   command! Newhtml execute 'vnew' | execute 'Sethtml'

"   On deleting in insert mode.
"   Type 'ctrl-w' to delete a word.
"   Type 'ctrl-h' to delete a character.

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

"   On tern js.
"   You need to start tern before starting vim. Open a new terminal
"   type 'tern', it should say listening on node whatever, and then
"   restart vim. shazam.

"   On default shell.
"   Not setting the (set shell=/bin/bash) option correctly was
"   breaking syntastic, and a few others things making non-issues
"   issues, note for future vim install to set this correctly.

"   On multiple cursors.
"   You actually don't need them... try this. Visually select some
"   text, then hit (cgn), meaning change (whatever g means) next.
"   Once you've typed the change, hit (.) to repeat the command.
"   awesome sauce! (cgN) would go backwards, and it works with undos.

"   On Nerd Tree.
"   You can use 'e' to open the highlighted directory in a new split
"   and use 'o' to open the file in the current window, really nice
"   for workflow.

"   On using FZF.
"   Install like this 1.) https://github.com/junegunn/fzf#using-git,
"   2.) set rtp+=~/.fzf 3.)

"   On using Airline and patched fonts.
"   In terminal, make sure you set your terminal font in preferences
"   to Source_Code_Pro or whatever patched font you are using.

"   On YouCompleteMe
"   In CSS, SCSS make sure to type control space. Still not sure how
"   to use HTML autocopmleteion...

"   On <C-h> being stupid
"   https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work

"   On Indents
"   Use 'cc' to enter correct indent level on any given line.
"   Use 'S' to substitue a line with correct indent level.
"   Use 'C' to change line from cursor current position.

"   On profiling Vim.
"   :profile start profile.log
"   :profile func *
"   :profile file *P"
"   do your stuff
"   :profile pause
"   :wq

"   On moving between windows.
"   Ctrl-w H,J,K,L will move current buffer to specificed direction.
"   Ctrl-w v, will split vertically.
"   Ctrl-w s, will split horizontally.

"   On CSScomb
"   be sure to install it using npm i csscomb -g.
"   and set a project file too.
"   https://github.com/csscomb/csscomb.js

"   On key repeating
"   defaults write NSGlobalDomain KeyRepeat -int 0

"   On finder titlebar path
"   run command: defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder

"   On ternjs
"   Use this in your home directory. This is referencing this base
"   configuration: https://atom.io/packages/atom-ternjs.
"   {
"     'ecmaVersion': 6,
"     'libs': [
"       'browser',
"       'jquery'
"     ],
"     'plugins': {
"       'complete_strings': {
"         'maxLength': 15
"       },
"       'node': {},
"       'doc_comment': {
"         'fullDocs': true,
"         'strong': true
"       }
"     }
"   }
