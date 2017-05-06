" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Color Scheme
Plug 'w0ng/vim-hybrid'

" Start
Plug 'mhinz/vim-startify'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Programming
Plug 'Valloric/MatchTagAlways'
Plug 'Shougo/echodoc.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}


" Usability
Plug 'pixelastic/vim-undodir-tree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'dietsche/vim-lastplace'
Plug 'Raimondi/delimitMate'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax enable

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid

" Airline

    " Vim-Airline
    function! AirlineInit()
        let g:airline_section_z = airline#section#create(['%l/%L %c'])
        let g:airline_section_b = airline#section#create(['branch'])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()
    let g:airline_theme = 'distinguished'

    " Airline symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''

    let g:airline#extensions#bufferline#overwrite_variables = 0
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline_skip_empty_sections = 1
set noshowmode

let mapleader=' '
set encoding=utf-8
scriptencoding utf-8

" Case-insensitive pathname tab completion
set wildignorecase

" Better searching
set ignorecase smartcase incsearch showmatch hlsearch
nnoremap <C-L> :noh<CR><C-L>

" Show relative line numbers and never let cursor touch top/bottom
set relativenumber scrolloff=5

" Save root files
cnoremap w!! w !sudo tee % > /dev/null <CR>

" Indentation
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent

" Hide -- INSERT -- in cmdline
set noshowmode

" Don't open preview window after completion
set completeopt-=preview

" Language-specific
au FileType css  set ts=2 sw=2 sts=2
au FileType html set ts=2 sw=2 sts=2

" Setup TAB to work for neosnippet and deoplete
function! TabKeyFunc() abort
    if neosnippet#jumpable()
        return "\<Plug>(neosnippet_jump)"
    elseif pumvisible()
        return "\<C-N>"
    else
        return "\<TAB>"
    endif
endfunction
imap <expr><TAB> TabKeyFunc()

" Setup ENTER to prevent new line when completing
function! EnterKeyFunc() abort
    if neosnippet#expandable()
        echomsg 'HERE'
        return "\<Plug>(neosnippet_expand)"
    elseif pumvisible()
        return deoplete#close_popup()
    else
        return "\<ENTER>"
    endif
endfunction
imap <expr><ENTER> EnterKeyFunc()

" Hide 'match 1 of 8' messages
set shortmess=filnxtToOIc

" Use tab for indenting
xnoremap <TAB> >gv|
xnoremap <S-TAB> <gv
nnoremap <TAB> >>_
nnoremap <S-TAB> <<_

" Page Up/Down single line
nnoremap <PageUp> <C-y>
nnoremap <PageDown> <C-e>


" Better Whitespace Plugin
highlight ExtraWhitespace ctermbg=01

" Echodoc
let g:echodoc_enable_at_startup = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#ignore_sources = {}

" Neosnippet
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Denite
call denite#custom#map('insert', '<Down>',
                     \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>',
                     \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#option('default', 'prompt', '')
call denite#custom#option('default', 'auto_resize', 'true')
call denite#custom#option('default', 'statusline', 0)
call denite#custom#option('default', 'highlight_matched_char', 'IncSearch')
call denite#custom#option('default', 'highlight_matched_range', 'Normal')
call denite#custom#option('default', 'highlight_mode_insert', 'NormalBold')


" Buffer navigation
nnoremap <C-RIGHT> :tabprevious<CR>
nnoremap <C-LEFT> :tabNext<CR>

    " Startify
    let g:startify_list_order = [
        \ ['   Files:'], 'files',
        \ ['   This Directory:'], 'dir',
        \ ['   Sessions:'], 'sessions',
        \ ['   Bookmarks:'], 'bookmarks',
        \ ['   Commands:'], 'commands',
        \ ]
    let g:startify_custom_header = [
        \ '                    (_)        .       .                                     .',
        \ '     .        ____.--^.',
        \ '      .      /:  /    |                               +           .         .',
        \ "            /:  `--=--'   .                                                .",
        \ '           /: __[\==`-.___          *           .',
        \ '          /__|\ _~~~~~~   ~~--..__            .             .',
        \ '          \   \|::::|-----.....___|~--.                                 .',
        \ '           \ _\_~~~~~-----:|:::______//---...___',
        \ '       .   [\  \  __  --     \       ~  \_      ~~~===------==-...____',
        \ '           [============================================================-',
        \ "           /         __/__   --  /__    --       /____....----''''~~~~      .",
        \ "     *    /  /   ==           ____....=---='''~~~~ .",
        \ "         /____....--=-''':~~~~                      .                .",
        \ '                        .                                   .           .',
        \ '                             .                      .             +',
        \ '           .     +              .'
        \ ]
