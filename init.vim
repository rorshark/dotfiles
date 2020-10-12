" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

Plug 'ianks/vim-tsx'
Plug 'dikiaap/minimalist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'NLKNguyen/papercolor-theme'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Initialize plugin system
call plug#end()

" Toggle NERDTree
let mapleader = ","
nmap <leader>nt :NERDTreeToggle<cr>

" Use silver searcher for :Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Dont open first match
cnoreabbrev Ack Ack!
map <Leader>a :Ack ''<Left>

" Common typos
cnoreabbrev W w
cnoreabbrev Q q

" Copy paste
" set clipboard=unnamedplus

" CTRL-C to Copy
" vnoremap <C-C> "+y

filetype indent on
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set nu

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" Code completion
source $HOME/.config/nvim/coc.vim

" For :e completion
set wildmenu
set wildmode=longest:full,full

" CTRLP

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

set noswapfile

" prettify visualmode selection
xnoremap <Tab> :PrettierPartial<CR>

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre *.js,*.ts,*.json :call <SID>StripTrailingWhitespaces()

" Theme
set background=dark
colorscheme PaperColor

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing
