" Vim syntax file
" Language:	ChordPro
" Maintainer:	Niels Bo Andersen <niels@niboan.dk>
" Last Change:	2003 May 20 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword ProDirective start_of_chorus soc end_of_chorus eoc new_song ns contained
syn keyword ProDirective base-fret frets no_grid ng grid g new_page np contained
syn keyword ProDirective new_physical_page npp start_of_tab sot contained
syn keyword ProDirective end_of_tab eot column_break colb contained

syn keyword ProDirWithOpt comment c comment_italic ci comment_box cb contained
syn keyword ProDirWithOpt title t subtitle st define contained
syn keyword ProDirWithOpt textfont textsize chordfont chordsize contained
syn keyword ProDirWithOpt columns col contained

syn region ProTag matchgroup=ProBracket start=+{+ end=+}+ contains=ProDirective keepend oneline
syn region ProTag matchgroup=ProBracket start=+{+ end=+:.\{-}}+ contains=ProDirWithOpt keepend oneline
syn region ProChord matchgroup=ProBracket start=+\[+ end=+]+ keepend oneline

syn match ProComment "#.*"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_chopro_syn_inits")
  if version < 508
    let did_chopro_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ProDirective Statement
  HiLink ProDirWithOpt Statement
  HiLink ProChord Type
  HiLink ProTag Special
  HiLink ProComment Comment
  HiLink ProBracket Constant

  delcommand HiLink
endif

let b:current_syntax = "chordpro"

" vim: ts=8
