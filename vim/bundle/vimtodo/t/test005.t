Test TODO entry filtering

Setup tests:

    :so test_setup.vim

Make sure we don't include any of the user's files:

    :if exists("g:todo_files") | unlet g:todo_files | endif

Set some variables to match specific dates:

    :let g:lastmonth = strftime("%Y-%m-%d", localtime() - 86400 * 30)
    :let g:lastweek  = strftime("%Y-%m-%d", localtime() - 86400 * 7)
    :let g:yesterday = strftime("%Y-%m-%d", localtime() - 86400)
    :let g:today     = strftime("%Y-%m-%d")
    :let g:tomorrow  = strftime("%Y-%m-%d", localtime() + 86400)
    :let g:day2      = strftime("%Y-%m-%d", localtime() + 86400 * 2)
    :let g:day3      = strftime("%Y-%m-%d", localtime() + 86400 * 3)
    :let g:day4      = strftime("%Y-%m-%d", localtime() + 86400 * 4)
    :let g:day7      = strftime("%Y-%m-%d", localtime() + 86400 * 7)
    :let g:day8      = strftime("%Y-%m-%d", localtime() + 86400 * 8)

Insert some TODO entries with varying due dates.

    > TODO ${g:today} Last Month {${g:lastmonth}}
    > TODO ${g:today} Last Week {${g:lastweek}}
    > TODO ${g:today} Yesterday {${g:yesterday}}
    > TODO ${g:today} Today {${g:today}}
    > TODO ${g:today} Tomorrow {${g:tomorrow}}
    > TODO ${g:today} 2 Days {${g:day2}}
    > TODO ${g:today} 3 Days {${g:day3}}
    > TODO ${g:today} 4 Days {${g:day4}}
    > TODO ${g:today} 7 Days {${g:day7}}
    > TODO ${g:today} 8 Days {${g:day8}}
    > DONE ${g:today} Last Month {${g:lastmonth}}
    > DONE ${g:today} Last Week {${g:lastweek}}
    > DONE ${g:today} Yesterday {${g:yesterday}}
    > DONE ${g:today} Today {${g:today}}
    > DONE ${g:today} Tomorrow {${g:tomorrow}}
    > DONE ${g:today} 2 Days {${g:day2}}
    > DONE ${g:today} 3 Days {${g:day3}}
    > DONE ${g:today} 4 Days {${g:day4}}
    > DONE ${g:today} 7 Days {${g:day7}}
    > DONE ${g:today} 8 Days {${g:day8}}
    :silent w test005.txt

Tasks due Today (\cd command)

    @\cd
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Today {'.g:today.'}'
    \ ]

Tasks due Today (:Today command)
    :Today
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Today {'.g:today.'}'
    \ ]


Tasks due Tomorrow (\cf command)

    @\cf
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Tomorrow {'.g:tomorrow.'}'
    \ ]

Tasks due Tomorrow (:Tomorrow command)

    :Tomorrow
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Tomorrow {'.g:tomorrow.'}'
    \ ]

Tasks due in 7 days (\cw command)

    @\cw
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Today {'.g:today.'}',
    \ 'TODO '.g:today.' Tomorrow {'.g:tomorrow.'}',
    \ 'TODO '.g:today.' 2 Days {'.g:day2.'}',
    \ 'TODO '.g:today.' 3 Days {'.g:day3.'}',
    \ 'TODO '.g:today.' 4 Days {'.g:day4.'}',
    \ 'TODO '.g:today.' 7 Days {'.g:day7.'}'
    \ ]

Tasks due in 7 days (:Week command)

    :Week
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Today {'.g:today.'}',
    \ 'TODO '.g:today.' Tomorrow {'.g:tomorrow.'}',
    \ 'TODO '.g:today.' 2 Days {'.g:day2.'}',
    \ 'TODO '.g:today.' 3 Days {'.g:day3.'}',
    \ 'TODO '.g:today.' 4 Days {'.g:day4.'}',
    \ 'TODO '.g:today.' 7 Days {'.g:day7.'}'
    \ ]

Tasks overdue (\cx command)

    @\cx
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Last Month {'.g:lastmonth.'}',
    \ 'TODO '.g:today.' Last Week {'.g:lastweek.'}',
    \ 'TODO '.g:today.' Yesterday {'.g:yesterday.'}'
    \ ]

Tasks overdue (:Overdue command)

    :Overdue
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Last Month {'.g:lastmonth.'}',
    \ 'TODO '.g:today.' Last Week {'.g:lastweek.'}',
    \ 'TODO '.g:today.' Yesterday {'.g:yesterday.'}'
    \ ]

Standard filter command - Note that filter includes DONE tasks

    :Filter Month
    :close
    ? map(getloclist(0), 'v:val.text') == [
    \ 'TODO '.g:today.' Last Month {'.g:lastmonth.'}',
    \ 'DONE '.g:today.' Last Month {'.g:lastmonth.'}'
    \ ]

Clean up

    :call delete("test005.txt")

vim: ft=vimcram
