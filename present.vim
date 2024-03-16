silent! autocmd! lspconfig
silent! LspStop

function NextExample()
  windo bn
  norm! k
endfunction

function PrevExample()
  windo bp
  norm! k
endfunction

nnoremap <right> <cmd>call NextExample()<cr>
nnoremap <left>  <cmd>call PrevExample()<cr>

autocmd WinEnter,BufEnter * setlocal statusline=%t
autocmd WinLeave,BufLeave * setlocal statusline=%{expand('%:h:t')}

set autochdir

args formatted/*/0.py
silent argdo silent vsplit
e unformatted/0.py

windo set scrollbind
norm! tK

