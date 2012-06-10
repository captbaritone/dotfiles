Test checkboxes

Setup tests:

    :so test_setup.vim

Normal checkbox:

    > [ ]
    @k
    @\cc
    [X]
    @\cc
    [ ]

Y/N/? checkbox

    @dd
    > [Y]
    @k
    @\cc
    [N]
    @\cc
    [?]
    @\cc
    [Y]

+/-/. checkbox

    @dd
    > [+]
    @k
    @\cc
    [-]
    @\cc
    [.]
    @\cc
    [+]

Checkbox with some text

    @dd
    > [ ] Some text
    @k
    @\cc
    [X] Some text

Checkbox with indent and text

    @dd
    >     [ ] Some text
    @k
    @\cc
        [X] Some text

Add a checkbox

    @dd
    > Some text
    @k
    @\cb
    [ ] Some text

Ensure repeated \cb commands don't add more checkboxes

    @\cb
    [ ] Some text

Ensure repeated \cn commands on checked boxes don't add more of them

    @\cc
    @\cb
    [X] Some text

vim: ft=vimcram
