if exists('b:current_syntax')
  finish
endif

setl iskeyword=33,35-39,42-43,45-58,60-90,94,95,97-122,126

syn match watParentheses "[^ '`\t\n()\[\]\";]\+"
syn match watParentheses "[)\]]"

syn match watIdentifier /[^ '`\t\n()\[\]\"|;][^ '`\t\n()\[\]\"|;]*/

syn match watComment /;;.*$/ contains=@Spell

syn region watForm matchgroup=watParentheses start="(" end=")" contains=ALLBUT,watUnquote,watDatumCommentForm,@watImportCluster

syn match watNumber /\(#[dbeio]\)*[+\-]*\([0-9]\+\|inf.0\|nan.0\)\(\/\|\.\)\?[0-9+\-@\ilns]*\>/
syn match watNumber /#x[+\-]*[0-9a-fA-F]\+\>/
syn region watString start=/\(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/ contains=@Spell

syn keyword watSyntax module
syn keyword watSyntax type
syn keyword watSyntax func
syn keyword watSyntax param
syn keyword watSyntax result
syn keyword watSyntax export
syn keyword watSyntax import
syn keyword watEvil unreachable
syn keyword watTypeMod sub
syn keyword watTypeMod struct
syn keyword watTypeMod ref
syn keyword watType eq
syn keyword watType i32
syn keyword watFunction return_call_ref
syn keyword watFunction return_call
syn keyword watFunction i32.const
syn keyword watFunction local.get
syn keyword watFunction ref.func
syn keyword watFunction i31.get_s
syn keyword watFunction i31.get_u
syn keyword watFunction i32.eq
syn keyword watStructuredFunction if
syn keyword watStructuredFunction then
syn keyword watStructuredFunction else

hi def link watParentheses Delimiter
hi def link watSyntax Keyword
hi def link watComment Comment
hi def link watIdentifier Identifier
hi def link watNumber Number
hi def link watString String
hi def link watFunction Function
hi def link watStructuredFunction Statement
hi def link watType Type
hi def link watTypeMod StorageClass
hi def link watEvil Debug

let b:current_syntax = 'wat'

