" ref: https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
" ref: https://www.chrisatmachine.com/Neovim/08-fzf/
" ref: https://gist.github.com/synasius/5cdc75c1c8171732c817
" ref: https://github.com/makccr/dot/blob/master/.config/nvim/init.vim
" ref: https://github.com/powerline/fonts

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
call plug#end()

" -------------------------------------------------------------------------------------------------
" general
" -------------------------------------------------------------------------------------------------
" Setting dark mode
set background=dark
"colorscheme torte
colorscheme molokai
set cursorline
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set copyindent
set autoread
set hidden

" smart-search
" ref: https://linuxcommando.blogspot.com/2008/06/smart-case-insensitive-incremental.html
set ignorecase
set smartcase
set incsearch

" transparent background, must present after colorscheme setting.
" ref: https://sy-base.com/myrobotics/vim/vim-transparent/
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
"highlight LineNr ctermbg=none
"highlight Folded ctermbg=none
"highlight EndOfBuffer ctermbg=none
"" change transparency if colorshceme changes.
"augroup TransparentBG
"	autocmd!
"	autocmd Colorscheme * highlight Normal ctermbg=none
"	autocmd Colorscheme * highlight NonText ctermbg=none
"	autocmd Colorscheme * highlight LineNr ctermbg=none
"	autocmd Colorscheme * highlight Folded ctermbg=none
"	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none 
"augroup END

" -------------------------------------------------------------------------------------------------
" keyword highlight
" -------------------------------------------------------------------------------------------------
set hlsearch
nnoremap <ESC><ESC> :nohl<CR>

" set Ag as the grep command
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

" -------------------------------------------------------------------------------------------------
" airline configurations
" -------------------------------------------------------------------------------------------------
" install powerline fonts from https://github.com/powerline/fonts and
" ./install.sh, set "*powerline*" font on your terminal font settings.
"let g:airline_theme='minimalist'
"let g:airline_theme='qwq'
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_powerline_fonts = 1

" -------------------------------------------------------------------------------------------------
" general keymap
" -------------------------------------------------------------------------------------------------
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR> 
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
 " SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<cr>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<cr>

" Show coc-explorer
nnoremap <silent> <space>e  :<C-u>CocCommand explorer<cr>


" -------------------------------------------------------------------------------------------------
" coc-git
" -------------------------------------------------------------------------------------------------
" ref: https://git.bytes.zone/brian/dotfiles.nix/src/commit/10a2d15e793916d4431d6e7842fccbac8e5d6b06/dotfiles/neovim.nix?lang=ru-RU
nnoremap <silent> <space>go :CocCommand git.browserOpen<cr>

" -------------------------------------------------------------------------------------------------
" vim-go 
" -------------------------------------------------------------------------------------------------
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" -------------------------------------------------------------------------------------------------
" fzf
" -------------------------------------------------------------------------------------------------
map <C-f> :Files<CR>
map <C-a> :Ag<CR>

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" Grep in contents of files, not file names by Ag.
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
