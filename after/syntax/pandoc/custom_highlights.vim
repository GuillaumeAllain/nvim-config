" syn match hashtags /\%(\s*#[^[:blank:]#]\+\)/ containedin=pandocAtxHeader
" hi link hashtags Operator
" syn keyword pandoctodo TODO containedin=pandocAtxHeader
" hi link pandoctodo todo
" syn keyword pandocdone DONE containedin=pandocAtxHeader
" hi link pandocdone Character
