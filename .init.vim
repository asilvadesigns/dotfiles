"--------------------------------------"
"
"     CONTENTS
"
"     Plugins
"         Initialize
"         Load
"         End
"     Commands
"         Files
"         Syntax
"         Text
"         Vimrc
"     Functions
"         Syntax
"     General
"         Buffers
"         Editing
"         Files
"         Help
"         MatchParen
"         Modes
"         Omnifunc
"         Search
"         Tabs & Indents
"         Terminal
"         Text
"     Hotkeys
"         Leader
"         Buffers
"         Code
"         Copy & Paste
"         Editing
"         Files
"         Tabs & Indents
"         Time
"         Selection
"     Settings
"         Ale
"         Buftabline
"         Colorizer
"         Comfortable Motion
"         Deoplete
"         Easy Motion
"         FZF
"         IndentLine
"         Markdown
"         Multiple Cursors
"         NERDTree
"         Neoformat
"         Nvim Completion Manager
"         OpenBrowser
"         Python Syntax
"         Tern
"         VimFiler
"     UI
"         ColorScheme
"         Devicons
"         Statusline
"         Syntax
"         Theme




"--------------------------------------"
"   Plugins


"   Plugins | Initialize
if &compatible
  set nocompatible               " Be iMproved
endif
"   ~required:
set rtp+=/Users/aas/.cache/dein/repos/github.com/Shougo/dein.vim
"   ~required:
if dein#load_state('/Users/aas/.cache/dein')
  call dein#begin('/Users/aas/.cache/dein')
  "   ~let dein manage dein
  call dein#add('/Users/aas/.cache/dein/repos/github.com/Shougo/dein.vim')
  "   ~buffers
  call dein#add('schickling/vim-bufonly')
  "   ~completion
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('mattn/emmet-vim')
  "call dein#add('roxma/nvim-completion-manager')
  "call dein#add('roxma/nvim-cm-tern', {'build': 'npm install'})
  "
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('ternjs/tern_for_vim', { 'build': 'npm install' })
  call dein#add('carlitux/deoplete-ternjs')
  "
  "   ~comments
  call dein#add('scrooloose/nerdcommenter')
  "   ~editing
  call dein#add('chrisbra/colorizer')
  call dein#add('godlygeek/tabular')
  call dein#add('junegunn/goyo.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tommcdo/vim-exchange')
  call dein#add('tpope/vim-surround')
  "   ~files
  call dein#add('iamcco/markdown-preview.vim')
  call dein#add('tyru/open-browser.vim')
  "   ~linting
  call dein#add('sbdchd/neoformat')
  call dein#add('w0rp/ale')
  "   ~navigation
  "call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/unite.vim')
  "call dein#add('yuttie/comfortable-motion.vim')
  "   ~searching
  call dein#add('easymotion/vim-easymotion')
  call dein#add('haya14busa/incsearch-easymotion.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('junegunn/fzf', { 'build': './install', 'rtp': '' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('rking/ag.vim')
  call dein#add('brooth/far.vim')
  "   ~syntax
  call dein#add('StanAngeloff/php.vim')
  "call dein#add('cakebaker/scss-syntax.vim')
  "call dein#add('hail2u/vim-css3-syntax')
  call dein#add('kh3phr3n/python-syntax')
  call dein#add('mxw/vim-jsx')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('rust-lang/rust.vim')
  call dein#add('stephpy/vim-yaml')
  "   ~theme
  call dein#add('asilvadesigns/atom-theif')
  call dein#add('mhartington/oceanic-next')
  call dein#add('tyrannicaltoucan/vim-deep-space')
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('ap/vim-buftabline')
  call dein#add('joshdick/onedark.vim')
  call dein#add('ryanoasis/vim-devicons')
  "call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('Yggdroot/indentLine')
  "   ~tmux
  call dein#add('christoomey/vim-tmux-navigator')
  "   ~whitespace
  call dein#add('ntpeters/vim-better-whitespace')
  "   ~required
  call dein#end()
  call dein#save_state()
endif

"   ~required:
filetype plugin indent on
syntax enable

"   ~if you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"   ~if you update a plugin and need to resource it...
"   ~use this `call dein#recache_runtimepath()`




"--------------------------------------"
"   Commands


"   Commands | Files
"   ~helper commands to make new files
command! Newhtml execute 'vnew' | execute 'Sethtml'
command! Newcss execute 'vnew' | execute 'Setcss'
command! Newscss execute 'vnew' | execute 'Setscss'
command! Newjs execute 'vnew' | execute 'Setjs'
"   ~set vim current directory to current buffer directory
command! GoBufferDir execute ':lcd %:p:h'
command! GoDesktop execute ':cd ~/Desktop'
command! GoGithub execute ':cd ~/Desktop/Github'
command! GoHome execute ':cd ~'
command! GoProjects execute ':cd ~/Desktop/Projects'
command! GoSites execute ':cd ~/Sites'


"   Commands | Text
"   ~clear all empty lines
command! DeleteAllEmptyLines execute 'g/^$/d'
"   ~make selection titlecase
command! MakeAllTitleCase execute ':%s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g'
"   ~soft wrap text toggle
command! WrapToggle execute ':set wrap! linebreak!'



"   Commands | Syntax
"   ~helper commands to set syntax
command! Sethtml execute 'set ft=html'
command! Setcss execute 'set ft=css'
command! Setscss execute 'set ft=scss'
command! Setjs execute 'set ft=javascript'


"   Commands | Vimrc
"   ~quickly open vimrc
command! Vimrc execute 'e $MYVIMRC'




"--------------------------------------"
"   Functions


"   Functions | Syntax
"   ~detect syntax
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"   Functions | NERDTree
"""   ~check if NERDTree is open or active
""function! s:isNERDTreeOpen()
""  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
""endfunction
""
"""   ~Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"""   ~file, and we're not in vimdiff
""function! s:syncTree()
""  if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
""    NERDTreeFind
""    wincmd p
""    return
""  endif
""endfunction




"--------------------------------------"
"   General


"   General | Buffers
"   ~allow switching through modified buffers
set hidden


"   General | Editing
"   ~don't show last command
set noshowcmd
"   ~load plugins for file types
filetype plugin on
"   ~if file changes: reload
set autoread
"   ~set file encoding to UTF8
set encoding=utf8
"   ~moving as expected through whitespace
set virtualedit=all
"   ~move through whitespace as expected
nnoremap j gj
nnoremap k gk
"   ~show relative line numbers
set rnu
"   ~no end of line on new files
set noeol


"   General | Files
"   ~don't use swapfile
set noswapfile


"   General | Help
"   ~always open help docs to the right with numbers : )
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif | setlocal rnu
augroup END


"   General | Modes
"   ~don't use nomatchparen
let loaded_matchparen = 1

"   General | Modes
"   ~get out of insert mode
inoremap jk <esc>
inoremap kj <esc>
"   ~quickly access command line
nnoremap ; :


"   General | Omnifunc
"   ~set omnifunc to complete CSS
augroup omnifuncs
  autocmd!
  autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end


"   General | Search
"   ~case intelligent search
set ignorecase
set smartcase
"   ~no highlight search result
set nohlsearch
"   ~show preview window when substituting string
"set inccommand=split


"   General | Tabs & Indents
"   ~reference #2 in options.txt under 'tabstop'
set tabstop=2
set shiftwidth=2
set expandtab
"   ~indent as expected
set autoindent
set copyindent
set smartindent


"   General | Terminal
"   ~set default shell
set shell=/bin/zsh
"   ~quickly get out of terminal mode
tnoremap kj <C-\><C-n>
"   ~hide numberlines
au TermOpen * setlocal nu norelativenumber


"   General | Text
"   ~no text wrapping
set nowrap




"--------------------------------------"
"   Hotkeys


"   Hotkeys | Leader
"   ~set leader mapping
let g:mapleader = ','


"   Hotkeys | Buffers
"   ~delete current buffer
map <leader>w :bd<cr>
"   ~delete current buffer without saving
map <leader>d :bd!<cr>
"   ~exit current buffer
map <leader>e :exit<cr>
"   ~quit current window
map <leader>q :q<cr>
"   ~close current window
 map <leader>x <C-w>c<cr>
"   ~reload current buffer
map <leader>r :e<cr>
"   ~source current file
map <leader>o :so%<cr>
"   ~save current buffer
map <leader>s :w<cr>
"   ~quickly move between buffers
nnoremap ) :bnext<cr>
nnoremap ( :bprevious<cr>
"   ~quickly move between panes
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
"   ~quickly resize panes horizontally
nnoremap <C-[> <C-W>5<
nnoremap <C-]> <C-W>5>
"   ~quickly resize panes vertically.. hmm
"nnoremap <C-k> <C-W>5+
"nnoremap <C-j> <C-W>5-


"   Hotkeys | Code | HTML
"   ~paste tag below
nnoremap <leader>pb vatygv<c-[>o<cr><c-[>pvat=kdd
"   ~join tag
nnoremap <leader>jt JxJx<c-[>0w
"   ~prepend html attribute
nnoremap <leader>pa 0wea<Space>
"   ~append html attribute
nnoremap <leader>aa 0w%i<Space>
"   ~append class
nnoremap <leader>ac 0/class<cr>/"<~cr>ni<Space>
"   remove first html attribute
nnoremap <leader>ra 0wewdt"da"<Esc>


"   Hotkeys | Copy & Paste
"   ~copy paste like it should be
vnoremap <C-c> "*y<cr>


"   Hotkeys | Editing
"   ~go to end of line in insert mode
inoremap <c-e> <esc>A


"   Hotkeys | Tabs & Indents
"   ~behave as expected
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


"   Hotkeys | Time
inoremap <special> <F3> <c-r>=strftime('%c')<CR>


"   Hotkeys | Selection
"   ~quickly select all
map <leader>va ggVG




"--------------------------------------"
"   Settings


"   Settings | Ale
"   ~disable by default, enable with `ALEEnable`
let g:ale_enabled = 0
let g:ale_lint_on_enter = 0
"   ~always show column
let g:ale_sign_column_always = 0
"   ~change default symbols
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
"   ~custom error message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"   Settings | Buftabline
"   ~enable modified flag
let g:buftabline_indicators=1
"   ~show ordinal numbers (left to right)
let g:buftabline_numbers=2
"   ~use hotkeys to jump to buffers
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


"   Settings | Colorizer
"   ~enable show colors
map <leader>ct :ColorToggle<cr>


""   Settings | Comfortable Motion
""   ~no default mappings
"let g:comfortable_motion_no_default_key_mappings = 1
""   ~my defined mappings
"nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<cr>
"nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<cr>
"
"


"    Settings | Deoplete
"   ~use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
set pumheight=10
set completeopt=longest,menuone
"   ~enable at startup
let g:deoplete#enable_at_startup = 1
"   ~disable auto completions
let g:deoplete#disable_auto_complete = 0
"   ~use smartcase.
let g:deoplete#enable_smart_case = 1
"   ~custom markers, aka 'icons'
call deoplete#custom#set('omni',          'mark', '⌾')
call deoplete#custom#set('ternjs',        'mark', '')
call deoplete#custom#set('jedi',          'mark', '')
call deoplete#custom#set('vim',           'mark', '⌁')
call deoplete#custom#set('neosnippet',    'mark', '⌘')
call deoplete#custom#set('tag',           'mark', '⌦')
call deoplete#custom#set('around',        'mark', '↻')
call deoplete#custom#set('buffer',        'mark', 'ℬ')
call deoplete#custom#set('tmux-complete', 'mark', '⊶')
call deoplete#custom#set('syntax',        'mark', '♯')


"   Settings | Easy Motion
"   ~easy motion fuzzy finder
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzyword#converter()],
        \   'modules': [incsearch#config#easymotion#module()],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction
"   ~use default mapping for f
nnoremap <leader>f <Plug>(easymotion-bd-f)
"   ~sexy search with space
nnoremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


"   Settings | FZF
"   ~set runtime path
set rtp+=~/.fzf
"   ~set options
let $FZF_DEFAULT_OPS .= ' --no-height'
"   ~NOTE: use <ctrl-c> to exit the below
"   ~set default usage.
nnoremap <C-p> :FZF<cr>
"   ~look in project files not node modules etc.
nnoremap <C-g> :GFiles<cr>
"   ~search for [query] within buffers
nnoremap <C-b> :Buffers<cr>
"   ~search for [query] within current buffer lines
nnoremap <C-f> :BLines<cr>
"   ~search for [query] within loaded buffer lines
"nnoremap <C-f> :Lines<cr>
"   ~mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"   ~insert mode completion
imap <c-f><c-k> <plug>(fzf-complete-word)
imap <c-f><c-f> <plug>(fzf-complete-path)
imap <c-f><c-j> <plug>(fzf-complete-file-ag)
imap <c-f><c-l> <plug>(fzf-complete-line)


"   Settings | IndentLine
"   ~set disable by default
let g:indentLine_enabled=0
"   ~set default character
let g:indentLine_char = ''
"   ~set default character color
let g:indentLine_color_gui = '#353a46'


"   Settings | Markdown
"   ~set path to chrome
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
"   ~don't close on switch to different buffer
let g:mkdp_auto_close = 0


"   Settings | Multiple Cursors
"   ~enable custom mapping
let g:multi_cursor_use_default_mapping = 0
"   ~and these are the defaults
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
"   ~and this is mine
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>


""   Settings | NERDTree
""    ~show on open
""au StdinReadPre * let s:std_in=1
""au VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif
""   ~show hidden files by default
"let NERDTreeShowHidden = 1
""   ~expandable icon - glyphs from SauceCodePro_Nerd_Font
"let g:NERDTreeDirArrowExpandable = ''
""   ~collapsible icon - glyphs from SauceCodePro_Nerd_Font
"let g:NERDTreeDirArrowCollapsible = ''
""   ~change working directory
"let g:NERDTreeChDirMode = 2
""   ~force minimal UI
"let g:NERDTreeMinimalUI = 1
""   ~show line numbers
"let g:NERDTreeShowLineNumbers = 0
""   ~hide cursorline
"let g:NERDTreeHighlightCursorline = 0
""   ~don't collapse only one child
"let g:NERDTreeCascadeSingleChildDir = 0
""   ~toggle nerd tree
"map <leader>nt :NERDTreeToggle<cr>
""   ~highlight currently open buffer in NERDTree
""autocmd BufEnter * call s:syncTree()


"   Settings | Nvim Completion Manager
"   ~don't be rude
"let g:cm_auto_popup = 0
" "   ~use tab and shift tab to cycle through completions
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"   Settings | OpenBrowser
   "~define google chrome
"let g:openbrowser_browser_commands = [
      "\   {'name': '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome',
      "\    'args': ['start', '{browser}', '{uri}']}
      "\]
"   ~command to current file in browser
command! OpenBrowserCurrent execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')


"   Settings | Python Syntax
"   ~enable all
let python_highlight_all = 1


"   Settings | Tern
"   ~if it exists
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  au FileType javascript setlocal omnifunc=tern#Complete
endif


"   Settings | VimFiler
"   ~use as default file explorer
let g:vimfiler_as_default_explorer = 1
"   ~add devicons to vimfilers
let g:webdevicons_enable_vimfiler = 1
"   ~modify indentation
let g:vimfiler_tree_indentation = 2
"   ~default tree leaf icon
let g:vimfiler_tree_leaf_icon = ""
"   ~default tree opened icon
let g:vimfiler_tree_opened_icon = ""
"   ~default tree closed icon
let g:vimfiler_tree_closed_icon = ""
"   ~change default directory
let g:vimfiler_enable_auto_cd = 1
"   ~default profile
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 1,
      \ '-auto-cd' : 1
      \ })
"   ~don't hide dotfiles
let g:vimfiler_ignore_pattern = []
"   ~define custom hotkeys
"nnoremap <leader>f :VimFiler -winwidth=35 -toggle -split -simple -auto-cd -status -no-quit<cr>
nnoremap <leader>f :VimFiler<cr>
"   ~because muscle memory..
nnoremap <leader>nt :VimFilerExplorer<cr>
"   ~don't use ctrl-l in vimfiler
autocmd FileType vimfiler nunmap <buffer> <C-l>




"--------------------------------------"
"   UI


"   UI | ColorScheme
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"   ~set colorscheme
colorscheme atomtheif

" "if (empty($TMUX))
"   if (has("nvim"))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" "endif
" "   ~enable cursorline
set nocursorline
" "   ~enable terminal italics
" let g:onedark_terminal_italics = 1
" "   ~enable terminal 256 colors
" let g:onedark_termcolors=256
" "   ~set colorscheme to onedark ... so sexy
" colorscheme onedark


"   UI | Devicons
"   ~set updatetime so new files in NERDTree get updated
"set updatetime=250
"   ~default file icon
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
"let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
"   ~default folder icon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
"   ~custom file icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['php'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ds_store'] = ''
"   ~adding the flags to NERDTree
"let g:webdevicons_enable_nerdtree = 1
"   ~no brackets
"let g:webdevicons_conceal_nerdtree_brackets = 1
"   ~remove extra padding after icon
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
"   ~on vimrc source, refresh the devicons
"if exists('g:loaded_webdevicons')
  "call webdevicons#refresh()
"endif
"   ~speed it up for syntax
"let g:NERDTreeSyntaxDisableDefaultExtensions = 1
"let g:NERDTreeDisableExactMatchHighlight = 1
"let g:NERDTreeDisablePatternMatchHighlight = 1
"let g:NERDTreeSyntaxEnabledExtensions = [
      "\ 'css',
      "\ 'html',
      "\ 'js',
      "\ 'json',
      "\ 'jsx',
      "\ 'md',
      "\ 'php',
      "\ 'rb',
      "\ 'scss',
      "\ 'sql',
      "\]


"   UI | Statusline
"   ~enable it
set laststatus=2
"   ~define function for filename
function! FileName()
  let ext=tolower(expand("%:e"))
  return ext
endfunction
"set numberwidth=4
set statusline=
"set statusline+=\ %04l
"set statusline+=\ •\ %3c
"set statusline+=\ •\ %3p%%
"set statusline+=\ \ \ %.30F\ %{WebDevIconsGetFileTypeSymbol()}
"set statusline+=\ •\ %t\ %{WebDevIconsGetFileTypeSymbol()}
"set statusline+=\ \ \ %t
set statusline+=\ %.40F
set statusline+=\ •\ %l
set statusline+=:\%p%%
"set statusline+=:\%-4c
"set statusline+=%#ErrorMsg#
set statusline+=\ %{getbufvar(bufnr('%'),'&mod')?'':''}
"set statusline+=%*
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\ \|\ %{&fileformat}
"set statusline+=\ \|\ %y
set statusline+=\ %y
set statusline+=\ \ 


"   UI | Syntax
"   ~no syntax highlight past 80 columns
set synmaxcol=120
"   ~change bg color after 80 columns
"execute "set colorcolumn=" . join(range(81,335), ',')
"   ~enable colorcolumn


" "   UI | Theme
" "   ~no borders between panes
set fillchars=""
" "   ~color the tildes so it looks like none
" "hi EndOfBuffer guifg=#282C34 ctermfg=235
" "   ~file colors can use 5c6370 or 636d83
" "hi NERDTreeFile guifg=#636d83 gui=NONE
" "   ~folder colors
" "hi NERDTreeDir guifg=#abb2bf gui=NONE
" "   ~slash after folder names
" "hi NERDTreeDirSlash guifg=#282c34 gui=NONE
" "   ~folder open icon color
" "hi NERDTreeOpenable guifg=#abb2bf gui=NONE
" "   ~folder close icon color
" "hi NERDTreeClosable guifg=#abb2bf gui=NONE
" "   ~current working directory
" "hi NERDTreeCWD guifg=#636d83 gui=NONE
" "   ~buffer splits
" "set fillchars+=vert:
" set fillchars=
" "   ~color of pane split - use 282c34 or 20242b
" hi VertSplit guibg=#282c34
" "   ~BUFTABLINE
" "hi BufTabLineCurrent guibg=#282c34 guifg=#6494ed
" "hi BufTabLineActive guibg=#282c34 guifg=#3f4658
" "hi BufTabLineHidden guibg=#282c34 guifg=#3f4658
" "hi BufTabLineFill guibg=#282c34 guifg=#3f4658
" hi BufTabLineCurrent guibg=#2a60c4 guifg=#ffffff
" hi BufTabLineActive guibg=#4d80df guifg=#ffffff
" hi BufTabLineHidden guibg=#4d80df guifg=#ffffff
" hi BufTabLineFill guibg=#4d80df guifg=#ffffff
" "   ~FZF
" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 guifg=#61afef guibg=#20242b
"   highlight fzf2 guifg=#61afef guibg=#20242b
"   highlight fzf3 guifg=#61afef guibg=#20242b
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction
" autocmd! User FzfStatusLine call <SID>fzf_statusline()
" "   ~use Italics on comments and html/xml attributes
" hi Comment gui=italic cterm=italic
" hi htmlArg gui=italic cterm=italic
" hi xmlAttrib gui=italic cterm=italic
" "   ~STATUSLINE - use 282c34 or 20242b
" hi StatusLine guibg=#282c34
" hi StatusLineNC guibg=#282c34 guifg=#3f4658
" hi LineNr guifg=#3f4658
" hi ErrorMsg guibg=#282c34
" "   ~MATCH PARENS
" "hi MatchParen guibg=#e06c75 guifg=#20242b
