" no compatible mode (with vi)
set nocompatible

" Italics support for capable terminals
if has('macunix') || system('uname') =~? '^Darwin'
	set t_ZH=[3m t_ZR=[23m " Set the italics code
endif

" True colors on terminals
set termguicolors

syntax on
filetype plugin indent on

" Keep status line always active
set laststatus=2

" Enable line numbers
set number

" Useful for showing <leader> status (near bottom right corner)
set showcmd

" Show the column where the cursor is located
set cursorcolumn

" Show the line where the cursor is located
set cursorline

" Printer settings: header row and paper size (command hardcopy)
set printoptions=header:1,paper:A4

" Better command line completion
set wildmenu

" Completion acts like the shell
set wildmode=list:longest

" Enable doxygen syntax highligh on standard files
let g:load_doxygen_syntax=1

" Enhanced mouse reporting
if has('mouse_sgr')
	set ttymouse=sgr
endif

" Select font for gvim
set guifont=Source\ Code\ Pro:h14

" Solarized8 - italics supported
let g:solarized_term_italics=1

" Solarized8 colorscheme activation
set background=dark
colorscheme solarized8

" Solarized8 - <leader>B can switch between light and dark theme
map <Leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Airline configuration
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Use the patched fonts...
let g:airline_powerline_fonts=1

" Use enanched tabline
let g:airline#extensions#tabline#enabled = 1

" CSCOPE: to use cscope functionality (cscope -Rb in the root project dir to rebuild the db)
if has("cscope")
	if has('macunix') || system('uname') =~? '^Darwin'
		set csprg=/usr/local/bin/cscope
	else
		set csprg=/usr/bin/cscope
	endif
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb

	map g<C-]> :cs find c <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>
endif

" Golang files
autocmd BufNewFile,BufRead *.go setlocal noexpandtab "tabstop=4 shiftwidth=4

" Settings for vim-go
let g:go_fmt_command = 'goimports'
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_info_mode = 'guru'
let g:go_def_reuse_buffer = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" :GoAlternate shortcuts
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Toggle NERDTree
nmap <F3> : NERDTreeToggle<CR>

" Toggle tagbar
nmap <F8> : TagbarToggle<CR>

" Open Tagbar also if you open a supported file in an already running Vim
" autocmd FileType * nested :call tagbar#autoopen(0)
autocmd VimEnter * nested :call tagbar#autoopen(1)

" Youcompleteme need to know we want python3
if has('macunix') || system('uname') =~? '^Darwin'
	let g:ycm_python_binary_path = '/usr/local/bin/python3'
else
	let g:ycm_python_binary_path = '/usr/bin/python3'
endif

" Disable preview window for Youcompleteme
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" Fix YouCompleteMe integration with UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Commented setup below is a valid alternative.
"let g:ycm_key_list_previous_completion=['<Up>']
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"

" TIPS: to reload .vimrc
" - :so % => source current file name (~/.vimrc must be the current open file)
" - :so $MYVIMRC => source ~/.vimrc (the configuration file can also be closed)
" - :so ~/.vimrc => same as the previous one
" - :Helptags => Generate the help tags. Now it is better to use :helptag ALL
