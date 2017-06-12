" PLUGINS
"
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'

" path finder
Plug 'ctrlpvim/ctrlp.vim'

" autocomplete
Plug 'Raimondi/delimitMate'

" commenting
Plug 'scrooloose/nerdcommenter'

" UI
Plug 'vim-airline/vim-airline'

" Search Highlight
Plug 'haya14busa/incsearch.vim'


" JavaScript

" indenting
" Plug 'pangloss/vim-javascript'
" Plug 'nathanaelkane/vim-indent-guides'

" syntax
" Plug 'jelera/vim-javascript-syntax'
" Plug 'Valloric/YouCompleteMe'
" Plug 'marijnh/tern_for_vim'

call plug#end()




" DEFINITIONS
" 
" Colors and Themes

set background=light
colorscheme PaperColor

" Leader
let mapleader = " "

"set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

augroup vimrcEx
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

    " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

    " Enable spellchecking for Markdown
    autocmd FileType markdown setlocal spell

    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    " Automatically wrap at 72 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell

    " Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" tab functions
set tabstop=4
set shiftwidth=4
set shiftround
" set expandtab

map <Leader>ss :set expandtab<CR>
map <Leader>tt :set noexpandtab<CR>


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" Numbers
set relativenumber
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
            \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" function to toggle numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
        set number
    endif
endfunc

" function to toggle highlight
function! HighlightToggle()
    if(&hls == 1)
        set nohls
    else
        set hls
    endif
endfunc

" function to toggle tab/spaces
function! TabToggle()
    if(&expandtab == 1)
        set noexpandtab
    else
        set expandtab
    endif
endfunc

" function to tab length
function! TabNum4()
    set tabstop=4
    set shiftwidth=4
endfunc

function! TabNum2()
    set tabstop=2
    set shiftwidth=2
endfunc

" Incsearch implementation
map /  :set hls<cr><Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" paste without format
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
" fix all indents
map <Leader>i mmgg=G`m
" change numbering
map <Leader>n :call NumberToggle()<cr>
" no highlight
map <Leader>h :call HighlightToggle()<cr>
" space to tabs
map <Leader>t :set noexpandtab<cr>
" tabs to space
map <Leader>s :set expandtab<cr>
" 2 tabs
map <Leader>2 :call TabNum2()<cr>
" 4 tabs
map <Leader>4 :call TabNum4()<cr>
