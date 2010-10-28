" Stick it somewhere (.vimrc?)
" Works with Gvim and Macvim
" Windows users should go back to their IE6
" Usage:
" :Maps Birmingham,UK

function! s:Maps(search)
  let search = a:search
  let p1 = "http://maps.google.com/maps/api/staticmap?center="
  let p2 = "&zoom=13&size=400x400&maptype=roadmap&sensor=true&format=png"
  let url = p1.search.p2
  if has('gui')
      if has('gui_gnome')
        let cmd = "xdg-open"
      elseif has('gui_macvim')
        let cmd = "qlmanage -p"
      elseif has('gui_win32')
          " WTF?
      endif
  endif
  execute ' ! curl -L "'.url.'" > map | '.cmd.' map'
endfunction
command! -bar -nargs=* Maps call s:Maps("<args>")
