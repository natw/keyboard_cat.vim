keyboard\_cat.vim
=================

A vim plugin for pretending like you can type really fast.


Why?
----

Conceivably, when giving some kind of presentation, you might want to pretend like you are typing something out.
But typing and talking is hard, so with this you can just mash on the keyboard and let the letters magically appear.

This might only really be useful for less serious presentations, like TiP BoF talks.

Install
-------

Do the usual [pathogen](https://github.com/tpope/vim-pathogen)/[vundle](https://github.com/gmarik/vundle) thing, put plugin/keyboard_cat.vim in  ~/.vim/plugin/ or just source it (for one-time use):

    :source plugin/keyboard_cat.vim

Use
---

Open up vim, and start the magic with this:

    :PlayMeOff /path/to/some/file

Then, in insert mode, typing any letter will enter the next character of the file specified.
So mash away to your heart's content.
