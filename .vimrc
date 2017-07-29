" Tabs
set  tabstop=2
set shiftwidth=2
set expandtab

set nocompatible               " be iMproved
filetype off                   " required!
let mapleader = ","
" Global variables {{{
let s:isWindows = has('win32') || has('win64')
"}}}
" Commands timeout {{{
" Mapping commands delay
set timeoutlen=1000
" Make Escape faster or any key code
set ttimeoutlen=0
"}}}

" Basic configuration {{{
  set encoding=utf-8
  if has("gui_macvim") || has("unix")
    set list "required by listchars
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
    set showbreak=↪
  elseif has("gui_win32")
    set list "required by listchars
    set listchars=tab:▸\ ,eol:¬,extends:╞,precedes:╡
    set showbreak=→
  endif
  set visualbell
  set splitbelow
  set splitright
  set title
  " Enable mouse 
  set mouse=a
" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

  augroup trailing
      au!
      if has("gui_macvim")
        au InsertEnter * :set listchars-=trail:⌴
        au InsertLeave * :set listchars+=trail:⌴
      elseif has("gui_win32")
        au InsertEnter * :set listchars-=trail:□
        au InsertLeave * :set listchars+=trail:□
      endif
  augroup END
" Clean trailing whitespace
nnoremap <leader>tt mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" }}}

" Saving and Auto saving {{{
  " augroup autosave
  "   au!
  "   au InsertLeave * :update
  " augroup END
  " Save shortcut
  nnoremap s :w<cr>
  " nnoremap :w<cr> :call input("NOPE!")<cr>
  " Save when losing focus
  " au FocusLost * :silent! wall
" }}}
"
" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}

" Custom mappings {{{
" faster way to change to normal mode
inoremap jk <ESC>
" Kill the buffer
nnoremap K :q<cr>
nnoremap <leader>p "+p
" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" Close all the buffers except this one
nnoremap <leader>o :only<cr>
" Set F12 for setting paste and nopaste
set pastetoggle=<F12>
nnoremap <F5> :e!<cr>
" }}}

" CommandT config {{{
" Use root directory the pwd of vim
" It does not search for git or mercurial in the parent dirs
let g:CommandTTraverseSCM = 'pwd'
" }}}

" Netrc  management {{{ 
" Open vertical explorer
nnoremap <leader>xv :Vexplore!<cr>
"Open horizontal explorer
nnoremap <leader>xs :Sex<cr>
" Open explorer in current buffer
nnoremap <leader>xx :Ex<cr>
" }}}

" Fugitive mappings {{{
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>ge :Gedit<cr>
" }}}

" Directional Keys {{{

" It's 2015.
noremap j gj
noremap k gk
noremap gj j
noremap gk k
"}}}

" Jumping {{{
" Keep jumps in the middle of the window
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
nnoremap <c-6> <c-6>zz

" }}}

 " Font {{{
  if has("gui_macvim")
    set guifont=Monaco:h12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
"}}}

" Configure Search and matches {{{
set hlsearch
set incsearch
set smartcase   "Match uppercase when they are written in search
set ignorecase  "Ignore case when searching
" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
"}}}

" Change the cursor in insert mode"

" first, enable status line always
 set laststatus=2

" now set it up to change the status line based on mode
 if version >= 700
   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl
   " guisp=Magenta
   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2
   ""   gui=bold,reverse
 endif

 " Pathogen bundle manager
 execute pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Color scheme
Plugin 'ovu/badwolf'

" My Bundles here:
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'Valloric/YouCompleteMe'
" Required for go
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'

" Snipmate and its dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" For Raml files
Plugin 'IN3D/vim-raml'
" Json files
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-jdaddy'
Plugin 'kopischke/vim-fetch'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'

" Better copy paste for vim
Plugin 'svermeulen/vim-easyclip'

" Needed for Omnisharp
" Plugin 'tpope/vim-dispatch'

" Scala
Plugin 'derekwyatt/vim-scala'

" Haskell
Plugin 'eagletmt/ghcmod-vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/vimproc.vim'
call vundle#end()

filetype plugin indent on     " required!

 " Numbers
set number

 " Colors
 "set t_Co=256
syntax on
if has('gui_running')
   set lines=999 columns=999
   set background=dark
   colorscheme badwolf
   " Reload the colorscheme whenever we write the file.
   augroup color_badwolf_dev
       au!
       au BufWritePost badwolf.vim color badwolf
   augroup END
else
     set t_Co=256
     set background=dark
   if !s:isWindows
     colorscheme badwolf
   else
     colorscheme distinguished
   endif
endif

" Buffers and windows
set splitright

" Source Vimrc after saving it"
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Pressing ,v opens vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Edit files rapidly {{{
nmap <leader>ev :vsplit $MYVIMRC<CR>
nmap <leader>ep :vsplit ~/.profile<CR>
nmap <leader>et :vsplit ~/.tmux.conf<CR>
nmap <leader>em :vsplit ~/.muttrc<CR>
" }}}

" Pressing leader sv sources the vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Set status line
set statusline=[%02n]\ %f

" Set shortcuts for vimdiff
if &diff
  map <leader>1 : diffget 1 <CR>
  map <leader>2 : diffget 2 <CR>
  map <leader>3 : diffget 3 <CR>
  map <leader>4 : diffget 4 <CR>
endif


" Windows navigation {{{
 map <C-h> <C-w>h
 map <C-l> <C-w>l
 map <C-j> <C-w>j
 map <C-k> <C-w>k
" }}}

if has("gui_macvim") || has("gui_win32")
   set cursorline
endif
" show cursorline
"augroup CursorLineOnlyInActiveWindow
"  autocmd!
"  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  autocmd WinLeave * setlocal nocursorline
"augroup END

 " Set cursorline color
"highlight CursorLine  ctermfg=white ctermbg=23

 " Allow backspace to delete existing text
 set backspace=indent,eol,start

 " Select the last text that was paste
 nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

 " Hide the toolbar and menu when in UI
 set guioptions-=m
 set guioptions-=T

 " Commandt configurations
" let g:CommandTHighlightColor = 'green'
 " Commandt exclude directories
 set wildignore +=bower_components
 set wildignore +=node_modules
 set wildignore +=dist
 set wildignore +=testresults

 " EasyGrep configuration
 let g:EasyGrepFilesToExclude='bower_components,node_modules,.tmp,.git,*.swp,packages'
 let g:EasyGrepCommand=1 "ack
 let g:EasyGrepRecursive=1 "yes
 let g:EasyGrepSearchCurrentBufferDir=1 "No

 " Enable matchit: match the start and end of code blocks, e.g html elements
 runtime macros/matchit.vim

 " JSHINT configuration"
 let $JS_CMD='node'

"  JSCS {{{
"  Use jshint and jscsrc
"autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jshint']
" autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']
" Default recommendet settings for Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"  }}}

" Haskell Config {{{
" let g:syntastic_haskell_checkers = ['ghc-mod']
noremap T :HdevtoolsType <cr>
au FileType haskell nnoremap <buffer> <F1> :GhcModType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <silent> ti :GhcModInfo!<CR>
au FileType haskell nnoremap <buffer> <silent> ts :GhcModSplitFunCase!<CR>
au FileType haskell nnoremap <buffer> <silent> tc :GhcModSigCodegen!<CR>
au FileType haskell nnoremap <buffer> <silent> te :GhcModTypeInsert!<CR>
au FileType haskell nnoremap <buffer> <silent> tf :GhcModInfoPreview!<CR>

" Configure YouCompleteMe with neco
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" Avoid error of module not found with hdevtools
function! FindCabalSandboxRoot()
  return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
  return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

let g:syntastic_haskell_hdevtools_args = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()
" let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()

" }}}

" Haskell files {{{
augroup ft_haskell
    au!
    " Haskell completion with neco
    let g:haskellmode_completion_ghc = 0
    au FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" Vim {{{

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" Json {{{
augroup ft_json
    au!
    au FileType json setlocal foldmethod=syntax
    au FileType help setlocal textwidth=78
    " let g:vim_json_syntax_conceal = 0 " Disable conceal for the plugin vim json
augroup END
"}}}
" Javascript {{{
augroup ft_javascript
    au!
    " The color column should be in sync with jshint. Change this value when jshint default changes 
    au FileType javascript setlocal colorcolumn=120 
augroup END
" }}}
"
" Custom Grep {{{

vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr> \| :execute "normal! n" <cr>
function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "Ggrep" . shellescape(@@) . " ."
    copen
    let @/ = escape(@@, '\\/.*$^~[]''')
    "Redraw so it looks good after showing results
    silent execute "redraw!"
endfunction

command! -nargs=1 Gg call s:GrepText(<f-args>) | execute "normal! /".<f-args>."\<cr>"
function! s:GrepText(text)
    execute "Ggrep ".a:text
    copen
endfunction
" }}}
"
" Fugitive configuration {{{
command! -nargs=0 Gs execute "Gstatus"
command! -nargs=0 Gb execute "Gblame"
command! -nargs=0 Gw execute "Gwrite"
command! -nargs=0 Gl execute "Glog"
command! -nargs=0 Gp execute "Gpush"
command! -nargs=0 Gc execute "Gcommit"
" }}}
"
" Control P configuration {{{
" Set custom file scanner: root, file listing
let g:ctrlp_user_command = ['.git','cd %s && git ls-files && git ls-files -o --exclude-standard']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
"}}}
"
" Syntax highlighting {{{
  " Syntax highlighting javascript libraries
  let g:used_javascript_libs = 'angularjs'
" }}}

" Improved unimpaired {{{
" Show matches in the middle of the window
nnoremap [q :cprevious<cr>zz
nnoremap ]q :cnext<cr>zz
" }}}

" Configure AutoPairs {{{
" Disable center line when cr is pressed 
let g:AutoPairsCenterLine = 0
" }}}

" Emmet plugin configuration {{{
imap <Leader>e <C-Y>,
"
" }}}

" YouCompleteMe plugin configureation {{{
" Disable TAB for autocompletion because TAB is used by SnipMate
let g:ycm_key_list_select_completion = ['<Down>'] 
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
" Disable the preview window when completing with ycm
set completeopt = "menu"
" " }}}"
" Go Vim plugin configuration {{{
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
" Show documentation
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" Show type info
au FileType go nmap <Leader>gi <Plug>(go-info)
" Custom mappings
au FileType go nmap <leader>d <Plug>(go-describe)
au FileType go nmap <leader>i <Plug>(go-implements)
au FileType go nmap <leader>a <Plug>(go-callers)
" Configure syntastic plugin to avoid it builds everytime a file is saved
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
" Required to get the type information
let g:go_auto_type_info = 1
" Linter configuration
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" Disable K to show dodoc. K is to kill buffer!
let g:go_doc_keywordprg_enabled = 0
" }}}

" Omnisharp configuraiton {{{
let g:syntastic_cs_checkers = ['issues', 'semantic']
" }}}

" Easy file navigation with gf when file extension is missing {{{
augroup suffixes
    autocmd!

    let associations = [
                \["javascript", ".js,.javascript,.es,.esx,.json,.jsx"],
                \["python", ".py,.pyw"]
                \]

    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
  augroup END
" }}}

" Easy Clip configuration  {{{
" Do not use <C-P> and <C-p>
let g:EasyClipUsePasteToggleDefaults = 0

nmap ]p <plug>EasyClipSwapPasteForward
nmap [p <plug>EasyClipSwapPasteBackwards

" Show yanks to paste
nnoremap <leader>i :IPaste<cr>
" Persist yanks ans share between vim instances
let g:EasyClipShareYanks=1
"}}}
" Better Next textobject {{{
" Stolen from Steve Losh 
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
"
" Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
" }}}

" NeoComplete {{{
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'haskell' : $HOME.'/.haskell_completions'
      \}

" }}}
