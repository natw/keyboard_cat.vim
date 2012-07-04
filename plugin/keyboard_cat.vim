let g:keyboard_cat_counter = 0
let s:letters = split('abcdefghijklmnopqrstuvwxyz;,./''', '\zs')

command! -nargs=? PlayMeOff call PlayMeOff(<args>)

function! PlayMeOff(...)
    if a:0 > 0
        let l:fname = a:1
    else
        let l:fname = "/tmp/keyboard_cat.txt"
    endif
    let s:keyboard_cat_text = s:ReadFile(l:fname)
    for l:letter in s:letters
        let l:cmd = "inoremap <expr> <buffer> " . l:letter . " NextCharacter()"
        execute l:cmd
    endfor
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
    " TODO: expand fname (allow ~)
    let l:lines = readfile(a:fname)
    let l:text = join(l:lines, "") " literal ^M
    return l:text
endfunction
