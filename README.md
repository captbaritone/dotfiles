Dotfiles 
========

These are my personal configuration files. Having them in a Gihub repository
allows me to instantly set up shop on any machine as well as keep my tools and
configurations in sync across my laptop and desktop machines.

Install 
-------

A handy script to fetch and install these files is located at
`classicalcode.com` you can run it via any of the one-liners below:

- `curl classicalcode.com | source`
- `wget -o - classicalcode.com | source`
- `lynx -source classicalcode.com | source`

This script fetches the dot files and then runs `install.sh` which setups up
the machine, links the dotfiles in place, and then sources `~/.bashrc`.

If a dotfile already exists, and is not the correct symlink, it will be moved
to `$FILENAME.local` with the expectation that the repository version of the
dotfile will source it. This allows for per-machine customization.

refit
-----

Once these files are installed, a command `refit` will be avaliable on the
command line. Which will re-execute will the `install.sh` script which, after
the inital install, will simply update the machine to the most modern setup.

Workflow 
--------

I work as a freelance web developer mostly on small projects where I am
responsible for taking sites from .psd to production. 

For the curious, here is a list of the tools (toolchain) I am currently using.
It is heavily keyboard and command-line centric.

- __OS:__ OSX on my desktop and Ubuntu on my laptop. These dotfiles work on
  both. 
- __Text editor:__ [Vim](http://www.vim.org/) may have a steep learning curve,
  but for me the return on investment was nearly immediate. For anyone looking
  to make the leap, I recommend reading [Coming Home to
  Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/) a blog post by
  Steve Losh and [Your problem with Vim is that you don't grock
  vi](http://stackoverflow.com/a/1220118) by StackOverflow user Jim Dennis.
    - __Snippet manager:__
      [Ultisnips](https://github.com/vim-scripts/UltiSnips) easily manage
      sophisticated code snippets. I have heard equally good things about
      [SnipMate](https://github.com/msanders/snipmate.vim/) but have not tried
      it myself.
    - __Colorscheme:__
      [Molokai](http://www.vim.org/scripts/script.php?script_id=2340) a high
      contrast, dark background colorscheme. 
    - __Code Linting:__ [Syntastic](http://github.com/scrooloose/syntastic)
      Find mal-formatted code at save time instead of at run time.
    - __Undo:__ [Gundo](http://github.com/sjl/gundo.vim) View and move through
      undo history as a tree.
    - __Status Line:__ [Vim
      Powerline](http://github.com/Lokaltog/vim-powerline) Beautiful status
      line with all the info I need.
    - __Window Manager:__ [DWM.Vim](http://github.com/spolu/dwm.vim) Manage
      multiple editing panes within Vim. One main focused editing pane on the
      left, and the rest are stacked on the right.
- __Revision control:__ [Git](http://git-scm.com/) I interact with Git via the
  command line.
    - __Branching model:__ [A Successful Git Branching
      Model](http://nvie.com/posts/a-successful-git-branching-model/) maintain
      your code in production, staging and development stats in parallel.
    - __Bash prompt:__ [Sexy Bash
      Prompt](https://github.com/captbaritone/dotfiles/blob/master/bash_prompt)
      have your prompt contain your current git branch and commit status.
- __Website deployment:__ [Git-ftp](https://github.com/ezyang/git-ftp) easily
  push your current git branch state via ftp. Transfers only the files that
  have changed since the last push. I run it directly from my development
  machine for smaller projects, and as a hook on my Git server (below) for
  collaborative projects.
- __CSS preprocessing:__ [Sass](http://sass-lang.com/) (Processed by Live
  Reload) write CSS the way a programmer ought to with inheritance and
  variables. Faster to write, easier to maintain. The new .scss version is
  backwards compatible to .css which makes transitioning very easy. 
- __Browser:__ [Chrome](http://www.google.com/chrome) runs faster than Firefox
  for me, and their developer tools are second to none.
- __Browser refresher:__ [Live Reload](http://livereload.com/) one of the few
  commercial softwares on this list. Watches the local files in your project
  and intelligently reloads your browser when they change.
- __Testing email:__ [MockSMTP](http://mocksmtpapp.com/) testing code that
  sends emails from a web server used to be a pain. MockSMTP masquerrades as
  a mail server and notifies you via Growl when your local web server sends an
  email.  It also renders HTML emails.
- __Local web server:__ [Apache](http://httpd.apache.org/) comes bundled with
  OSX and is used on 99% of production servers.
- __Window manager:__ [SizeUp](http://www.irradiatedsoftware.com/sizeup/)
  assign hotkeys to resize your windows to predefined positions. Lets me
  effectively use my entire screen(s).
- __Directory jumper:__ [z](https://github.com/sjl/z-zsh) quickly jump to
  oft-visited directories at the command-line
- __FTP client:__ [Transmit](http://panic.com/transmit/) sometimes I just need
  a GUI for a quick FTP transfer.
- __Git server:__ [Gitolite](https://github.com/sitaramc/gitolite/) running on
  the server in my closet, this allows for a central repository for all
  collaborative projects. Especially useful in conjunction with Git-ftp (above)
  running as a server side Git hook.
- __Database management:__ [PhpMyAdmin](http://www.phpmyadmin.net/) another
  task for which I still use a GUI. PhpMyAdmin is generally already available
  on most shared hosting accounts.
- __Email:__ [Gmail](http://gmail.com) I have some privacy concerns about my
  personal information being used as a marketing tool, but between the spam
  filter, search functionality and the highly usable web interface, for now
  I sacrifice principle for convenience.

Shortcomings 
------------

- On Ubuntu, opening a file in Vim from the command line spawns a new GVim
  instance instead of opening a new pane in the existing instance.
- Git push and pull on linux machines throw an error having to do with the OXS
  key thingy. `git: 'credential-osxkeychain' is not a git command. See 'git
  --help'.`
- Auto indent in vim doesn't work for HTML tags
- Ocassionally `git lg` will crash after it runs
    - `error: git lg1 died of signal 13`
    - `fatal: While expanding alias 'lg': 'git lg1': Undefined error: 0`
- Git aparently has a better way to do the brach and status in the prompt now.
