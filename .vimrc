" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

"==============================================================================
"   Vim-plug
"==============================================================================

set nocompatible
filetype off

"   Automate plugin installation process
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'vimwiki/vimwiki'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

"==============================================================================
"   Global
"==============================================================================

" Clean previous mapping
nnoremap <SPACE> <Nop>

" Leader Key
let mapleader=' '

"==============================================================================
"   Extensions
"==============================================================================

"------------------------------------------------------------------------------
"   TagBar
"------------------------------------------------------------------------------

nnoremap <C-n> :TagbarToggle<CR>

"------------------------------------------------------------------------------
"   Airline
"------------------------------------------------------------------------------

let g:airline#extensions#tagbar#enabled = 1
"let g:airline_theme ='lucius'
"let g:airline_theme ='raven'
"let g:airline_theme='onedark'
"let g:airline_theme ='wombat'

"------------------------------------------------------------------------------
"   Netrw
"------------------------------------------------------------------------------

" Show as tree
let g:netrw_liststyle = 3
" Set window size
let g:netrw_winsize = 20
" Directly open file in previous window
let g:netrw_browse_split = 4

"------------------------------------------------------------------------------
"   NerdCommenter
"------------------------------------------------------------------------------

" Enable file type checking
filetype plugin on

"==============================================================================
"   Search mode
"==============================================================================

"------------------------------------------------------------------------------
"   Settings
"------------------------------------------------------------------------------

" Enable smart case (first requires option ignorecase)
set ignorecase smartcase

" Highlight previous search
set hlsearch

" Do not search while typing
set noincsearch

"------------------------------------------------------------------------------
"   Mappings
"------------------------------------------------------------------------------

" Block searching
vnoremap // y/<C-R>"<CR>

" Disable highlight
nnoremap <Leader>l :nohlsearch<CR>

" Easiest word surrounding (with plugin 'vim-surround')
nmap <Leader>" ysiW"


"==============================================================================
"   Command Mode
"==============================================================================

"------------------------------------------------------------------------------
"   Settings
"------------------------------------------------------------------------------

set virtualedit=block

" Opposite of Shift-J
" nnoremap <C-J> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>

"------------------------------------------------------------------------------
"   Mappings
"------------------------------------------------------------------------------

" Remove EX mode
"unmap Q

" Formatting
"map Q gq

" Empty line without entering insert mode
nmap <A-o> o<Esc>k

" Replay last Ex command
nnoremap ^ q:k<CR>

" FZF
nnoremap <C-p> :<C-u>FZF<CR>

"==============================================================================
"   Insert Mode
"==============================================================================

"------------------------------------------------------------------------------
"   Settings
"------------------------------------------------------------------------------

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Use soft tabs (i.e spaces)
set expandtab

" Ignore in makefiles
autocmd FileType make setlocal noexpandtab

" Indent settings
set autoindent
set smartindent

" Also use quickfix window for cscope results
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

" Automatic bracket setting
"inoremap { {<CR>}<Esc>O

"------------------------------------------------------------------------------
"   Mappings
"------------------------------------------------------------------------------

""" PageUp/Down

imap <PageUp> <UP>
imap <PageDown> <DOWN>

"==============================================================================
"   Environment
"==============================================================================

"------------------------------------------------------------------------------
"   Settings
"------------------------------------------------------------------------------

""" Buffers

" Ask confirmation before closing a modified buffer
set confirm

" Do not save the buffer automatically
set noautowriteall
set noautowrite

" No hidden buffers
set nohidden

" Clipboard buffer
" set clipboard=unnamed

""" Mouse
" No mouse
set mouse=

""" Audio

" No beep and no flash
set visualbell
set t_vb=

""" Command line

" Show ongoing command in last line
set showcmd

" Redraw only when necessary
set lazyredraw

" Show matching bracket
set showmatch

"------------------------------------------------------------------------------
"   Folding
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
"   Splits
"------------------------------------------------------------------------------

""" Settings
set splitbelow
set splitright

""" Mappings

" Move in split tiles
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"------------------------------------------------------------------------------
"   Tabs
"------------------------------------------------------------------------------

""" Settings

" Maximum number of tab pages
set tabpagemax=100

""" Convert tabs to splits
" Remark: Do the opposite with built-in <C-W>T

" Splits with Previous/Next tab
function VsP()
  tabprevious
  let var = expand('%')
  tabclose
  execute "vsplit " . var
endfunction
function SpP()
  tabprevious
  let var = expand('%')
  tabclose
  execute "split " . var
endfunction
function VsN()
  tabnext
  let var = expand('%')
  tabclose
  execute "vsplit " . var
endfunction
function SpN()
  tabnext
  let var = expand('%')
  tabclose
  execute "split " . var
endfunction

command TabPrevVs   call VsP()
command TabPrevSp   call SpP()
command TabNextVs   call VsN()
command TabNextSp   call SpN()

" Diff with Previous/Next tab
function DVsP()
  call VsP()
  windo diffthis
endfunction
function DSpP()
  call SpP()
  windo diffthis
endfunction
function DVsN()
  call VsN()
  windo diffthis
endfunction
function DSpN()
  call SpN()
  windo diffthis
endfunction

command DiffTabPrevVs   call DVsP()
command DiffTabPrevSp   call DSpP()
command DiffTabNextVs   call DVsN()
command DiffTabNextSp   call DSpN()

" Move tab
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>
nnoremap <S-F8> :tabmove +1<CR>
nnoremap <S-F7> :tabmove -1<CR>

"==============================================================================
"   StatusBar
"==============================================================================

"------------------------------------------------------------------------------
"   Functions
"------------------------------------------------------------------------------
function! IsFugitive()
    let l:path = expand('%')
    if l:path == ""
        return ""
    endif
    if split(l:path,":")[0] == "fugitive"
        set nomodifiable
        set ro
        return "F"
    endif
    return ""
endfunction

function! IsModified()
    if !&modifiable
        return "[" . IsFugitive() ."-]"
    elseif &mod
        return "[" . IsFugitive() ."+]"
    endif
    return "[" . IsFugitive() ." ]"
endfunction

"------------------------------------------------------------------------------
"   Constants
"------------------------------------------------------------------------------
set noruler
set laststatus=2
set statusline=

"------------------------------------------------------------------------------
"   Left
"------------------------------------------------------------------------------

set statusline+=%{IsModified()}:    " Modified? / Readonly ?
set statusline+=%-60.60F            " File Path

"------------------------------------------------------------------------------
"   Right
"------------------------------------------------------------------------------
set statusline+=%=                  " Right side
set statusline+=%03c\ :%03v\        " XXX
set statusline+=%04l/%04L[%P]       " Current line / Total lines

"==============================================================================
"   Cosmetic
"==============================================================================

syntax enable
syntax on

"------------------------------------------------------------------------------
"   Settings
"------------------------------------------------------------------------------

" Obvious
set number
set relativenumber

" Classic backspace behavior
set backspace=indent,eol,start

" Tab menu
set wildmenu
set wildmode=list:longest

" Highlight cursor line
set cursorline
hi cursorline cterm=none term=none
highlight CursorLine guibg=#303000 ctermbg=234

"------------------------------------------------------------------------------
"   Colors
"------------------------------------------------------------------------------

" Background
set background=dark
colors default
"colors jellybeans
"colorscheme solarized
"colorscheme mustang
"colorscheme palenight

" Columns
" Color
"set colorcolumn=80,130
" Linebreak at 130
set formatoptions+=t
"set textwidth=130

"------------------------------------------------------------------------------
"   Highlighting
"------------------------------------------------------------------------------

:highlight ExtraWhitespace ctermbg=brown guibg=red
:match ExtraWhitespace /\s\+$/
:autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
:autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * match ExtraWhitespace /\s\+$/

":highlight Goil_RightCommand ctermbg=blue guibg=blue
":syntax region Goil_Command start="/if/" end="/end/"
":autocmd BufWinEnter * match Goil_Command /if/
":autocmd InsertEnter * match Goil_Command /if/
":autocmd InsertLeave * match Goil_Command /if/

" :highlight HighlightTab ctermbg=blue guibg=blue
" :match HighlightTab /\t\+/
" :autocmd BufWinEnter * match HighlightTab /\t\+/
" :autocmd InsertLeave * match HighlightTab /\t\+/

:autocmd BufWinLeave * call clearmatches()

"------------------------------------------------------------------------------
"   Invisible characters
"------------------------------------------------------------------------------
set list
set listchars=tab:▸·,nbsp:⏎,trail:␣
"set listchars=tab:▸·,nbsp:⏎,trail:·



"------------------------------------------------------------------------------
"   Tools
"------------------------------------------------------------------------------

" Remove extra space
command CleanSpace  :%s/\s\+$//g

" Autocorrect
map <silent> <F9> "<Esc>:silent setlocal spell! spelllang=fr<CR>"

" Type ?
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"==============================================================================
"   Unsorted
"==============================================================================

"No differences between real and visual lines
nnoremap j gj
nnoremap k gk

nnoremap gV `[v`]

vmap <C-T> !sed '1i\ ' \| txt2tags -H -t tex -i -
