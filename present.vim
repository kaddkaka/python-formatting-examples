e unformatted/0.py

autocmd WinEnter,BufEnter * setlocal statusline=%t
autocmd WinLeave,BufLeave * setlocal statusline=%{expand('%:h:t')}

belowright  split formatted/yapf/0.py
belowright vsplit formatted/ruff/0.py
belowright vsplit formatted/autopep8/0.py

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

windo set scrollbind
set autochdir

silent! autocmd! lspconfig
silent! LspStop

norm! k
