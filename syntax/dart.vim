" Vim syntax file " Language: Dart
" Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
" for details. All rights reserved. Use of this source code is governed by a
" BSD-style license that can be found in the LICENSE file.

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='dart'
  syn region dartFold start="{" end="}" transparent fold
endif

" keyword definitions
syn keyword dartConditional    if else switch
syn keyword dartRepeat         while for
syn keyword dartBoolean        true false
syn keyword dartConstant       null
syn keyword dartTypedef        this super class typedef
syn keyword dartOperator       new is in factory
syn match   dartOperator       "+\|-\|*\|[~]\=/\|%\|||\|&&\|!\|==[=]\="
syn keyword dartType           void var const bool int double num
syn keyword dartStatement      return
syn keyword dartStorageClass   static final abstract
syn keyword dartExceptions     throw try catch finally
syn keyword dartAssert         assert
syn keyword dartClassDecl      extends implements interface
" TODO(antonm): check if labels on break and continue are supported.
syn keyword dartBranch         break continue nextgroup=dartUserLabelRef skipwhite
syn keyword dartKeyword        function get set
syn match   dartUserLabelRef   "\k\+" contained
syn match   dartVarArg         "\.\.\."

" TODO(antonm): consider conditional highlighting of corelib classes.

syn region  dartLabelRegion   transparent matchgroup=dartLabel start="\<case\>" matchgroup=NONE end=":"
syn keyword dartLabel         default

" Comments
syn keyword dartTodo          contained TODO FIXME XXX
syn region  dartComment       start="/\*"  end="\*/" contains=dartTodo,dartDocLink,@Spell
syn match   dartLineComment   "//.*" contains=dartTodo,@Spell
syn region  dartDocLink       contained start=+\[+ end=+\]+

" Strings
syn region  dartString       start=+"+ end=+"+ contains=@Spell,dartInterpolation,dartSpecialChar
syn region  dartString       start=+'+ end=+'+ contains=@Spell,dartInterpolation,dartSpecialChar
syn match   dartInterpolation     contained "\$\(\w+\|{\w\+}\)"
syn match   dartSpecialChar       contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"

" Numbers
syn match dartNumber         "\<\d\+\(\.\d\+\)\=\>"

" The default highlighting.
command! -nargs=+ HiLink hi def link <args>
HiLink dartVarArg          Function
HiLink dartBranch          Conditional
HiLink dartUserLabelRef    dartUserLabel
HiLink dartLabel           Label
HiLink dartUserLabel       Label
HiLink dartConditional     Conditional
HiLink dartRepeat          Repeat
HiLink dartExceptions      Exception
HiLink dartAssert          Statement
HiLink dartStorageClass    StorageClass
HiLink dartClassDecl       dartStorageClass
HiLink dartBoolean         Boolean
HiLink dartString          String
HiLink dartNumber          Number
HiLink dartStatement       Statement
HiLink dartOperator        Operator
HiLink dartComment         Comment
HiLink dartLineComment     Comment
HiLink dartConstant        Constant
HiLink dartTypedef         Typedef
HiLink dartTodo            Todo
HiLink dartKeyword         Keyword
HiLink dartType            Type
HiLink dartInterpolation   PreProc
HiLink dartDocLink         SpecialComment
HiLink dartSpecialChar     SpecialChar
delcommand HiLink

let b:current_syntax = "dart"

if main_syntax == 'dart'
  unlet main_syntax
endif

let b:spell_options="contained"
