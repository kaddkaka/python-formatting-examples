rm -r black
rm -r yapf
rm -r yapf-google
rm -r yapf-facebook
rm -r yapf-yapf
cp -rT unformatted black
cp -rT unformatted yapf
cp -rT unformatted yapf-google
cp -rT unformatted yapf-facebook
cp -rT unformatted yapf-yapf

time black --line-length=80 black
echo "^^^^^^^^^^^^^^^^^^ Black ^^^^^^^^^^^^^^^^^^"

time yapf -i --recursive yapf
echo "^^^^^^^^^^^^^^^^^^ yapf ^^^^^^^^^^^^^^^^^^"

time yapf -i --recursive --style=google yapf-google
echo "^^^^^^^^^^^^^^^^^^ yapf-google ^^^^^^^^^^^^^^^^^^"

time yapf -i --recursive --style=facebook yapf-facebook
echo "^^^^^^^^^^^^^^^^^^ yapf-facebook ^^^^^^^^^^^^^^^^^^"

time yapf -i --recursive --style=yapf yapf-yapf
echo "^^^^^^^^^^^^^^^^^^ yapf-yapf ^^^^^^^^^^^^^^^^^^"

# globstar is not sorted per directory
#nvim **/*.py
fd .py | xargs nvim -S <(cat << EOF
:e unformatted/0.py
:belowright sb black/0.py
:belowright split yapf/0.py
:belowright split yapf-google/0.py
:belowright vsplit yapf-facebook/0.py
:norm! k
:belowright vsplit yapf-yapf/0.py
:windo set scrollbind
:nnoremap <right> <cmd>windo bn<cr>
:nnoremap <left> <cmd>windo bp<cr>
:autocmd! lspconfig
:LspStop
":set laststatus=3
EOF
)



#cp python/examples{,_yapf}.py
#cp python/examples_yapf{,_facebook}.py
#cp python/examples_yapf{,_google}.py
#cp python/examples_yapf{,_yapf}.py


#yapf -i --style yapf python/examples_yapf_yapf.py
