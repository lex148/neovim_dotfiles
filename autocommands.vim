if has('autocmd')

  " Triggers =====================================================================
  autocmd FocusLost    * :set number
  autocmd FocusGained  * :set relativenumber
  autocmd InsertEnter  * :set number
  autocmd InsertLeave  * :set relativenumber


  " if executable('go')
  "   autocmd FileType go autocmd BufWritePre <buffer> Fmt
  " endif

  function Tab2()
    set tabstop=2
    set shiftwidth=2
    set expandtab
    echom "tab 2!"
  endfunction

  function Tab4()
    set tabstop=4
    set shiftwidth=4
    set expandtab
    echom "tab 4!"
  endfunction


endif

function Tab2()
  set tabstop=2
  set shiftwidth=2
  set expandtab
  echom "tab 2!"
endfunction

function Tab4()
  set tabstop=4
  set shiftwidth=4
  set expandtab
  echom "tab 4!"
endfunction
