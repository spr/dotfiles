set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "scott"
" term={bold,underline,undercurl,reverse,inverse,italic,standout
" hi group term= ctermfg= ctermbg= guifg= guibg=

hi SpecialKey term=bold ctermfg=4
" NonText: ~, @, 'showbreak' characters.
hi NonText term=bold ctermfg=12
" Directory: directory/special names in listings
hi Directory term=bold ctermfg=4
" ErrorMsg: error msgs on the command line
hi ErrorMsg term=standout ctermfg=15 ctermbg=1
" IncSearch: 'incsearch' highlighting.
hi IncSearch term=reverse cterm=reverse
hi Search term=reverse ctermbg=11
" MoreMsg: more prompt 
hi MoreMsg term=bold ctermfg=2
" ModeMsg: 'showmode' message (ie "-- INSERT --")
hi ModeMsg term=bold cterm=bold
" LineNr: Line number color for :number and :# and 'number'
hi LineNr term=underline ctermfg=32
hi Question term=standout ctermfg=2
hi StatusLine term=bold,reverse cterm=bold,reverse
hi StatusLineNC term=reverse cterm=reverse
" VertSplit: column used to separate
hi VertSplit term=reverse cterm=reverse
hi Title term=bold ctermfg=5 gui=bold
hi Visual term=reverse ctermbg=7
hi VisualNOS term=bold,underline cterm=bold,underline
hi WarningMsg term=standout ctermfg=1
hi WildMenu term=standout ctermfg=0 ctermbg=11
" Folded: line used for closed folds
hi Folded term=standout ctermfg=4 ctermbg=84
" FoldColumn: 'foldcolumn' color
hi FoldColumn term=standout ctermfg=4 ctermbg=84
" DiffAdd: diff - added line
hi DiffAdd term=bold ctermbg=43
" DiffChange: diff - changed line
hi DiffChange term=bold ctermbg=75
" DiffDelete: diff - deleted line
hi DiffDelete term=bold ctermfg=12 ctermbg=63
" DiffText: diff - changed text in changed line
hi DiffText term=reverse cterm=bold ctermbg=9
" SignColumn: column where signs are
hi SignColumn term=standout ctermfg=4 ctermbg=84
hi SpellBad term=reverse ctermbg=74
hi SpellCap term=reverse ctermbg=43
hi SpellRare term=reverse ctermbg=75
hi SpellLocal term=underline ctermbg=14
hi Pmenu ctermbg=75
hi PmenuSel ctermbg=7
hi PmenuSbar ctermbg=84
hi PmenuThumb cterm=reverse
hi TabLine term=underline cterm=underline ctermfg=0 ctermbg=7
hi TabLineSel term=bold cterm=bold
hi TabLineFill term=reverse cterm=reverse
" CursorColumn: highlight for column cursor is in with cursorcolumn
hi CursorColumn term=reverse ctermbg=7
" CursorLine: highlight for line cursor is in with cursorline
hi CursorLine term=underline cterm=underline
" Cursor: the character under the cursor
" CursorIM: cursor in IME
" lCursor: unknown
" MatchParen: Highlight color for paired matches.
hi MatchParen term=reverse ctermbg=14
hi Comment term=bold ctermfg=4
hi Constant term=underline ctermfg=1
hi Special term=bold ctermfg=5
hi Identifier term=underline ctermfg=6
hi Statement term=bold ctermfg=32 gui=bold
hi PreProc term=underline ctermfg=5
hi Type term=underline ctermfg=2
hi Underlined term=underline cterm=underline ctermfg=5
hi Ignore ctermfg=15
hi Error term=reverse ctermfg=15 ctermbg=9
hi Todo term=standout ctermfg=0 ctermbg=11
"hi String links to Constant
"hi Character links to Constant
"hi Number links to Constant
"hi Boolean links to Constant
"hi Float links to Number
"hi Function links to Identifier
"hi Conditional links to Statement
"hi Repeat links to Statement
"hi Label links to Statement
"hi Operator links to Statement
"hi Keyword links to Statement
"hi Exception links to Statement
"hi Include links to PreProc
"hi Define links to PreProc
"hi Macro links to PreProc
"hi PreCondit links to PreProc
"hi StorageClass links to Type
"hi Structure links to Type
"hi Typedef links to Type
"hi Tag links to Special
"hi SpecialChar links to Special
"hi Delimiter links to Special
"hi SpecialComment links to Special
"hi Debug links to Special
