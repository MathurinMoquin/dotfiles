set number relativenumber tabstop=4 shiftwidth=4 autoindent
syntax on
set termguicolors
colorscheme default
set encoding=utf-8
set fileencoding=utf-8


filetype plugin on
set omnifunc=syntaxcomplete#Complete

call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set completeopt=menuone,noinsert,noselect

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ CheckBackspace() ? "\<TAB>" :
	\ coc#refresh()

"inoremap <silent><expr> <S-TAB>
	\ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"function! CheckBackspace() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1] =~# '\s'
"endfunction


"inoremap <silent><expr> <TAB> pumvisible() ? (coc#pum#selected() >= 0 ? "\<C-n>" : "\<C-n>") : "\<TAB>"
"inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


nnoremap <silent> K :call CocActionAsync('doHover')<CR>

inoremap <silent> <C-Space> :call CocActionAsync('showSignatureHelp')<CR>

highlight Pmenu      guibg=#2c2c2c guifg=#ffffff
highlight PmenuSel   guibg=#5f87ff guifg=#ffffff
highlight PmenuSbar  guibg=#444444
highlight PmenuThumb guibg=#87afff

