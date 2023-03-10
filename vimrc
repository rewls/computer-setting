" Load defaults.vim
" see :h defaults.vim
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim


set packpath+=~/.vim/pack/
set number
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set relativenumber
set autowriteall

" Set cursor shape for insert mode and replace mode
" See VT10X escape sequences or cursorshape in config.h
let &t_SI = "\<ESC>[6 q"
let &t_EI = "\<ESC>[2 q"
let &t_SR = "\<ESC>[4 q"
" To enable folding in markdown
let g:markdown_folding = 1


" Set <C-c> to copy selected text using xclip
vmap <C-c> y:call system("xclip -selection clipboard", getreg("\""))<CR>


" vim-colors-github plugin (https://github.com/cormacrelf/vim-colors-github)
" Set colorscheme
colorscheme github


" vim-translator plugin (https://github.com/voldikss/vim-translator)
" Set target language
let g:translator_target_lang='ko'

" markdown-preview.nvim plugin
" (https://github.com/iamcco/markdown-preview.nvim)
let g:mkdp_browser = 'firefox'


" Goyo plugin (https://github.com/junegunn/goyo.vim)
" Ensure :q to quit even when Goyo is active
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
     if b:quitting_bang
       qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
