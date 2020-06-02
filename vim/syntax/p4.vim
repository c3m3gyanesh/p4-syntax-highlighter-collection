" Vim syntax file
" Language: P4
" Created By: Antonin Bas, Barefoot Networks Inc
" Updated By: Gyanesh Patra, Unicamp University
" Updated By: Glen Gibb, Intel
" Latest Revision: 29 May 2020

"if version &lt; 600
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" P4_14 syntax
" ------------
if !exists("p4_no_p4_14")
  " Use case sensitive matching of keywords
  syn case match

  syn keyword p4ObjectKeyword parser table action action_profile
  syn keyword p4ObjectKeyword header_type header action action_profile metadata
  syn keyword p4ObjectKeyword field_list field_list_calculation calculated_field
  syn keyword p4ObjectKeyword control
  syn keyword p4ObjectKeyword parser_value_set
  syn keyword p4ObjectKeyword counter meter

  " Tables
  syn keyword p4ObjectAttributeKeyword reads actions min_size max_size size
  " Header types
  syn keyword p4ObjectAttributeKeyword fields length max_length
  " Field list calculation
  syn keyword p4ObjectAttributeKeyword input algorithm output_width
  " Calculated fields
  syn keyword p4ObjectAttributeKeyword verify update
  " Counters and meters
  syn keyword p4ObjectAttributeKeyword type direct static
  syn keyword p4ObjectAttributeKeyword instance_count min_width saturating
  syn keyword p4ObjectAttributeKeyword result pre_color

  syn keyword p4FieldModKeyword        signed saturating

  syn keyword p4HeaderIdxKeyword       last

  syn keyword p4MatchTypeKeyword       exact ternary lpm range valid

  syn keyword p4CounterTypeKeyword     bytes packets packets_and_bytes

  syn keyword p4FieldListKeyword       payload

  syn keyword p4ParserKeyword          parse_error default
  syn keyword p4ParserKeyword          mask latest current
  syn keyword p4ParserKeyword          parser_exception parser_drop

  syn keyword p4RegisterKeyword        register width attributes

  syn keyword p4ActionProfileKeyword   action_selector

  syn keyword p4Todo          contained FIXME TODO
  syn match   p4Comment       "//.*$"  contains=p4Todo,@Spell
  syn region  p4BlockComment  start="/\*"  end="\*/" contains=p4Todo,@Spell

  syn match   p4Preprocessor  "#.*$"


  " Numbers
  syn case ignore
  syn match	p4Number	display transparent "\<\d" contains=p4NumDec,p4NumBin,p4NumHex
  " Decimal (with optional width at the beginning/no trailing apostrophe)
  syn match	p4NumDec	display contained "\(\d\+\>'\<\)\?\d\+\>'\@!"
  " Binary (with optional width at the beginning/no trailing apostrophe)
  syn match	p4NumBin	display contained "\(\d\+\>'\<\)\?0b[_01]\+\>'\@!"
  " Hexadecimal (with optional width at the beginning/no trailing apostrophe)
  syn match	p4NumHex	display contained "\(\d\+\>'\<\)\?0x\x\+\>'\@!"

  syn case match

  syn keyword p4Builtin       apply hit miss
  syn keyword p4Builtin       extract set_metadata

  syn keyword p4Primitives    add_header copy_header remove_header
  syn keyword p4Primitives    modify_field
  syn keyword p4Primitives    add_to_field add
  syn keyword p4Primitives    subtract_from_field subtract
  syn keyword p4Primitives    set_field_to_hash_index
  " legacy, to remove later
  syn keyword p4Primitives    modify_field_with_hash_based_offset
  syn keyword p4Primitives    modify_field_rng_uniform
  syn keyword p4Primitives    bit_and bit_or bit_xor
  syn keyword p4Primitives    shift_left shift_right
  syn keyword p4Primitives    truncate drop
  syn keyword p4Primitives    push pop
  syn keyword p4Primitives    count meter
  syn keyword p4Primitives    execute_meter
  syn keyword p4Primitives    register_read register_write
  syn keyword p4Primitives    generate_digest
  syn keyword p4Primitives    resubmit recirculate
  syn keyword p4Primitives    clone_ingress_pkt_to_ingress
  syn keyword p4Primitives    clone_egress_pkt_to_ingress
  syn keyword p4Primitives    clone_ingress_pkt_to_egress
  syn keyword p4Primitives    clone_egress_pkt_to_egress

  syn keyword p4Conditional   if else select
  syn keyword p4Statement     return

  syn keyword p4Constants     P4_PARSING_DONE true false

endif  " if !exists("p4_no_p4_14")


" P4_16 syntax
" ------------
if !exists("p4_no_p4_16")
  " Use case sensitive matching of keywords
  syn case match

  " Comments (same as P4_14)
  syn keyword p416Todo          contained FIXME TODO
  syn match   p416Comment       "//.*$"  contains=p416Todo,@Spell
  syn region  p416BlockComment  start="/\*"  end="\*/" contains=p416Todo,@Spell

  " Preprocessor
  syn region p416Included	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
  syn match  p416Included	display contained "<[^>]*>"
  syn match  p416Include	display "^\s*\zs#include\>\s*["<]" contains=p416Included

  syn region p416PreCondit start="^\s*\zs#\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend contains=p416Comment
  syn match  p416PreConditMatch display "^\s*\zs\(%:\|#\)\s*\(else\|endif\)\>"

  syn region p416Define start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@p416PreProcGroup,@Spell

  " Literals - boolean
  syn keyword     p416Boolean     true false

  " Literals - numbers
  syn match	p416Number	display transparent "\<\d" contains=p416NumDec,p416NumBin,p416NumHex
  " Decimal (with optional width at the beginning/no trailing apostrophe)
  syn match	p416NumDec	display contained "\(\d\+[ws]\(\d\|_\)\+\|\d\(\d\|_\)*\)\>'\@!"
  " Binary (with optional width at the beginning/no trailing apostrophe)
  syn match	p416NumBin	display contained "\(\d\+[ws]\)\?\c0b[_01]\+\>'\@!"
  " Octal (with optional width at the beginning/no trailing apostrophe)
  syn match	p416NumOct	display contained "\(\d\+[ws]\)\?\c0o[_01234567]\+\>'\@!"
  " Hexadecimal (with optional width at the beginning/no trailing apostrophe)
  syn match	p416NumHex	display contained "\(\d\+[ws]\)\?\c0x\(\x\|_\)\+\>'\@!"

  " Literals - strings
  syn region      p416String      start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell extend

  " Types
  syn keyword     p416Type        void error match_kind bool string bit int varbit
  syn keyword     p416Type        enum header header_union struct tuple extern parser control package

  " Keywords
  syn keyword     p416Statement   return exit
  syn keyword     p416Conditional if else switch
  syn keyword     p416Keyword     default const
  syn keyword     p416ParamDir    in out inout
  syn keyword     p416Parsing     state transition select value_set
  syn keyword     p416Control     apply action table key actions default_action entries

  " Annotations
  syn match       p416Annotation  display "@\w\+\>"

  " P4 core library
  if !exists("p4_no_core_lib")
    syn keyword     p416CoreLib     packet_in packet_out
  endif

endif  " if !exists("p4_no_p4_14")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apply highlight groups to syntax groups defined above
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_p4_syntax_inits")
  if version <= 508
    let did_p4_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  if !exists("p4_no_p4_14")
    HiLink p4NumDec                 Number
    HiLink p4NumBin                 Number
    HiLink p4NumHex                 Number
    HiLink p4ObjectKeyword          Type
    HiLink p4Comment                Comment
    HiLink p4BlockComment           Comment
    HiLink p4Preprocessor           Macro
    HiLink p4ObjectAttributeKeyword Keyword
    HiLink p4FieldModKeyword        Keyword
    HiLink p4HeaderIdxKeyword       Keyword
    HiLink p4MatchTypeKeyword       Keyword
    HiLink p4CounterTypeKeyword     Keyword
    HiLink p4FieldListKeyword       Keyword
    HiLink p4ParserKeyword          Keyword
    HiLink p4RegisterKeyword        Keyword
    HiLink p4ActionProfileKeyword   Keyword
    HiLink p4Builtin                Function
    HiLink p4Conditional            Conditional
    HiLink p4Statement              Statement
    HiLink p4Constants              Constant
    HiLink p4Primitives             Function
  endif   " if !exists("p4_no_p4_14")

  if !exists("p4_no_p4_16")
    HiLink p416Comment              Comment
    HiLink p416BlockComment         Comment
    HiLink p416Todo                 Todo
    HiLink p416Include              PreProc
    HiLink p416Included             String
    HiLink p416PreCondit            PreCondit
    HiLink p416PreConditMatch       PreCondit
    HiLink p416Define               Macro
    HiLink p416Boolean 	            Number
    HiLink p416NumDec               Number
    HiLink p416NumBin               Number
    HiLink p416NumOct               Number
    HiLink p416NumHex               Number
    HiLink p416String               String
    HiLink p416Type                 Type
    HiLink p416Statement            Statement
    HiLink p416Conditional          Conditional
    HiLink p416Keyword              Keyword
    HiLink p416ParamDir             Keyword
    HiLink p416Parsing              Keyword
    HiLink p416Control              Keyword

    HiLink p416Annotation           PreProc

    HiLink p416CoreLib              Keyword
  endif   " if !exists("p4_no_p4_16")

  delcommand HiLink
endif

let b:current_syntax = "p4"
