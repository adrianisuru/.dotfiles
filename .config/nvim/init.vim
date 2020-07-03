set hidden
set mouse=a
syntax on
filetype plugin indent on

"Dein
if &compatible
  set nocompatible
endif
filetype off
" append to runtime path
set rtp+=/usr/share/vim/vimfiles
set rtp+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))
" add packages here, e.g:
"call dein#add('qwelyt/TrippingRobot')
call dein#add('jiangmiao/auto-pairs')
"call dein#add('scrooloose/nerdtree')
"call dein#add('rakr/vim-one')
"call dein#add('sonph/onehalf', {'rtp': 'vim/'})
call dein#add('arcticicestudio/nord-vim')
"call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline')
"call dein#add('vim-airline/vim-airline-themes')
"call dein#add('lervag/vimtex')
"call dein#add('Shougo/deoplete.nvim')
"call dein#add('natebosch/vim-lsc')
"call dein#add('alvan/vim-closetag')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
"call dein#add('racer-rust/vim-racer')
call dein#add('rust-lang/rust.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('christoomey/vim-conflicted')
"call dein#add('artur-shaik/vim-javacomplete2')
"call dein#add('octol/vim-cpp-enhanced-highlight')
"call dein#add('tikhomirov/vim-glsl')
"call dein#add('dart-lang/dart-vim-plugin')
" call dein#add('arakashic/chromatica.nvim')
"call dein#add('autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash_install.sh',
"    \}
"\)
"call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

" exit dein
call dein#end()
" auto-install missing packages on startup
if dein#check_install()
  call dein#install()
endif
filetype plugin on

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"let g:deoplete#enable_at_startup=1

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
let g:gruvbox_italic=1
colorscheme nord

set statusline+=%#warningmsg#
set statusline+=%*

let g:airline_powerline_fonts = 1

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

inoremap <A-;> <Esc>la

" Highlight after 80 characters
"   highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"   match OverLength /\%>80v.\+/
    set number


" Press F12 to switch to UTF-8 encoding
nnoremap <F12> :e ++enc=utf-8<CR>

" Flush buffer
tnoremap <C-l> <C-\><C-n><C-l>i<C-l>

" Chromatica
"let g:chromatica#enable_at_startup=1
"let g:chromatica#libclang_path='/usr/lib/libclang.so'

" line at 80 col
set colorcolumn=81

" compile latex
autocmd BufNewFile,BufRead *.tex nnoremap <C-c> :w<Enter>:!pdflatex %<Enter>

let g:rustfmt_autosave=1


"call deoplete#enable()

