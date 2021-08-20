"call fzf#run({ 'source': 'ls' })
"call fzf#run(fzf#wrap({ 'source': 'ls' }))
"call fzf#run(fzf#vim#with_preview(fzf#wrap({ 'source': 'ls' })))
"
"" See how these decorators "decorate" (or "extend") the dictionary
"echo fzf#wrap({ 'source': 'ls' })
"echo fzf#vim#with_preview(fzf#wrap({ 'source': 'ls' }))

"let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --no-index --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)
