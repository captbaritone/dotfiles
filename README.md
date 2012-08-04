Dotfiles
========

These are my personal configuration files. Having them in a Gihub repository 
allows me to instantly set up shop on any machine as well as keep my tools and 
configurations in sync across my laptop and desktop machines.

I work as a web developer and I am beginning to learn the value of honing 
not only my knowledge and skills, but also my tools. Every second spent doing
something that could have been automated is wasteful and tedious, but more 
importantly, it makes my work less interesting. I am trying to minimize 
monotony.

As I said, this is my toolkit and it has been honed for my workflow as a web
developer. For the curious, here is a list of the tools (toolchain) I am 
currently using. It is heavily keyboard and command-line centric.

- OS: OSX on my desktop and Ubuntu on my laptop. These dotfiles work on both
- Text editor: [Vim](http://www.vim.org/)
    - Snippet manager: [Ultisnips](https://github.com/vim-scripts/UltiSnips)
    - Colorscheme: [Molokai](http://www.vim.org/scripts/script.php?script_id=2340)
- Revision control: [Git](http://git-scm.com/)
    - Branching model: [A Successful Git Branching Model](http://nvie.com/posts/a-successful-git-branching-model/)
- Website deployment: [Git-ftp](https://github.com/ezyang/git-ftp)
- CSS preprocessing: Sass (Processed by Live Reload)
- Browser: [Chrome](http://www.google.com/chrome)
- Browser refresher: [Live Reload](http://livereload.com/)
- Testing email: [MockSMTP](http://mocksmtpapp.com/)
- Web server: Apache
- Window manager: [SizeUp](http://www.irradiatedsoftware.com/sizeup/)
- Directory jumper: [z](https://github.com/sjl/z-zsh)
- FTP client: [Transmit](http://panic.com/transmit/)
- Git server: [Gitolite](https://github.com/sitaramc/gitolite/)
- Database management: [PhpMyAdmin](http://www.phpmyadmin.net/)
- Email: [Gmail](http://gmail.com)
- PHP Framework: [CodeIgniter](http://codeigniter.com)


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
