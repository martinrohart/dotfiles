"""

" -- plugin settings, everything that affects how a plugin works

scriptencoding utf-8
set encoding=utf-8


" ALE {{{

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_save = 1

" Enable both ESlint and stylelint in jsx (styled-components)
" let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
" let g:ale_linter_aliases = {'jsx': 'css'}

" }}}


" Deoplete {{{

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set completeopt-=preview
let g:deoplete#sources = {}


" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1


" UltiSnips
let g:UltiSnipsSnippetsDir = $HOME . '/.config/nvim/'
let g:UltiSnipsEditSplit = 'vertical'


" JavaScript
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
\ 'tern#Complete',
\ 'jspc#omni'
\]

let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 0
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif


" elm
if exists('g:plugs["elm-vim"]')
  let g:deoplete#omni#functions.elm = ['elm#Complete']
  let g:deoplete#omni#input_patterns.elm = '[^ \t]+'

  let g:elm_format_autosave = 1
endif



" PureScript
if exists('g:plugs["purescript-vim"]')
  let g:deoplete#omni#input_patterns.purescript = '[^ \t]+'
endif

" }}}


" goyo.vim {{{

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux set pane-border-status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nocursorline
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set nocursorline
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}


" Haskell {{{

" neco-ghc
if exists('g:plugs["neco-ghc"]')
  let g:haskellmode_completion_ghc = 1
  let g:necoghc_enable_detailed_browse = 1
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
endif


" haskell-vim
if exists('g:plugs["haskell-vim"]')
  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  let g:haskell_indent_case = 2             " two spaces for indentation
endif

" }}}


" JavaScript {{{

" allow jsx in normal JavaScript files
let g:jsx_ext_required = 0

" I use ESlint for Flow, disable the plugin typechecking
let g:flow#enable = 0

" use locally installed Flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" }}}


" Neoformat {{{

" use formatprg if possible
let g:neoformat_try_formatprg = 1
" let g:neoformat_verbose = 1

" JavaScript
let g:neoformat_enabled_javascript = ['prettier']

" CSS
let g:neoformat_enabled_css = ['prettier']

" SASS
let g:neoformat_enabled_scss = ['prettier']

" JSON
let g:neoformat_enabled_json = ['prettier']

" Haskell
let g:neoformat_enabled_haskell = ['hindent', 'stylish-haskell']

" }}}


" NERDTree {{{

" path to bookmarks
let NERDTreeBookmarksFile=expand("$HOME/.config/nvim/NERDTreeBookmarks")

" Open NERDTree when opening a directory or just starting Neovim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" }}}


" PureScript {{{

let g:psc_ide_syntastic_mode = 2

" }}}


" Reason {{{
augroup filetype_reason
  autocmd!

  let g:neoformat_reason_refmt80 = {
  \ 'exe': 'refmt',
  \ 'args': ['--print-width 80'],
  \ 'replace': 0,
  \ 'stdin': 1,
  \ 'no_append': 1
  \ }

  let g:neoformat_enabled_reason = ['refmt80']
augroup END

" }}}


" SuperTab {{{

let g:SuperTabCrMapping=1

" }}}
