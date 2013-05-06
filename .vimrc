" Scott Paul Robertson's .vimrc
" Taken from Hans' template (http://hans.fugal.net/vim/)

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Fix for vundle (Issue 239)
set shell=bash

" Setup Vundle
filetype off
set rtp +=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle "Syntastic"
Bundle "vim-octopress"

Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_whitelist = {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'objc': 1,
      \ 'objcpp': 1,
      \ 'python': 1,
      \ 'perl': 1,
      \ 'perl6': 1,
      \ 'ruby': 1,
      \ 'php': 1,
      \}

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Can't stand shifting #'s to the start, fixes smartindent.
inoremap # X<C-H>#

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78 

  " Ruby, Vim sw=2
  autocmd FileType ruby setlocal sw=2
  autocmd FileType vim setlocal sw=2

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" I like using :Man <manpage> to get man pages
runtime ftplugin/man.vim
nmap K :Man <C-R>=expand("<cword>")<CR><CR>

" My mappings
" Turn on spell checking
map <Leader>s :set spell<CR>
map <Leader>S :set nospell<CR>
map <F8> :nohl<CR>
imap <F8> <C-O><F8>

" Cscope
if has("cscope")
  set cst
  set csto=1
  if filereadable("cscope.out")
    cs add cscope.out
  endif
endif

" ^\s finds references to token
" ^\c finds function calls of token
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

" Short explanation of each option:	     *option-list*
" |'aleph'|	    |'al'|       ASCII code of the letter Aleph (Hebrew)
" |'allowrevins'|   |'ari'|      allow CTRL-_ in Insert and Command-line mode
" |'altkeymap'|	    |'akm'|      for default second language (Farsi/Hebrew)
" |'autoindent'|    |'ai'|       take indent for new line from previous line
" |'autoread'|	    |'ar'|       autom. read file when changed outside of Vim
" |'autowrite'|	    |'aw'|       automatically write file if changed
set autowrite	" preserves the file when you shell exec, etc
" |'autowriteall'|  |'awa'|      as 'autowrite', but works with more commands
" |'background'|    |'bg'|       "dark" or "light", used for highlight colors
set bg=light	" I'm almost always on a black term
" |'backspace'|	    |'bs'|       how backspace works at start of line
set backspace=indent,eol,start 	" Kill everything!
" |'backup'|	    |'bk'|       keep backup file after overwriting a file
" |'backupcopy'|    |'bkc'|      make backup as a copy, don't rename the file
" |'backupdir'|	    |'bdir'|     list of directories for the backup file
" |'backupext'|	    |'bex'|      extension used for the backup file
" |'backupskip'|    |'bsk'|      no backup for files that match these patterns
" |'balloondelay'|  |'bdlay'|    delay in mS before a balloon may pop up
" |'ballooneval'|   |'beval'|    switch on balloon evaluation
" |'balloonexpy'|   |'bexpr'|    expression for text to show in balloon
" |'binary'|	    |'bin'|      read/write/edit file in binary mode
" |'bioskey'|	    |'biosk'|    MS-DOS: use bios calls for input characters
" |'bomb'|			 prepend a Byte Order Mark to the file
" |'breakat'|	    |'brk'|      characters that may cause a line break
" |'browsedir'|	    |'bsdir'|    which directory to start browsing in
" |'bufhidden'|	    |'bh'|       what to do when buffer is no longer in window
" |'buflisted'|	    |'bl'|       whether the buffer shows up in the buffer list
" |'buftype'|	    |'bt'|       special type of buffer
" |'cdpath'|	    |'cd'|       list of directories searched with ":cd"
" |'cedit'|			 key used to open the command-line window
" |'charconvert'|   |'ccv'|      expression for character encoding conversion
" |'cindent'|	    |'cin'|      do C program indenting
" |'cinkeys'|	    |'cink'|     keys that trigger indent when 'cindent' is set
" |'cinoptions'|    |'cino'|     how to do indenting when 'cindent' is set
" |'cinwords'|	    |'cinw'|     words where 'si' and 'cin' add an indent
" |'clipboard'|	    |'cb'|       use the clipboard as the unnamed register
" |'cmdheight'|	    |'ch'|       number of lines to use for the command-line
" |'cmdwinheight'|  |'cwh'|      height of the command-line window
" |'columns'|	    |'co'|       number of columns in the display
" |'comments'|	    |'com'|      patterns that can start a comment line
" |'commentstring'| |'cms'|      template for comments; used for fold marker
" |'compatible'|    |'cp'|       behave Vi-compatible as much as possible
" |'complete'|	    |'cpt'|      specify how Insert mode completion works
" |'completefunc'|  |'cfu'|      Name of function for insert mode completion
" |'completeopt'|   |'cot'|      Options for insert mode completion (menu).
set completeopt+=preview
" |'confirm'|	    |'cf'|       ask what to do about unsaved/read-only files
" |'conskey'|	    |'consk'|    get keys directly from console (MS-DOS only)
" |'cpoptions'|	    |'cpo'|      flags for Vi-compatible behavior
" |'cscopepathcomp'| |'cspc'|    how many components of the path to show
" |'cscopeprg'|	    |'csprg'|    command to execute cscope
" |'cscopetag'|	    |'cst'|      use cscope for tag commands
" |'cscopetagorder'| |'csto'|    determines ":cstag" search order
" |'cscopeverbose'| |'csverb'|   give messages when adding a cscope database
" |'debug'|			 set to "msg" to see all error messages
" |'define'|	    |'def'|      pattern to be used to find a macro definition
" |'delcombine'|    |'deco'|     delete combining characters on their own
" |'dictionary'|    |'dict'|     list of file names used for keyword completion
" |'diff'|			 use diff mode for the current window
" |'diffexpr'|	    |'dex'|      expression used to obtain a diff file
" |'diffopt'|	    |'dip'|      options for using diff mode
" |'digraph'|	    |'dg'|       enable the entering of digraphs in Insert mode
" |'directory'|	    |'dir'|      list of directory names for the swap file
" |'display'|	    |'dy'|       list of flags for how to display text
" |'edcompatible'|  |'ed'|       toggle flags of ":substitute" command
" |'eadirection'|   |'ead'|      in which direction 'equalalways' works
" |'encoding'|	    |'enc'|      encoding used internally
set enc=utf8
" |'endofline'|	    |'eol'|      write <EOL> for last line in file
" |'equalalways'|   |'ea'|       windows are automatically made the same size
" |'equalprg'|	    |'ep'|       external program to use for "=" command
" |'errorbells'|    |'eb'|       ring the bell for error messages
" |'errorfile'|	    |'ef'|       name of the errorfile for the QuickFix mode
" |'errorformat'|   |'efm'|      description of the lines in the error file
" |'esckeys'|	    |'ek'|       recognize function keys in Insert mode
" |'eventignore'|   |'ei'|       autocommand events that are ignored
" |'expandtab'|	    |'et'|       use spaces when <Tab> is inserted
set expandtab
" |'exrc'|	    |'ex'|       read .vimrc and .exrc in the current directory
" |'fileencoding'|  |'fenc'|     file encoding for multi-byte text
" |'fileencodings'| |'fencs'|    automatically detected character encodings
" |'fileformat'|    |'ff'|       file format used for file I/O
" |'fileformats'|   |'ffs'|      automatically detected values for 'fileformat'
" |'filetype'|	    |'ft'|       type of file, used for autocommands
" |'fillchars'|	    |'fcs'|      characters to use for displaying special items
" |'fkmap'|	    |'fk'|       Farsi keyboard mapping
" |'foldclose'|	    |'fcl'|      close a fold when the cursor leaves it
" |'foldcolumn'|    |'fdc'|      width of the column used to indicate folds
" |'foldenable'|    |'fen'|      set to display all folds open
if version > 580
	set foldenable
endif
" |'foldexpr'|	    |'fde'|      expression used when 'foldmethod' is "expr"
" |'foldignore'|    |'fdi'|      ignore lines when 'foldmethod' is "indent"
" |'foldlevel'|	    |'fdl'|      close folds with a level higher than this
" |'foldlevelstart'| |'fdls'|    'foldlevel' when startng to edit a file
" |'foldmarker'|    |'fmr'|      markers used when 'foldmethod' is "marker"
" |'foldmethod'|    |'fdm'|      folding type
if version > 580
	set fdm=marker
endif
" |'foldminlines'|  |'fml'|      minimum number of lines for a fold to be closed
" |'foldnestmax'|   |'fdn'|      maximum fold depth
" |'foldopen'|	    |'fdo'|      for which commands a fold will be opened
" |'foldtext'|	    |'fdt'|      expression used to display for a closed fold
" |'formatexpr'|    |'fex'|      How to format text in gq over 'textwidth'
" |'formatlistpat'| |'flp'|      pattern to recognize a numbered list
" |'formatoptions'| |'fo'|       how automatic formatting is to be done
" |'formatprg'|	    |'fp'|       name of external program used with "gq" command
" |'fsync'|         |'fs'|       Whether fsync() is called after writing
" |'gdefault'|	    |'gd'|       the ":substitute" flag 'g' is default on
" |'grepformat'|    |'gfm'|      format of 'grepprg' output
" |'grepprg'|	    |'gp'|       program to use for ":grep"
" |'guicursor'|	    |'gcr'|      GUI: settings for cursor shape and blinking
set guicursor+=a:blinkon0      " Disable the cursed blink!
" |'guifont'|	    |'gfn'|      GUI: Name(s) of font(s) to be used
" |'guifontset'|    |'gfs'|      GUI: Names of multi-byte fonts to be used
" |'guifontwide'|   |'gfw'|      list of font names for double-wide characters
" |'guiheadroom'|   |'ghr'|      GUI: pixels room for window decorations
set guiheadroom=0
" |'guioptions'|    |'go'|       GUI: Which components and options are used
set guioptions+=c
set guioptions-=L
set guioptions-=R
set guioptions-=r
set guioptions-=T
set guioptions-=m
" |'guipty'|			 GUI: try to use a pseudo-tty for ":!" commands
" |'guitablabel'|   |'gtl'|      GUI: Text to display in tab page label
" |'guitabltooltip'||'gtt'|      GUI: Text to display in tab page tooltip
" |'helpfile'|	    |'hf'|       name of this help file
" |'helpheight'|    |'hh'|       minimum height of a new help window
" |'hidden'|	    |'hid'|      don't unload buffer when it is |abandon|ed
" |'highlight'|	    |'hl'|       sets highlighting mode for various occasions
" |'hlsearch'|	    |'hls'|      highlight matches with last search pattern
" |'history'|	    |'hi'|       number of command-lines that are remembered
set history=50
" |'hkmap'|	    |'hk'|       Hebrew keyboard mapping
" |'hkmapp'|	    |'hkp'|      phonetic Hebrew keyboard mapping
" |'icon'|			 let Vim set the text of the window icon
" |'iconstring'|		 string to use for the Vim icon text
" |'ignorecase'|    |'ic'|       ignore case in search patterns
" |'imactivatekey'| |'imak'|     key that activates the X input method
" |'imcmdline'|	    |'imc'|      use IM when starting to edit a command line
" |'iminsert'|	    |'imi'|      use :lmap or IM in Insert mode
" |'imsearch'|	    |'ims'|      use :lmap or IM when typing a search pattern
" |'include'|	    |'inc'|      pattern to be used to find an include file
" |'includeexpr'|   |'inex'|     expression used to process an include line
" |'incsearch'|	    |'is'|       highlight match while typing search pattern
set incsearch
" |'indentexpr'|    |'inde'|     expression used to obtain the indent of a line
" |'indentkeys'|    |'indk'|     keys that trigger indenting with 'indentexpr'
" |'infercase'|	    |'inf'|      adjust case of match for keyword completion
" |'insertmode'|    |'im'|       start the edit of a file in Insert mode
" |'isfname'|	    |'isf'|      characters included in file names and pathnames
" |'isident'|	    |'isi'|      characters included in identifiers
" |'iskeyword'|	    |'isk'|      characters included in keywords
" |'isprint'|	    |'isp'|      printable characters
" |'joinspaces'|    |'js'|       two spaces after a period with a join command
" |'key'|			 encryption key
" |'keymap'|	    |'kmp'|      name of a keyboard mapping
" |'keymodel'|	    |'km'|       enable starting/stopping selection with keys
" |'keywordprg'|    |'kp'|       program to use for the "K" command
" |'langmap'|	    |'lmap'|     alphabetic characters for other language mode
" |'langmenu'|	    |'lm'|       language to be used for the menus
" |'laststatus'|    |'ls'|       tells when last window has status lines
set laststatus=1
" |'lazyredraw'|    |'lz'|       don't redraw while executing macros
" |'linebreak'|	    |'lbr'|      wrap long lines at a blank
set linebreak
" |'lines'|			 number of lines in the display
" |'linespace'|	    |'lsp'|      number of pixel lines to use between characters
" |'lisp'|			 automatic indenting for Lisp
" |'lispwords'|	    |'lw'|       words that change how lisp indenting works
" |'list'|			 show <Tab> and <EOL>
" |'listchars'|	    |'lcs'|      characters for displaying in list mode
" |'loadplugins'|   |'lpl'|      load plugin scripts when starting up
" |'macatsui'|                   Mac: use ATSUI text display functions
" |'magic'|			 changes special characters in search patterns
" |'makeef'|	    |'mef'|      name of the errorfile for ":make"
" |'makeprg'|	    |'mp'|       program to use for the ":make" command
" |'matchpairs'|    |'mps'|      pairs of characters that "%" can match
" |'matchtime'|	    |'mat'|      tenths of a second to show matching paren
set matchtime=1
" |'maxcombine'|    |'mco'|      maximum number of combining chars displayed
" |'maxfuncdepth'|  |'mfd'|      maximum recursive depth for user functions
" |'maxmapdepth'|   |'mmd'|      maximum recursive depth for mapping
" |'maxmem'|	    |'mm'|       maximum memory (in Kbyte) used for one buffer
" |'maxmempattern'| |'mmp'|      maximum amount of memory for pattern matching
" |'maxmemtot'|	    |'mmt'|      maximum memory (in Kbyte) used for all buffers
" |'menuitems'|	    |'mis'|      maximum number of items in a menu
" |'mkspellmem'|    |'msm'|      parameters for :mkspell memory use
" |'modeline'|	    |'ml'|       recognize modelines at start or end of file
set modeline
" |'modelines'|	    |'mls'|      number of lines checked for modelines
set modelines&
" |'modifiable'|    |'ma'|       changes to the text are not possible
" |'modified'|	    |'mod'|      buffer has been modified
" |'more'|			 pause listings when the whole screen is filled
" |'mouse'|			 enable the use of mouse clicks
" |'mousefocus'|    |'mousef'|   keyboard focus follows the mouse
" |'mousehide'|	    |'mh'|       hide mouse pointer while typing
" |'mousemodel'|    |'mousem'|   changes meaning of mouse buttons
" |'mouseshape'|    |'mouses'|   shape of the mouse pointer in different modes
" |'mousetime'|	    |'mouset'|   max time between mouse double-click
" |'mzquantum'|     |'mzq'|      Time in msec to schedule MzScheme threads
" |'nrformats'|	    |'nf'|       number formats recognized for CTRL-A command
" |'number'|	    |'nu'|       print the line number in front of each line
" |'numberwidth'|   |'nuw'|      Minimal width of space for 'number' option
" |'omnifunc'|      |'ofu'|      Function used for omni completion
" |'operatorfunc'|  |'opfunc'|   function called for g@
" |'osfiletype'|    |'oft'|      operating system-specific filetype information
" |'paragraphs'|    |'para'|     nroff macros that separate paragraphs
" |'paste'|			 allow pasting text
" |'pastetoggle'|   |'pt'|       key code that causes 'paste' to toggle
" |'patchexpr'|	    |'pex'|      expression used to patch a file
" |'patchmode'|	    |'pm'|       keep the oldest version of a file
" |'path'|	    |'pa'|       list of directories searched with "gf" et.al.
" |'previewheight'| |'pvh'|      height of the preview window
" |'previewwindow'| |'pvw'|      identifies the preview window
" |'printdevice'|   |'pdev'|     name of the printer to be used for :hardcopy
" |'printfont'|	    |'pfn'|      name of the font to be used for :hardcopy
" |'printheader'|   |'pheader'|  format of the header used for :hardcopy
" |'printmbcharset'||'pmbcs'|    CJK char set used for :hardcopy
" |'printmbfont'|   |'pmbfn'|    Font for CJK output of :hardcopy
" |'printoptions'|  |'popt'|     controls the format of :hardcopy output
" |'pumheight'|     |'ph'|       maximum number of items in popup menu
" |'quiteescape'|   |'qe'|       Characters used to escape quotes
" |'readonly'|	    |'ro'|       disallow writing the buffer
" |'remap'|			 allow mappings to work recursively
" |'report'|			 threshold for reporting nr. of lines changed
" |'restorescreen'| |'rs'|       Win32: restore screen when exiting
" |'revins'|	    |'ri'|       inserting characters will work backwards
" |'rightleft'|	    |'rl'|       window is right-to-left oriented
" |'ruler'|	    |'ru'|       show cursor line and column in the status line
set ruler
" |'rulerformat'|   |'ruf'|      custom format for the ruler
" |'runtimepath'|   |'rtp'|      list of directories used for runtime files
" |'scroll'|	    |'scr'|      lines to scroll with CTRL-U and CTRL-D
" |'scrollbind'|    |'scb'|      scroll in window as other windows scroll
" |'scrolljump'|    |'sj'|       minimum number of lines to scroll
" |'scrolloff'|	    |'so'|       minimum nr. of lines above and below cursor
set scrolloff=2
" |'scrollopt'|	    |'sbo'|      how 'scrollbind' should behave
" |'sections'|	    |'sect'|     nroff macros that separate sections
" |'secure'|			 secure mode for reading .vimrc in current dir
" |'selection'|	    |'sel'|      what type of selection to use
" |'selectmode'|    |'slm'|      when to use Select mode instead of Visual mode
" |'sessionoptions'| |'ssop'|    options for |:mksession|
" |'shell'|	    |'sh'|       name of shell to use for external commands
" |'shellcmdflag'|  |'shcf'|     flag to shell to execute one command
" |'shellpipe'|	    |'sp'|       string to put output of ":make" in error file
" |'shellquote'|    |'shq'|      quote character(s) for around shell command
" |'shellredir'|    |'srr'|      string to put output of filter in a temp file
" |'shellslash'|    |'ssl'|      use forward slash for shell file names
" |'shelltemp'|     |'stmp'|     Whether to use a temp file or pipe
" |'shelltype'|	    |'st'|       Amiga: influences how to use a shell
" |'shellxquote'|   |'sxq'|      like 'shellquote', but include redirection
" |'shiftround'|    |'sr'|       round indent to multiple of shiftwidth
set shiftround
" |'shiftwidth'|    |'sw'|       number of spaces to use for (auto)indent step
set sw=4
" |'shortmess'|	    |'shm'|      list of flags, reduce length of messages
" |'shortname'|	    |'sn'|       non-MS-DOS: Filenames assumed to be 8.3 chars
" |'showbreak'|	    |'sbr'|      string to use at the start of wrapped lines
" |'showcmd'|	    |'sc'|       show (partial) command in status line
set showcmd
" |'showfulltag'|   |'sft'|      show full tag pattern when completing tag
" |'showmatch'|	    |'sm'|       briefly jump to matching bracket if insert one
set showmatch
" |'showmode'|	    |'smd'|      message on status line to show current mode
" |'showtabline'|   |'stal'|     whether to show tab pages line
" |'sidescroll'|    |'ss'|       minimum number of columns to scroll horizontal
" |'sidescrolloff'| |'siso'|     min. nr. of columns to left and right of cursor
" |'smartcase'|	    |'scs'|      no ignore case when pattern has uppercase
set smartcase
" |'smartindent'|   |'si'|       smart autoindenting for C programs
set smartindent
" |'smarttab'|	    |'sta'|      use 'shiftwidth' when inserting <Tab>
set smarttab
" |'softtabstop'|   |'sts'|      number of spaces that <Tab> uses while editing
set sts=4
" |'spell'|                      Switch spell checking on/off
" |'spellcapcheck'| |'spc'|      Pattern to locate the end of a sentence
" |'spellfile'|     |'spf'|      file for good and wrong words to be added
" |'spelllang'|     |'spl'|      languages to check spelling for
if version > 699
    set spelllang=en_us
endif
" |'spellsuggest'|  |'sps'|      methods for spelling suggestions
" |'splitbelow'|    |'sb'|       new window from split is below the current one
" |'splitright'|    |'spr'|      new window is put right of the current one
" |'startofline'|   |'sol'|      commands move cursor to first blank in line
" |'statusline'|    |'stl'|      custom format for the status line
" |'suffixes'|	    |'su'|       suffixes that are ignored with multiple match
" |'suffixesadd'|   |'sua'|      suffixes added when searching for a file
" |'swapfile'|	    |'swf'|      whether to use a swapfile for a buffer
" |'swapsync'|	    |'sws'|      how to sync the swap file
" |'switchbuf'|	    |'swb'|      sets behavior when switching to another buffer
set switchbuf=useopen
" |'syntax'|	    |'syn'|      syntax to be loaded for current buffer
" |'synmaxcol'|     |'smc'|      maximum column to look for syntax items
" |'tabstop'|	    |'ts'|       number of spaces that <Tab> in file uses
set ts=8
" |'tabline'|       |'tal'|      expression for text to display in tab pages
" |'tabpagemax'|    |'tpm'|      maximum number of tab pages to open for -p
" |'tagbsearch'|    |'tbs'|      use binary searching in tags files
" |'taglength'|	    |'tl'|       number of significant characters for a tag
" |'tagrelative'|   |'tr'|       file names in tag file are relative
" |'tags'|	    |'tag'|      list of file names used by the tag command
" |'tagstack'|	    |'tgst'|     push tags onto the tag stack
" |'term'|			 name of the terminal
" |'termencoding'|  |'tenc'|     character encoding used by the terminal
set tenc=utf-8
" |'terse'|			 shorten some messages
" |'textauto'|	    |'ta'|       obsolete, use 'fileformats'
" |'textmode'|	    |'tx'|       obsolete, use 'fileformat'
" |'textwidth'|	    |'tw'|       maximum width of text that is being inserted
" |'thesaurus'|	    |'tsr'|      list of thesaurus files for keyword completion
" |'tildeop'|	    |'top'|      tilde command "~" behaves like an operator
" |'timeout'|	    |'to'|       time out on mappings and key codes
" |'timeoutlen'|    |'tm'|       time out time in milliseconds
" |'title'|			 let Vim set the title of the window
" |'titlelen'|			 percentage of 'columns' used for window title
" |'titleold'|			 old title, restored when exiting
" |'titlestring'|		 string to use for the Vim window title
" |'toolbar'|	    |'tb'|       GUI: which items to show in the toolbar
" |'ttimeout'|			 time out on mappings
" |'ttimeoutlen'|   |'ttm'|      time out time for key codes in milliseconds
" |'ttybuiltin'|    |'tbi'|      use built-in termcap before external termcap
" |'ttyfast'|	    |'tf'|       indicates a fast terminal connection
" |'ttymouse'|	    |'ttym'|     type of mouse codes generated
" |'ttyscroll'|	    |'tsl'|      maximum number of lines for a scroll
" |'ttytype'|	    |'tty'|      alias for 'term'
" |'undolevels'|    |'ul'|       maximum number of changes that can be undone
" |'updatecount'|   |'uc'|       after this many characters flush swap file
" |'updatetime'|    |'ut'|       after this many milliseconds flush swap file
" |'verbose'|	    |'vbs'|      give informative messages
" |'verbosefile'|   |'vfile'|    log messages in a file
" |'viewdir'|	    |'vdir'|     directory where to store files with :mkview
" |'viewoptions'|   |'vop'|      specifies what to save for :mkview
" |'viminfo'|	    |'vi'|       use .viminfo file upon startup and exiting
" |'virtualedit'|   |'ve'|       when to use virtual editing
" |'visualbell'|    |'vb'|       use visual bell instead of beeping
set vb
" |'warn'|			 warn for shell command when buffer was changed
" |'weirdinvert'|   |'wi'|       for terminals that have weird inversion method
" |'whichwrap'|	    |'ww'|       allow specified keys to cross line boundaries
" |'wildchar'|	    |'wc'|       command-line character for wildcard expansion
" |'wildcharm'|	    |'wcm'|      like 'wildchar' but also works when mapped
" |'wildignore'|    |'wig'|      files matching these patterns are not completed
" |'wildmenu'|	    |'wmnu'|     use menu for command line completion
set wildmenu
" |'wildmode'|	    |'wim'|      mode for 'wildchar' command-line expansion
set wildmode=longest:full,full
" |'wildoptions'|   |'wop'|      change how command line completion is done
" |'winaltkeys'|    |'wak'|      when the windows system handles ALT keys
" |'winfixwidth'|   |'wfw'|      window with fixed width
" |'winheight'|	    |'wh'|       minimum number of lines for the current window
set wh=10
" |'winminheight'|  |'wmh'|      minimum number of lines for any window
" |'winminwidth'|   |'wmw'|      minimal number of columns for any window
" |'winwidth'|	    |'wiw'|      minimal number of columns for current window
" |'wrap'|			 long lines wrap and continue on the next line
" |'wrapmargin'|    |'wm'|       chars from the right where wrapping starts
" |'wrapscan'|	    |'ws'|       searches wrap around the end of the file
" |'write'|			 writing to a file is allowed
" |'writeany'|	    |'wa'|       write to file with no need for "!" override
" |'writebackup'|   |'wb'|       make a backup before overwriting a file
if has("vms")
	set nobackup
else
	set writebackup
endif
" |'writedelay'|    |'wd'|       delay this many msec for each char (for debug)

" .gpg files are encrypted and editing in memory with this
augroup encrypted
	au!

	" First make sure nothing is written to ~/.viminfo while editing
	" an encrypted file.
	autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
	" We don't want a swap file, as it writes unencrypted data to disk
	autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
	" Switch to binary mode to read the encrypted file
	autocmd BufReadPre,FileReadPre      *.gpg set bin
	autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
	autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt 2> /dev/null
	" Switch to normal mode for editing
	autocmd BufReadPost,FileReadPost    *.gpg set nobin
	autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
	autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
	" Convert all text to encrypted text before writing
	autocmd BufWritePre,FileWritePre    *.gpg   '[,']!gpg --default-recipient-self -ae 2>/dev/null
	" Undo the encryption so we are back in the normal text, directly
	" after the file has been written.
	autocmd BufWritePost,FileWritePost    *.gpg   u
augroup END

" vim: ts=8
