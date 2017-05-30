set number
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-S-Right> :bnext<CR>
nnoremap <C-S-Up> :bprev<CR>
"Tab management"
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>
" Split pane management"
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-S-Down> :split<CR>
nnoremap <C-S-Left> :vsplit<CR>

nnoremap <C-S-s> <Esc>:w<CR>
" Nerd tree "
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-m><C-m> :NERDTreeToggle<CR>

filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
hi CursorLine   cterm=NONE ctermbg=black

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
set mouse=a
filetype plugin indent on
set ignorecase

set t_Co=256
let s:lightmode=0
syntax on
" set background=dark

function! ToggleSolarized()
    if s:lightmode == 1
       let g:solarized_termcolors=256
        syntax enable
        let s:lightmode=2
        set background=dark
        colorscheme solarized
        let g:solarized_contrast="normal"
    elseif s:lightmode == 0
      let g:solarized_termcolors=256
        syntax enable
        let s:lightmode=1
        set background=light
        colorscheme solarized
        let g:solarized_contrast="high"
    else  
        syntax on
        let s:lightmode=0
        set background=dark

    endif
endfunction

set pastetoggle=<F2>
set showmode
map <F3> :mksession! ~/vim_session <cr>
map <F4> :source ~/vim_session <cr>
map <F5> :set invnumber<CR>
map <F6> :call ToggleSolarized()<cr>
