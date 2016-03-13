# Notes

- The book assumes that you are working in a Unix-like environment. If you are on Windows you can use [Cygwin](https://www.cygwin.com/) so that you can follow along with the bash terminal commands.

- All the project files for the book are hosted on github: [https://github.com/aminmeyghani/angular2-intro](https://github.com/aminmeyghani/angular2-intro). You can clone the repository and check out the project files. Throughout the book, you will see references to the project files. Those refer to this repository. For example, `angular2-intro/project-files/hello-angular` refers to the `hello-angular` folder inside the `project-files` folder.

- Make sure you have `git` installed on your machine. That is, make sure you get an output for `git --version`.

- The book assumes that you have a working knowledge of JavaScript and Angular 1.x

- Node is heavily used throughout the book. Make sure that you follow the "Node" chapter to install Node and set permissions correctly.

- All the keyboard shortcuts are mac-based. But if you are using a non-mac machine, you can almost always replace `command` with `ctrl` and you should be good. For example, if you a see a shortcut like `command + shift + b`, you can use `ctrl + shift + b` where `ctrl` is obviously the `control` key!

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

# Visual Studio Code

Visual Studio Code is a good IDE for developing web apps. In this chapter we will look at installing and configuring VSCode.

## Visual Studio Code Basics

- Install Visual Studio Code from: [https://code.visualstudio.com/](https://code.visualstudio.com/)

- You can open new projects by going to the `File > Open` tag, to etierh open a folder containing your project or a single file

- Some useful keyboard shortcuts are:

    - `command + b`: to close/open the file navigator
    - `command + shift + p`: to open the prompt

- To install extensions open the prompt with `command + shift + p` and type:

    ```
    > install extension
    ```

- You can change the keyboard shortcuts settings from `Preferences > Keyboard Shortcuts`. Open the settings and then you can add your own shortcuts:

    ```
    // Place your key bindings in this file to overwrite the defaults
    [
      {
        "key": "cmd+t",
        "command": "workbench.action.quickOpen"
      },
      {
        "key": "shift+cmd+r",
        "command": "editor.action.format",
        "when": "editorTextFocus"
      }
    ]
    ```

## Setting up VSCode for TypeScript

In this section we are going to set up Visual Studio Code for TypeScript. The project files for this chapter are in [**`angular2-intro/project-files/vscode`**](https://github.com/aminmeyghani/angular2-intro/tree/master/project-files/vscode). You can either follow along or check out the folder to see the final result.

### Installing TypeScript

Before anything, we need to install the TypeScript compiler. You can install the TypeScript compiler with npm:

```
npm i typescript -g
```

Then to verify that it is installed, run `tsc -v` to see the version of the compiler. You will get an output like this:

```
message TS6029: Version 1.7.5
```

In addition to the compiler, we also need to install the TypeScript Definition manager for DefinitelyTyped (tsd). You can install tsd with:

```
npm i tsd -g
```

Using TSD, you can search and install TypeScript definition files directly from the community driven DefinitelyTyped repository. To verify that tsd is installed, run tsd with the `version` flag:

```
tsd --version
```

You should get an output like this:

```
>> tsd 0.6.5
```

After `tsd` and `tsc` are installed, we can compile a hello world program:

make a file called `hello.ts` on your desktop:

```
touch ~/Desktop/hello.ts
```

Then, put some TypeScript code in the file:

```
echo "const adder = (a: number, b: number): number => a + b;" > ~/Desktop/hello.ts
```

Then you can compile the file to JavaScript:

```
tsc ~/Desktop/hello.ts
```

It should output a file in `Desktop/hello.js`:

```javascript
var adder = function (a, b) { return a + b; };
```

Now that your TypeScript compiler setup, we can move on to configuring Visual Studio Code.

### Add VSCode Configurations

- First download and install Visual Studio Code from the VSCode [Website](https://code.visualstudio.com/)
- After installing VSCode, open it and then make a new window: `File > New Window`
- Then, make a folder on your desktop for a new project: `mkdir ~/Desktop/vscode-demo`
- After that, open the folder in VSCode: `File > open` and select the `vscode-demo` folder on your desktop.
- Now we need to make three configuration files:

    1. [`tsconfig.json`](http://json.schemastore.org/tsconfig): configuration for the TypeScript compiler
    2. `tasks.json`: Task configuration for VSCode to watch and compile files
    3. `launch.json`: Configuration for the debugger

The `tsconfig.json` file should be in the root of the project. Let's make the file and put the following in it:

```javascript
{
  "compilerOptions": {
    "experimentalDecorators": true,
    "emitDecoratorMetadata": true,
    "module": "commonjs",
    "target": "es5",
    "sourceMap": true,
    "outDir": "output",
    "watch": true
  }
}
```

Now to make the `tasks.json` file. Open the prompt with `command + shift + p` and type:

```
> configure task runner
```

Then put the following in the file and save the file:

```javascript
{
  "version": "0.1.0",
  "command": "tsc",
  "showOutput": "silent",
  "isShellCommand": true,
  "problemMatcher": "$tsc"
}
```

The last thing that we need to set up is the debugger, i.e. the `launch.json` file. Right click on the `.vscode` folder in the file navigator and make a new file called `launch.json` and put in the following:

```javascript
{
  "version": "0.1.0",
  "configurations": [
    {
      "name": "TS Debugger",
      "type": "node",
      "program": "main.ts",
      "stopOnEntry": false,
      "sourceMaps": true,
      "outDir": "output"
    }
  ]
}
```

After you save the file, you should be able to see the debugger in the debugger dropdown options.

Now, we are ready to make the `main.ts` file in the root of the project:

**`main.ts`**

```typescript
const sum = (a: number, b: number): number => a + b;
const r = sum(1,2);
console.log(r);
```

Now you can start the task to watch the files and compile as you work. Open the prompt with `command + shift + p` and type:

```
> run build tasks
```

you can also use the `command + shift + b` keyboard shortcut instead. This will start the debugger and watch the files. After making a change to `main.ts`, you should be able to see the output in the `output` folder.

After the build task is running, we can put a breakpoint anywhere in our TypeScript code. Let's put a breakpoint on line 2 by clicking on the margin. Then start the debugger by going to the debugger tab and clicking the green play icon.

Now you should see that the program will stop at the breakpoint and you should be able to step over or into your program.

To stop the task you can terminate it. Open the prompt and type:

```
> terminate running task
```

You can learn more about running TypeScript with VSCode on MSDN's [blog](http://blogs.msdn.com/b/typescript/archive/2015/04/30/using-typescript-in-visual-studio-code.aspx).

## Running VSCode from the Terminal

If you want to run VSCode from the terminal, you can follow the [guide](https://code.visualstudio.com/Docs/editor/setup) on VSCode's website. Below is the summary of the guide:

**MAC**

Add the following to your "bash" file:

```
function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }
```

**Linux**

```
sudo ln -s /path/to/vscode/Code /usr/local/bin/code
```

**Windows**

You might need to log off after the installation for the change to the PATH environmental variable to take effect.

## Debugging App from VSCode

The "vscode-chrome-debug" extension allows you to attach VSCode to a running instance of chrome. This makes it very convenient because you can put breakpoints in your TypeScript code and run the debugger to debug your app. Let's get started.

In order to install the [extension](https://github.com/Microsoft/vscode-chrome-debug) open the prompt in VSCode with `command + shift + p` and type:

```
> install extension
```

hit enter and then type:

```
debugger for chrome
```

Then just click on the result to install the extension. Restart VSCode when you are prompted.

After installing the extension, we need to update or create a `launch.json` file for debugging. You can create one in the `.vscode` folder. After you created the file, put in the following:

```
{
  "version": "0.1.0",
  "configurations": [
    {
      "name": "Launch Chrome Debugger",
      "type": "chrome",
      "request": "launch",
      "url": "http://localhost:8080",
      "sourceMaps": true,
      "webRoot": "${workspaceRoot}",
      "runtimeExecutable": "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
      "runtimeArgs": ["--remote-debugging-port=9222", "--incognito"]
    }
  ]
}
```

**Notes:**

- Depending on your platform you need to change the `runtimeExecutable` path to Chrome's executable path. After configuring the debugger you need to have a server running serving the app. You can change the `url` value accordingly. Also make sure that the `webRoot` path is set to the root of your web server.

- After that it is a good idea to close all the instances of chrome. Then, put a breakpoint in your code and run the debugger. If everything is set up correctly, you should see an instance of chrome running in incognito mode. To trigger the breakpoint, just reload the page and you should be able to see the debugger paused at the breakpoint.

- Also make sure that you have the compiler running so that you can use the JavaScript output and the sourcemaps to use the debugger. See the TypeScript and VSCode set up for more details.

