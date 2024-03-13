#!/usr/bin/env bash

format () {
  local tool=$1
  local cmd=$2
  local pyproject=$3
  local dir="formatted/${tool}"
  rm -rf $dir
  mkdir -p $dir
  cp unformatted/*.py $dir
  echo "all:
	$2" > $dir/Makefile
  echo "$3" > $dir/pyproject.toml
  (cd $dir && command time -f %U make)
  echo "^ Tool: $tool"
  echo "----------------------------------------"
}

format "ruff"     "ruff format --line-length=80"
format "yapf"     "yapf -i --recursive ." "
[tool.yapf]
based_on_style = \"google\"
column_limit = 80
indent_width = 4
split_penalty_for_added_line_split = 1000
spaces_around_subscript_colon = true"

# globstar is not sorted per directory
#nvim **/*.py
fd .py | xargs -o $EDITOR -S <(cat << EOF
:e unformatted/0.py
:belowright  split formatted/yapf/0.py
:belowright vsplit formatted/ruff/0.py

:windo set scrollbind
:nnoremap <right> <cmd>windo bn<cr>
:nnoremap <left> <cmd>windo bp<cr>
:silent! autocmd! lspconfig
:silent! LspStop
":silent! set laststatus=3
EOF
)
