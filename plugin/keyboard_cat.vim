let g:keyboard_cat_counter = 0
let s:letters = split('abcdefghijklmnopqrstuvwxyz;,.:<>?"{}/''', '\zs')

command! -nargs=? -complete=file PlayMeOff call PlayMeOff(<f-args>)

function! PlayMeOff(...)
    if a:0 > 0
        let l:fname = a:1
    else
        let l:fname = "/tmp/keyboard_cat.txt"
    endif
    let s:keyboard_cat_text = s:ReadFile(l:fname)
    for l:letter in s:letters
        execute "inoremap <expr> <buffer> " . l:letter . " NextCharacter()"
        execute "inoremap <expr> <buffer> " . toupper(l:letter) . " NextCharacter()"
    endfor
    inoremap <expr> <buffer> <space> NextCharacter()
    inoremap <buffer> <silent> <c-k> DisableKeyboardCat()<cr>
endfunction

function! NextCharacter()
    let l:char = strpart(s:keyboard_cat_text, g:keyboard_cat_counter, 1)
    let g:keyboard_cat_counter += 1
    return l:char
endfunction

function! DisableKeyboardCat()
    " TODO: turn off
endfunction

function! s:ReadFile(fname)
    let l:lines = readfile(a:fname)
    let l:text = join(l:lines, "") " literal ^M
    return l:text
endfunction
