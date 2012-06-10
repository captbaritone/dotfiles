Test Archiving

Ensure we have a clean archive file first
    :w test006.archive

Setup tests:

    :so test_setup.vim
    :let g:todo_done_file='test006.archive'

Insert some test data

    > TODO 2009-09-07 Test entry
    > DONE 2009-09-08 Test entry 2
    > CANCELLED 2009-09-08 Test entry 3
    > WAITING 2009-09-09 Test entry 4
    > CLOSED 2009-09-10 Test entry 5

Archive, and check that done tasks were removed
    @\ca
    TODO 2009-09-07 Test entry
    WAITING 2009-09-09 Test entry 4

Now check the contents of the archive file

    :e! test006.archive
    DONE 2009-09-08 Test entry 2
    CANCELLED 2009-09-08 Test entry 3
    CLOSED 2009-09-10 Test entry 5

Clean up

    :call delete("test006.archive")

vim: ft=vimcram
