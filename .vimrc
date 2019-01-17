"sy on
"set smarttab
"set tabstop=4
"set shiftwidth=4
"set mouse=a
"set smartindent
"set number
"imap jj <esc>
"set hlsearch

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

function Compile()
		if &filetype == 'cpp'
				exec "!g++ % -o %< -g -Wall -Wextra -Wconversion -std=c++14"
		elseif &filetype == 'c'
				exec "!gcc % -o %< -g -Wall -Wextra -Wconversion"
		elseif &filetype == 'pas'
				exec "!fpc % -g"
		elseif &filetype == 'tex'
				exec "!xelatex '%'"
		elseif &filetype == 'java'
				exec "!javac %"
		elseif &filetype == 'scss'
				exec "!sass % > %<.css"
		endif
endfunction

function Debug()
		if &filetype == 'cpp' 
				exec "!gdb ./%<"
		elseif &filetype == 'tex'
				exec "!okular './%<.pdf'"
		elseif &filetype == 'java'
				exec "!jdb %<"
		endif
endfunction

function Run()
		if &filetype == 'cpp'
				exec "!time ./%<"
		elseif &filetype == 'python'
				exec "!time python %"
		elseif &filetype == 'tex'
				exec "!okular './%<.pdf'"
		elseif &filetype == 'java'
				exec "!java %<"
		elseif &filetype == 'ruby'
				exec "!ruby %"
		elseif &filetype == 'html'
				exec "!firefox %"
		elseif &filetype == 'php'
				exec "!php %"
		elseif &filetype == 'sh'
				exec "!bash %"
		endif
endfunction

set hlsearch
set mouse=a
set smartindent
set fdm=marker
set number
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
iab scnaf scanf
iab cosnt const
iab spilt split
iab namesapce namespace
syntax on
filetype plugin indent on
imap jj <Esc>
imap pp <C-P>
imap ooo <Esc>o
imap cc <Esc>:w<LF>:call Compile()<LF>
nmap <C-A> ggvG"+y
nmap cc :call Compile() <LF>
nmap <F5> :call Debug() <LF>
nmap rr :call Run() <LF>
map <F8> : ! g++ % -o %< -O2 <LF>
map <F12> : ! subl ./% <LF>
map <F2> : ! python3 % <LF>
"colors evening
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

