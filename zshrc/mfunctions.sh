#!/bin/zsh

# Function

function run() {
	$@ & disown
}

function runq() {
	run $@
	e
}

function asm() {
   local file="$1"
   local name="${file%.asm}"
   local outp="${name}.o"
   nasm -f elf64 "$file" -o "$outp" && ld "$outp" -o "$name"
}

function pyenv() {
   mkdir $1
   python3 -m venv $1
   source $1/bin/activate
   cd $1
}

function bn() {
   sudo brightnessctl -d "intel_backlight" set $1%
}

function c() {
   cl
   fastfetch
}

function cmk() {
   mkdir $1
   cd $1
}

function z() {
   unzip $1
   mkdir $1:0:-4
   cd $1:0:-4
}
