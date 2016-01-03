Installing Node
===============

-   Use [nvm](https://github.com/creationix/nvm) to install and manage
    Node on the machine. Copy the install script and run it:

``` {.bash}
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
```

-   After installed, make sure that it is installed, by running:

``` {.bash}
nvm --help
```

-   Then use `nvm` to install node version `0.12.9` by running:

``` {.bash}
nvm install 0.12.9
```

-   Confirm that it is installed by running `node -v`.

-   You can load any node version in the current shell with
    `nvm use 0.x.y` after of course installing it.

-   You can make `0.12.9` the default version by making an alias for the
    default node:

    ``` {.bash}
    nvm alias default 0.12.9
    ```

    Permissions
    -----------

-   Never use `sudo` to install packages, never do
    `sudo npm install <package>`. If you get permission errors, you can
    own the folders by the current user. So for example, if you get an
    error like:

    ``` {.bash}
    Error: EACCES, mkdir '/usr/local'
    ```

-   you can own the folder with:

    ``` {.bash}
    sudo chown -R `whoami` /usr/local
    ```

    You can own folders until node doesn't complain.

Installing `live-server`
------------------------

-   Install a package to verify that node is installed and everything is
    wired up correctly. We are going to use `live-server` through
    the course. So let's install that:

    ``` {.bash}
    npm i -g live-server
    ```

-   Then, you should be able to run `live-server` in any folder to
    server the content of that folder:

    ``` {.bash}
    mdkir ~/Desktop/sample && cd $_
    live-server .
    ```

Visual Studio Code
==================

Visual Studio Code is a good IDE for developing web apps. In this
chapter we will look at installing and configuring VSCode.

Visual Studio Code Basics
-------------------------

-   Install Visual Studio Code from: <https://code.visualstudio.com/>

-   You can open new projects by going to the `File > Open` tag, to
    etierh open a folder containing your project or a single file

-   Some useful keyboard shortcuts are:

    -   `command + b`: to close/open the file navigator
    -   `command + shift + p`: to open the prompt
-   To install extensions open the prompt with `command + shift + p` and
    type:

    -   `> install extension`
-   Open the shortcuts settings from `Preferences > Keyboard Shortcuts`,
    and then you can add your own shortcuts:

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

Setting up TypeScript for VSCode
--------------------------------

You can set up Visual Studio Code to compile your TypeScript code as
your work.

-   You can download and instal Visual Studio Code from the VSCode
    [Website](https://code.visualstudio.com/)
-   First, open Visual Studio Code
-   Make a new window: `File > New Window`
-   Then, make a folder on your desktop for a new project:
    `mkdir ~/Desktop/vscode-demo`
-   The, open the folder in VSCode: `File > open` and select the
    `vscode-demo` folder on your desktop.
-   Now we need to make three configuration files:

    1.  `tsconfig.json`: configuration for the TypeScript compiler
    2.  `tasks.json`: Task configuration for VSCode to watch and compile
        files
    3.  `launch.json`: Configuration for the debugger
-   The `tsconfig.json` file should be in the root of the project. Let's
    make the file and put the following in it:

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

-   Now to make the `tasks.json` file, open the prompt with
    `command + shift + p` and type:

        > configure task runner

-   Then put the following in the file and save the file:

        {
          "version": "0.1.0",
          "command": "tsc",
          "showOutput": "silent",
          "isShellCommand": true,
          "problemMatcher": "$tsc"
        }

-   The last thing that we need to set up is the debugger,
    i.e.`launch.json` file. Right click on the `.vscode` folder in the
    file navigator and make a new file called `launch.json` and put in
    the following:

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

-   After you save the file, you should be able to see the debugger in
    the debugger dropdown options.

-   Now, we are ready to make the `main.ts` file in the root of the
    project:

    **`main.ts`**

    ``` {.typescript}
    console.log('hello');
    ```

-   Now you can start the task to watch the files and compile as
    you work. Open the prompt with `command + shift + p` and type:

        > run build tasks

    you can also use the `command + shift + b` keyboard
    shortcut instead. This will start the debugger and watch the files.
    After making a change to `main.ts`, you should be able to see the
    output in the `output` folder.

-   Now that the build task is running, we can put a breakpoint anywhere
    in our typescript code. Lets add some more code to the main file and
    use the debugger:

    ``` {.typescript}
    let a = 2;
    let b = 3;
    let c = 4;
    ```

-   Then click on the margin of line two for example to add
    a breakpoint. Then open the debugger tab to run the debugger and you
    should see that the program will stop at the breakpoint and you can
    step over or into the line.

-   To stop the task you can terminate it. Open the prompt and type:

        > terminate running task

Running VSCode from the Terminal
--------------------------------

If you want to run VSCode from the terminal, you can follow the
[guide](https://code.visualstudio.com/Docs/editor/setup) on VSCode's
website. Below is the summary of the guide:

**MAC**

Add the following to your "bash" file:

    function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

**Linux**

    sudo ln -s /path/to/vscode/Code /usr/local/bin/code

**Windows**

You might need to log off after the installation for the change to the
PATH environmental variable to take effect.

Debugging App from VSCode
-------------------------

The "vscode-chrome-debug" extension allows you to attach VSCode to a
running instance of chrome. This makes it very convenient because you
can put breakpoints in your TypeScript code and run the debugger to
debug your app. Let's get started.

-   In order to install the
    [extension](https://github.com/Microsoft/vscode-chrome-debug) open
    the prompt in VSCode with `command + shift + p` and type:

        > install extension

    hit enter and then type:

        debugger for chrome

    Then just click on the result to install the extension. Restart
    VSCode when you are prompted.

-   After installing the extension, we need to update or create a
    `launch.json` file for debugging. You can create one in the
    `.vscode` folder. After you created the file, put in the following:

        {
          "version": "0.1.0",
          "configurations": [
            {
              "name": "Launch Chrome Debugger",
              "type": "chrome",
              "request": "launch",
              "url": "http://localhost:8080",
              "sourceMaps": true,
              "webRoot": ".",
              "runtimeExecutable": "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
              "runtimeArgs": ["--remote-debugging-port=9222", "--incognito"]
            }
          ]
        }

    Depending on your platform you need to change the
    `runtimeExecutable` path to Chrome's executable path. After
    configuring the debugger you need to have a server running serving
    the app. You can change the `url` value accordingly. Also make sure
    that the `webRoot` path is set to the root of your web server.

-   After that it is a good idea to close all the instances of chrome.
    Then, put a breakpoint in your code and run the debugger. If
    everything is set up correctly, you should see an instance of chrome
    running in incognito mode. To trigger the breakpoint, just reload
    the page and you should be able to see the debugger paused at
    the breakpoint.

-   Also make sure that you have the compiler running so that you can
    use the JavaScript output and the sourcemaps to use the debugger.
    See the TypeScript and VSCode set up for more details.

TypeScript Crash-course
=======================

Installing TypeScript
---------------------

You can install the TypeScript compiler with node:

``` {.bash}
npm i typescript -g
```

Then to verify that it is installed, run `tsc -v` to see the version of
the compiler. You will get an output like this:

    message TS6029: Version 1.7.5

In addition to the compiler, we also need to install the TypeScript
Definition manager for DefinitelyTyped (tsd). You can install tsd with:

``` {.bash}
npm i tsd -g
```

Using TSD, you can search and install TypeScript definition files
directly from the community driven DefinitelyTyped repository. To verify
that tsd is installed, run tsd with the `version` flag:

``` {.bash}
tsd --version
```

You should get an output like this:

    >> tsd 0.6.5

After `tsd` and `tsc` are installed, we can compile a hello world
program:

-   make a file called `hello.ts` on your desktop:

    ``` {.bash}
    touch ~/Desktop/hello.ts
    ```

-   Then, put some TypeScript code in the file:

    ``` {.bash}
    echo "const adder = (a: number, b: number): number => a + b;" > ~/Desktop/hello.ts
    ```

-   Then you can compile the file to JavaScript:

    ``` {.bash}
    tsc ~/Desktop/hello.ts
    ```

-   It should output a file in `Desktop/hello.js`:

    ``` {.javascript}
    var adder = function (a, b) { return a + b; };
    ```

Now that your TypeScript compiler setup, we can move on to configuring
Visual Studio Code.

Types and the Basics
--------------------

There are 7 types in TypeScript:

-   boolean: `var isDone: boolean = false;`
-   number: `var height: number = 6;`
-   string: `var name: string = "bob";`
-   array: `var list:number[] = [1, 2, 3];` also
    `var list:Array<number> = [1, 2, 3];`
-   enum: `enum Color {Red, Green, Blue};`
-   any: `var notSure: any = 4;`
-   void: `function hello(): void { console.log('hello'); }`

Interface
---------

-   An Interface is defined using the `interface` keyword
-   Interfaces are used only during compilation time to check types
-   By convention, interface definitions start with an `I`, e.g. :
    `IPoint`
-   Interfaces are used in classical object oriented programming as a
    design tool
-   Interfaces don't contain implementations
-   They provide definitions only
-   When an object implements an interface, it must adhere to the
    contract defined by the interface
-   An interface defines what properties and methods an object must
    implement
-   If an object implements an interface, it must adhere to
    the contract. If it doesn't the compiler will let us know.
-   Interfaces also define custom types

### Basic Interface

Below is an example of an Interface that defines two properties and
three methods that implementers should provide implementations for:

``` {.typescript}
interface IMyInterface {
  // some properties
  id: number;
  name: string;

  // some methods
  method(): void;
  methodWithReturnVal():number;
  sum(nums: number[]):number;
}
```

Using the interface above we can create an object that adheres to the
interface:

``` {.typescript}
let myObj: IMyInterface = {
  id: 2,
  name: 'some name',

  method() { console.log('hello'); },
  methodWithReturnVal () { return 2; },
  sum(numbers) {
    return numbers.reduce( (a,b) => { return a + b } );
  }
};
```

Notice that we had to provide values to **all** the properties defined
by the Interface, and the implementations for **all** the methods
defined by the Interface.

And then of course you can use your object methods to perform
operations:

``` {.typescript}
let sum = myObj.sum([1,2,3,4,5]); // -> 15
```

Classes
-------

-   Classes are heavily used in classical object oriented programming
-   It defines what an object is and what it can do
-   A class is defined using the `class` keyword followed by a name
-   By convention, the name of the class start with an uppercase letter
-   A class can be used to create multiple objects (instances) of the
    same class
-   An object is created from a class using the `new` keyword
-   A class can have a `constructor` which is called when an object is
    made from the class
-   Properties of a class are called instance variables and its
    functions are called the class methods
-   Access modifiers can be used to make them public or private
-   The instance variables are attached to the instance itself but not
    the prototype
-   Methods however are attached to the prototype object as opposed to
    the instance itself
-   Classes can inherit functionality from other classes, but you should
    [favor composition over
    inheritance](https://medium.com/javascript-scene/the-two-pillars-of-javascript-ee6f3281e7f3#.oc5pdevwh)
    or make sure you know [when to use
    it](https://medium.com/@dtinth/es6-class-classical-inheritance-20f4726f4c4#.xdif2m42e)
-   Classes can implement interfaces

Let's make a class definition for a car and incrementally add more
things to it.

### Adding an Instance Variable

The `Car` class definition can be very simple and can define only a
single instance variable that all cars can have:

``` {.typescript}
class Car {
  distance: number;
}
```

-   `Car` is the name of the class, which also defines the custom type
    `Car`
-   `distance` is a property that tracks the distance that car has
    traveled
-   Distance is of type `number` and only accepts `number` type.

Now that we have the definition for a car, we can create a car from the
definition:

``` {.typescript}
let myCar:Car = new Car();
myCar.distance = 0;
```

-   `myCar:Car` means that `myCar` is of type `Car`
-   `new Car()` creates an instance from the `Car` definition.
-   `myCar.distance = 0` sets the initial value of the `distance` to 0
    for the newly created `car`

### Adding a Method

So far our car doesn't have any definitions for any actions. Let's
define a `move` method that all the cars can have:

``` {.typescript}
class Car {
  distance: number;
  move():void {
    this.distance += 1;
  };
}
```

-   `move():void` means that `move` is a method that does not return any
    value, hence `void`.
-   The body of the method is defined in `{ }`
-   `this` refers to the instance, therefore `this.distance` points to
    the `distance` property defined on the car instance.
-   Now you can call the `move` method on the car instance to increment
    the `distance` value by 1:

``` {.typescript}
myCar.move();
console.log(myCar.distance) // -> 1
```

### Adding a constructor

A `constructor` is a special method that gets called when an instance is
created from a class. Let's add a constructor to the `Car` class that
initializes the `distance` value to 0. This means that all the cars that
are crated from this class, will have their `distance` set to 0
automatically:

``` {.typescript}
class Car {
  distance: number;
  constructor () {
    this.distance = 0;
  };
  move():void {
    this.distance += 1;
  };
}
```

-   `constructor()` is called automatically when a new car is created
-   The body of the constructor is defined in the `{ }`

So now when we create a car, the `distance` property is automatically
set to 0.

### Using Access Modifiers

If you wanted to tell the compiler that the `distance` variable is
private and can only be used by the object itself, you can use the
`private` modifier before the name of the property:

``` {.typescript}
class Car {
  private distance: number;
  constructor () {
    ...
  };
  ...
}
```

Access modifiers can be used in different places. Check out the access
modifiers chapter for more details.

### Implementing an Interface

Classes can implement one or multiple interfaces. We can make the `Car`
class implement two interfaces:

**interfaces**

``` {.typescript}
interface ICarProps {
  distance: number;
}
interface ICarMethods {
  move():void;
}
```

Making the `Car` class implement the interfaces:

``` {.typescript}
class Car implements ICarProps, ICarMethods {
  distance: number;
  constructor () {
    this.distance = 5;
  };
  move():void {
    this.distance += 1;
  };
}
```

The above example is silly, but it shows the point that a class can
implement one or more interfaces. Now if the class does not provide
implementations for any of the interfaces, the compiler will complain.
For example, if we leave out the `distance` instance variable, the
compiler will print out the following error:

> error TS2420: Class 'Car' incorrectly implements interface
> 'ICarProps'. Property 'distance' is missing in type 'Car'.

Hello Angular
=============

In this section we are going to write a simple `HelloAngular` component,
compile it and run it in the browser. In addition, we will configure
VSCode to build the TypeScript files as we go.

Project Files
-------------

The project files for this chapter are in
**`angular2-intro/code/hello-angular`**

You can either follow along or just look at the final result. As always,
the `node_modules` folder is not included. You would have to install it
with `npm i` in the project folder:

    cd angular2-intro/code/hello-angular && npm i

Getting Started
---------------

Make a folder on your desktop called `hello-angular` and navigate to it:

``` {.bash}
mkdir ~/Desktop/hello-angular && cd $_
```

Start npm in this folder with `npm init` and accept all the defaults.

After that, install the dependencies with:

``` {.bash}
npm i angular2 rxjs -S
```

Then install the "devDependencies":

``` {.bash}
npm i systemjs -D
```

After all the dependencies are installed, start VSCode in this folder
with `code .`

Then create a `index.html` file in the root of the project and put in
the following:

**`index.html`**

``` {.html}
<html>
<head>
  <title>Hello Angular</title>

  <script src="node_modules/angular2/bundles/angular2-polyfills.js"></script>
  <script src="node_modules/systemjs/dist/system.src.js"></script>
  <script src="node_modules/rxjs/bundles/Rx.js"></script>
  <script src="node_modules/angular2/bundles/angular2.dev.js"></script>

  <!-- add systemjs settings later -->

</head>

<body>
  <!-- add app stuff later -->
</body>

</html>
```

This loads all the necessary scripts that we need to run Angular in the
browser.

Making the Component
--------------------

Let's start by making the `main.ts` file in the root of the project. In
this file we are going to define the main component called
`HelloAngular` and then bootstrap the app with it:

**`main.ts`**

``` {.typescript}
import {Component, OnInit } from 'angular2/core';
import {bootstrap} from 'angular2/platform/browser';

@Component({
  selector: 'app',
  template: `<h1> hello angular </h1> `
});

class HelloAngular implements OnInit  {
  constructor() { console.log('constructor called'); }
  ngOnInit() { console.log('component initialized'); }
}

bootstrap(HelloAngular, []);
```

-   On line 1 we are importing the `component` meta data (annotation)
    and the `onInit` interface.
-   On line 2 we are loading the `bootstrap` method that bootstraps the
    app given a component.
-   On line 4, we are defining a component using the
    `component` annotation. The `@component` is technically a class
    decorator because it precedes the `HelloAngular` class definition.
-   On line 5, we are telling angular to look out for the `app` tag. So
    when Angular looks at the html and comes across the `<app></app>`
    tag, it is going to load the template (on line 6) and instantiates
    the class for it (defined on line 9).
-   On line 9, we are defining a class called `HelloAngular` that
    defines the logic of the component. And for fun, we are implementing
    the `OnInit` interface to log something to the console when the
    component is ready with its data. We will learn more about the
    lifeCycle hooks later.
-   Last but not least, we call the `bootstrap` method with the
    `HelloAngular` class as the first argument to bootstrap the app with
    the `HelloAngular` component.

Compiling the Component
-----------------------

Now we need to compile the file to JavaScript. We can do it from the
terminal, but let's stick to VSCode. In order to that, we need to make
two config files:

1.  First is the standard `tsconfig.json` file

2.  And the `tasks.json` file for VSCode to do the compiling

Create the `tsconfig.json` file in the root of the project and put in
the following:

**`tsconfig.json`**

``` {.json}
{
  "compilerOptions": {
    "target": "es5",
    "module": "system",
    "moduleResolution": "node",
    "sourceMap": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "removeComments": false,
    "noImplicitAny": false,
    "outDir": "output",
    "watch": true
  },
  "exclude": [
    "node_modules"
  ]
}
```

Then create the `tasks.json` in the `.vscode` folder in the root of the
project and put in the following:

**`.vscode/tasks.json`**

``` {.json}
{
  "version": "0.1.0",
  "command": "tsc",
  "showOutput": "silent",
  "isShellCommand": true,
  "problemMatcher": "$tsc"
}
```

-   Now we can build the TypeScript files as we work. We just need to
    start the build task with `command + shift + b` or using the prompt.
    If you want to use the prompt do the following:

    -   Use `command + shift + p` to open the prompt

    -   Then, type `> run build task` and hit enter to start the
        build task.

-   After you run the build task, you should see an `output` file
    generated with `main.js` and the source maps in it.

-   The task is watching the files and compiling as you go. To stop the
    task, open the prompt and type:

        > terminate running task

Loading the Component
---------------------

After compiling the component, we need to load it to the `index.html`
file with `Systemjs`. Open the `index.html` file and replace
`<!-- add systemjs settings later -->` with the following:

``` {.html}
<script>
  System.config({
    packages: {
      output: {
        format: 'register',
        defaultExtension: 'js'
      }
    }
  });
  System.import('output/main')
  .then(null, console.error.bind(console));
</script>
```

Now we can use our component in the body of the html:

``` {.html}
<body>
  <app>Loading ...</app>
</body>
```

It is finally time to serve the app. You can serve the app in the
current directory using the `live-server`:

``` {.bash}
live-server .
```

If everything is wired up correctly, you should be able to see the
following:

![Hello Angular](./images/hello-angular.png)
