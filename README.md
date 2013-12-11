
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

I work as a freelance web developer mostly on small projects where I am
responsible for taking sites from .psd to production. Most projects are built
in PHP.

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
    - __Status Line:__ [Vim Powerline] Beautiful status line with all the info
    I need.
    - __File Opener:__ [ctrl-p] Fuzzy matching file opener.
- __Revision control:__ [Git] I interact with Git via the command line.
- __Website deployment:__ [Git-ftp] Some clients are running on Windows servers
  where I only have FTP access. With Git-fpt I can easily push my current git
  branch state via ftp. Transfers only the files that have changed since the
  last push.
- __Development Environment:__ [Vagrant] I'm using a Vagrant deployed virtual
  machine as my development server. It allows me to avoid having to keep my
  LAMP stack working on my development machine. I currently have just one VM
  which hosts all my projects. You can find my Vagrant config
  [here][vagrant-lamp].
- __CSS preprocessing:__ [Sass] Write CSS the way a programmer ought to with
  inheritance and variables. Faster to write, easier to maintain. The new .scss
  version is backwards compatible to .css which makes transitioning very easy.
- __Browser refresher:__ [Live Reload] one of the few commercial softwares on
  this list. Watches the local files in your project and intelligently reloads
  your browser when they change.
- __Testing email:__ [MailCatcher] testing code that sends emails from a web
  server used to be a pain. MailCatcher runs on your server and masquerades as
  sendmail on your dev server. You can then view all sent emails in a web
  interface. It also renders HTML emails.
- __Window manager:__ [SizeUp] assign hotkeys to resize your windows to
  predefined positions. Lets me effectively use my entire screen(s).  a GUI for
  a quick FTP transfer.
- __Database management:__ [Sequel Pro] For ages I stuck with PhpMyAdmin, but
  as of recently I've found having a native MYSQL client is actually far more
  convenient.
- __Email:__ [Gmail] I have some privacy concerns about my personal information
  being used as a marketing tool, but between the spam filter, search
  functionality and the highly usable web interface, for now I sacrifice
  principle for convenience.

[vim]: http://www.vim.org/
[Coming Home to Vim]: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
[Your problem with Vim is that you don't grock vi]: http://stackoverflow.com/a/1220118
[Ultisnips]: https://github.com/vim-scripts/UltiSnips
[Molokai]: http://github.com/tomasr/molokai
[Syntastic]: http://github.com/scrooloose/syntastic
[Gundo]: http://github.com/sjl/gundo.vim
[Vim Powerline]: http://github.com/Lokaltog/vim-powerline
[ctrl-p]: http://github.com/kien/ctrlp.vim.git
[Git]: http://git-scm.com/
[Git-ftp]: https://github.com/ezyang/git-ftp
[Vagrant]: http://www.vagrantup.com/
[vagrant-lamp]: https://github.com/captbaritone/vagrant-lamp
[Sass]: http://sass-lang.com/
[Live Reload]: http://livereload.com/
[MailCatcher]: http://mailcatcher.me/
[SizeUp]: http://www.irradiatedsoftware.com/sizeup/
[Sequel Pro]: http://www.sequelpro.com/
[Gmail]: http://gmail.com
