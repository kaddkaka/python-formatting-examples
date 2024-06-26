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

format "ruff"  "ruff format --line-length=80 --preview"
format "autopep8"   "autopep8 -i --recursive --max-line-length=80 ."
format "autopep8a"  "autopep8 -i --recursive --max-line-length=80 . --aggressive"
format "autopep8aa" "autopep8 -i --recursive --max-line-length=80 . --aggressive --aggressive"

# Indents some lists very strangely
#format "yapf"     "yapf -i --recursive ." "
#[tool.yapf]
#based_on_style = \"google\"
#column_limit = 80
#indent_width = 4
#split_penalty_for_added_line_split = 1000
#spaces_around_subscript_colon = true"

# Uninteresting in comparison with ruff format
#format "black" "black --line-length=80 ."
#format "pyink" "pyink --line-length=80 ."

# Does not do enough formatting
#format "fixit" "fixit fix -a"
#format "autoflake" "autoflake -ir ."

LC_ALL=1 ls unformatted/*.py formatted/*/*.py | xargs -o $EDITOR -S present.vim
