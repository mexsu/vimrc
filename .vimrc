"Things to do:
" *Install vim-plug:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" *Enable/Disbale mouse
" *Change theme background color

""" General
set nocompatible 	" Don't try to be vi compatible
set title		"name of the file as title
syntax on		"enable syntax
set encoding=utf-8
set showcmd		" Show commands
set mouse=a		" Enable mouse
set clipboard+=unnamedplus
"set noswapfile		" disable swap file
"set cursorline		" Highlight line you are on

let mapleader =","	" map <leader>

"install vim-plug from https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
"Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end() " :PlugInstall

set number		" Show normal line numbers
set relativenumber	" Show numbers relative to line you are on

set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=++	" Wrap-broken line prefix
set textwidth=125	" Line wrap (number of cols)
set wildmode=longest,list,full

set belloff=all		" Disable bell
"set visualbell		" Use visual bell (no beeping)

set ruler		" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Searching
set hlsearch 	" Highlight all search results
set incsearch	" Searches for strings incrementally
set ignorecase	" Always case-insensitive
set smartcase	" Enable smart-case search
set showmatch	" Highlight matching brace

" Indent
set autoindent    " Auto-indent new lines
set smartindent   " Enable smart-indent
set shiftwidth=4  " Number of auto-indent spaces

" Visualize tab end of line
set list
set listchars=tab:›\ ,extends:>,precedes:<,eol:¬

" Unbind Q (it used to take you into Ex mode)
nnoremap Q gq

" Move between lines and wrapped-broken lines
noremap k gk
noremap j gj

" Change shortcut from Ctrl+w+hjkl to Ctrl+hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Make splits to open at the bottom and the right
set splitbelow
set splitright

" Clear search highlight with Enter after searching,n-search next,N-go to previous
nnoremap <CR> :noh<CR>

" Move line up or down with arrow keys in normal mode
nnoremap <up> ddkP
nnoremap <down> ddp

" Spell-check set to F6
nnoremap <F6> :setlocal spell! spelllang=en_us<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" To use the colorscheme in a 256-color terminal
set t_Co=256

" To use the true color mode
set termguicolors

" Setting this option does not change the background color, it tells Vim what the background color looks like
set background=dark "dark/light"

" To make colorscheme work, or comment the line below to disable colorscheme
colorscheme gruvbox
" To change the background color go to:
" ~/.vim/plugged/gruvbox/colors/gruvbox.vim - change let s:gb.dark0 = "#00000f" this value

" FINDING FILES:Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" NOW WE CAN:- Hit tab to :find by partial match
" " - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" FILE BROWSING:
" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

"netrw
filetype plugin on	"built in plugin(for netrw)
" Tweaks for browsing
let g:netrw_banner=0		" disable banner
let g:netrw_browse_split=3	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3	" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+' "press a to show hidden files
" NOW WE CAN:
" - :edit a folder to open a file browser
" netrw_browse_split=1 - <CR>/v/t to open in an h-split/v-split/tab
" netrw_browse_split=3 - <CR>/v/o to open in an tab/v-split/h-split
" gt gT move between tabs
" - check |netrw-browse-maps| for more mappings

" Change font in Gvim
if has("gui_running")
  if has("gui_win32") "windows Gvim
    set guifont=Courier\ New:h11 "set guifont=Consolas:h11:cANSI
  "elseif has("gui_gtk2")
    "set guifont=Inconsolata\ 12
  "elseif has("gui_macvim")
    "set guifont=Menlo\ Regular:h14
  endif
endif

" Add the status bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2            " set the bottom status bar

function! ModifiedColor()
        if &mod == 1
	        hi statusline guibg=White ctermfg=8 guifg=OrangeRed4 ctermbg=15
		    else
		            hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15
			        endif
				endfunction

				au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
    " default the statusline when entering Vim
    hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15

    " Formats the statusline
    set statusline=%f                           " file name
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%y      "filetype
    set statusline+=%h      "help file flag
    set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
    "modified flag

    set statusline+=%r      "read only flag

    set statusline+=\ %=                        " align left
    set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
    set statusline+=\ Col:%c                    " current column
    set statusline+=\ Buf:%n                    " Buffer number
    set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
""""""""""""""""""""""""""""""""""""""End"Status"Bar""""""""""""""""""""""""""""""""""""""""""""""""
