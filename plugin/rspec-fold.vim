" from https://github.com/bcaccinolo/rspec-vim-folding/blob/master/plugin/rspec-vim-folding.vim
function! s:FoldItBlock()
  let start = search('^\s*\(it\|specify\|scenario\|before\).*do\s*$', 'We')
  let end = search('end', 'We')
  let cmd = (start+1).','.(end).'fold'
  if (start > 0) && (start < end)
    execute cmd
    return 1
  else
    return 0
  endif
endfunction

function! FoldAllItBlocks()
  let position = line('.')
  exe cursor(1,1)
  let result = 1

  while result == 1
    let result = s:FoldItBlock()
  endwhile

  call cursor(position, 1)
endfunction
