filetype plugin indent on

set expandtab
set ts=2 sts=2 sw=2
set nu
set nowrap

syntax enable

"colorscheme solarized
if has("gui_running")
  set background=light
else
  set background=dark
endif

" save with W also
:command W w
:command Wq wq
:command WQ wq

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" make command line work like bash command line
cnoremap <C-a> <Home>
cnoremap <C-d> <Delete>

" go back to the last buffer
nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-f> :CtrlP<CR>
                        
" set 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
        set t_Co=256
endif

" This beauty remembers where you were the last time you edited the file,
" and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
