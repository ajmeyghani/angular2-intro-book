# Installing Node

You can use [nvm](https://github.com/creationix/nvm) to install and manage Node on your machine. Copy the install script and run it:

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
```

After that, make a new terminal window and make sure that it is installed, by running:

```
nvm --help
```

Now you can use `nvm` to install Node `0.12.9` by running:

```
nvm install 0.12.9
```

After that, nvm is going to load version 0.12.9 automatically. If it doesn't, you can load it in the current shell, with:

```
nvm use 0.12.9
```

Note that you can load any node version in the current shell with `nvm use 0.x.y` after installing that version.

Also note that if you want to make `0.12.9` the default Node version on your machine, you can do so by running the following:

```
nvm alias default 0.12.9
```

Then you can verify that it is the default version by making a new terminal window and typing `node -v`.

## Permissions

Never use `sudo` to install packages, never do `sudo npm install <package>`. If you get permission errors while installing without `sudo`, you can own the folders instead. So for example, if you get an error like:

```
Error: EACCES, mkdir '/usr/local'
```

you can own the folder with:

```
sudo chown -R `whoami` /usr/local
```

You can own folders until Node doesn't complain.

## Installing `live-server`

Install a package to verify that node is installed and everything is wired up correctly. We are going to use `live-server` through the book. So let's install that with:

```
npm i -g live-server
```

Then, you should be able to run `live-server` in any folder to serve the content of that folder:

```
mdkir ~/Desktop/sample && cd $_
live-server .
```

