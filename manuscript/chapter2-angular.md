# Angular

This chapter will walk you through the main concepts in Angular. We will start by looking at components, and then we move onto pipes, services, events and other concepts. By the end of the chapter you should have a basic understanding of the most important concepts in Angular.

The goal of this chapter is to get your feet wet without scaring you with a lot of details. Don't worry, there will be a lot coming in later chapters.

## Project Files

### Running the Project Files

First, make sure that you have cloned the code repo somewhere on your machine:

```
cd ~/Desktop && git clone git@github.com:st32lth/angular2-intro.git
```

In order to run the project files, you need to do two things:

- First, install the server dependencies and run the server in the root of the repo:

    ```
    cd angular2-intro && npm i && npm start
    ```

    After the dependencies are installed, it will open up the browser at port 8080.

- The next step is to install the dependencies for angular examples. Go to `project-files/angular-examples` and install the dependencies:

    ```
    cd project-files/angular-examples && npm i
    ```

After following the steps above, you should be able to see the examples in the browser. For example, if you want to see the `basic-component` example, you can go to the following url:

```
http://localhost:8080/project-files/angular-examples/basic-component/index.html
```

### Starter Project

There is a starter project in `angular-examples/starter`. You can make a copy of that folder if you want to work on something new. The steps for running the project is the same for all the projects:

- Install the dependencies for the dev server in the root of the repo with `npm i` **(needed once)**
- Start the dev server in the root of the repo with `npm start`
- Install the dependencies for angular examples: `cd project-files/angluar-examples && npm i` **(needed once)**
- Open your project in VSCode: `code project-files/angular-examples/starter`
    - Close all chrome instances (quit out of Chrome)
    - In VSCode start the build with `command + shift + b` and run the app by hitting F5 on the keyboard
- If you don't want to use VSCode, you can use any other editor that you want. But make sure that you run the TypeScript compiler in the project folder: `cd project-files/angular-examples/starter && tsc -w`.

## Using the Docs

**TODO**

## Component Basics

Components are at the heart of Angular. The main idea is that you break down your application into different cohesive components and let the components handle the rest. Every component has a controller defined by a class and a template defined by html. In addition, a component's job is to enable the user experience and delegate everything non-trivial to services.

In this section we are going to write a simple `HelloAngular` component, compile it and run it in the browser. In addition, we will configure VSCode to build the TypeScript files as we go.

Note that there is a lot to talk about components. We are going dive into components a lot more in later chapters, but for now let's just keep things simple.


The project files for this chapter are in **[`angular2-intro/project-files/angular-examples/basic-component`](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/basic-component)** You can either follow along or just look at the final result

In order to run the project files, please refer to the [Running the Project Files](#running-the-project-files) section.

**Getting Started**

Make a folder on your desktop called `hello-angular` and navigate to it:

```
mkdir ~/Desktop/hello-angular && cd $_
```

Start npm in this folder with `npm init` and accept all the defaults.

After that, add the `dependencies` and `devDependencies` field to your `package.json` file:

```json
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

```json
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

After all the dependencies are installed, start VSCode in this folder with `code .`

Then create a `index.html` file in the root of the project and put in the following:

**`index.html`**

```html
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

This loads all the necessary scripts that we need to run Angular in the browser.

**Note**

If you need to support older browsers, you need to include the `es6-shims` before everything else:

```html
<script src="/node_modules/es6-shim/es6-shim.js"></script>
```

### Making a Simple Component

Let's start by making the `main.ts` file in the root of the project. In this file we are going to define the main component called `HelloAngular` and then bootstrap the app with it:

**`main.ts`**

```typescript
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

- On line 1 we are importing the `component` meta data (annotation) and the `onInit` interface.
- On line 2 we are loading the `bootstrap` method that bootstraps the app given a component.
- On line 4, we are defining a component using the `component` decorator. The `@component` is technically a class decorator because it precedes the `HelloAngular` class definition.
- On line 5, we are telling angular to look out for the `app` tag. So when Angular looks at the html and comes across the `<app></app>` tag, it is going to load the template (on line 6) and instantiates the class for it (defined on line 9).
- On line 9, we are defining a class called `HelloAngular` that defines the logic of the component. And for fun, we are implementing the `OnInit` interface to log something to the console when the component is ready with its data. We will learn more about the lifeCycle hooks later.
- Last but not least, we call the `bootstrap` method with the `HelloAngular` class as the first argument to bootstrap the app with the `HelloAngular` component.

**Compiling the Component**

Now we need to compile the file to JavaScript. We can do it from the terminal, but let's stick to VSCode. In order to that, we need to make two config files:

1. First is the standard [`tsconfig.json`](http://json.schemastore.org/tsconfig) file

2. And the `tasks.json` file for VSCode to do the compiling

Create the `tsconfig.json` file in the root of the project and put in the following:

**`tsconfig.json`**

```json
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

Then create the `tasks.json` in the `.vscode` folder in the root of the project and put in the following:

**`.vscode/tasks.json`**

```json
{
  "version": "0.1.0",
  "command": "tsc",
  "showOutput": "silent",
  "isShellCommand": true,
  "problemMatcher": "$tsc"
}
```

- Now we can build the TypeScript files as we work. We just need to start the build task with `command + shift + b` or using the prompt. If you want to use the prompt do the following:

    - Use `command + shift + p` to open the prompt

    - Then, type `> run build task` and hit enter to start the build task.

- After you run the build task, you should see an `output` file generated with `main.js` and the source maps in it.

- The task is watching the files and compiling as you go. To stop the task, open the prompt and type:

    ```
    > terminate running task
    ```

**Loading the Component**

After compiling the component, we need to load it to the `index.html` file with `Systemjs`. Open the `index.html` file and replace `<!-- add systemjs settings later -->` with the following:

```html
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

```html
<body>
  <app>Loading ...</app>
</body>
```

It is finally time to serve the app. You can serve the app in the current directory using the `live-server`:

```
live-server .
```

If everything is wired up correctly, you should be able to see the following:

![Running a basic component in the browser](images/hello-angular.png)

**Debugging the component**

You can connect chrome's debugger to VSCode using the chrome debugger extension for Visual Studio Code. See the [Debugging App from VSCode](#debugging-app-from-vscode) section in case you missed to install it. But, assuming that you have the extension installed, you can debug your app from VSCode. In order to do that, we need to create a `launch.json` file in the `.vscode` folder:

```
touch .vscode/launch.json
```

After you created the file, put in the following configuration in the file:

```json
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

- Make sure that all instances of chrome are closed. It makes it easier to run the debugger from VSCode itself.
- Make sure that the `runtimeExecutable` path is valid. This value would be different depending on your OS.
- Make sure that the `url` value is valid as well. The `url` value has to match the path that you see when you run a server serving the files.
- Set a breakpoint on a line in `main.ts` file and then run the debugger under the debugger tab.

In order to run the debugger, select `Launch Chrome Debugger` in the dropdown under the debugger tab and either click on the play icon or hit F5 on the keyboard. After that, an instance of Chrome should be opened in incognito mode. In order to trigger the debugger just refresh the page and you should be able to see the debugger pausing in VSCode. If everything is set up correctly you should be able to see something like the following screenshot:

![Debugging the app with Chrome Debugger in VSCode](images/run-debugger.png)

### Component Inputs

- You can pass data to a component.
- You can either use the `inputs` array on a component or annotate an instance variable with the `Input` decorator
- Once you specify the inputs to your component, they become available in the `ngOnInit` method
- You can implement the `ngOnInit` and access the input instance variables
- You can use the `[propname]="data"` to set the `propname` to whatever `data` evaluates to
- Note that if you set `[propname]="'data'"`, `propname` will be set to the literal `data` string

**Project files**

The project files for this section are in [angular2-intro/project-files/angular-examples/component-input](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/component-input).

**Getting Started**

In order to demonstrate component inputs, we are going to create a `user` component and pass `name`, `lastName`, and `userId` to it. So our final html tag would look something like the following:

```html
<user name="Tom" lastName="Johnson" uesrId="1"></user>
```

And the template for the component will be:

```html
<h1>Hello, {{ name }} {{ lastName }}, id: {{ userId }}</h1>
```

which would output: `Hello, Tom Johnson id: 1`.

To get started, let's define the `User` component:

```typescript
@Component({
  selector: 'user',
  template: '<h1>Hello, {{ name }} {{ lastName }} id: {{ userId }}</h1>',
  inputs: ['name', 'lastName', 'userId'] // <- specifying the inputs to the `User` component
})
class User {}
```

- On line 4 we are defining the inputs as an array of strings

Then, we are going to use the `User` component inside our app's template:

```typescript
@Component({
  selector: 'app',
  template: `<user name="Tom" lastName="Johnson" uesrId="1"></user>`
})
class Root {}
```

because we are using the `User` component in the app, we need to register it with the app by adding `User` class to the list of `directives` of the app component:

```typescript
@Component({
  selector: 'app',
  template: `<user name="Tom" lastName="Johnson" userId="1"></user>`,
  directives: [User] // <- register the component
})
class Root {}
```

and at the end we need to bootstrap the app:

```typescript
bootstrap(Root, [])
```

Now, notice that instead of adding the inputs to the `inputs` array, we could have decorated the instance variables with the `@Input` decorator:

```typescript
import {Input} from 'angular2/core'; // <- importing the Input decorator
@Component({
  selector: 'user',
  template: '<h1>Hello, {{ name }} {{ lastName }} id: {{ userId }}</h1>'
  // <- removing the inputs array.
})
class User {
  @Input() private name: string;
  @Input() private lastName: string;
  @Input() private userId: number;
}
```

**Binding Data to Properties**

Now, let's see how we can bind to a property from another component. For this example, we are going to continue with our `User` component and create a new component called `Permission`. Then we are going to use the the `Permission` component inside the `User` component and set the `uid` of `Permission` by the `userId` of the `User`.

The `Permission` component is defined as follows:

```typescript
@Component({
  selector: 'permission',
  template: '<h2> Restriction is: {{ restriction }}'
})
class Permission {
  @Input() private uid: string;
  private restriction: string;
  constructor() {
    this.restriction = 'none';
  }
  ngOnInit() {
    this.restriction = this.uid === '1' ? 'admin' : 'normal';
  }
}
```

- On line 6 we are defining `uid` to be an input instance variable. It's value is set from outside.
- In the constructor we are setting a default value for the restriction.
- Then in the `ngOnInit` hook, we are evaluating the value of `restriction` based on the given id provided by other components, in this case the `User` component
- In this silly example, if the passed id is `1`, we will set the `restriction` to `admin`, otherwise we set it to `normal`.

then we are going to register the `Permission` component with the `User` component so that we can use it in the `User` template:

```typescript
@Component({
  selector: 'user',
  ///...
  directives: [Permission] // <-
})
class User {}
```

then we can update the `User` template to include the `Permission`:

```typescript
@Component({
  selector: 'user',
  template: `
  <h1>Hello, {{ name }} {{ lastName }}, id: {{ userId}}</h1>
  <div>
    <permission [uid]="userId"></permission>
  </div>
  `,
  inputs: ['name', 'lastName', 'userId'],
  directives: [Permission]
})
class User {}
```

- Note that on line 6 we are setting the `uid` of `Permission` by `userId` available from the `User` component.

If you run the app you should see the following printed to the page:

![Input to components](images/input-cmp.png)

### Component Output/Events

- Events can be emitted from components. These events can be either custom or they could be DOM events
- The syntax is `(eventname)="fn()"` where `eventname` is the name of the event and `fn` is the handler function
- The handler function is called when the event is fired
- For example, if you want to handle a click event you can do: `(click)="handler()"`. In this case the `hander` is called whenever the click event is fired off
- You can use Angular's `EventEmitter` to fire off custom events


**Project Files**

The project files for this section are in [angular2-intro/project-files/angular-examples/component-output-events](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/component-output-events).

**Final Result**

The goal of this section is to show you how to create a component that contains a button that when is clicked, calls a handler defined by the component's class. The final html will look like the following:

```html
<p>Value: {{ value }}</p>
<button (click)=addOne()>Add +</button>
```

That idea is very simple: every time we click on the button we want to increment the value by one. In addition to that, we want to be able to hook into a custom event and run the `addOne` method whenever the event is fired:

```html
<p>Value: {{ value }}</p>
<span adder-auto (myevent)=addOne()>adding ...</span>
```

**Getting Started**

Let's get started by defining our `Adder` component:

```typescript
@Component({
  selector: 'adder',
  template:`
  <p>Value: {{ value }}</p>
  <button (click)=addOne()>Add +</button>
  `
})
class Adder {
  private value: number;
  constructor() {
    this.value = 0;
  }
  addOne() {
  this.value += 1;
  console.log(this.value);
  }
}
```

Now, we are just going to register `Adder` with our root component:

```typescript
@Component({
  selector: 'app',
  directives: [Adder],
  template: '<adder></adder>'
})
class App {}
```

after you bootstrap the app and run it you should be able to see a button that when clicked increments the value by one.

**Using EventEmitter**

Now, let's see how we can use the `EventEmitter` to increment the value by one every time a custom event is fired every second. In order to achieve that, we are going to create an attribute directive called `AdderAuto`. Start by importing the `Directive` metadata class:

```typescript
import {Directive} from 'angular2/core';
```

and then define the selector for the directive:

```typescript
@Directive({
  selector: '[adder-auto]'
})
```

- `selector: '[adder-auto]'` means that angular will target any element that has the `adder-auto` attribute and will create an instance of the class. Now we need to define the class for our directive:

```typescript
class AdderAuto {
  // custom event definition
}
```

In this class we need to define a custom event output hook. We are going to call it `myevent`. The same way that you can hook into `(click)`, we want to be able to use `(myevent)`. To achieve that, we need to create an instance variable and decorate it with the `Output` decorator:

```typescript
// -> importing `EventEmitter` and `Output` decorator.
import {EventEmitter, Output} from 'angular2/core';
class AdderAuto {
  @Output() myevent: EventEmitter<string>;
  constructor() {
    this.myevent = new EventEmitter();
  }
}
```

- If you notice, `myevent` is of type `EventEmitter` that emit events of type string
- In the constructor we are creating an instance of `EventEmitter`. So now we can use `myevent` to emit events
- We can use `setInterval` to emit event from our custom event every second

```typescript
class AdderAuto {
  @Output() myevent: EventEmitter<string>;
  constructor() {
    this.myevent = new EventEmitter();
    setInterval(()=> {this.myevent.emit('myevename')}, 1000);
  }
}
```

Now we can register `AdderAuto` with the `Adder` component and run the `addOne` method every second:

```typescript
@Component({
  selector: 'adder',
  ...
  directives: [AdderAuto] // <- register `AdderAuto`
})
```

and then we can update the template:

```html
<p>Value: {{ value }}</p>
<button (click)="addOne()">Add +</button>
<!-- using the event. -->
<h2>Using Emitter</h2>
<span adder-auto (myevent)="addOne($event)"> EVENT: </span>
```

- first we are adding the attribute directive `adder-auto` on the span
- second, we are using the `myevent` hook and attaching `addOne` handler to it. This means that whenever the `myevent` event is triggered, run the `addOne` handler.

The `Adder` component now looks like the following with the updated template:

```typescript
@Component({
  selector: 'adder',
  template:`
  <p>Value: {{ value }}</p>
  <button (click)="addOne()">Add +</button>
  <h2>Using Emitter</h2>
  <span adder-auto (myevent)="addOne($event)"> EVENT: </span>
  `,
  directives: [AdderAuto]
})
```

Now if you run the code, you should be able to see the number incrementing by one every second.

## Directives

- Directives and components hand-in-hand are the fundamental elements of Angular.
- Components can be defined as directives with views.
- There are two types of directives in Angular:
    - Structural
    - Attribute
- A directive is defined using the `@directive` decorator

**TODO**

## Change Detection

- In Angular2 you can limit the change detection scope to components
- Using `chageDection` property we can choose a change detection strategy for a component
- The `changeDetection` field accept one of the following values:

    - `ChangeDetectionStrategy.Default`: sets detector mode to `CheckAlways`
    - `ChangeDetectionStrategy.OnPush`: sets detector mode to `CheckOnce`. This will limit change detection to the bindings affecting the component only
    - `ChangeDetectionStrategy.Detached`: change detector sub tree is not a part of the main tree and should be skipped
    - `ChangeDetectionStrategy.CheckAlways`: after calling detectChanges the mode of the change detector will remain `CheckAlways`
    - `ChangeDetectionStrategy.Checked`: change detector should be skipped until its mode changes to `CheckOnce`
    - `ChangeDetectionStrategy.CheckOnce`: after calling detectChanges the mode of the change detector will become `Checked`

- Having the ability to specify change detection strategy can reduce the number of checks and improve app's performance

## Pipes

- Pipes allow you to transform values in templates before they are outputed to the view.
- Pipes were formerly known as filters in Angular 1.x
- A pipe is defined using the `@pipe` class decorator
- The pipe decorator takes name as a parameter defining the name of the pipe: `@pipe({ name: 'myPipe' })`
- Every pipe class has a `transform` method that transforms input to outputs:
    - The first parameter is the input to the pipe
    - The second parameter is the list of arguments passed to the pipe
- Give the following pipe in a template: `{{ data | somePipe:1:'px'}}`:
    - `data` is the input to pipe --  the first parameter of the transform method
    - `[1, 'px']` is the arguments to the pipe -- the second parameter of the transform method
- A pipe can be as simple as:

    ```typescript
    @pipe({name: 'simplePipe'})
    class MyPipe {
      transform(input, args) { return input + 'px'; }
    }
    ```

- If you want to use a pipe, you need to register your pipe class with the components in the pipes array:

    ```typescript
    @component({
      selector: '...',
      pipes: [MyPipe] // adding pipe to the array of pipes.
    })
    class MyComponent {}
    ```

- Pipes can be chained: `input | pipe1 | pipe2 | pipe3 `
    - `input | pipe1 : output1`
    - `output1 | pipe2: output2`
    - `output2 | pipe3 : finalOutput`

### Basic Pipe

Let's make a basic pipe called `pixel` that takes a value as the input and appends 'px' to the end of it. The project files for this section are in [angular2-intro/project-files/angular-examples/pipes/basic-pipe](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/pipes/basic-pipe).

Start by making a copy of the "starter" folder and call it "basic-pipe" and put it in `project-files/angular-examples`. Then, open the folder in VSCode: `code project-files/angular-examples/basic-pipe` and start the build with `command + shift + b`.

Then, create a file for the pipe and call it `pixel.pipe.ts` in the root of the project.

After that we need to do couple of things to define the pipe:

- Import the Pipe Class Metadata from angular core: `import {Pipe} from 'Angular/core'`
- Then create a class defining the Pipe:

    ```typescript
    class PixelPipe {

    }
    ```

- Implement the `transform` method in the class:

    ```typescript
    class PixelPipe {
      transform(input) {
        return input + 'px';
      }
    }
    ```

- After implementing the method, we need to decorate the class and give the pipe a name that we want to use in our templates:

    ```typescript
    @Pipe({name: 'pixel'}) // <- adding the decorator
    class PixelPipe {
      transform(input) {
        return input + 'px';
      }
    }
    ```

- As the last step we are going to export the class by putting the `export` keyword behind the class:

    ```typescript
    ...
    export class PixelPipe {
      ...
    }
    ```

Now, your file should look like the following:

```typescript
import {Pipe} from 'angular2/core';
@Pipe({name: 'pixel'}) // <- adding the decorator
export class PixelPipe {
  transform(input) {
    return input + 'px';
  }
}
```

Now, let's go back to the `main.ts` file and import our pipe:

```typescript
import {Component} from 'angular2/core';
import {bootstrap} from 'angular2/platform/browser';
import {PixelPipe} from './pixel.pipe'; // <- importing pipe
```

After importing our pipe, we should register it with our component by adding it to the `pipes` array:

```typescript
@Component({
  selector: 'app',
  templateUrl : 'templates/app.tpl.html',
  pipes: [PixelPipe] // <- registering the pipe
})
```

Now that we have registered the pipe, we can use it in our template in `templates/app.tpl.html`:

```html
<h1>{{ name }}</h1>
<p>Pixel value: {{ 25 | pixel }}</p>
```

You should be all set now. You can set the url in your `launch.json` file and hit F5:

```json
...
"url": "http://localhost:8080/project-files/angular-examples/basic-pipe/index.html",
...
```

If your server is running you should be able to see the following output:

![Running the pixelPipe in the browser](images/basic-pipe.png)

### Chaining Pipes

Let's continue where we left off with the "pixelPipe" and add another pipe called "round" that rounds down given values, that is:

```
25.3 | round | pixel -> 25px
```

The project files for this section are in [angular2-intro/project-files/angular-examples/pipes/pipe-chaining](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/pipes/pipe-chaining).

We are going to add the "roundPipe" to our "basic-pipe" project. Let's get started by adding the `round.pipe.ts` file in the root of the project:

```typescript
import {Pipe} from 'angular2/core';
@Pipe({name: 'round'})
export class RoundPipe {
  transform (input) {
    return Math.floor(+input); // <- convert input to number and then floor it.
  }
}
```

This Pipe is not complicated at all. We are just returning the floor of the input. We are also converting the input to number by putting a `+` before input.

Now, let's import the pipe into our `main.ts` file:

```typescript
import {Component} from 'angular2/core';
import {bootstrap} from 'angular2/platform/browser';
import {PixelPipe} from './pixel.pipe';
import {RoundPipe} from './round.pipe'; // <- importing `RoundPipe`
```

and then we have to add the pipe to the list of pipe array:

```typescript
@Component({
  selector: 'app',
  templateUrl : 'templates/app.tpl.html',
  pipes: [PixelPipe, RoundPipe] // <- registering the pipe
})
```

after that we are going to add the following to our `templates/app.tpl.html` file:

```html
<p>Pixel value: {{ 34.4 | round | pixel }}</p>
```

After running the app you should see `34.px` as the output on the page.

### Pipes with Parameters

In this section we are going to extend our 'pixel' pipe to accept an optional parameter to set the unit. As a result, we are going to rename the 'pixel' pipe to 'unit' to make it more generic. This pipe will take the unit as an optional argument. If no argument is passed, it will default to 'px'. That is:

```
25 | unit -> 25px
25 | unit:'em' -> 25em
34.5 | round | unit:'%' -> 34%
```

You can look at the project files in [angular2-intro/project-files/angular-examples/pipes/pipe-unit](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/pipes/pipe-unit).. AFter refactoring the name of the Pipe, we just need to change the implementation of the "UnitPipe":

**`unit.pipe.ts`**

```typescript
import {Pipe} from 'angular2/core';
@Pipe({name: 'unit'})
export class UnitPipe {
  transform(input, args:string) {
    const unit = args[0] || 'px';
    return input + unit;
  }
}
```

- On line 5, we are grabbing the first parameter that is passed in and setting it to the `unit` variable. And if the value is not set, we are setting 'px' as the default value.
- And finally we are returning `input + unit`.

That's basically all we have to do. Note that you can pass multiple parameters separated by `:` and they all become available in the `args` array. So if you wanted to expand this pipe, this is how your template would look like:

```html
{{ 25 | unit:'em':2}}
```

And the `args` array would be: `['em', 2]`.

### Async Pipes

Async Pipes can be used for values that will be resolved after some asynchronous operation like getting a value after making a http call.

**TODO**

### Built-in Pipes

In this section we are going to look at the pipes that Angular provides out of the box.

- [AsyncPipe](https://angular.io/docs/ts/latest/api/common/AsyncPipe-class.html): used to work with asynchronous values
- [CurrencyPipe](https://angular.io/docs/ts/latest/api/common/CurrencyPipe-class.html): used to format a number as a local currency
- [DatePipe](https://angular.io/docs/ts/latest/api/common/DatePipe-class.html): used to format a date object to a readable string
- [DecimalPipe](https://angular.io/docs/ts/latest/api/common/DecimalPipe-class.html): used to format numbers
- [JsonPipe](https://angular.io/docs/ts/latest/api/common/JsonPipe-class.html): calls `JSON.stringify` on the input and useful for debugging
- [LowerCasePipe](https://angular.io/docs/ts/latest/api/common/LowerCasePipe-class.html): used to convert a string to lowercase letters
- [PercentPipe](https://angular.io/docs/ts/latest/api/common/PercentPipe-class.html): used to format a number as percentage
- [SlicePipe](https://angular.io/docs/ts/latest/api/common/SlicePipe-class.html): used to create a subset of list or string
- [UpperCasePipe](https://angular.io/docs/ts/latest/api/common/UpperCasePipe-class.html): used to transform a text to upper case

#### Date

```html
{{ input | date:optionalFormat}}
```

- `input`: a date object or a number (milliseconds since UTC epoch)
- `optionalFormat`: a string used to format the output. It specifies which components of date and time to include in the output

**Using predefined formats**

Usage Example: `{{ input | date:'short'}}`

+--------------+---------------------------+
| Name         | Example                   |
+==============+===========================+
| `short`      | 9/3/2010, 12:05 PM        |
+--------------+---------------------------+
| `shortDate`  | 9/3/2010                  |
+--------------+---------------------------+
| `medium`     | Sep 3, 2010, 12:05:08 PM  |
+--------------+---------------------------+
| `mediumDate` | Sep 3, 2010               |
+--------------+---------------------------+
| `longDate`   | September 3, 2010         |
+--------------+---------------------------+
| `fullDate`   | Friday, September 3, 2010 |
+--------------+---------------------------+
| `shortTime`  | 12:05 PM                  |
+--------------+---------------------------+
| `mediumTime` | 12:05:08 PM               |
+--------------+---------------------------+

**Using Custom Formats**

- Generally speaking every date object has a year, month, day, hour, minute, and second.
- Using a custom string, you can specify which component you would like to include in the output.

+------+-----------------+-----+-------------+------------+--------+--------+
| Year | Month           | Day | Weekday     | Hour       | Minute | Second |
+======+=================+=====+=============+============+========+========+
| y    | M, MMM, MMMM    | d   | EEE, EEEE   | j, h, H    | m      | s      |
+------+-----------------+-----+-------------+------------+--------+--------+
| 2016 | 1, Jan, January | 1   | Sun, Sunday | 1, 1 AM, 1 | 1      | 1      |
+------+-----------------+-----+-------------+------------+--------+--------+


Note that every single letter identifier can be used twice to denote a double digit numeric value. For example, `yy` will result in `15` for the year value. Below is a table just to be thorough:

**Double Digit**

+------+-------+-----+----------------+--------+--------+
| Year | Month | Day | Hour           | Minute | Second |
+======+=======+=====+================+========+========+
| yy   | MM    | dd  | jj, hh, HH     | mm     | ss     |
+------+-------+-----+----------------+--------+--------+
| 16   | 01    | 01  | 01,  01 AM, 01 | 01     | 01     |
+------+-------+-----+----------------+--------+--------+

Details for Month/Weekday/Hour are summarized in the tables below:

**Month Details**

+-------+-----------+-----------+
| M     | MMM       | MMMM      |
+=======+===========+===========+
| Digit | Abbr Name | Full Name |
+-------+-----------+-----------+
| 1     | Jan       | January   |
+-------+-----------+-----------+


**Weekday Details**

+-----------+-----------+
| EEE       | EEEE      |
+===========+===========+
| Abbr Name | Full Name |
+-----------+-----------+
| Sun       | Sunday    |
+-----------+-----------+


**Hour Details**

+-------+--------------+----------+
| j     | h            | H        |
+=======+==============+==========+
| Digit | Hour12 AM/PM | Military |
+-------+--------------+----------+
| 13    | 1 PM         | 13       |
+-------+--------------+----------+

#### Slice

- The slice pipe is useful when you want a subset of a list or string. One of the common use cases are in when iterating over a list with `ngFor` for example.

**TODO**

#### Decimal

- Used for formatting numbers given a decimal formatter

**TODO**

#### Percent

**TODO**

#### Currency

**TODO**

#### Async

**TODO**

#### Json

**TODO**

#### LowerCase

**TODO**

#### UpperCase

**TODO**

## Dependency Injection

Dependency Injection is a coding pattern in which a class receives its dependencies from external sources rather than creating them itself. In order to achieve Dependency Injection we need a Dependency InjectionFramework to handle the dependencies for us. Using a DI framework, you simply ask for a class from the injector instead of worrying about the dependencies inside the class itself.

Angular has a standalone module that handles Dependency Injection. This framework can also be used in non-Angular applications to handle Dependency Injection.


**TODO**

## Services and Providers

- A service is nothing more than a class in Angular 2. It remains nothing more than a class until we register it with the Angular injector.
- When you bootstrap your app, Angular creates an injector on the fly that can inject services and other dependencies throughout the app.
- You can register the service or the dependencies during when bootstrapping the app or when defining a component.
- If you have a class called `MyService`, you can register it with the Injector and then you can inject it everywhere:

    ```typescript
    bootstrap(App, [MyService]); // second param is an array of providers
    ```
- Providers is a way to specify what services are available inside the component in a hierarchical fashion.
- A provider can be a class, a value or a factory.
- Providers create the instances of the things that we ask the injector to inject.
- `[SomeService];` is short for `[provide(SomeService, {useClass:SomeService})];` where the first param is the token, and the second is the definition object.
- A simple object can be passed to the Injector to create a Value Provider:

    ```typescript
    beforeEachProviders(() => {
      let someService = { getData: () => [] };
      // using `useValue` instead of `useClass`
      return [ provide(SomeSvc, {useValue: someService}) ];
    });
    ```
- You can also use a factory as a provider.
- You can use a factory function that creates a properly configured Service:

    ```typescript
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

- Defining object dependencies is simple. You can make a plain JavaScript object available for injection using a string-based token and the `@Inject` decorator:

    ```typescript
    var myObj = {};

    bootstrap(AppComponent, [
      provide('coolObjToken', {useValue: myObj})
    ]);

    // and you can inject it to a component

    import {Inject} from 'angular2/core'
    constructor(dx: DepX, @Inject('coolObjToken') config)
    ```

### Simple Service

In this section we are going to make a simple service and use it in our root component.

**Project Files**

The project files for this section are in [angular2-intro/project-files/angular-examples/services/simple-service](https://github.com/st32lth/angular2-intro/tree/master/project-files/angular-examples/services/simple-service);

**Getting Started**

Let's get started by creating a class, called `StudentSvc` that represents our service:

```typescript
class StudentSvc {
  private students: any[];
  constructor() {
    this.students = [
      {name: 'Tom', id: 1},
      {name: 'John', id: 2},
      {name: 'Kim', id: 3},
      {name: 'Liz', id: 4}
    ];
  }
  getAll() {
    return this.students;
  }
}
```

There is nothing special about this class. It's just a class the has a method to return the list of all students. Now, we are going to make it special by decorating it with the `Injectable` decorator. But, first we need to import `Injectable` from Angular:

```typescript
import {Injectable} from 'angular2/core';
```

After importing the `Injectable` metadata class, we can decorate our class:

```typescript
/**
 * Student service
 */
@Injectable() // <- decorating with `Injectable`
class StudentSvc {
  private students: any[];
  constructor() {
   // ...
  }
  // ...
}
```

Now we have an injectable class and the injector would know how to create an instance of it when we need to inject it. And that's what we are going to do next. We are going to add `StudentSvc` in the list of `viewProviders` of the root component:

```typescript
@Component({
  selector: 'app',
  templateUrl : 'templates/app.tpl.html',
  viewProviders: [StudentSvc] // <- registering the service
})
```

The last thing we need to do is to inject the service in the constructor of our root component:

```typescript
class Root  {
  private name: string;
  private students: any[];
  constructor (studentSvc: StudentSvc) { // <- injecting the service
    this.name = 'Simple Service Demo';
    this.students = studentSvc.getAll(); // <- calling the `getAll` method
  }
}
```

- In the constructor, we are defining a variable to be of type `StudentSvc`. By doing that the injector will create an instance from the `StudentSvc` to be used

- And on line 6 we are calling the `getAll` method from the service to get a list of all students.

Finally, we can verify that the `getAll` method is actually called by printing the students in the template:

**`app.tpl.html`**

```html
<h1>{{ name }}</h1>

<ul>
  <li *ngFor="#student of students">Name: {{ student.name }}, id: {{ student.id }}</li>
</ul>
```

and it would output:

```
Name: Tom, id: 1
Name: John, id: 2
Name: Kim, id: 3
Name: Liz, id: 4
```

## Data and State Management

- Angular is flexible and doesn't prescribe a recipe for managing data in your apps
- Since observables are integrated into Angular, you can take advantage of observables to manage data and state
- You ca use services to manage streams that emit models
- Components can subscribe to the streams maintained by services and render accordingly.
    - For example, you can have a service for a Todo app that contains a stream of todos and a `ListComponent` can listen for todos and render when a new task is added.
    - You may have another component that listens for the user that has been assigned to a task provided by a service.
- The steps for creating different parts of an app can be summarized in three steps:
    - Defining a Model using a class
    - Defining the service
    - Defining the component

## Observables

- Angular embraces observables using the RxJS library.
- Observables emit events and observers observe observables.
- An observer *subscribes* to events emitted from an observable.
- RxJS has an object called *subject* that can be used both as an observer or an observable. *Subject* can be imported from `RxJS` very easily:

    ```typescript
    import {Subject} from 'rxjs/Subject';
    ```
- A subscription can be canceled by calling the `unsubscribe` method.

**TODO**

## Metadata Classes

- Angular uses Metadata to decorate classes, methods and properties.
- The most notable Metadata is the `@component` Metadata.
- Metadta classes are very convenient and they make it easy to work with components, services and the dependency injection system

Below is a list of Angular's core Metadata classes categorized under directives/components, pipes and di.

**Directive/component Meta-data**

- [Component](https://angular.io/docs/ts/latest/api/core/ComponentMetadata-class.html): used to define a component

    - [View](https://angular.io/docs/ts/latest/api/core/ViewMetadata-class.html): used to define the template for a component
    - [ViewChild](https://angular.io/docs/ts/latest/api/core/ViewChildMetadata-class.html): used to configure a view query
    - [ViewChildren](https://angular.io/docs/ts/latest/api/core/ViewChildrenMetadata-class.html): used to configure a view query

- [Directive](https://angular.io/docs/ts/latest/api/core/DirectiveMetadata-class.html): used to define a directive

    - [Attribute](https://angular.io/docs/ts/latest/api/core/AttributeMetadata-class.html)  used to grab the value of an attribute on an element hosting a directive
    - [ContentChild](https://angular.io/docs/ts/latest/api/core/ContentChildMetadata-class.html): used to configure a content query
    - [ContentChildren](https://angular.io/docs/ts/latest/api/core/ContentChildrenMetadata-class.html): used to configure a content query
    - [Input](https://angular.io/docs/ts/latest/api/core/InputMetadata-class.html): used to define the input to a directive/component
    - [Output](https://angular.io/docs/ts/latest/api/core/OutputMetadata-class.html): used to define the output events of a directive/component
    - [HostBinding](https://angular.io/docs/ts/latest/api/core/HostBindingMetadata-class.html): used to declare a host property binding
    - [HostListener](https://angular.io/docs/ts/latest/api/core/HostListenerMetadata-class.html): used to declare a host listener

**Pipes**

  - [Pipe](https://angular.io/docs/ts/latest/api/core/PipeMetadata-class.html): used to declare reusable pipe function

**DI**

  - [Inject](https://angular.io/docs/ts/latest/api/core/InjectMetadata-class.html): parameter metadata that specifies a dependency.
  - [Injectable](https://angular.io/docs/ts/latest/api/core/InjectableMetadata-class.html): a marker metadata that marks a class as available to Injector for creation.
  - [Host](https://angular.io/docs/ts/latest/api/core/HostMetadata-class.html): Specifies that an injector should retrieve a dependency from any injector until reaching the closest host.
  - [Optional](https://angular.io/docs/ts/latest/api/core/OptionalMetadata-class.html): parameter metadata that marks a dependency as optional
  - [Self](https://angular.io/docs/ts/latest/api/core/SelfMetadata-class.html): Specifies that an Injector should retrieve a dependency only from itself.
  - [SkipSelf](https://angular.io/docs/ts/latest/api/core/SkipSelfMetadata-class.html): Specifies that the dependency resolution should start from the parent injector.
  - [Query](https://angular.io/docs/ts/latest/api/core/QueryMetadata-class.html): Declares an injectable parameter to be a live list of directives or variable bindings from the content children of a directive.
  - [ViewQuery](https://angular.io/docs/ts/latest/api/core/ViewQueryMetadata-class.html): Similar to `QueryMetadata`, but querying the component view, instead of the content children.

**TODO**

## Angular Router

Angular has a stand-alone module responsible for handling routing.

**TODO**

