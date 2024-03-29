" no compatible mode (with vi)
set nocompatible

" Italics support for capable terminals
if has('macunix') || system('uname') =~? '^Darwin'
	set t_ZH=[3m t_ZR=[23m " Set the italics code
endif

" Undercurl support for capable terminals
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" True colors on terminals
set termguicolors
syntax on
filetype plugin indent on

" Keep status line always active
set laststatus=2

" Enable incremental search (start the operation while typing characters)
set incsearch

" Enable line numbers
set number

" Useful for showing <leader> status (near bottom right corner)
set showcmd

" Show the column where the cursor is located
set cursorcolumn

" Show the line where the cursor is located
set cursorline

" Enable mouse support
set mouse=a

" Printer settings: header row and paper size (command hardcopy)
set printoptions=header:1,paper:A4

" Better command line completion
set wildmenu

" Completion acts like the shell
set wildmode=list:longest

" Enable doxygen syntax highligh on standard files
let g:load_doxygen_syntax=1

" Enhanced mouse reporting
" NOTE: THIS SHOULD BE AUTODETECTED AND NOT BE NECESSARY ANYMORE. TURN IT ON IF
" THERE ARE TROUBLES WITH LINES LONGER THAN " ~ 230 CHARACTERS.
"if has('mouse_sgr')
"	set ttymouse=sgr
"endif

" Select font for gvim
set guifont=Source\ Code\ Pro:h14

" Select font for printer
set printfont="Source Code Pro:h10"

" Solarized8 - italics supported
let g:solarized_term_italics=1

" Solarized8 colorscheme activation
set background=dark
colorscheme solarized8

" Disable automatic folding (annoying with Markdown files...).
set nofoldenable

" Enable spell check for American English and Italian
set spell spelllang=en_us,it

" Emmet leader key.
" The current setting means that invocation happens with ',,'.
let g:user_emmet_leader_key=','

" Solarized8 - <leader>B can switch between light and dark theme
map <Leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Airline detect spell language and use flags to show them
let g:airline_detect_spelllang='flag'

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
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Use the patched fonts...
let g:airline_powerline_fonts=1

" Use enhanched tabline
let g:airline#extensions#tabline#enabled = 1

" Indent guides settings (default use <leader> ig to toggle on and off
let g:indent_guides_start_level = 4
" set guide size, it requires softtabs (does not work with hard tab)
let g:indent_guides_guide_size = 1
" let's use manual colors
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd guibg=#002b36
hi IndentGuidesEven ctermfg=1  guibg=#073642

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
autocmd BufNewFile,BufRead *.go setlocal spell spelllang=en_us

" Settings for vim-go
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_def_reuse_buffer = 1
let g:go_fmt_command = 'goimports'
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['errcheck', 'revive', 'gosec', 'govet']
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['bodyclose', 'deadcode', 'depguard', 'dogsled', 'dupl', 'errcheck', 'exportloopref', 'funlen', 'gochecknoinits', 'goconst', 'gocritic', 'gocyclo', 'gofmt', 'goimports', 'gosec', 'gosimple', 'govet', 'ineffassign', 'interfacer', 'lll', 'misspell', 'nakedret', 'prealloc', 'revive', 'staticcheck', 'structcheck', 'stylecheck', 'typecheck', 'unconvert', 'unparam', 'unused', 'varcheck', 'whitespace']

" Highlight Go builtins as keywords
highlight link goBuiltins Keyword

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" :GoCoverage toggle shortcut
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" :GoAlternate shortcuts
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Set PostgreSQL as default SQL syntax
let g:sql_type_default = 'pgsql'

" Toggle NERDTree
nmap <F3> : NERDTreeToggle<CR>

" Toggle tagbar
nmap <F8> : TagbarToggle<CR>

" Run Python with F7
autocmd FileType python map <buffer> <F7> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F7> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType py set autoindent
autocmd FileType py set smartindent

" Adhere to PEP8 formatting style (indent works with 4 chars per tab)
autocmd BufNewFile,BufRead *.py setlocal noexpandtab tabstop=4 shiftwidth=4 noexpandtab
" or: autocmd  FileType go set ts=4 ...

let python_hightlight_all=1

" Add Python support to VIRTUALENV
if has('python3') " missing indentation due to the <<
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
endif

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
"
"	print variables: :echo expression expression ...
"
"   touchbar
"   if has('touchbar') ...
"   then settings should be permited using :amenu
