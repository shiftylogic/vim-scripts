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

if exists("g:loaded_sl_cpphelpers")
    finish
endif

let g:loaded_sl_cpphelpers = 100

function s:SL_NewCppSourceFile()
    " Add the license header
    call SL_InsertCppLicenseHeader()
endfunction

function s:SL_NewCppHeaderFile()
    " Insert the guard
    call SL_InsertHeaderGuard()

    " Also, add the license header
    call SL_InsertCppLicenseHeader()

    " Position cursor inside guard
    execute "normal! GO\<cr>\<esc>O"
endfunction

autocmd BufNewFile *.{c,cpp} call <SID>SL_NewCppSourceFile()
autocmd BufNewFile *.{h,hpp} call <SID>SL_NewCppHeaderFile()

