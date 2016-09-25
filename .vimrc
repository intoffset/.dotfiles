"" .vimrc

"" Initialization
set nocompatible
filetype off
filetype plugin indent off

"" Appearance option
set number
set ruler
set list
set listchars=tab:>-,trail:_
set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
if exists('&ambiwidth')
  set ambiwidth=double
endif

"" Insert option
set cindent
set ts=4 sts=4 sw=4 expandtab
set backspace=indent,eol,start

"" Cursor key option
set whichwrap=b,s,h,l,<,>,[,],~

if has("autocmd")
  augroup vimrcEx
    au!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
endif

"" Command line option
set showcmd
set history=50

"" Search option
set ignorecase
set smartcase
set incsearch

"" Diff original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

"" Toggle mouse mode
nnoremap <F12> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

"" Color scheme
colorscheme torte
set background=light

"" Dein
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#end()

"" Filetype on
filetype plugin indent on
