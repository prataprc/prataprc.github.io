---
layout: post
title: "Console jockey"
permalink: console-jockey.html
---

Console is pairing input device - the keyboard, and output device -
the monitor. That, when jacked into a computing machine, transforms any
ordinary human-being into a console-jockey. Let us ride on ..

This post is organized in five parts namely, the terminal, shell, programming
languages, version control and handy bunch of tools.

Desktop
-------

Keyboard tweaks

```bash
sudo apt-get install gnome-tweak-tool // to remap key codes.
sudo apt-get install gnome-session-fallback // to go back to classic desktop
```

Fonts and konsole

```bash
curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash
```


Terminal
--------

Terminal is a 2 dimensional array of character cells to display human readable
text. Although it is least useful in the context of pixel graphics, it tends
to be most versatile for keyboard jockeys. In present day computers, terminals
are almost always emulated, here are some such emulators,

```bash
sudo apt-get install konsole terminator
sudo apt-get install libvte-dev
```

[libvte][libvte-link] is the popular library that provides the terminal
emulator for most of the [gtk][gtk-link] based terminal application.

If you are power user of terminal, who end up opening several windows and
several tabs in each window, then you must seriously consider
[tmux][tmux-link] (or its ancestor [screen][screen-link]).

**tmux**,

In short, [tmux][tmux-link] allows user to create sessions and attach any
number of terminal emulators to a session. Inside a session you can create
any number of windows, even splitting them into panes. There is a whole
bunch of short-cut keys defined for you to manage, migrate and monitor your
windows/panes and emulator clients. For detailed information, check out its
man-page.

```bash
sudo apt-get install tmux
man tmux    # To learn about tmux.
```

Shell
-----

Terminal always launches a shell by default. Most likely, the default shell is
defined in /etc/passwd or in terminal's configuration file. If you are a power
user you ought to try [zsh][zsh-link].

```bash
sudo apt-get install zsh zsh-completions zsh-lovers zsh-syntax-highlighting
```

Zsh comes with an awesome completion, with syntax-highlighting you can even
get live feed back about what you are typing, similar to fish-shell.

Don't forget to configure your shell with .zshrc, there are many samples
available through google.

Editor, vim
-----------

Start with [vim][vim-link]. Sleek, productive and can get extremely powerful
for text editing and text manipulations.

```bash
sudo apt-get install exuberant-ctags vim vim-scripts vim-python-jedi
sudo apt-get install vim-syntax-docker vim-syntax-go vim-vimerl
sudo apt-get install vim-vimerl-syntax vim-athena
```

[vim][vim-link] comes with a built in scripting language. But bindings are
available for several languages like python, lua, tcl etc ... To know the
available binding in your vim installation,

```bash
vim --version
```

Should list `+python`, `+lua` etc.. in the output.

Similarly, to copy/paste content from OS clipboard `+clipboard` option should
be listed when doing --version, subsequently use  `+yy`, `+p` and related
commands inside vim will copy/paste from OS clipboard.

Supposing Vim has clipboard support, synchronizing Vim's default register and
the clipboard register is possible by adding the following line in your
`.vimrc` file,

```bash
set clipboard^=unnamed
```

Allowing you to simply use y and p.

Under /etc/vim/vimrc uncomment lines to enable vim to jump to the last
position when opening a file.

Programming languages
---------------------

Now that we have an editor, here is a list of über-cool languages that you should
install and play-around with,

**lua**,

In spirit [lua][lua-link] is similar to Javascript, with some semantic support for
concurrency using co-routines. It is an elegant and cleanly done language
which must be the first choice of language for configuring/extending
applications.

```bash
sudo apt-get install lua luajit luarocks
```

[luajit][luajit-link] is a super-fast Just-in-time compiler for lua that can almost compete
with Google-javascript-V8. [luarocks][luarocks-link] is package manager for lua. Packages
can be installed local to a single user or under system directory making it
available for all users.

**node.js**,

[node.js][nodejs-link] is a Javascript tool that encourages the paradigm of event-driven
programming, similar to what we see in web-browsers. It is one of the fastest
growing language-tool-kit.

```bash
sudo apt-get install nodejs npm
```

[npm][npm-link] is node-package-manager. Installing the package will also install the
console based interactive shell for node. Node packages when 

**python**,

[Python][python-link] is dynamically typed, high level programming language. It is both
suitable for quick scripting and prototyping applications, has got a wonderful
collection of library that comes along with the distribution and countless
third party packages.

```bash
sudo apt-get install python python3 python-doc python3-doc
sudo apt-get install python-pip python3-pip # package manager for python
sudo apt-get install ipython ipython3   # powerful interactive shell
sudo apt-get install python-dev python3-dev # python development package
```

Right now python is going through a phase of split personality, one called as
2.x version and the other called as 3.x version. Incompatibilities exist
between these two versions, and there are still some applications/tools that
are slowly changing to 3.x version.

This leads to an interesting situation for developers, who may want to develop
with Python-2.x sometimes and with Python-3.x other times. Normally get around this
problem by using `virtualenv`.

```bash
# Installing setuptools / pip / virtualenv
sudo apt-get install python3-setuptools # Install package python3-setuptools,
sudo easy_install3 pip  # will give you the command pip-3.2 like kev's solution.
sudo pip-3.2 install virtualenv
```

Since Python-2.x and setuptools will eventually get phased out (hopefully),
above gymnastic may not be relevant in the longer run.

If you are authoring python package and uploading them into python-cheeseshop,
[pypi][pypi-link] you can create a ~/.pypirc to automatically upload your
package with credential. Make sure that the file is readable only by your uid,


```ini
[distutils]
  index-servers = pypi

[pypi]
  repository: http://www.python.org/pypi
  username: <username>
  password: <password>
```

**haskell**,

[Haskell][haskell-link] is a functional language that does lazy evaluation.
It has a very strong community of programmers and large collection of libraries
and tools.

```bash```
sudo apt-get install ghc ghc-doc ghc-haddock ghc-prof haskell-platform
cabal update                # Update list of haskell packages.
sudo apt-get install darcs
```

[darcs][darcs-link] is a DVCS written in haskell and many haskell projects use that as
their revision control. [Cabal][cabal-link] is the package manager for haskell.

**erlang**,

[erlang][erlang-link] is the default language to create multi-node distributed and concurrent
applications.

```bash
sudo apt-get install erlang erlang-base-hipe erlang-doc erlang-manpages
```

[HiPE][hipe-link] is High Performance Erlang, a just-in-time compiler for erlang. Even
though it is not as sophisticated as JVM it does a decent job.

**ruby**,

[Ruby][ruby-link] is good to create scriptable tools where the scripts, although
interpreted as ruby program, can be written in declarative style.

```bash
sudo apt-get install ruby
```

**go**,

```bash
sudo apt-get install golang gccgo-go
```

To work with bleeding edge Go, download the latest version for the target
machine,

```bash
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

Some go tools,

```bashrc
go get code.google.com/p/go-tour/gotour # tutorial on go.

go get github.com/golang/lint # for golint
cd lint; go install ./...

go get github.com/mattn/goveralls # for goveralls
go install github.com/mattn/goveralls

go get github.com/axw/gocov # for gocov
cd lint; go install ./...

sudo apt-get install protobuf-compier # to install protobuf
```

Mercurial must be installed for `go get` command to work.

**development tools**,

use [ncurses][ncurses-link] to author terminal applications.

```bash
sudo apt-get install automake autoconf  # Used for compiling C packages.
sudo apt-get install openssl  ncurses-examples # Secure socket layer
sudo apt-get install ncurses-base libncurses-dev ncurses-doc
sudo apt-get install libxml2-dev libxslt1-dev   # a tolerant HTML/XML parser
sudo pip install lxml
sudo pip3 install lxml
```

To configure DNS. Add this line in /etc/dhcp/dhclient.conf

```text
option domain-name-servers 8.8.8.8
```

For development that does not consider full-screen terminal, just a reasonable
control on keyboard-input line by line, [readline][readline-link] is very good.
There is also rlwrap tool that will give readline like interface for many
interpreters.

```bash
sudo apt-get install readline rlwrap
```

[Readline][readline-link] settings to use vim key-binding. Open /etc/inputrc and 
add the following line,

```text
set editing-mode vi
```

Version control
---------------

Subversion is a great replacement for CVS, which have the concepts of tagging
and branching straightened out when compared to CVS.

```bash
sudo apt-get install subversion
```

**Mercurial**,

When new to [DVCS][dvcs-link] (distributed version control system)
[Mercurial][mercurial-link] is better place to start. Written in C and python
is fast and fun to work with, although it might complain when committing
large files (>10M).

```bash
sudo apt-get install mercurial
```

The following configurations might be helpful when working with `hg` (the
command line program to access mercurial repositories). Add them under `~/.hgrc`

```ini
[ui]
username = username <emailid>
verbose = True
```

If you are planning to use code.google.com or bitbucket with mercurial you
might want your credentials to be automatically authenticated. For such cases
add a list of credentials under `[auth]` section in the `~/.hgrc`

```ini
[auth]
paenv-gc.prefix = code.google.com/p/paenv/
paenv-gc.username = prataprc
paenv-gc.password = <password>
paenv-gc.schemes = http https

pluggdapps-gc.prefix = code.google.com/p/pluggdapps/
pluggdapps-gc.username = prataprc
pluggdapps-gc.password = <password>
pluggdapps-gc.schemes = http https
```

In the above configuration `paenv-gc` and `pluggdapps-gc` prefixes group auth
credentials for different repositories.

**git**,

Most popular among version control system is [git][git-link], thanks to linux
and github for doing that.

```bash
sudo apt-get install git
```

After installing git, update the user configuration file ~/.gitconfig,

```ini
[color]
    ui = auto
```

To change your git username setting, use the git config command,

```bash
git config --global user.name  "Anand T"         # Set a new name
git config --global user.email "anand@gmail.com" # Set your emailid
git config --global core.editor /usr/bin/vim     # use editor
```

The --global flag writes this setting into your global git config. If you
remove that flag you can override the setting for your current repository.
You can learn more with these [articles](https://help.github.com/articles).

In case you want to publish mercurial repositories on github or with any other
git respository-hosting service, you can use [hg-git][hg-git-link] and
[dulwich][dulwich-link]

```bash
sudo pip install hg-git dulwich
sudo pip3 install hg-git dulwich
```

And add the following configuration settings under .hgrc file

```ini
[extensions]
hgext.bookmarks =
hggit=
```

ssh setup for github

```bash
ssh -T git@github.com
```

**Few other version control systems**,

```bash
sudo apt-get install bzr    # created and maintained by canonical-ubuntu
cabal install darcs         # written in haskell
```

In case you have not installed ghc and haskell-platform, it is explained
else where in this article. Some say that [darcs][darcs-link] has the best support for
cherry picking and in some sense true to the spirit of Distributed Version
Control System.

Dictionary
----------

[sdcv][sdcv-link] is command line interface for stardict dictionary program.

```bash
sudo apt-get install sdcv
sdcv -l
```

You can download dictionaries and install them under ~/.stardict/ directory
and add following exports in your bashrc or zshrc file.

```bash
export STARDICT_DATA_DIR=$HOME/.stardict/dic
export SDCV_HISTSIZE=10000
```

To learn hardware info
----------------------

`lspci` will show you most of your hardware in a nice quick way. Some of the
commonly used flags are:

* `-v` and `-vv` varying levels of verbosity
* `-k` argument is a good way to find out kernel driver used by a hardware
  component.
* `-nn` will let you simply know the hardware ID which is great for searching.


It doesn't show USB hardware other than the USB bus.

Here are three real world examples:
Graphics:

```bash
$ lspci -nnk | grep VGA -A1
$ lspci -nnk | grep net -A2
```

* `lsusb` is like lspci but for USB devices.
* `lshw` will give you a very comprehensive list of hardware and settings.

```bash
$ sudo lshw | less
$ sudo lshw -c network
```

For something graphical:

```bash
sudo apt-get install hardinfo
```


Tools and applications
----------------------

A collection of useful console application.

```bash
sudo apt-get install mc                 # Midnight-commander, file manager
sudo apt-get install mutt               # email client
sudo apt-get install muttprint muttprint-manual mutt-patched 
sudo apt-get install elinks elinks-doc  # browse web in text-mode
sudo apt-get install finch              # console version of pidgin
sudo apt-get install newsbeuter         # RSS / Atom feed reader
sudo apt-get install irssi              # IRC client
sudo apt-get install sc                 # spread-sheet calculator
sudo apt-get install cmus               # music player
sudo apt-get install urlview            # extracting url from text 
sudo apt-get install w3m
sudo apt-get install rename
sudo apt-get install ltrace htop atop iostat iotop
```

More tools and utilities.

```bash
sudo apt-get install htop atop xclip rar curl apache2-utils
sudo apt-get install sqlite3    # Access SQL-like database as library
sudo apt-get install gimp       # Image processing tool
```

Add package repository for adobe acrobat.

```bash
# Application - adobe acrobat
sudo apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install acroread
```

To share your file-system with Windows, use samba server and configure the
user-name.

```bash
# Optional - samba
sudo apt-get install samba samba-common python-glade2 system-config-samba
# After adding the shared directory, do the following
sudo smbpasswd -a <username>
```

ssh and automatic authentication for tools using ssh. After generating the key,
append id_rsa.pub to client's `authorized_keys` under `.ssh/authrized_keys`

```bash
sudo apt-get install openssh-client openssh-server
ssh-keygen -t rsa   # Optional ssh auto login
chmod 700 $HOME/.ssh # security
sudo apt-get install ssh-askpass
service ssh restart
```

GUI tools and utilities.

```bash
# Optional packages - settings, configuration and desktop
sudo apt-get install firefox chromium-browser
sudo apt-get install myunity
sudo apt-get install indicator-multiload    # Load indicator applet
```

Installing fonts for Konsole. I especially like `inconsolata`. After running
fc-cache start the konsole and configure your desired fonts.

```bash
sudo apt-get install ttf-inconsolata fonts-inconsolata
sudo apt-get install xfonts-terminus console-terminus
sudo fc-cache 
fc-cache
```

For mac
-------

iterm2 is the pretty good. Download the .zip, unzip and cut paste the
iterm2.app folder to /Applications, as of this writing iterm2 is not
available via brew.

```config
# Copy paste from clip-board
bind P run "pbpaste | tmux load-buffer -; tmux paste-buffer"
bind Y run "tmux save-buffer - | pbcopy"
```

If you are using tmux, take a look at
[this](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git)

Use Option-key + mouse to select text inside tmux, then use CMD+c to copy the
selected text. CMD+v works anyway

[libvte-link]: https://developer.gnome.org/vte/0.27/
[gtk-link]: http://www.gtk.org/
[tmux-link]: http://tmux.sourceforge.net/
[screen-link]: https://www.gnu.org/software/screen/
[zsh-link]: http://www.zsh.org/
[vim-link]: http://www.vim.org/
[luarocks-link]: http://luarocks.org/
[luajit-link]: http://luajit.org/
[lua-link]: http://www.lua.org/
[nodejs-link]: http://nodejs.org/
[npm-link]: https://npmjs.org/
[python-link]: http://www.python.org/
[pypi-link]: https://pypi.python.org/pypi
[haskell-link]: http://www.haskell.org/haskellwiki/Haskell
[darcs-link]: http://darcs.net/
[cabal-link]: http://www.haskell.org/cabal/
[erlang-link]: http://www.erlang.org/
[sdcv-link]: http://sdcv.sourceforge.net/
[dulwich-link]: https://github.com/jelmer/dulwich
[hg-git-link]: http://hg-git.github.io/
[git-link]: http://git-scm.com/
[mercurial-link]: http://mercurial.selenic.com/
[dvcs-link]: http://en.wikipedia.org/wiki/Distributed_revision_control
[readline-link]: http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
[ruby-link]: http://www.ruby-lang.org/en/
[ncurses-link]: http://www.gnu.org/software/ncurses/
[hipe-link]: http://www.erlang.org/doc/apps/hipe/
