" MIT License
"
" Copyright (c) 2020-present Robert Anderson
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

if exists("g:loaded_sl_license")
    finish
endif

let g:loaded_sl_license = 100

if !exists("g:sl_license")
    if !filereadable("LICENSE")
        let g:sl_license = [ "No 'LICENSE' file available" ]
    else
        let g:sl_license = readfile("LICENSE")
    endif
endif

function s:SL_InsertLicenseCore()
    for l:line in g:sl_license
        execute "normal! o" . l:line
    endfor
endfunction

function SL_InsertLicenseHeader()
    execute "normal! mqggO\<esc>d$"
    call s:SL_InsertLicenseCore()
    execute "normal! o\<esc>ggdd`q"
endfunction

function SL_InsertCppLicenseHeader()
    execute "normal! mqggO\<esc>d$i/**"
    call s:SL_InsertLicenseCore()
    execute "normal! o\<esc>xA*/\<esc>o\<esc>`q"
endfunction

function SL_InsertDartLicenseHeader()
    execute "normal! mqggO\<esc>d$i/**"
    for l:line in g:sl_license
        execute "normal! o* " . l:line
    endfor
    execute "normal! o*/\<esc>o\<esc>`q"
endfunction

function SL_InsertGoLicenseHeader()
    execute "normal! mqggO\<esc>d$"
    for l:line in g:sl_license
        execute "normal! o// " . l:line
    endfor
    execute "normal! o\<esc>ggdd`q"
endfunction

function SL_InsertPyLicenseHeader()
    execute "normal! mqggO\<esc>d$"
    for l:line in g:sl_license
        execute "normal! o# " . l:line
    endfor
    execute "normal! o\<esc>ggdd`q"
endfunction

function SL_InsertSwiftLicenseHeader()
    execute "normal! mqggO\<esc>d$i/**"
    for l:line in g:sl_license
        execute "normal! o* " . l:line
    endfor
    execute "normal! o\<esc>xA*/\<esc>o\<esc>`q"
endfunction

