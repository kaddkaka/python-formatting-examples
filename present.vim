:e unformatted/0.py

:autocmd WinEnter,BufEnter * setlocal statusline=%t
:autocmd WinLeave,BufLeave * setlocal statusline=%{expand('%:h:t')}

:belowright  split formatted/yapf/0.py
:belowright vsplit formatted/ruff/0.py
:belowright vsplit formatted/autopep8/0.py

:norm! k

:windo set scrollbind
:nnoremap <right> <cmd>windo bn<cr>
:nnoremap <left>  <cmd>windo bp<cr>
:silent! autocmd! lspconfig
:silent! LspStop
":silent! set laststatus=3
