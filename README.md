
Dotfiles
========

These are my personal configuration files. Having them in a GitHub repository
allows me to instantly set up shop on any machine as well as keep my tools and
configurations in sync across my laptop and desktop machines.

Install
-------

A handy script to fetch and install these files is located at
`classicalcode.com` I can run it via any of the one-liners below:

- `curl classicalcode.com | sh`
- `wget -o - classicalcode.com | sh`
- `lynx -source classicalcode.com | sh`

This script fetches the dot files and then runs `install.sh` which setups up
the machine, links the dotfiles in place.

If a dotfile already exists, and is not the correct symlink, it will be moved
to `$FILENAME.local` with the expectation that the repository version of the
dotfile will source it. This allows for per-machine customization.

Workflow
--------

For the curious, here is a list of the tools (toolchain) I am currently using.
It is heavily keyboard and command-line centric.

- __OS:__ OSX on my desktop and Ubuntu on my laptop. These dotfiles work on
  both.
- __Text editor:__ [Vim] may have a steep learning curve, but for me the
  return on investment was nearly immediate. For anyone looking to make the
  leap, I recommend reading [Coming Home to Vim] a blog post by Steve Losh
  and [Your problem with Vim is that you don't grock vi] by StackOverflow user
  Jim Dennis.
    - __Snippet manager:__ [Ultisnips] easily manage sophisticated code
      snippets.
    - __Colorscheme:__ [Molokai] a high contrast, dark background colorscheme.
    - __Code Linting:__ [Syntastic] Find mal-formatted code at save time instead of
    at run time.
    - __Undo:__ [Gundo] View and move through undo history as a tree.
    - __Status Line:__ [Vim Airline] Beautiful status line with all the info
    I need, implemented in native VimL.
    - __File Opener:__ [ctrl-p] Fuzzy matching file opener.
- __Revision control:__ [Git] I interact with Git via the command line.

[vim]: http://www.vim.org/
[Coming Home to Vim]: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
[Your problem with Vim is that you don't grock vi]: http://stackoverflow.com/a/1220118
[Molokai]: http://github.com/tomasr/molokai
[Syntastic]: http://github.com/scrooloose/syntastic
[Gundo]: http://github.com/sjl/gundo.vim
[Vim Airline]: https://github.com/bling/vim-airline
[ctrl-p]: http://github.com/kien/ctrlp.vim.git
[Git]: http://git-scm.com/
