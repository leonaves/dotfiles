colorscheme darkblue        " awesome colorscheme

syntax enable               " enable syntax processing

set tabstop=2               " number of visual spaces per TAB

set softtabstop=2           " number of spaces in tab when editing

set number                  " line numbers on

set expandtab               " tabs are spaces

set showcmd                 " show command in bottom bar

filetype indent on          " load filetype-specific indent files

set wildmenu                " visual autocomplete for command menu

set lazyredraw              " redraw only when we need to.

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight with \<space>
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

