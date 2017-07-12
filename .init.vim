"--------------------------------------"
"
"     CONTENTS
"
"     Commands
"         Files
"         Syntax
"         Vimrc
"     Functions
"         Syntax
"     General
"         Buffers
"         Editing
"         Modes
"         Search
"         Tabs & Indents
"         Terminal
"         Text
"     Hotkeys
"         Leader
"         Buffers
"         Code
"         Editing
"         Tabs & Indents
"         Time
"         Selection
"     Plugins
"         Initialize
"         Load
"         End
"     Settings
"         Ale
"         Colorizer
"         Comfortable Motion
"         Easy Motion
"         FZF
"         IndentLine
"         Markdown
"         Multiple Cursors
"         Nerd Tree
"         Nvim Completion Manager
"     UI
"         ColorScheme
"         Devicons
"         Statusline
"         Syntax
"         Theme




"--------------------------------------"
"   Commands


"   Commands | Files
"   ~helper commands to make new files
command! Newhtml execute 'vnew' | execute 'Sethtml'
command! Newcss execute 'vnew' | execute 'Setcss'
command! Newscss execute 'vnew' | execute 'Setscss'
command! Newjs execute 'vnew' | execute 'Setjs'


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
"   ~show relative line numbers
set rnu
"   ~no end of line on new files
set noeol


"   General | Modes
"   ~get out of insert mode
inoremap jk <esc>
inoremap kj <esc>
"   ~quickly access command line
nnoremap ; :


"   General | Search
"
"   ~case intelligent search
set ignorecase
set smartcase
"   ~no highlight search result
set nohlsearch
"   ~show preview window when substituting string
set inccommand=split


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
au TermOpen * setlocal nonumber norelativenumber


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
"   ~open file explorer
map <leader>x :Explore<cr>
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
nnoremap <C-[> <C-W>5<
nnoremap <C-]> <C-W>5>


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
"   Plugins


"   Plugins | Initialize
"   ~required to start plugins block
call plug#begin('~/.config/nvim/plugged')


"   Plugins | Load
"   ~buffers
Plug 'schickling/vim-bufonly'
"   ~completion
Plug 'jiangmiao/auto-pairs'
Plug 'marijnh/tern_for_vim'
Plug 'mattn/emmet-vim'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'roxma/nvim-completion-manager'
"   ~comments
Plug 'scrooloose/nerdcommenter'
"   ~editing
Plug 'chrisbra/colorizer'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
"   ~files
Plug 'iamcco/markdown-preview.vim'
"   ~linting
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
"   ~navigation
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'
"   ~searching
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
"   ~theme
Plug 'ap/vim-buftabline'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Yggdroot/indentLine'
"   ~tmux
Plug 'christoomey/vim-tmux-navigator'
"   ~whitespace
Plug 'ntpeters/vim-better-whitespace'



"   Plugins | End
"   ~required to close plugins block
call plug#end()




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
"   ~change color of symbols
" augroup aleTheme
"   autocmd!
"   autocmd ColorScheme * hi ALEWarningSign guifg=#e5c07b
" augroup END


"   Settings | Colorizer
"   ~enable show colors
map <leader>ct :ColorToggle<cr>


"   Settings | Comfortable Motion
"   ~no default mappings
let g:comfortable_motion_no_default_key_mappings = 1
"   ~my defined mappings
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<cr>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<cr>


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


"   Settings | Nerd Tree
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


"   Settings | Nvim Completion Manager
"   ~use tab and shift tab to cycle through completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"




"--------------------------------------"
"   UI


"   UI | ColorScheme
"if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
"endif
"   ~enable cursorline
set cursorline
"   ~enable terminal italics
let g:onedark_terminal_italics = 1
"   ~enable terminal 256 colors
let g:onedark_termcolors=256
"   ~set colorscheme to onedark ... so sexy
colorscheme onedark


"   UI | Devicons
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
"   ~speed it up for syntax
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


"   UI | Statusline
set numberwidth=6
set statusline=
set statusline+=\ %4l•%-3c
set statusline+=\ %3p%%
set statusline+=\ \ \ %.60F\ %{WebDevIconsGetFileTypeSymbol()}
set statusline+=%#ErrorMsg#
set statusline+=\ %{getbufvar(bufnr('%'),'&mod')?'':''}
set statusline+=%*
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ \ 


"   UI | Syntax
"   ~no syntax highlight past 80 columns
set synmaxcol=200
"   ~change bg color after 80 columns
"execute "set colorcolumn=" . join(range(81,335), ',')


"   UI | Theme
"   ~no borders between panes
set fillchars=""
"   ~color the tildes so it looks like none
hi EndOfBuffer guifg=#282C34 ctermfg=235
"   ~file colors can use 5c6370 or 636d83
hi NERDTreeFile guifg=#636d83 gui=NONE
"   ~folder colors
hi NERDTreeDir guifg=#abb2bf gui=NONE
"   ~slash after folder names
hi NERDTreeDirSlash guifg=#282c34 gui=NONE
"   ~folder open icon color
hi NERDTreeOpenable guifg=#abb2bf gui=NONE
"   ~folder close icon color
hi NERDTreeClosable guifg=#abb2bf gui=NONE
"   ~current working directory
hi NERDTreeCWD guifg=#636d83 gui=NONE
"   ~FZF
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 guifg=#61afef guibg=#20242b
  highlight fzf2 guifg=#61afef guibg=#20242b
  highlight fzf3 guifg=#61afef guibg=#20242b
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
"   ~use Italics on comments and html/xml attributes
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
hi xmlAttrib gui=italic cterm=italic
