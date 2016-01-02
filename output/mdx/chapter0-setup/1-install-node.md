# Installing Node

- Use [nvm](https://github.com/creationix/nvm) to install and manage Node on the machine. Copy the install script and run it:

~~~~{.numberLines .bash startFrom="1"}
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
~~~~~~~

- After installed, make sure that it is installed, by running:

~~~~{.numberLines .bash startFrom="1"}
nvm --help
~~~~~~~

- Then use `nvm` to install node version `0.12.9` by running:

~~~~{.numberLines .bash startFrom="1"}
nvm install 0.12.9
~~~~~~~

- Confirm that it is installed by running `node -v`.

- You can load any node version in the current shell with `nvm use 0.x.y` after of course installing it.

- You can make `0.12.9` the default version by making an alias for the default node:

    ~~~~{.numberLines .bash startFrom="1"}
    nvm alias default 0.12.9
    ~~~~~~~
## Permissions

- Never use `sudo` to install packages, never do `sudo npm install <package>`. If you get permission errors, you can own the folders by the current user. So for example, if you get an error like:

    ~~~~{.numberLines .bash startFrom="1"}
    Error: EACCES, mkdir '/usr/local'
    ~~~~~~~

- you can own the folder with:

    ~~~~{.numberLines .bash startFrom="1"}
    sudo chown -R `whoami` /usr/local
    ~~~~~~~

    You can own folders until node doesn't complain.

## Installing `live-server`

- Install a package to verify that node is installed and everything is wired up correctly. We are going to use `live-server` through the course. So let's install that:

    ~~~~{.numberLines .bash startFrom="1"}
    npm i -g live-server
    ~~~~~~~

- Then, you should be able to run `live-server` in any folder to server the content of that folder:

    ~~~~{.numberLines .bash startFrom="1"}
    mdkir ~/Desktop/sample && cd $_
    live-server .
    ~~~~~~~
