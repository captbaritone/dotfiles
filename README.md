Dotfiles
========

These are my personal configuration files. Having them in a Gihub repository 
allows me to instantly set up shop on any machine as well as keep my tools and 
configurations in sync across my laptop and desktop machines.

Install
-------

In the home directory:

    git clone git://github.com/captbaritone/dotfiles
    git submodule update --init


Then deploy (symbolically link) the files into your home dir

    cd dotfiles
    ./install.sh


install.sh
----------

`install.sh` will symlink all the dotfiles (every file in `dotfiles` except
`README.md` and `install.sh`) into your home dir. If the dotfile already
exists, and is not the correct symlink, it will be moved to `$FILENAME.local`
with the expectation that the repository version of the dotfile will source it.
This allows for per-machine customization.

Workflow
--------

I work as a freelance web developer mostly on small projects where I am
responsible for taking sites from .psd to production. I am beginning to learn
the value of honing not just my knowledge and skills, but also my tools. Every
second spent doing something that could have been automated is wasteful and
tedious, but more importantly makes my work less interesting.

For the curious, here is a list of the tools (toolchain) I am 
currently using. It is heavily keyboard and command-line centric.

- __OS__ OSX on my desktop and Ubuntu on my laptop. These dotfiles work on    
  both. 
- __Text editor__ [Vim](http://www.vim.org/) may have a steep learning curve,but
  for me the return on investment was nearly immediate. For anyone looking to
  make the leap, I recommend reading [Coming Home to 
  Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/) a blog post
  by Steve Losh and [Your problem with Vim is that you don't grock
  vi](http://stackoverflow.com/a/1220118) by StackOverflow user Jim Dennis.
    - __Snippet manager__ [Ultisnips](https://github.com/vim-scripts/UltiSnips)
      easily manage sophisticated code snippets. I have heard equally good
      things about [SnipMate](https://github.com/msanders/snipmate.vim/) but
      have not tried it myself.
    - __Colorscheme__ [Molokai](http://www.vim.org/scripts/script.php?script_id=2340) 
      a high contrast, dark background colorscheme. 
- __Revision control__ [Git](http://git-scm.com/) I interact with Git via the
  command line.
    - __Branching model__ [A Successful Git Branching Model](http://nvie.com/posts/a-successful-git-branching-model/)
      maintain your code in production, staging and development stats in parallel.
    - __Bash prompt__ [Sexy Bash Prompt](https://github.com/captbaritone/dotfiles/blob/master/bash_prompt) 
      have your prompt contain your current git branch and commit status.
- __Website deployment__ [Git-ftp](https://github.com/ezyang/git-ftp) easily push
  your current git branch state via ftp. Transfers only the files that
  have changed since the last push. I run it directly from my development
  machine for smaller projects, and as a hook on my Git server (below) for
  collaborative projects.
- __CSS preprocessing__ [Sass](http://sass-lang.com/) (Processed by Live Reload)
  write CSS the way a programmer ought to with inheritance and variables.
  Faster to write, easier to maintain.
- __Browser__ [Chrome](http://www.google.com/chrome) runs faster than Firefox for
  me, and their developer tools are second to none.
- __Browser refresher__ [Live Reload](http://livereload.com/) one of the few
  commercial softwares on this list. Watches the local files in your project
  and intelligently reloads your browser when they change.
- __Testing email__ [MockSMTP](http://mocksmtpapp.com/) testing code that sends
  emails from a web server used to be a pain. MockSMTP masquerrades as a mail
  server and notifies you via Growl when your local web server sends an email.
  It also renders HTML emails.
- __Local web server__ [Apache](http://httpd.apache.org/) comes bundled with OSX
  and is used on 99% of production servers.
- __Window manager__ [SizeUp](http://www.irradiatedsoftware.com/sizeup/) assign
  hotkeys to resize your windows to predefined positions. Lets me effectively
  use my entire screen(s).
- __Directory jumper__ [z](https://github.com/sjl/z-zsh) quickly jump to
  oft-visited directories at the command-line
- __FTP client__ [Transmit](http://panic.com/transmit/) sometimes I just need
  a GUI for a quick FTP transfer.
- __Git server__ [Gitolite](https://github.com/sitaramc/gitolite/) running on the
  server in my closet, this allows for a central repository for all
  collaborative projects. Especially useful in conjunction with Git-ftp (above) 
  running as a server side Git hook.
- __Database management__ [PhpMyAdmin](http://www.phpmyadmin.net/) another task
  that I still use a GUI for. PhpMyAdmin is generally already available on most
  shared hosting accounts.
- __Email__ [Gmail](http://gmail.com) I have some privacy concerns about my
  personal information being used as a marketing tool, but between the spam
  filter, search functionality and the highly usable web interface, for now
  I sacrifice principle for convenience.
