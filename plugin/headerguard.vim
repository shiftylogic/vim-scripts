" MIT License
" 
" Copyright (c) 2020 Robert Anderson
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

if exists("g:loaded_sl_headerguard")
    finish
endif

let g:loaded_sl_headerguard = 100

function SL_InsertHeaderGuard()
    let headerID = substitute(SL_MakeGuid(), "-", "", "g")
    let filename = substitute(expand("%:t"), "\\.", "_", "g")
    let guardTag = toupper("__" . filename . "_" . headerID . "__")
    execute "normal! i#ifndef " . guardTag
    execute "normal! o#define " . guardTag
    execute "normal! Go#endif  /* " . guardTag . " */"
endfunction

