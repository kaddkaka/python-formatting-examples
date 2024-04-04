nnoremap <right> <cmd> windo bn <bar> wincmd k <cr>
nnoremap <left>  <cmd> windo bp <bar> wincmd k <cr>

" Buffer local setting, will "reset" when stepping through examples
autocmd WinEnter,BufEnter * setlocal statusline=%t
autocmd WinLeave,BufLeave * setlocal statusline=%{expand('%:h:t')}

args formatted/*/0.py
silent argdo silent vsplit
e unformatted/0.py

windo set scrollbind
wincmd =
norm! tK

set autochdir

