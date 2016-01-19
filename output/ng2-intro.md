Notes
=====

-   The book assumes that you are working in a Unix-like environment. If
    you are on Windows you can use [Cygwin](https://www.cygwin.com/) so
    that you can follow along with the bash terminal commands.

-   All the project files for the book are hosted on github:
    <https://github.com/st32lth/angular2-intro>. You can clone the
    repository and check out the project files. Throughout the book, you
    will see references to the project files. Those refer to
    this repository. For example,
    `angular2-intro/project-files/hello-angular` refers to the
    `hello-angular` folder inside the `project-files` folder.

-   Make sure you have `git` installed on your machine. That is, make
    sure you get an output for `git --version`.

-   The book assumes that you have a working knowledge of JavaScript and
    Angular 1.x

-   Node is heavily used throughout the book. Make sure that you follow
    the "Node" chapter to install Node and set permissions correctly.

-   All the keyboard shortcuts are mac-based. But if you are using a
    non-mac machine, you can almost always replace `command` with `ctrl`
    and you should be good. For example, if you a see a shortcut like
    `command + shift + b`, you can use `ctrl + shift + b` where `ctrl`
    is obviously the `control` key.

Installing Node
===============

You can use [nvm](https://github.com/creationix/nvm) to install and
manage Node on your machine. Copy the install script and run it:

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash

After that, make a new terminal window and make sure that it is
installed, by running:

    nvm --help

Now you can use `nvm` to install Node `0.12.9` by running:

    nvm install 0.12.9

After that, nvm is going to load version 0.12.9 automatically. If it
doesn't, you can load it in the current shell, with:

    nvm use 0.12.9

Note that you can load any node version in the current shell with
`nvm use 0.x.y` after installing that version.

Also note that if you want to make `0.12.9` the default Node version on
your machine, you can do so by running the following:

    nvm alias default 0.12.9

Then you can verify that it is the default version by making a new
terminal window and typing `node -v`.

Permissions
-----------

Never use `sudo` to install packages, never do
`sudo npm install <package>`. If you get permission errors while
installing without `sudo`, you can own the folders instead. So for
example, if you get an error like:

    Error: EACCES, mkdir '/usr/local'

you can own the folder with:

    sudo chown -R `whoami` /usr/local

You can own folders until Node doesn't complain.

Installing `live-server`
------------------------

Install a package to verify that node is installed and everything is
wired up correctly. We are going to use `live-server` through the book.
So let's install that with:

    npm i -g live-server

Then, you should be able to run `live-server` in any folder to serve the
content of that folder:

    mdkir ~/Desktop/sample && cd $_
    live-server .

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

        > install extension

-   You can change the keyboard shortcuts settings from
    `Preferences > Keyboard Shortcuts`. Open the settings and then you
    can add your own shortcuts:

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

Setting up VSCode for TypeScript
--------------------------------

In this section we are going to set up Visual Studio Code for
TypeScript. The project files for this chapter are in
[**`angular2-intro/project-files/vscode`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/vscode).
You can either follow along or check out the folder to see the final
result.

### Installing TypeScript

Before anything, we need to install the TypeScript compiler. You can
install the TypeScript compiler with npm:

    npm i typescript -g

Then to verify that it is installed, run `tsc -v` to see the version of
the compiler. You will get an output like this:

    message TS6029: Version 1.7.5

In addition to the compiler, we also need to install the TypeScript
Definition manager for DefinitelyTyped (tsd). You can install tsd with:

    npm i tsd -g

Using TSD, you can search and install TypeScript definition files
directly from the community driven DefinitelyTyped repository. To verify
that tsd is installed, run tsd with the `version` flag:

    tsd --version

You should get an output like this:

    >> tsd 0.6.5

After `tsd` and `tsc` are installed, we can compile a hello world
program:

make a file called `hello.ts` on your desktop:

    touch ~/Desktop/hello.ts

Then, put some TypeScript code in the file:

    echo "const adder = (a: number, b: number): number => a + b;" > ~/Desktop/hello.ts

Then you can compile the file to JavaScript:

    tsc ~/Desktop/hello.ts

It should output a file in `Desktop/hello.js`:

``` {.javascript}
var adder = function (a, b) { return a + b; };
```

Now that your TypeScript compiler setup, we can move on to configuring
Visual Studio Code.

### Add VSCode Configurations

-   First download and install Visual Studio Code from the VSCode
    [Website](https://code.visualstudio.com/)
-   After installing VSCode, open it and then make a new window:
    `File > New Window`
-   Then, make a folder on your desktop for a new project:
    `mkdir ~/Desktop/vscode-demo`
-   After that, open the folder in VSCode: `File > open` and select the
    `vscode-demo` folder on your desktop.
-   Now we need to make three configuration files:

    1.  [`tsconfig.json`](http://json.schemastore.org/tsconfig):
        configuration for the TypeScript compiler
    2.  `tasks.json`: Task configuration for VSCode to watch and compile
        files
    3.  `launch.json`: Configuration for the debugger

The `tsconfig.json` file should be in the root of the project. Let's
make the file and put the following in it:

``` {.javascript}
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

Now to make the `tasks.json` file. Open the prompt with
`command + shift + p` and type:

    > configure task runner

Then put the following in the file and save the file:

``` {.javascript}
{
  "version": "0.1.0",
  "command": "tsc",
  "showOutput": "silent",
  "isShellCommand": true,
  "problemMatcher": "$tsc"
}
```

The last thing that we need to set up is the debugger, i.e. the
`launch.json` file. Right click on the `.vscode` folder in the file
navigator and make a new file called `launch.json` and put in the
following:

``` {.javascript}
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

After you save the file, you should be able to see the debugger in the
debugger dropdown options.

Now, we are ready to make the `main.ts` file in the root of the project:

**`main.ts`**

``` {.typescript}
const sum = (a: number, b: number): number => a + b;
const r = sum(1,2);
console.log(r);
```

Now you can start the task to watch the files and compile as you work.
Open the prompt with `command + shift + p` and type:

    > run build tasks

you can also use the `command + shift + b` keyboard shortcut instead.
This will start the debugger and watch the files. After making a change
to `main.ts`, you should be able to see the output in the `output`
folder.

After the build task is running, we can put a breakpoint anywhere in our
TypeScript code. Let's put a breakpoint on line 2 by clicking on the
margin. Then start the debugger by going to the debugger tab and
clicking the green play icon.

Now you should see that the program will stop at the breakpoint and you
should be able to step over or into your program.

To stop the task you can terminate it. Open the prompt and type:

    > terminate running task

You can learn more about running TypeScript with VSCode on MSDN's
[blog](http://blogs.msdn.com/b/typescript/archive/2015/04/30/using-typescript-in-visual-studio-code.aspx).

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

In order to install the
[extension](https://github.com/Microsoft/vscode-chrome-debug) open the
prompt in VSCode with `command + shift + p` and type:

    > install extension

hit enter and then type:

    debugger for chrome

Then just click on the result to install the extension. Restart VSCode
when you are prompted.

After installing the extension, we need to update or create a
`launch.json` file for debugging. You can create one in the `.vscode`
folder. After you created the file, put in the following:

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

**Notes:**

-   Depending on your platform you need to change the
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

In this chapter we will quickly go through the most important concepts
in TypeScript so that you can have a better understanding of Angular
code that you will write. Knowing TypeScript definitely helps to
understand Angular, but again it is not a requirement. The project files
for this chapter are in
[**`angular2-intro/project-files/typescript`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript).

TypeScript Basics
-----------------

-   TypeScript is a superset of JavaScript with additional features,
    among which optional types is the most notable. This means that any
    valid JavaScript code (ES 2015/2016...) is valid TypeScript code.
    You can basically change the extension of the file to `.ts` and
    compile it with the the TypeScript compiler.

-   TypeScript defines 7 primary types:

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

### Classes as Interfaces

Because classes define types as well, they can also be used as
interfaces. If you have an interface you can extend it with a class for
example:

``` {.typescript}
class Point {
  x: number;
  y: number;
}
interface Point3d extends Point {
  z: number;
}
const point3d: Point3d = {x: 1, y: 2, z: 3};
console.log(point3d.x); // -> 1
```

First we are defining a class called `Point` that defines two fields.
Then we define an interface called `Point3d` that extends the `Point` by
adding a third field. An then we create a point of type `point3d` and
assign a value to it. We read the value and it outputs `1`.

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
things to it. The project files for this section are in
[**`angular2-intro/project-files/typescript/classes/basic-class`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/classes/basic-class).

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
  }
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

### Using Access Modifiers

If you wanted to tell the compiler that the `distance` variable is
private and can only be used by the object itself, you can use the
`private` modifier before the name of the property:

``` {.typescript}
class Car {
  private distance: number;
  constructor () {
    ...
  }
  ...
}
```

-   There are 3 main access modifiers in TypeScript: `private`,
    `public`, and `protected`:

-   `private` modifier means that the property or the method is only
    defined inside the class only.
-   `protected` modifier means that the property or the method is only
    accessible inside the class and the classes derived from the class.
-   `public` is the default modifier which means the property or the
    method is the accessible everywhere and can be accessed by anyone.

### Adding a constructor

A `constructor` is a special method that gets called when an instance is
created from a class. A class may contain at most one constructor
declaration. If a class contains no constructor declaration, an
automatic constructor is provided.

Let's add a constructor to the `Car` class that initializes the
`distance` value to 0. This means that all the cars that are crated from
this class, will have their `distance` set to 0 automatically:

``` {.typescript}
class Car {
  distance: number;
  constructor () {
    this.distance = 0;
  }
  move():void {
    this.distance += 1;
  }
}
```

-   `constructor()` is called automatically when a new car is created
-   Parameters are passed to the constructor in the `()`
-   The body of the constructor is defined in the `{ }`

Now, let's customize the car's constructor to accept `distance` as a
parameter:

``` {.typescript}
class Car {
  private distance: number;
  constructor (distance) {
    this.distance = distance;
  }
}
```

-   On line 3 we are passing distance as a parameter. This means that
    when a new instance is created, a value should be passed in to set
    the distance of the car.
-   On line 4 we are assigning the value of distance to the value that
    is passed in

This pattern is so common that TypeScript has a shorthand for it:

``` {.typescript}
class Car {
  constructor (private distance) {
  }
}
```

Note that the only thing that we had to do was to add `private distance`
in the constructor parameter and remove the `this.distance` and
`distance: number`. TypeScript will automatically generate that. Below
is the JavaScript outputed by TypeScript:

``` {.javascript}
var Car = (function () {
  function Car(distance) {
    this.distance = distance;
  }
  return Car;
})();
```

Now that our car expects a `distance` we have to always supply a value
for the distance when creating a car. You can define default values if
you want so that the car is instantiated with a default value for the
distance if none is given:

``` {.typescript}
class Car {
  constructor (private distance = 0) {
  }
  getDistance():number { return this.distance; }
}
```

Now if I forget to pass a value for the `distance`, it is going to be
set to zero by default:

``` {.typescript}
const mycar = new Car();
console.log(mycar.getDistance()); //-> 0
```

Note that if you pass a value, it will override the default value:

``` {.typescript}
const mycar = new Car(5);
console.log(mycar.getDistance()); //-> 5
```

### Setters and Getters (Accessors)

It is a very common pattern to have setters and getters for properties
of a class. TypeScript provides a very simple syntax to achieve that.
Let's take our example above and add a setter and getter for the
distance property. But before that we are going to rename `distance` to
`_distance` to make it explicit that it is private. It is not required
but it is a common pattern to prefix private properties with an
underscore.

``` {.typescript}
class Car {
  constructor (private _distance = 0) {}
  getDistance():number { return this._distance; }
}
```

In order to create the getter method, we are going to use the `get`
keyword and the name for the property followed by `()`:

``` {.typescript}
class Car {
  constructor (private _distance = 0) {}
  get distance() { return this._distance; }
}
```

Now we can get the value of `distance`:

``` {.typescript}
const car2 = new Car(5);
console.log(car2.distance) //-> 5
```

Note on line 2 that we didn't call a function. Behind the scenes,
TypeScript creates a property for us, that's why it is not a method.
Below is the relevant generated JavaScript:

``` {.javascript}
Object.defineProperty(Car.prototype, "distance", {
  get: function () { return this._distance; },
  enumerable: true,
  configurable: true
});
```

JavaScript behind the scenes calls the get function for you to get the
value, and that's why we simply did `car2.distance` as opposed to
`car2.distance()`. For more information about `Object.defineProperty`
checkout the
[MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty)
docs.

Similar to the getter, we can define a setter as well:

``` {.typescript}
class Car {
  constructor (private _distance = 0) {}
  get distance() { return this._distance; }
  set distance(newDistance: number) { this._distance = newDistance; }
}
```

Now we can both get and set the distance value:

``` {.typescript}
const coolCar = new Car();
console.log(coolCar.distance); // -> 0

coolCar.distance = 55;
console.log(coolCar.distance); // -> 55
```

Note that if we take out the setter, we won't be able to assign a new
value to `distance`.

### Static Methods and Properties

Static methods and properties belong to the class but not the instances.
For example, the `Array.isArray` method is only accessible through the
`Array` but not an instance of an array:

``` {.javascript}
var x = [];
x.isArray // -> undefined
Array.isArray(x) //-> true
```

-   On line 2 we are trying to access the `isArray` method, but
    obviously it is not defined because `isArray` is a static method.
-   On line three we are calling the static `isArray` method from
    `Array` and we can check if `x` is an array.

If you look at the
[Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray)
documentation you can see that methods and properties are either defined
on the `Array.prototype` or `Array`:

-   `Array.prototype.x`: makes `x` available to all the instances of
    `Array`
-   `Array.x`: `x` is static and only available through `Array`.

Now that we have some context, let's see how you can define static
methods and properties in TypeScript. Consider the code below:

``` {.typescript}
class Car {
  static controls: {isAuto: boolean } = {
    isAuto: true
  };
  static isAuto():boolean {
    return Car.controls.isAuto;
  }
  constructor (private _distance = 0) {}
  get distance() { return this._distance; }
}

console.log(Car.controls); // -> { isAuto: true }
console.log(Car.isAuto()); // -> true
```

-   On line 2 we are defining a static property called `controls` using
    the `static` modifier. Then we specify the form and then assign a
    value for it.
-   On line 5 we are defining a static method called `isAuto` using the
    the `static` modifier. This method simply returns the value of
    `isAuto` from the static `control` object. Not that we get access to
    the class using the name of the class as opposed to using
    `this`. i.e. `return Car.controls.isAuto`

### Implementing an Interface

Classes can implement one or multiple interfaces. We can make the `Car`
class implement two interfaces:

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

### Inheritance

In Object-oriented programming, a class can inherit from another class
which helps to define shared attributes and methods among objects.
Although this pattern is very useful, it should be used cautiously as it
can lead to code that is hard to maintain. You can learn more about
classical inheritance and prototypical inheritance by watching Eric
Elliot's [talk](https://www.youtube.com/watch?v=lKCCZTUx0sI) at
O'Reilly's Fluent Conference. The project files for this section are in
[**`angular2-intro/project-files/typescript/classes/inheritance`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/classes/inheritance).

Let's get started by creating a base class called `Vehicle`. This class
is going to be the base class for other classes that we create later.

``` {.typescript}
// Vehicle.ts
export class Vehicle {
  constructor( private _name: string = 'Vehicle',
               private _distance: number = 0 ) { }
  get distance(): number { return this._distance; }
  set distance(newDistance: number) { this._distance = newDistance; }
  get name(): string { return this._name;}
  set name(newName: string) { this._name = newName; }
  move() { this.distance += 1 }
  toString() { return this._name; }
}
```

There is nothing special in this class. We are just creating a class
that has two private properties (name, distance) and we are creating the
setters and getters for them. Additionally, we are defining the
`toString` method that JavaScript internally calls in "textual
contexts". The constructor is the most notable of all the other methods:

-   It sets the `name` property to "Vehicle" for all the instances
-   It also sets the `distance` property to 0.

This means that when a class extends the `Vehicle` class, it will have
to call the constructor of `Vehicle` using the `super` keyword. Let's do
that now by creating two classes called `Car` and `Truck` that inherit
from the `Vehicle` class:

**`cars.ts`**

``` {.typescript}
import {Vehicle} from './vehicle';
export class Car extends Vehicle {
  constructor(name?: string) {
    super();
    this.name = name || 'Car';
  }
}
export class Truck extends Vehicle {
  constructor(name?: string) {
    super();
    this.name = name || 'Truck';
  }
}
```

-   The `Car` class and the `Truck` class both look almost identical.
    They both inherit from the `Vehicle` using the `extends` keyword.
-   They both call the `Vehicle`'s constructor in their own constructor
    method before implementing their own:
    `constructor(name?: string) { super(); }`
-   They both take an optional `name` property to set the name of
    the vehicle. If not name is provided, it will be set to either 'Car'
    or 'Truck'

Now let's create the `main` file and run the file:

``` {.typescript}
import {Car, Truck} from './cars';

/**
 * Creating a new car from `Car`
 */
const car = new Car();
console.log(car.name);
car.distance = 5;
car.move();
car.move();
console.log(car.distance);
/**
 * Creating a new Truck.
 */
const truck = new Truck();
console.log(truck.name);
```

-   On line 1 we are importing the `Car` and the `Truck` class.
-   and then we create a `Car` and `Truck` instance and log their names
    and distance to the console.

Run the build task (command + shift + b) and run the file (F5) and you
should see the output:

    node --debug-brk=7394 --nolazy output/main.js
    Debugger listening on port 7394
    Car
    7
    Truck

You can play around with the code above an try passing a string when
instantiating a `Car` or a `Truck` to see the name change.

**TODO**

-   `constructor overloading`

### Class Decorators

There are different types of decorators in TypeScript. In this section
we are going to focus on Class Decorators.

**TODO**

`add content`

Modules
-------

-   In TypeScript you can use modules to organize your code, avoid
    polluting the global space, and expose functionalities for others
    to use.
-   Multiple modules can be defined in the same file. However, it makes
    more sense to keep on module per file
-   If you want, you can split a single module across multiple files
-   If you decide to split a module across different files, this is how
    you would do it:
    -   Create the module file: `mymodule.ts` and declare your module
        there: `module MyModule {}`
    -   Create another file: `mymodule.ext1.ts` and on top of the file
        add: `/// <reference path="mymodule.ts" />`. Then in the file,
        you can use the same name of the module and add more stuff to
        it: `module MyModule { // other stuff... }`
    -   Then in your main file, you need two things on top of the file:
        -   `/// <reference path="mymodule.ts" />`
        -   `/// <reference path="mymodule.ext1.ts" />`
    -   Then, you can use the name of your module to refer to the
        symbols defined: `MyModule.something`, `MyModule.somethingElse`
-   TypeScript has two system: one used internally and the other used
    externally
-   External modules are used if your app uses CommonJS or AMD modules.
    Otherwise, you can use TypeScript's internal module system
-   Using TypeScript's internal module system, you can:
    -   use the `module` keyword to define a module:
        `module MyModule { ... }`
    -   split modules into different files that contribute to a single
        module
    -   use the `/// <reference path="File.ts" />` tag to tell the
        compiler how files are related to each other when modules are
        split across files
-   Using TypeScript's external module system:
    -   you cannot use the `module` keyword. The `module` keyword is
        used only by the internal module system.
    -   instead of the `reference` tag, you can use the `import` keyword
        to define the relationship between modules
    -   you can import symbols using the file name:
        `import mymodule = require('mymodule')`

The project files for this chapter are in
[**`angular2-intro/project-files/typescript/modules`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules).

### Simple Module

Let's create a simple module that contains two classes. The first class
is a vehicle class and the second is a car class that inherits from the
vehicle class. Then we are going to expose the car class to the outside
world and import it from another file. The project files for this
section are in
[**`angular2-intro/project-files/typescript/modules/basic-module`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules/basic-module).

First, create the `main.ts` file and copy paste the following:

**`main.ts`**

``` {.typescript}
module MyModule {
  class Vehicle {
    constructor (public name: string = 'Vehicle', private _distance: number = 0) {}
    get distance():number { return this._distance; }
    set distance(newDistance: number) { this._distance = newDistance; }
    move() { this.distance += 1 }
  }
}
```

-   On line 1 we are defining the module called `MyModule`.
-   Inside this module we have defined a class called `Vehicle` that has
    a distance property and a setter and getter.

Now we want to create a class and export it so that it can be imported
by others:

**`main.ts`**

``` {.typescript}
module MyModule {
  class Vehicle {
    constructor (public name: string = 'Vehicle', private _distance: number = 0) {}
    get distance():number { return this._distance; }
    set distance(newDistance: number) { this._distance = newDistance; }
    move() { this.distance += 1 }
  }
  // -> adding the car class
  export class Car extends Vehicle {
    constructor (public name: string = 'Car') {
      super();
    }
  }
}
```

-   On line 9 we are using the `export` keyword to indicate that the
    `Car` class is exposed and can be used by others.

Now, let's create a car using the `Car` class defined in the `MyModule`
module:

``` {.typescript}
const mycar = new MyModule.Car('My Car');
console.log(mycar.name);
```

Note that we accessed the `Car` class using the `MyModule` symbol:
`MyModule.Car`. Now we can split up the module into its own file and
import it into the main file. Let's create a file called `MyModule.ts`
and move the module definition to that file. Now in our main file we are
just going to import the module and use the car class from it.

**`main.ts`**

``` {.typescript}
/// <reference path="MyModule.ts" />
const mycar = new MyModule.Car('My Car');
console.log(mycar.name);
```

Note that we can create an alias to the `MyModule` using
`import AliasName = MyModule`. Now you can reference the module name
with `AliasName`:

``` {.typescript}
/// <reference path="MyModule.ts" />
import AliasName = MyModule;
const mycar = new AliasName.Car('My Car');
console.log(mycar.name);
```

Now if we run this in debug mode, the compiler will complain that it
can't find the `MyModule` reference. Because of that we need to make
some changes to our config files. First, we are going to add the `out`
property in the `tsconfig.json` file. This will tell the compiler to
compile all the files into a single file:

    "out": "output/run.js",

So our `tsconfig.json` file will look like this:

    {
      "compilerOptions": {
        "experimentalDecorators": true,
        "emitDecoratorMetadata": true,
        "module": "commonjs",
        "target": "es5",
        "sourceMap": true,
        "outDir": "output",
        "out": "output/run.js",
        "watch": true
      }
    }

Now if you run the build, you should see that all the project has been
compiled into `output/run.js`. In addition to the `tsconfig.json` file,
we are going to update the `launch.json` file and add a new
configuration field:

    {
      "name": "TS All Debugger",
      "type": "node",
      "program": "output/run.js",
      "stopOnEntry": false,
      "sourceMaps": true
    }

Now we should be able to use the debugger and put breakpoints in our
TypeScript files. Select `TS All Debugger` from the debugger dropdown
and run the debugger and it should stop if you put a breakpoint in any
of your TypeScript files.

**NOTE** Using the configuration files above we can compile all the
TypeScript files into a single JavaScript file. But sometimes that is
not what you want. Be aware that using the above configuration you will
not get an output for each TypeScript file.

### Splitting Internal Modules

Internal modules in TypeScript are open ended. This means that you can
define a module with the same name in different files and keep adding to
it. This is also known as merging. In this section we are going to
demonstrate merging multiple files that contribute to a single module
called `Merged`. The project files for this section are in
[**`angular2-intro/project-files/typescript/modules/merged-module`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules/merged-module).

First, we are going to make two files: `A.ts` and `B.ts`. In each file
we are going to define the `Merged` module:

``` {.typescript}
// A.ts
module Merged {
  const name = 'File A'; // not exported
  export class Door {
    constructor (private _color = 'white') {}
    get color() { return this._color; }
    set color(newColor) { this._color = newColor; }
  }
}
```

and then the `B.ts` file:

``` {.typescript}
// B.ts
module Merged {
  const name = 'File B'; // not exported
  export class Car {
    constructor(public distance = 0) {}
    move () {this.distance += 1;}
  }
}
```

We just created two files called `A.ts` and `B.ts` and each file we
defined the `Merged` module and added a class to each and exported it.
Now we are going to make the `main.ts` file and reference these two
files:

``` {.typescript}
// main.ts
/// <reference path="./A.ts" />
/// <reference path="./B.ts" />
```

And now we can use the classes defined in the `Merged` module, that is
the `Car` and the `Door` class:

``` {.typescript}
/// <reference path="./A.ts" />
/// <reference path="./B.ts" />
const car: Merged.Car = new Merged.Car();
const door: Merged.Door = new Merged.Door();
door.color = 'blue';
car.move();
car.move();
console.log(car.distance);
console.log(door.color);
```

if you run the build task (command + shift + b) and hit F5 you should
see the following output:

    node --debug-brk=19237 --nolazy output/run.js
    Debugger listening on port 19237
    2
    blue

### External Modules

In addition to TypeScript's internal module system, you can use external
modules as well. In this section we are going to demonstrate how you can
use external modules in TypeScript. The project files for this section
are in
[**`angular2-intro/project-files/typescript/modules/external-module`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules/external-module).

Let's say I have a JavaScript Node module defined in CommonJS format in
a file called `common.js`:

``` {.javascript}
// common.js
module.exports = function () {
  this.name = 'CommonJS Module';
};
```

In order to import this we need to do two things: first, we need to
install Node's Type Definitions. Then we need to require the module. To
install Node's Type Definitions run the following the terminal in the
root of your project:

    tsd install node --save

Now you should see a folder called `typings` containing the type
definitions. Now that we have Node's type definitions, let's add a
reference to it on top of `main.ts`:

``` {.typescript}
// main.ts
/// <reference path="./typings/node/node.d.ts" />
```

and then we are going to require the module and log it to the console:

``` {.typescript}
// main.ts
/// <reference path="./typings/node/node.d.ts" />
const common = require('./common');
console.log(common()); // --> CommonJS Module
```

After running the build task ( command + shift + b ), and running the
file (F+5) you should see the following output:

    node --debug-brk=32221 --nolazy run.js 
    Debugger listening on port 32221
    CommonJS Modules

**Note** the configuration files that we are using:

**`tsconfig.json`**

    {
      "compilerOptions": {
        "experimentalDecorators": true,
        "emitDecoratorMetadata": true,
        "module": "commonjs",
        "target": "es5",
        "sourceMap": true,
        "outDir": "output",
        "out": "run.js",
        "watch": true
      }
    }

**`launch.json`**

    {
      "version": "0.1.0",
      "configurations": [
        {
          "name": "TS All Debugger",
          "type": "node",
          "program": "./run.js",
          "stopOnEntry": false,
          "sourceMaps": true
        }
      ]
    }

Decorators
----------

-   Decorators can be used to add additional properties and methods to
    existing objects.
-   Decorators are a declarative way to add metadata to code.
-   There are four decorators: ClassDecorator, PropertyDecorator,
    MethodDecorator, ParameterDecorator
-   TypeScript supports decorators and does not know about Angular's
    specific annotations.
-   Angular provides annotations that are made with decorators behind
    the scenes

### Method Decorators

Goals: - make a method decorator called `log`. - Decorate `someMethod`
in a class using `@log`

``` {.typescript}
class SomeClass {
  @log
  someMethod(n: number) {
    return n * 2;
  }
}
```

In the usage, `someMethod` has been decorated with `log` using the `@`
symbol. `@log` is decorating `someMethod` because it is placed right
before the method.

-   Decorator Implementation:

``` {.typescript}
function log(target: Function, key: string, value: any) {
  return {
    value: function (...args: any[]) {
      var a = args.map(a => JSON.stringify(a)).join();
      var result = value.value.apply(this, args);
      var r = JSON.stringify(result);
      console.log(`Call: ${key}(${a}) => ${r}`);
      return result;
    }
  };
}
```

A method decorators takes a 3 arguments:

-   `target`: the method being decorated.
-   `key`: the name of the method being decorated.
-   `value`: a property descriptor of the given property if it exists on
    the object, undefined otherwise. The property descriptor is obtained
    by invoking the `Object.getOwnPropertyDescriptor` function.

**TODO**

-   Add decorator content for each type.

Angular
=======

This chapter will walk you through the main concepts in Angular. We will
start by looking at components, and then we move onto pipes, services,
events and other concepts. By the end of the chapter you should have a
basic understanding of the most important concepts in Angular.

The goal of this chapter is to get your feet wet without scaring you
with a lot of details. Don't worry, there will be a lot coming in later
chapters.

Project Files
-------------

### Running the Project Files

First, make sure that you have cloned the code repo somewhere on your
machine:

    cd ~/Desktop && git clone git@github.com:st32lth/angular2-intro.git

In order to run the project files, you need to do two things:

-   First, install the server dependencies and run the server in the
    root of the repo:

        cd angular2-intro && npm i && npm start

    After the dependencies are installed, it will open up the browser at
    port 8080.

-   The next step is to install the dependencies for angular examples.
    Go to `project-files/angular-examples` and install the dependencies:

        cd project-files/angular-examples && npm i

After following the steps above, you should be able to see the examples
in the browser. For example, if you want to see the `basic-component`
example, you can go to the following url:

    http://localhost:8080/project-files/angular-examples/basic-component/index.html

### Starter Project

There is a starter project in `angular-examples/starter`. You can make a
copy of that folder if you want to work on something new. The steps for
running the project is the same for all the projects:

-   Install the dependencies for the dev server in the root of the repo
    with `npm i` **(needed once)**
-   Start the dev server in the root of the repo with `npm start`
-   Install the dependencies for angular examples:
    `cd project-files/angluar-examples && npm i` **(needed once)**
-   Open your project in VSCode:
    `code project-files/angular-examples/starter`
    -   Close all chrome instances (quit out of Chrome)
    -   In VSCode start the build with `command + shift + b` and run the
        app by hitting F5 on the keyboard
-   If you don't want to use VSCode, you can use any other editor that
    you want. But make sure that you run the TypeScript compiler in the
    project folder:
    `cd project-files/angular-examples/starter && tsc -w`.

Components
----------

Components are at the heart of Angular. The main idea is that you break
down your application into different cohesive components and let the
components handle the rest. Every component has a controller defined by
a class and a template defined by html. In addition, a component's job
is to enable the user experience and delegate everything non-trivial to
services.

In this section we are going to write a simple `HelloAngular` component,
compile it and run it in the browser. In addition, we will configure
VSCode to build the TypeScript files as we go.

Note that there is a lot to talk about components. We are going dive
into components a lot more in later chapters, but for now let's just
keep things simple.

### Project Files

The project files for this chapter are in
**[`angular2-intro/project-files/angular-examples/basic-component`](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/basic-component)**
You can either follow along or just look at the final result

In order to run the project files, please refer to the [Using Angular
Project Files](#using-angular-project-files) section.

### Getting Started

Make a folder on your desktop called `hello-angular` and navigate to it:

    mkdir ~/Desktop/hello-angular && cd $_

Start npm in this folder with `npm init` and accept all the defaults.

After that, add the `dependencies` and `devDependencies` field to your
`package.json` file:

``` {.json}
"dependencies": {
  "angular2": "^2.0.0-beta.1",
  "es6-promise": "^3.0.2",
  "es6-shim": "^0.33.3",
  "reflect-metadata": "0.1.2",
  "rxjs": "5.0.0-beta.0",
  "zone.js": "0.5.10"
},
"devDependencies": {
  "systemjs": "^0.19.16"
}
```

your `package.json` file should look something like the follwoing:

``` {.json}
{
  "name": "hello-angular",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Stealth <st32lth@gmail.com> (http://github.com/st32lth)",
  "license": "ISC",
  "dependencies": {
    "angular2": "^2.0.0-beta.1",
    "es6-promise": "^3.0.2",
    "es6-shim": "^0.33.3",
    "reflect-metadata": "0.1.2",
    "rxjs": "5.0.0-beta.0",
    "zone.js": "0.5.10"
  },
  "devDependencies": {
    "systemjs": "^0.19.16"
  }
}
```

Then run `npm i` to install the dependencies.

After all the dependencies are installed, start VSCode in this folder
with `code .`

Then create a `index.html` file in the root of the project and put in
the following:

**`index.html`**

``` {.html}
<html>
<head>
  <title>Hello Angular</title>

  <script src="/node_modules/angular2/bundles/angular2-polyfills.js"></script>
  <script src="/node_modules/systemjs/dist/system.src.js"></script>
  <script src="/node_modules/rxjs/bundles/Rx.js"></script>
  <script src="/node_modules/angular2/bundles/angular2.dev.js"></script>

  <!-- add systemjs settings later -->

</head>

<body>
  <!-- add app stuff later -->
</body>

</html>
```

This loads all the necessary scripts that we need to run Angular in the
browser.

**Note**

If you need to support older browsers, you need to include the
`es6-shims` before everything else:

``` {.html}
<script src="/node_modules/es6-shim/es6-shim.js"></script>
```

### Making the Component

Let's start by making the `main.ts` file in the root of the project. In
this file we are going to define the main component called
`HelloAngular` and then bootstrap the app with it:

**`main.ts`**

``` {.typescript}
import {Component, OnInit} from 'angular2/core';
import {bootstrap} from 'angular2/platform/browser';

@Component({
  selector: 'app',
  styles: [`h1 { line-height: 100vh; text-align: center }`],
  template: `<h1>{{ name }}</h1>`
})
class HelloAngular implements OnInit {
  name: string;
  constructor() { this.name = 'Hello Angular'; }
  ngOnInit() { console.log('component linked'); }
}

bootstrap(HelloAngular, []);
```

-   On line 1 we are importing the `component` meta data (annotation)
    and the `onInit` interface.
-   On line 2 we are loading the `bootstrap` method that bootstraps the
    app given a component.
-   On line 4, we are defining a component using the
    `component` decorator. The `@component` is technically a class
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

### Compiling the Component

Now we need to compile the file to JavaScript. We can do it from the
terminal, but let's stick to VSCode. In order to that, we need to make
two config files:

1.  First is the standard
    [`tsconfig.json`](http://json.schemastore.org/tsconfig) file

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

### Loading the Component

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

    live-server .

If everything is wired up correctly, you should be able to see the
following:

![Running a basic component in the browser](images/hello-angular.png)

### Debugging the component

You can connect chrome's debugger to VSCode using the chrome debugger
extension for Visual Studio Code. See the [Debugging App from
VSCode](#debugging-app-from-vscode) section in case you missed to
install it. But, assuming that you have the extension installed, you can
debug your app from VSCode. In order to do that, we need to create a
`launch.json` file in the `.vscode` folder:

    touch .vscode/launch.json

After you created the file, put in the following configuration in the
file:

``` {.json}
{
  "version": "0.1.0",
  "configurations": [
    {
      "name": "Launch Chrome Debugger",
      "type": "chrome",
      "request": "launch",
      "url": "http://127.0.0.1:8080/",
      "sourceMaps": true,
      "webRoot": ".",
      "runtimeExecutable": "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
      "runtimeArgs": [
        "--remote-debugging-port=9222",
        "--incognito"
      ]
    }
  ]
}
```

Before running the debugger:

-   Make sure that all instances of chrome are closed. It makes it
    easier to run the debugger from VSCode itself.
-   Make sure that the `runtimeExecutable` path is valid. This value
    would be different depending on your OS.
-   Make sure that the `url` value is valid as well. The `url` value has
    to match the path that you see when you run a server serving
    the files.
-   Set a breakpoint on a line in `main.ts` file and then run the
    debugger under the debugger tab.

In order to run the debugger, select `Launch Chrome Debugger` in the
dropdown under the debugger tab and either click on the play icon or hit
F5 on the keyboard. After that, an instance of Chrome should be opened
in incognito mode. In order to trigger the debugger just refresh the
page and you should be able to see the debugger pausing in VSCode. If
everything is set up correctly you should be able to see something like
the following screenshot:

![Debugging the app with Chrome Debugger in
VSCode](images/run-debugger.png)

Directives
----------

-   Directives and components hand-in-hand are the fundamental elements
    of Angular.
-   Components can be defined as directives with views.
-   There are two types of directives in Angular:
    -   Structural
    -   Attribute
-   A directive is defined using the `@directive` decorator

**TODO**

Pipes
-----

-   Pipes allow you to transform values in templates before they are
    outputed to the view.
-   Pipes were formerly known as filters in Angular 1.x
-   A pipe is defined using the `@pipe` class decorator
-   The pipe decorator takes name as a parameter defining the name of
    the pipe: `@pipe({ name: 'myPipe' })`
-   Every pipe class has a `transform` method that transforms input to
    outputs:
    -   The first parameter is the input to the pipe
    -   The second parameter is the list of arguments passed to the pipe
-   Give the following pipe in a template:
    `{{ data | somePipe:1:'px'}}`:
    -   `data` is the input to pipe -- the first parameter of the
        transform method
    -   `[1, 'px']` is the arguments to the pipe -- the second parameter
        of the transform method
-   A pipe can be as simple as:

    ``` {.typescript}
    @pipe({name: 'simplePipe'})
    class MyPipe {
      transform(input, args) { return input + 'px'; }
    }
    ```

-   If you want to use a pipe, you need to register your pipe class with
    the components in the pipes array:

    ``` {.typescript}
    @component({
      selector: '...',
      pipes: [MyPipe] // adding pipe to the array of pipes.
    })
    class MyComponent {}
    ```

-   Pipes can be chained: `input | pipe1 | pipe2 | pipe3`
    -   `input | pipe1 : output1`
    -   `output1 | pipe2: output2`
    -   `output2 | pipe3 : finalOutput`

### Basic Pipe

Let's make a basic pipe called `pixel` that takes a value as the input
and appends 'px' to the end of it. The project files for this section
are in
[angular2-intro/project-files/angular-examples/pipes/basic-pipe](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/pipes/basic-pipe).

Start by making a copy of the "starter" folder and call it "basic-pipe"
and put it in `project-files/angular-examples`. Then, open the folder in
VSCode: `code project-files/angular-examples/basic-pipe` and start the
build with `command + shift + b`.

Then, create a file for the pipe and call it `pixel.pipe.ts` in the root
of the project.

After that we need to do couple of things to define the pipe:

-   Import the Pipe Class Metadata from angular core:
    `import {Pipe} from 'Angular/core'`
-   Then create a class defining the Pipe:

    ``` {.typescript}
    class PixelPipe {

    }
    ```

-   Implement the `transform` method in the class:

    ``` {.typescript}
    class PixelPipe {
      transform(input) {
        return input + 'px';
      }
    }
    ```

-   After implementing the method, we need to decorate the class and
    give the pipe a name that we want to use in our templates:

    ``` {.typescript}
    @Pipe({name: 'pixel'}) // <- adding the decorator
    class PixelPipe {
      transform(input) {
        return input + 'px';
      }
    }
    ```

-   As the last step we are going to export the class by putting the
    `export` keyword behind the class:

    ``` {.typescript}
    ...
    export class PixelPipe {
      ...
    }
    ```

Now, your file should look like the following:

``` {.typescript}
import {Pipe} from 'angular2/core';
@Pipe({name: 'pixel'}) // <- adding the decorator
export class PixelPipe {
  transform(input) {
    return input + 'px';
  }
}
```

Now, let's go back to the `main.ts` file and import our pipe:

``` {.typescript}
import {Component} from 'angular2/core';
import {bootstrap} from 'angular2/platform/browser';
import {PixelPipe} from './pixel.pipe'; // <- importing pipe
```

After importing our pipe, we should register it with our component by
adding it to the `pipes` array:

``` {.typescript}
@Component({
  selector: 'app',
  templateUrl : 'templates/app.tpl.html',
  pipes: [PixelPipe] // <- registering the pipe
})
```

Now that we have registered the pipe, we can use it in our template in
`templates/app.tpl.html`:

``` {.html}
<h1>{{ name }}</h1>
<p>Pixel value: {{ 25 | pixel }}</p>
```

You should be all set now. You can set the url in your `launch.json`
file and hit F5:

``` {.json}
...
"url": "http://localhost:8080/project-files/angular-examples/basic-pipe/index.html",
...
```

If your server is running you should be able to see the following
output:

![Running the pixelPipe in the browser](images/basic-pipe.png)

### Chaining Pipes

Let's continue where we left off with the "pixelPipe" and add another
pipe called "round" that rounds down given values, that is:

    25.3 | round | pixel -> 25px

The project files for this section are in
[angular2-intro/project-files/angular-examples/pipes/pipe-chaining](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/pipes/pipe-chaining).

We are going to add the "roundPipe" to our "basic-pipe" project. Let's
get started by adding the `round.pipe.ts` file in the root of the
project:

``` {.typescript}
import {Pipe} from 'angular2/core';
@Pipe({name: 'round'})
export class RoundPipe {
  transform (input) {
    return Math.floor(+input); // <- convert input to number and then floor it.
  }
}
```

This Pipe is not complicated at all. We are just returning the floor of
the input. We are also converting the input to number by putting a `+`
before input.

Now, let's import the pipe into our `main.ts` file:

``` {.typescript}
import {Component} from 'angular2/core';
import {bootstrap} from 'angular2/platform/browser';
import {PixelPipe} from './pixel.pipe';
import {RoundPipe} from './round.pipe'; // <- importing `RoundPipe`
```

and then we have to add the pipe to the list of pipe array:

``` {.typescript}
@Component({
  selector: 'app',
  templateUrl : 'templates/app.tpl.html',
  pipes: [PixelPipe, RoundPipe] // <- registering the pipe
})
```

after that we are going to add the following to our
`templates/app.tpl.html` file:

``` {.html}
<p>Pixel value: {{ 34.4 | round | pixel }}</p>
```

After running the app you should see `34.px` as the output on the page.

### Pipes with Parameters

In this section we are going to extend our 'pixel' pipe to accept an
optional parameter to set the unit. As a result, we are going to rename
the 'pixel' pipe to 'unit' to make it more generic. This pipe will take
the unit as an optional argument. If no argument is passed, it will
default to 'px'. That is:

    25 | unit -> 25px
    25 | unit:'em' -> 25em
    34.5 | round | unit:'%' -> 34%

You can look at the project files in
[angular2-intro/project-files/angular-examples/pipes/pipe-unit](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/pipes/pipe-unit)..
AFter refactoring the name of the Pipe, we just need to change the
implementation of the "UnitPipe":

**`unit.pipe.ts`**

``` {.typescript}
import {Pipe} from 'angular2/core';
@Pipe({name: 'unit'})
export class UnitPipe {
  transform(input, args:string) {
    const unit = args[0] || 'px';
    return input + unit;
  }
}
```

-   On line 5, we are grabbing the first parameter that is passed in and
    setting it to the `unit` variable. And if the value is not set, we
    are setting 'px' as the default value.
-   And finally we are returning `input + unit`.

That's basically all we have to do. Note that you can pass multiple
parameters separated by `:` and they all become available in the `args`
array. So if you wanted to expand this pipe, this is how your template
would look like:

``` {.html}
{{ 25 | unit:'em':2}}
```

And the `args` array would be: `['em', 2]`.

### Async Pipes

Async Pipes can be used for values that will be resolved after some
asynchronous operation like getting a value after making a http call.

**TODO**

Dependency Injection
--------------------

Dependency Injection is a coding pattern in which a class receives its
dependencies from external sources rather than creating them itself. In
order to achieve Dependency Injection we need a Dependency
InjectionFramework to handle the dependencies for us. Using a DI
framework, you simply ask for a class from the injector instead of
worrying about the dependencies inside the class itself.

Angular has a standalone module that handles Dependency Injection. This
framework can also be used in non-Angular applications to handle
Dependency Injection.

**TODO**

Services and Providers
----------------------

-   A service is nothing more than a class in Angular 2. It remains
    nothing more than a class until we register it with the
    Angular injector.
-   When you bootstrap your app, Angular creates an injector on the fly
    that can inject services and other dependencies throughout the app.
-   You can register the service or the dependencies during when
    bootstrapping the app or when defining a component.
-   If you have a class called `MyService`, you can register it with the
    Injector and then you can inject it everywhere:

    ``` {.typescript}
    bootstrap(App, [MyService]); // second param is an array of providers
    ```

-   Providers is a way to specify what services are available inside the
    component in a hierarchical fashion.
-   A provider can be a class, a value or a factory.
-   Providers create the instances of the things that we ask the
    injector to inject.
-   `[SomeService];` is short for
    `[provide(SomeService, {useClass:SomeService})];` where the first
    param is the token, and the second is the definition object.
-   A simple object can be passed to the Injector to create a Value
    Provider:

    ``` {.typescript}
    beforeEachProviders(() => {
      let someService = { getData: () => [] };
      // using `useValue` instead of `useClass`
      return [ provide(SomeSvc, {useValue: someService}) ];
    });
    ```

-   You can also use a factory as a provider.
-   You can use a factory function that creates a properly configured
    Service:

    ``` {.typescript}
    let myServiceFactory = (dx: DepX, dy: DepY) => {
      return new MyService(dx, dy.value);
    }

    // provider definition object.
    let myServiceDefinition = {
       useFactory: myServiceFactory,
       deps: [DepX, DepY]
    };

    // create provider and bootstrap
    let myServiceProvider = provide(MyService, myServiceDefinition);
    bootstrap(AppComponent, [myServiceProvider, DepX, DepY]);
    ```

-   Defining object dependencies is simple. You can make a plain
    JavaScript object available for injection using a string-based token
    and the `@Inject` decorator:

    ``` {.typescript}
    var myObj = {};

    bootstrap(AppComponent, [
      provide('coolObjToken', {useValue: myObj})
    ]);

    // and you can inject it to a component

    import {Inject} from 'angular2/core'
    constructor(dx: DepX, @Inject('coolObjToken') config)
    ```

    **TODO**

Data and State Management
-------------------------

-   Angular is flexible and doesn't prescribe a recipe for managing data
    in your apps
-   Since observables are integrated into Angular, you can take
    advantage of observables to manage data and state
-   You ca use services to manage streams that emit models
-   Components can subscribe to the streams maintained by services and
    render accordingly.
    -   For example, you can have a service for a Todo app that contains
        a stream of todos and a `ListComponent` can listen for todos and
        render when a new task is added.
    -   You may have another component that listens for the user that
        has been assigned to a task provided by a service.
-   The steps for creating different parts of an app can be summarized
    in three steps:
    -   Defining a Model using a class
    -   Defining the service
    -   Defining the component

Observables
-----------

-   Angular embraces observables using the RxJS library.
-   Observables emit events and observers observe observables.
-   An observer *subscribes* to events emitted from an observable.
-   RxJS has an object called *subject* that can be used both as an
    observer or an observable. *Subject* can be imported from `RxJS`
    very easily:

    ``` {.typescript}
    import {Subject} from 'rxjs/Subject';
    ```

-   A subscription can be canceled by calling the `unsubscribe` method.

**TODO**

Metadata Classes
----------------

-   Angular uses Metadata to decorate classes, methods and properties.
-   The most notable Metadata is the `@component` Metadata.
-   Metadta classes are very convenient and they make it easy to work
    with components, services and the dependency injection system

Below is a list of Angular's core Metadata classes categorized under
directives/components, pipes and di.

**Directive/component Meta-data**

-   [Component](https://angular.io/docs/ts/latest/api/core/ComponentMetadata-class.html):
    used to define a component

    -   [View](https://angular.io/docs/ts/latest/api/core/ViewMetadata-class.html):
        used to define the template for a component
    -   [ViewChild](https://angular.io/docs/ts/latest/api/core/ViewChildMetadata-class.html):
        used to configure a view query
    -   [ViewChildren](https://angular.io/docs/ts/latest/api/core/ViewChildrenMetadata-class.html):
        used to configure a view query
-   [Directive](https://angular.io/docs/ts/latest/api/core/DirectiveMetadata-class.html):
    used to define a directive

    -   [Attribute](https://angular.io/docs/ts/latest/api/core/AttributeMetadata-class.html)
        used to grab the value of an attribute on an element hosting a
        directive
    -   [ContentChild](https://angular.io/docs/ts/latest/api/core/ContentChildMetadata-class.html):
        used to configure a content query
    -   [ContentChildren](https://angular.io/docs/ts/latest/api/core/ContentChildrenMetadata-class.html):
        used to configure a content query
    -   [Input](https://angular.io/docs/ts/latest/api/core/InputMetadata-class.html):
        used to define the input to a directive/component
    -   [Output](https://angular.io/docs/ts/latest/api/core/OutputMetadata-class.html):
        used to define the output events of a directive/component
    -   [HostBinding](https://angular.io/docs/ts/latest/api/core/HostBindingMetadata-class.html):
        used to declare a host property binding
    -   [HostListener](https://angular.io/docs/ts/latest/api/core/HostListenerMetadata-class.html):
        used to declare a host listener

**Pipes**

-   [Pipe](https://angular.io/docs/ts/latest/api/core/PipeMetadata-class.html):
    used to declare reusable pipe function

**DI**

-   [Inject](https://angular.io/docs/ts/latest/api/core/InjectMetadata-class.html):
    parameter metadata that specifies a dependency.
-   [Injectable](https://angular.io/docs/ts/latest/api/core/InjectableMetadata-class.html):
    a marker metadata that marks a class as available to Injector
    for creation.
-   [Host](https://angular.io/docs/ts/latest/api/core/HostMetadata-class.html):
    Specifies that an injector should retrieve a dependency from any
    injector until reaching the closest host.
-   [Optional](https://angular.io/docs/ts/latest/api/core/OptionalMetadata-class.html):
    parameter metadata that marks a dependency as optional
-   [Self](https://angular.io/docs/ts/latest/api/core/SelfMetadata-class.html):
    Specifies that an Injector should retrieve a dependency only
    from itself.
-   [SkipSelf](https://angular.io/docs/ts/latest/api/core/SkipSelfMetadata-class.html):
    Specifies that the dependency resolution should start from the
    parent injector.
-   [Query](https://angular.io/docs/ts/latest/api/core/QueryMetadata-class.html):
    Declares an injectable parameter to be a live list of directives or
    variable bindings from the content children of a directive.
-   [ViewQuery](https://angular.io/docs/ts/latest/api/core/ViewQueryMetadata-class.html):
    Similar to `QueryMetadata`, but querying the component view, instead
    of the content children.

**TODO**

Angular Router
--------------

Angular has a stand-alone module responsible for handling routing.

**TODO**

Deep Dive
=========

Let's deep dive into Angular and RxJS concepts

Components in Depth
-------------------

-   A component declares a reusable building block of an app
-   A TypeScript class is used to define a component coupled with the
    `@component` decorator

The `@component` decorator defines the following:

-   selector: `string` value defining the css selector targeting an html
    element
-   inputs: `array of string` values defining the inputs to the
    component
-   outputs: `array of string` values defining the output of the
    component
-   properties: `array of string` values defining the properties
-   events: `array of string` values defining the events
-   host?: {\['string'\]: 'string'},
-   providers: `array of objects` defining the providers for the
    component
-   exportAs: `string` value defining the exported value
-   moduleId: `string` value defining the module id
-   viewProviders: `array of objects` defining the providers for the
    view
-   queries: {\[key: string\]: any},
-   changeDetection: `ChangeDetectionStrategy` object defining the
    strategy for detecting changes:

    -   `ChangeDetectionStrategy.Default`: sets detector mode to
        `CheckAlways`
    -   `ChangeDetectionStrategy.OnPush`: sets detector mode to
        `CheckOnce`
    -   `ChangeDetectionStrategy.Detached`: change detector sub tree is
        not a part of the main tree and should be skipped
    -   `ChangeDetectionStrategy.CheckAlways`: after calling
        detectChanges the mode of the change detector will remain
        `CheckAlways`
    -   `ChangeDetectionStrategy.Checked`: change detector should be
        skipped until its mode changes to `CheckOnce`
    -   `ChangeDetectionStrategy.CheckOnce`: after calling detectChanges
        the mode of the change detector will become `Checked`
-   templateUrl: `string` value for the url path to the template
-   template: `string` value for the template
-   styleUrls: `array of string` values defining url paths to css files
-   styles: `array of string` values defining css styles:

    -   styles: \['.myclass { color: \#000;}'\],
-   directives: `array` of directives used in the component
-   pipes: `array` of pipes used in the component
-   encapsulation: `ViewEncapsulation` value that defines template and
    style encapsulation options:
    -   `ViewEncapsulation.None`: means do not provide any style
        encapsulation
    -   `ViewEncapsulation.Emulated`: No Shadow DOM but style
        encapsulation emulation using extra attributes on the DOM
        (default method)
    -   `ViewEncapsulation.Native`: means provide native shadow DOM
        encapsulation and styles appear in component’s template inside
        the shadow root.

**TODO**

RxJS
====

-   RxJS is a great library for composing event streams
-   You can perform operations on events

**TODO**
