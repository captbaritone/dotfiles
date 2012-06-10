Test task time totals

Test setup

    :so test_setup.vim

Basic test

    > cn TODO test entry
    >     Some Subtask [0.5h]
    >     Some other subtask [1.5h]
    @\ce
    (2)     :INFO:
    (3)         +TOTALTIME: 2.00

Two entries

    @ggdG
    > cn TODO test entry [2.5h]
    >     Some subtask [1.5h]
    >     Some subtask [13.25h]
    > cn TODO another entry
    >     Subtask 1 [1.00h]
    >     Subtask 2 [4.75h]
    @\ce
    (2)     :INFO:
    (3)         +TOTALTIME: 17.25
    (7)     :INFO:
    (8)         +TOTALTIME: 5.75

Change one time entry

    @zR
    @4Gc$Some subtask [1.75h]
    @\ce
    (3)         +TOTALTIME: 17.50

vim: ft=vimcram
