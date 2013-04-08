command! -nargs=? -complete=file PlayMeOff call s:PlayMeOff(<f-args>)
command! -nargs=? -complete=file DisableKeyboardCat call s:DisableKeyboardCat()

let s:letters = split('abcdefghijklmnopqrstuvwxyz1234567890-=;,.:<>?"{}[]/''', '\zs')

function! s:PlayMeOff(...)
    setlocal noautoindent
    setlocal nosmartindent
    setlocal nosmarttab
    setlocal indentexpr=
    setlocal indentkeys=
    setlocal comments=
    filetype indent off
    let b:keyboard_cat_counter = 0
    if a:0 > 0
        let l:fname = a:1
    else
        let l:fname = "/tmp/keyboard_cat.txt"
    endif
    let b:keyboard_cat_text = s:ReadFile(l:fname)
    call <SID>MapCat()
endfunction

function! s:MapCat()
    for l:letter in s:letters
        execute "inoremap <expr> <buffer> " .  l:letter . " <SID>NextCharacter()"
        execute "inoremap <expr> <buffer> " .  toupper(l:letter) . " <SID>NextCharacter()"
    endfor
    inoremap <expr> <buffer> <space> <SID>NextCharacter()
    inoremap <expr> <buffer> <BS> <SID>GoBackKittyCat()
endfunction

function! s:NextCharacter()
    let l:char = strpart(b:keyboard_cat_text, b:keyboard_cat_counter, 1)
    let b:keyboard_cat_counter += 1
    return l:char
endfunction

function! s:GoBackKittyCat()
    let b:keyboard_cat_counter -= 1
    return "\b"
endfunction

function! s:DisableKeyboardCat()
    for l:letter in s:letters
        execute "inoremap <buffer>" l:letter l:letter
        execute "inoremap <buffer>" toupper(l:letter) toupper(l:letter)
    endfor
    inoremap <buffer> <space> <space>
    inoremap <buffer> <bs> <bs>
endfunction

function! s:ReadFile(fname)
    let l:lines = readfile(a:fname)
    let l:text = join(l:lines, "\r")
    return l:text
endfunction
