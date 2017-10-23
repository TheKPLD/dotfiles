" indention
set ai
set sw=4
set ts=4
set et
set sta
set nu

" General settings
syntax on
filetype plugin indent on

" Extra whitespace highlighting out of insert mode
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!

" I honestly forgot what this dones
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" pathogen to source files in
" Now any plugins you wish to install can be extracted to a subdirectory under
" ~/.vim/bundle, and they will be added to the 'runtimepath'.
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
