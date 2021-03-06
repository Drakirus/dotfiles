" Leader Mappings
let mapleader = ","

"  Virtual Environments
let g:python3_host_prog = '/usr/bin/python3'

" Add bundles
call plug#begin('~/.vim/bundle/')

" Breakdown Vim's --startuptime output
" Plug 'tweekmonster/startuptime.vim'

" Git
Plug 'tpope/vim-fugitive' " Git wrapper
nnoremap <silent> - :Gstatus<cr>:13wincmd_<cr>:call search('\v<' . expand('#:t') . '>')<cr>
au FileType gitrebase nnoremap <buffer> <silent> <c-s><c-s> :s/^#\?\w\+/squash/<cr>:noh<cr>
set diffopt+=vertical
set diffopt+=iwhiteall
autocmd FileType gitcommit startinsert
autocmd FileType gitcommit setlocal spell! spelllang=en

Plug 'whiteinge/diffconflicts'

Plug 'sodapopcan/vim-twiggy' " Git branch management
let g:twiggy_close_on_fugitive_command = 1
nnoremap _ :Twiggy<cr>
Plug 'junegunn/gv.vim' " Git commit history (integrates into twiggy)

Plug 'junegunn/vim-easy-align'
nmap ,ga <Plug>(EasyAlign)
xmap ,ga <Plug>(EasyAlign)


Plug 'airblade/vim-gitgutter'
let g:gitgutter_preview_win_floating = 0
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hs <Plug>(GitGutterPreviewHunk)
nnoremap <Leader>hS :GitGutterLineHighlightsToggle<CR>

Plug 'wincent/vcs-jump'
nmap <Leader>h <Plug>(VcsJump)

" tmux-navigator configuration
Plug 'christoomey/vim-tmux-navigator'

" searching
Plug 'pchampio/loupe'
map <leader><space> <Plug>(LoupeClearHighlight)

" searching multiple files
Plug 'wincent/ferret'
" prevent any default mapping from being configured
let g:FerretMap=0
nmap <leader>* <Plug>(FerretAckWord)
nmap <leader>E <Plug>(FerretAcks)
nnoremap g/ :Ack<space>
let g:FerretExecutableArguments = {
      \   'rg': '--vimgrep --no-heading --max-columns 4096'
      \ }

" enhances Vim's integration with the terminal
Plug 'wincent/terminus'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': '10new' }
let g:fzf_action = {
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_colors =
      \ {'fg':     ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'PreProc'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'Comment'],
      \ 'prompt':  ['fg', 'Statement'],
      \ 'pointer': ['fg', 'Comment'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Comment'],
      \ 'header':  ['fg', 'Comment'] }
imap <c-x><c-f> <plug>(fzf-complete-path)

autocmd! FileType fzf
autocmd  FileType fzf set  noshowmode noruler norelativenumber nonumber | echo ""
  \| autocmd BufLeave <buffer> set  showmode ruler relativenumber number
autocmd! User FzfStatusLine setlocal statusline=%7*\ FZF\ %*%4*

" An asynchronous fuzzy finder
let g:leaderf_install = './install.sh | sed -i "260,300 s/        if self._reverse_order/\0 and \"--popup\" in self._arguments or lfEval(\"g:Lf_WindowPosition\") == \"popup\"/" autoload/leaderf/python/leaderf/instance.py'
Plug 'Yggdroot/LeaderF', { 'do': g:leaderf_install}
nnoremap g\ :Leaderf --bottom --reverse --nameOnly rg -i <CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupShowStatusline = 1
let g:Lf_CursorBlink = 0
let g:Lf_PopupHeight = float2nr(&lines * 0.50)
let g:Lf_PopupWidth = float2nr(&columns * 0.85)
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_DefaultExternalTool = "rg"
nnoremap <silent> <C-p> :LeaderfFile --no-ignore<CR>
let g:Lf_FollowLinks = 1
let g:Lf_WorkingDirectoryMode = 'af'
let g:Lf_CacheDirectory = expand('~/.cache')
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git', 'requirements', 'pubspec.yaml']
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:Lf_StlColorscheme = 'one'
let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_PreviewResult = { 'Rg': 1 }
let g:Lf_StlPalette = {
    \ 'stlName':     {'guifg': '#F2F0EB', 'guibg': '#AF0000'},
    \ 'stlBlank':    {'guifg': '#586E75', 'guibg': '#eee8d5'},
    \ 'stlCwd':      {'guifg': '#586E75', 'guibg': '#eee8d5'},
    \ 'stlLineInfo': {'guifg': '#F9E4CC', 'guibg': '#586E75'},
    \ 'stlTotal':    {'guifg': '#F9E4CC', 'guibg': '#586E75'}
    \}
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '.svn', '.hg', '.gitlab', 'node_modules', '*egg-info'],
    \ 'file': ['*.exe', '*.so', '*.tar', '*.gz', '*.tar', '*.gz', '*.git', '*.o', '*.svn', '*.swp', '*.pyc'],
    \}
let g:Lf_CommandMap = {'<C-X>': ['<C-i>'], '<C-]>': ['<C-s>'], '<C-S>': ['<C-z>'], '<Home>': ['<C-a>'], '<End>': ['<C-e>']}
" Solarized light theme for LeaderF popup window
let g:Lf_PopupPalette = {'light': {
    \ 'Lf_hl_popup_window': {'guibg': '#f6f0dd', 'guifg': '#586e75'},
    \ 'Lf_hl_popup_inputText': {'guibg': '#eee8d5', 'guifg': '#657b83'},
    \ 'Lf_hl_match':    {'guifg': '#DC322F'},
    \ 'Lf_hl_matchRefine':    {'guifg': '#268BD2'},
    \ 'Lf_hl_cursorline': {'guifg': '#586E75'},
    \ 'Lf_hl_popup_inputMode': {'guifg': '#F2F0EB', 'guibg': '#AF0000'},
    \ 'Lf_hl_popup_total': {'guifg': '#F9E4CC', 'guibg': '#586E75'},
    \ 'Lf_hl_popup_lineInfo': {'guifg': '#F9E4CC', 'guibg': '#839496'},
    \ 'Lf_hl_popup_cwd': {'guifg': '#586E75', 'guibg': '#eee8d5'},
    \ 'Lf_hl_popup_fullPathMode': {'guifg': '#3E4452', 'guibg': '#93a1a1'},
    \ 'Lf_hl_popup_fuzzyMode': {'guifg': '#3E4452', 'guibg': '#b58900'},
    \ 'Lf_hl_popup_nameOnlyMode': {'guifg': '#3E4452', 'guibg': '#859900'},
    \ 'Lf_hl_popup_regexMode': {'guifg': '#3E4452', 'guibg': '#cb4b16'},
    \ 'Lf_hl_popup_category': {'guifg': '#3E4452', 'guibg': '#839496'},
    \ 'Lf_hl_popup_blank': {'guibg': '#eee8d5'},
    \}}

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" let g:clap_theme = 'solarized_light'

" Syntax highlight
" A collection of +70 language packs for Vim
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']
Plug 'adimit/prolog.vim'

Plug 'vimwiki/vimwiki', {'branch': 'dev'}
let g:vimwiki_auto_chdir = 1
let g:vimwiki_folding = 'syntax'
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_hl_headers = 1
au FileType vimwiki set tw=10000

"pchampion's PHD WIKI
" git clone https://github.com/lotabout/vimwiki-tpl ~/resources/vimwiki
let wiki_1 = {}
let wiki_1.path = '~/resources/wiki'
let wiki_1.path_html = wiki_1.path . '/dist'
let wiki_1.template_path= wiki_1.path_html . '/template'
let wiki_1.template_default = 'default'
let wiki_1.template_ext = '.htm'

let g:vimwiki_list = [wiki_1]

function! VimWikiMapping()
  nnoremap <Leader>wg :VimwikiAll2HTML<cr>
  nnoremap <Leader>wb :Vimwiki2HTMLBrowse<cr>
  nmap <Leader>w<space> <Plug>VimwikiToggleListItem
  vmap <Leader>w<space> <Plug>VimwikiToggleListItem
  nmap <Leader>w<BS> <Plug>VimwikiRemoveSingleCB
  nmap <Leader>wq <Plug>VimwikiVSplitLink
  nmap <Leader>wQ <Plug>VimwikiSplitLink
  map << <Plug>VimwikiDecreaseLvlSingleItem
  map <<< <Plug>VimwikiDecreaseLvlWholeItem
  map << <Plug>VimwikiDecreaseLvlSingleItem
  map <<< <Plug>VimwikiDecreaseLvlWholeItem
  map <<< <Plug>VimwikiDecreaseLvlWholeItem
  setlocal spell spelllang=en
  let b:ale_enabled = 0
  nnoremap <A-j> zr]]
  nnoremap <A-k> za
endfunction

autocmd FileType vimwiki call VimWikiMapping()

Plug 'chriskempson/base16-vim'

" syntastic
Plug 'dense-analysis/ale'
let g:ale_linters_ignore = {'vimwiki': ['']}
let g:ale_completion_enabled=0
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_virtualtext_cursor = 1
let g:ale_lint_on_enter = 0
let g:ale_list_window_size = 5
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_fix_on_save = 1
hi! link ALEErrorSign SpellBad
hi! link ALEWarningSign SpellRare

nmap <silent> <leader>dt <Plug>(ale_toggle_buffer)
nmap <leader>df ;let b:ale_fix_on_save = 0
nnoremap <silent> <leader>d<Space> :call ALEListToggle()<cr>

function! ALEListToggle()
  if g:ale_open_list
    let g:ale_open_list = 0
    lclose
    return
  else
    let g:ale_open_list = 1
    lopen
  endif
endfunction

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'markdown': ['remove_trailing_lines'],
\   'liquid': ['remove_trailing_lines'],
\   'python': ['black'],
\   'go': ['goimports'],
\   'dart': ['dartfmt'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

autocmd BufEnter * if @% =~? '^fugitive.*' | let b:ale_fix_on_save = 0 | endif
let g:ale_python_flake8_options = '--max-line-length=110 --ignore=' "E221,E241'
let g:ale_python_autopep8_options = ' --aggressive  --max-line-length 90'

" surround
Plug 'machakann/vim-sandwich'
" More conf in vim/plugin/surround.vim

" highlight yank
Plug 'machakann/vim-highlightedyank'
autocmd ColorScheme * hi HighlightedyankRegion guifg=#d33682 gui=underline,bold
let g:highlightedyank_highlight_duration = 500
" TODO remove this plugin
" https://www.reddit.com/r/neovim/comments/gofplz/neovim_has_added_the_ability_to_highlight_yanked/

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_trailing_comma = 1

" move function arguments
Plug 'AndrewRadev/sideways.vim'
nnoremap <silent> <A-.> :SidewaysRight<cr>
nnoremap <silent> <A-,> :SidewaysLeft<cr>
"argument text object.
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

Plug 'pchampio/vim-edgemotion'
" enable line number overwrite
" let g:edgemotion#line_numbers_overwrite = 1
map J <Plug>(edgemotion-j)
map K <Plug>(edgemotion-k)

" The missing motion for Vim
Plug 'justinmk/vim-sneak'
let g:sneak#prompt = 'Sneak >>> '
let g:sneak#label = 1 " EasyMotion like
let g:sneak#use_ic_scs = 1 " Case sensitivity
" S is for sandwich
nmap t <Plug>Sneak_s
nmap T <Plug>Sneak_S
" Clever-f mappings
let g:sneak#s_next = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map : <Plug>Sneak_;
" Clever-f highlight <3
autocmd ColorScheme * hi Sneak guifg=red guibg=NONE gui=bold,underline
autocmd ColorScheme * hi SneakLabel guifg=red guibg=#eee8d5 gui=bold,underline

Plug 'svermeulen/vim-yoink'
let g:yoinkMoveCursorToEndOfPaste = 1
let g:yoinkSwapClampAtEnds = 0
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" replace with register
Plug 'svermeulen/vim-subversive'
" replace with register clipboard with R
nmap R "+<plug>(SubversiveSubstitute)
nmap RR "+<plug>(SubversiveSubstituteLine)
nmap r <plug>(SubversiveSubstitute)
nmap rr <plug>(SubversiveSubstituteLine)
xmap r <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
" iE = inner entire buffer
onoremap iE :exec "normal! ggVG"<cr>
nmap <silent> <leader>e <plug>(SubversiveSubstituteWordRange)iE
nmap <silent> <leader>ee ;call sneak#cancel()<cr><plug>(SubversiveSubstituteRange)
xmap <silent> <leader>e <plug>(SubversiveSubstituteRange)iE
" cursor will not move when substitutions are applied
let g:subversivePreserveCursorPosition = 1

" Vim Exchange
Plug 'tommcdo/vim-exchange'

" Commanter
Plug 'scrooloose/nerdcommenter'
let NERDUsePlaceHolders=0
let NERDSpaceDelims=1 " add space after the comment symbol
let g:NERDCustomDelimiters = {
    \ 'gomod': { 'left' : '//'},
    \ 'c': { 'left' : '//', 'leftAlt' : '/*', 'rightAlt': '*/' },
    \ 'javascript.jsx': { 'left' : '//', 'leftAlt' : '/*', 'rightAlt': '*/' },
    \ 'caddy': { 'left' : '#' },
\ }

" <leader>u for git like undo
Plug 'simnalamburt/vim-mundo'
nnoremap <leader>u :MundoToggle<CR>
let g:mundo_width=70
let g:mundo_playback_delay=40
let g:mundo_verbose_graph=0

" insert or delete brackets
Plug 'cohama/lexima.vim'

" user Text objects
Plug 'kana/vim-textobj-user'
" https://github.com/kana/vim-textobj-user/wiki
Plug 'kana/vim-textobj-function' " funcions Text-object
Plug 'haya14busa/vim-textobj-function-syntax' " heuristic function Text-object

Plug 'jeetsukumaran/vim-pythonsense' "Python

" word-based columns Text-object
Plug 'idbrii/textobj-word-column.vim'

" stop repeating the basic movement keys
" Plug 'takac/vim-hardtime'
" let g:hardtime_default_on = 1
" let g:hardtime_showmsg = 1
" let g:hardtime_ignore_quickfix = 1
" let g:hardtime_maxcount = 4
" let g:list_of_normal_keys = ["h", "j", "k", "l"]
" let g:hardtime_ignore_buffer_patterns = [ "fugitive.*", "\.git.*"]

Plug 'christoomey/vim-tmux-runner'

autocmd FileType prolog :nnoremap <buffer> <silent> <cr> :execute "normal vip\<Plug>NERDCommenterToggle"<cr>
      \ :VtrOpenRunner {'orientation': 'h', 'percentage': 30, 'cmd': 'swipl'}<cr>
      \ :VtrSendCommand! abort. %; swipl<cr>
      \ :VtrSendCommand! [<c-r>=expand('%:r')<cr>].<cr> vip:VtrSendLinesToRunner<cr>
\ :undo<cr>

" autocmd FileType sh,bash,zsh :nnoremap <cr> mavip:VtrSendLinesToRunner<cr>`a

Plug 'lervag/vimtex'
let g:vimtex_view_general_callback = 'TermPDF'
let g:vimtex_view_automatic = 0

function! TermPDF(status) abort
  if a:status
    call system('kitty @ kitten termpdf.py ' .  b:vimtex.root . '/' . b:vimtex.name . '.pdf')
  endif
endfunction

function TermPDFClose() abort
  call system('kitty @ close-window --match title:termpdf')
endfunction

augroup VimtexTest
  autocmd!
  autocmd FileType tex :VimtexCompile
  autocmd FileType tex :Clean
  autocmd! User VimtexEventCompileStopped call TermPDFClose()
augroup end

" (Do)cumentation (Ge)nerator (leader d)
Plug 'kkoomen/vim-doge'
let g:doge_doc_standard_python = 'google'
let g:doge_mapping = '<Leader>D'

"  Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger  = "<leader><leader>"
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/snippets', 'snips', 'UltiSnips']

" Dark powered asynchronous
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1 " Use Idleboot (faster boot-time)
" pip3 install --user --upgrade pynvim

Plug 'davidhalter/jedi-vim', {'for': 'python'}
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>gd"
let g:jedi#documentation_command = "<leader>K"
let g:jedi#usages_command = "<leader>r"
let g:jedi#rename_command = "<leader>e"


Plug 'deoplete-plugins/deoplete-jedi'
let g:deoplete#sources#jedi#statement_length = 30

Plug 'Shougo/echodoc.vim', {'for':['python', 'go', 'dart']}
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

set completeopt=noinsert,menu,noselect

" LSP
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--init={"cacheDirectory": "/tmp/.cache/cquery/"}'],
    \ }
    " \ 'dart': ['$DART_SDK/dart', "$DART_SDK/snapshots/analysis_server.dart.snapshot", "--lsp"],
" \ 'go': [$GOPATH.'/bin/gopls'],

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_loggingFile = '/tmp/LSP.log'
let g:LanguageClient_changeThrottle = 0.3
let g:LanguageClient_diagnosticsList = 'Location'
let g:LanguageClient_rootMarkers = {
      \ 'dart': ['pubspec.yaml', '.git'],
      \ 'go':  ['go.mod', '.git'],
      \ 'c': ['clangd', '-background-index'],
      \ }

function! s:code_mapping()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    " Lsp mapping
    nnoremap <buffer> <silent> <leader>== :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <buffer> <silent> <leader>K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> <leader>ll :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <leader>a :call LanguageClient#textDocument_codeAction()<CR>
    nnoremap <silent> <leader>g :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>G :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
    nnoremap <silent> <leader>e :call LanguageClient#textDocument_rename()<CR>
    nnoremap <silent> <leader>r :call LanguageClient#textDocument_references()<CR>

    " format / same as ALE fix on save
    augroup LSPFormatDocument
      autocmd!
      autocmd BufWritePre <buffer> :call LanguageClient#textDocument_formatting_sync()
    augroup END

    " disable ALE
    let b:ale_enabled = 0
    let b:ale_fix_on_save = 0

    " message info
    echohl ModeMsg | echo "" | echon '-- LSP enabled --' | echohl None
    call timer_start(2000, function('execute', ['echo ""'])) " cleanup
  else
    noremap <leader>g <c-]>
  endif
endfunction

call plug#end()

" Wait until idle to run additional "boot" commands.
augroup Idleboot
  autocmd!
  if has('vim_starting')
    set updatetime=700
    autocmd CursorHold,CursorHoldI * call s:idleboot()
  endif
augroup END

function! s:idleboot() abort
  " Make sure we automatically call s:idleboot() only once.
  augroup Idleboot
    autocmd!
  augroup END

  call deoplete#enable()
  " message info
  echohl ModeMsg | echon '-- Deoplete enabled --' | echohl None
  call timer_start(2000, function('execute', ['echo ""'])) " cleanup

  call s:code_mapping()


  call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
    \})

endfunction

" Theme
set termguicolors
colorscheme base16-solarized-light
set background=light

" Make comments italic
" See terminfo database "tic" command in ./install/dotfiles:35
highlight Comment gui=italic cterm=italic

" Ignore
set wildignore+=.hg,.git,.svn                           " Version control
set wildignore+=*.aux,*.out,*.toc                       " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg          " binary images
set wildignore+=*.luac                                  " Lua byte code
set wildignore+=*.o,*.lo,*.obj,*.exe,*.dll,*.manifest   " compiled object files
set wildignore+=*.pyc                                   " Python byte code
set wildignore+=*.spl                                   " compiled spelling word lists
set wildignore+=*.sw?                                   " Vim swap files set wildignore+=*~,*.swp,*.tmp
set wildignore+=*.DS_Store?                             " OSX bullshit
set wildignore+=*.sqlite3
set wildignore+=*.so
set wildignore+=*.jar

" Required for operations modifying multiple buffers like rename.
set hidden

" above and below the cursor when scrolling
set scrolloff=3
set sidescrolloff=7

nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>

" Clipboard
let g:clipboard = {
      \ 'name': 'myClipboard',
      \     'copy': {
      \         '+': 'env COPY_PROVIDERS=desktop clipboard-provider copy',
      \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
      \     },
      \     'paste': {
      \         '+': 'env PASTE_PROVIDERS=desktop clipboard-provider paste',
      \         '*': 'env PASTE_PROVIDERS=tmux clipboard-provider paste',
      \     },
      \ }
set clipboard=unnamed   " to/from * by default (tmux only, not system), use + to access host/OSC-52 clipboard
" Yank to system clipboard with Y
nmap YY "+yy
nmap Y "+y
vmap Y "+y
" Paste from system clipboard with P
" nmap P "+p
" vmap P "+p

" highlight vertical column of cursor
set cursorline

" relativ number
set relativenumber
set number

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/
set noswapfile   " No *.swp

" store commands
set shada=!,'1,f0,h,s100
let &shadafile = expand('~/.vim/shada')

" Softtabs, 2 spaces tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set inccommand=split
" set wildoptions=pum

" 80 columns
set colorcolumn=80      " highlight the 80 column

set nowrap
" Display extra whitespace
set list listchars=tab:▸\ ,trail:·,extends:›,precedes:‹
" set list listchars=tab:\ \ ,trail:·,extends:›,precedes:‹
highlight SpecialKey ctermbg=none cterm=none

set spellfile=~/dotfiles/spell/ownSpellFile.utf-8.add

" UTF-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix

" Open vim help on the left of the screen
autocmd FileType help wincmd L
" To make vsplit put the new buffer on the right/below of the current buffer
set splitbelow
set splitright

" resizing a window split
nnoremap <S-Left> <C-w>10<
nnoremap <S-Down> <C-W>5-
nnoremap <S-Up> <C-W>5+
nnoremap <S-Right> <C-w>10>

" faster quicklist
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" navigate between errors
nnoremap <silent> ]e :lbelow<cr>
nnoremap <silent> [e :labove<cr>

"Moving lines
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
vnoremap <up>  :m '<-2<CR>gv=gv
vnoremap <Down> :m '>+1<CR>gv=gv

" Quicker navigation start - end of line
noremap H 0^
xmap H ^
omap H ^
noremap L g_

" overrides the change operations don't affect the current yank
nnoremap c "_c
nnoremap C "_C

nnoremap <leader><leader> :w!<cr>

vnoremap <silent><expr> ++ VMATH_YankAndAnalyse()

inoremap <c-l> <esc>A

noremap j gj
noremap k gk

noremap <leader>cd :lcd <c-r>=expand("%:p:h")<cr>

" no more ex Mode
nnoremap Q <nop>

" Insert New line
noremap <silent> U :call append(line('.'), '')<CR>j

" Spell-Checking
" zg add word to the spelling dictionary
" zw remove it
nnoremap <silent> <leader>sen <Esc>:silent setlocal spell! spelllang=en<CR>
nnoremap <silent> <leader>sfr <Esc>:silent setlocal spell! spelllang=fr<CR>
nnoremap <silent> <leader>sall <Esc>:silent setlocal spell! spelllang=fr,en<CR>
nnoremap <silent> <leader>sa <Esc>zg
nnoremap <silent> <leader>sd <Esc>zug
inoremap <leader>a à
inoremap <leader>u ù
inoremap <c-u> ȗ
inoremap <leader>e é
inoremap <leader>.e è
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=fr,en tw=80

" nnoremap <A-s> w[sei<C-x>s
inoremap <expr> <A-s>  pumvisible() ?  "\<C-n>" : "\<C-x>s"
nnoremap <expr> <A-s> pumvisible() ?  "i\<C-n>" : "w[sei\<C-x>s"

hi SpellBad  gui=underline guifg=#dc322f
hi SpellCap  gui=undercurl guifg=#6c71c4
hi SpellRare gui=undercurl guifg=#6c71c4
hi SpellLocal gui=undercurl guifg=#eee8d5

nnoremap ; :
vnoremap ; :
cnoreabbrev ; :
cnoremap <C-A> <Home>

vnoremap . :norm.<CR>

" --------------------------
" function
" --------------------------

" Go to the last known cursor position in a file
autocmd BufReadPost *
      \ if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') &&
      \   line("'\"") > 1 && line("'\"") < line("$") && &filetype != "svn" |
      \   exe "normal! g`\"" |
      \ endif

" Visual search mappings
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Close vim if the quickfix window or other listed window
" is the only window visible
autocmd WinEnter * call s:CloseOnlyWindow()

function! s:CloseOnlyWindow() abort
  if winnr('$') == 1
    let s:buftype =  getbufvar(winbufnr(winnr()), "&buftype")
    if s:buftype == "quickfix" || &filetype == 'twiggy' || &filetype == 'fzf'
      q
    endif
  endif
endfunction

function! RenameFile() abort
  let old_name = expand('%')
  let ext_file = expand('%:e')
  if !empty(ext_file) | let ext_file = ".".ext_file | endif
  let x = 0
  let feedkeys = ""
  while x < len(ext_file)
    let x+=1
    let feedkeys .= "\<left>"
  endwhile
  let new_name = input('New file name: ', expand('%').feedkeys, 'file')
  if isdirectory(new_name)
    let new_name = substitute(new_name, "/$", '', 'g')
    let new_name .= '/' . expand('%:t')
    let ext_file = ""
  endif
  if new_name != '' && new_name !=# old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
    echohl ModeMsg | echo "RenameFile: ".old_name. " -> " .new_name | echohl None
  endif
endfunction
nnoremap <Leader>rn :call RenameFile()<cr>

function! s:MkNonExDir(file, buf) abort
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir) | call mkdir(dir, 'p') | endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
