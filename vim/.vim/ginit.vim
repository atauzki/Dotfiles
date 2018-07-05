if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Sarasa Mono  SC 10.5')
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
endif
