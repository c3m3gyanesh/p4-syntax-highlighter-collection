" Vim syntax file                                                                
" Language: P4                                                                   
" Maintainer: Antonin Bas, Barefoot Networks Inc                                 
" Latest Revision: 5 August 2014                                                 
" Updated By: Gyanesh Patra, Unicamp University                                  
" Latest Revision: 12 April 2016                                                 

"if version &lt; 600                                                             
if version < 600                                                                 
  syntax clear                                                                   
elseif exists("b:current_syntax")                                                
  finish                                                                         
endif                                                                            

" Use case sensitive matching of keywords                                        
syn case match                                                                   

syn keyword p4ObjectKeyword parser table action                                  
syn keyword p4ObjectKeyword header_type header action metadata                   
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

syn keyword p4MatchTypeKeyword       exact ternary lpm range valid               

syn keyword p4CounterTypeKeyword     bytes packets                               

syn keyword p4TODO          contained FIXME TODO                                 
syn match   p4Comment       "//.*$"  contains=p4TODO,@Spell                      
syn region  p4BlockComment  start="/\*"  end="\*/" contains=p4TODO,@Spell        

syn match   p4Preprocessor  "#.*$"    

" Integers                                                                       
syn match   p4DecimalInt "\&lt;\d\+\([Ee]\d\+\)\?\&gt;"                          
syn match   p4HexadecimalInt "\&lt;0x\x\+\&gt;"                                  

syn keyword p4Builtin       apply hit miss                                       
syn keyword p4Builtin       extract set_metadata                                 

syn keyword p4Primitives    add_header copy_header remove_header                 
syn keyword p4Primitives    modify_field add_to_field                            
syn keyword p4Primitives    set_field_to_hash_index                              
" legacy, to remove later                                                        
syn keyword p4Primitives    modify_field_with_hash_based_offset                  
syn keyword p4Primitives    truncate drop                                        
syn keyword p4Primitives    count meter                                          
syn keyword p4Primitives    generate_digest                                      
syn keyword p4Primitives    resubmit recirculate                                 
syn keyword p4Primitives    clone_ingress_pkt_to_ingress                         
syn keyword p4Primitives    clone_egress_pkt_to_ingress                          
syn keyword p4Primitives    clone_ingress_pkt_to_egress                          
syn keyword p4Primitives    clone_egress_pkt_to_egress                           

syn keyword p4Conditional   if else select                                       
syn keyword p4Statement     return                                               

syn keyword p4Constants     P4_PARSING_DONE                                      

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

  HiLink p4ObjectKeyword          Type
  HiLink p4Comment                Comment
  HiLink p4BlockComment           Comment
  HiLink p4Preprocessor           Macro
  HiLink p4ObjectAttributeKeyword Keyword
  HiLink p4MatchTypeKeyword       Keyword
  HiLink p4CounterTypeKeyword     Keyword
  HiLink p4DecimalInt             Integer
  HiLink p4HexadecimalInt         Integer
  HiLink p4Builtin                Function
  HiLink p4Conditional            Conditional
  HiLink p4Statement              Statement
  HiLink p4Constants              Constant
  HiLink p4Primitives             Function

  delcommand HiLink
endif

let b:current_syntax = "p4"  
