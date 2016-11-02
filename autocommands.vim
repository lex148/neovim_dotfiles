if has('autocmd')

  " Triggers =====================================================================
  autocmd FocusLost    * :set number
  autocmd FocusGained  * :set relativenumber
  autocmd InsertEnter  * :set number
  autocmd InsertLeave  * :set relativenumber


  " if executable('go')
  "   autocmd FileType go autocmd BufWritePre <buffer> Fmt
  " endif



endif
