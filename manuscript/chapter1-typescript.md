# TypeScript Crash-course

In this chapter we will quickly go through the most important concepts in TypeScript so that you can have a better understanding of Angular code that you will write. Knowing TypeScript definitely helps to understand Angular, but again it is not a requirement. The project files for this chapter are in [**`angular2-intro/project-files/typescript`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript).

## TypeScript Basics

- TypeScript is a superset of JavaScript with additional features, among which optional types is the most notable. This means that any valid JavaScript code (ES 2015/2016...) is valid TypeScript code. You can basically change the extension of the file to `.ts` and compile it with the the TypeScript compiler.

- TypeScript defines 7 primary types:

    - boolean: `var isDone: boolean = false;`
    - number: `var height: number = 6;`
    - string: `var name: string = "bob";`
    - array: `var list:number[] = [1, 2, 3];` also `var list:Array<number> = [1, 2, 3];`
    - enum: `enum Color {Red, Green, Blue};`
    - any: `var notSure: any = 4;`
    - void: `function hello(): void { console.log('hello'); }`

## Interface

- An Interface is defined using the `interface` keyword
- Interfaces are used only during compilation time to check types
- By convention, interface definitions start with an `I`, e.g. : `IPoint`
- Interfaces are used in classical object oriented programming as a design tool
- Interfaces don't contain implementations
- They provide definitions only
- When an object implements an interface, it must adhere to the contract defined by the interface
- An interface defines what properties and methods an object must implement
- If an object implements an interface, it must adhere to the contract. If it doesn't the compiler will let us know.
- Interfaces also define custom types

### Basic Interface

Below is an example of an Interface that defines two properties and three methods that implementers should provide implementations for:

```typescript
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

Using the interface above we can create an object that adheres to the interface:

```typescript
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

Notice that we had to provide values to **all** the properties defined by the Interface, and the implementations for **all** the methods defined by the Interface.

And then of course you can use your object methods to perform operations:

```typescript
let sum = myObj.sum([1,2,3,4,5]); // -> 15
```

### Classes as Interfaces

Because classes define types as well, they can also be used as interfaces. If you have an interface you can extend it with a class for example:

```typescript
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

First we are defining a class called `Point` that defines two fields. Then we define an interface called `Point3d` that extends the `Point` by adding a third field.
An then we create a point of type `point3d` and assign a value to it. We read the value and it outputs `1`.

## Classes

- Classes are heavily used in classical object oriented programming
- It defines what an object is and what it can do
- A class is defined using the `class` keyword followed by a name
- By convention, the name of the class start with an uppercase letter
- A class can be used to create multiple objects (instances) of the same class
- An object is created from a class using the `new` keyword
- A class can have a `constructor` which is called when an object is made from the class
- Properties of a class are called instance variables and its functions are called the class methods
- Access modifiers can be used to make them public or private
- The instance variables are attached to the instance itself but not the prototype
- Methods however are attached to the prototype object as opposed to the instance itself
- Classes can inherit functionality from other classes, but you should [favor composition over inheritance](https://medium.com/javascript-scene/the-two-pillars-of-javascript-ee6f3281e7f3#.oc5pdevwh) or make sure you know [when to use it](https://medium.com/@dtinth/es6-class-classical-inheritance-20f4726f4c4#.xdif2m42e)
- Classes can implement interfaces

Let's make a class definition for a car and incrementally add more things to it. The project files for this section are in [**`angular2-intro/project-files/typescript/classes/basic-class`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/classes/basic-class).

### Adding an Instance Variable

The `Car` class definition can be very simple and can define only a single instance variable that all cars can have:

```typescript
class Car {
  distance: number;
}
```

- `Car` is the name of the class, which also defines the custom type `Car`
- `distance` is a property that tracks the distance that car has traveled
- Distance is of type `number` and only accepts `number` type.

Now that we have the definition for a car, we can create a car from the definition:

```typescript
let myCar:Car = new Car();
myCar.distance = 0;
```

- `myCar:Car` means that `myCar` is of type `Car`
- `new Car()` creates an instance from the `Car` definition.
- `myCar.distance = 0` sets the initial value of the `distance` to 0 for the newly created `car`

### Adding a Method

So far our car doesn't have any definitions for any actions. Let's define a `move` method that all the cars can have:

```typescript
class Car {
  distance: number;
  move():void {
    this.distance += 1;
  }
}
```

- `move():void` means that `move` is a method that does not return any value, hence `void`.
- The body of the method is defined in `{ }`
- `this` refers to the instance, therefore `this.distance` points to the `distance` property defined on the car instance.
- Now you can call the `move` method on the car instance to increment the `distance` value by 1:

```typescript
myCar.move();
console.log(myCar.distance) // -> 1
```

### Using Access Modifiers

If you wanted to tell the compiler that the `distance` variable is private and can only be used by the object itself, you can use the `private` modifier before the name of the property:

```typescript
class Car {
  private distance: number;
  constructor () {
    ...
  }
  ...
}
```

- There are 3 main access modifiers in TypeScript: `private`, `public`, and `protected`:

- `private` modifier means that the property or the method is only defined inside the class only.
- `protected` modifier means that the property or the method is only accessible inside the class and the classes derived from the class.
- `public` is the default modifier which means the property or the method is the accessible everywhere and can be accessed by anyone.

### Adding a constructor

A `constructor` is a special method that gets called when an instance is created from a class. A class may contain at most one constructor declaration. If a class contains no constructor declaration, an automatic constructor is provided.

Let's add a constructor to the `Car` class that initializes the `distance` value to 0. This means that all the cars that are crated from this class, will have their `distance` set to 0 automatically:

```typescript
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

- `constructor()` is called automatically when a new car is created
- Parameters are passed to the constructor in the `()`
- The body of the constructor is defined in the `{ }`

Now, let's customize the car's constructor to accept `distance` as a parameter:

```typescript
class Car {
  private distance: number;
  constructor (distance) {
    this.distance = distance;
  }
}
```

- On line 3 we are passing distance as a parameter. This means that when a new instance is created, a value should be passed in to set the distance of the car.
- On line 4 we are assigning the value of distance to the value that is passed in

This pattern is so common that TypeScript has a shorthand for it:

```typescript
class Car {
  constructor (private distance) {
  }
}
```

Note that the only thing that we had to do was to add `private distance` in the constructor parameter and remove the `this.distance` and `distance: number`. TypeScript will automatically generate that. Below is the JavaScript outputed by TypeScript:

```javascript
var Car = (function () {
  function Car(distance) {
    this.distance = distance;
  }
  return Car;
})();
```

Now that our car expects a `distance` we have to always supply a value for the distance when creating a car. You can define default values if you want so that the car is instantiated with a default value for the distance if none is given:

```typescript
class Car {
  constructor (private distance = 0) {
  }
  getDistance():number { return this.distance; }
}
```

Now if I forget to pass a value for the `distance`, it is going to be set to zero by default:

```typescript
const mycar = new Car();
console.log(mycar.getDistance()); //-> 0
```

Note that if you pass a value, it will override the default value:

```typescript
const mycar = new Car(5);
console.log(mycar.getDistance()); //-> 5
```

### Setters and Getters (Accessors)

It is a very common pattern to have setters and getters for properties of a class. TypeScript provides a very simple syntax to achieve that. Let's take our example above and add a setter and getter for the distance property. But before that we are going to rename `distance` to `_distance` to make it explicit that it is private. It is not required but it is a common pattern to prefix private properties with an underscore.

```typescript
class Car {
  constructor (private _distance = 0) {}
  getDistance():number { return this._distance; }
}
```

In order to create the getter method, we are going to use the `get` keyword and the name for the property followed by `()`:

```typescript
class Car {
  constructor (private _distance = 0) {}
  get distance() { return this._distance; }
}
```

Now we can get the value of `distance`:

```typescript
const car2 = new Car(5);
console.log(car2.distance) //-> 5
```

Note on line 2 that we didn't call a function. Behind the scenes, TypeScript creates a property for us, that's why it is not a method. Below is the relevant generated JavaScript:

```javascript
Object.defineProperty(Car.prototype, "distance", {
  get: function () { return this._distance; },
  enumerable: true,
  configurable: true
});
```

JavaScript behind the scenes calls the get function for you to get the value, and that's why we simply did `car2.distance` as opposed to `car2.distance()`. For more information about `Object.defineProperty` checkout the [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty) docs.

Similar to the getter, we can define a setter as well:

```typescript
class Car {
  constructor (private _distance = 0) {}
  get distance() { return this._distance; }
  set distance(newDistance: number) { this._distance = newDistance; }
}
```

Now we can both get and set the distance value:

```typescript
const coolCar = new Car();
console.log(coolCar.distance); // -> 0

coolCar.distance = 55;
console.log(coolCar.distance); // -> 55
```

Note that if we take out the setter, we won't be able to assign a new value to `distance`.

### Static Methods and Properties

Static methods and properties belong to the class but not the instances. For example, the `Array.isArray` method is only accessible through the `Array` but not an instance of an array:

```javascript
var x = [];
x.isArray // -> undefined
Array.isArray(x) //-> true
```

- On line 2 we are trying to access the `isArray` method, but obviously it is not defined because `isArray` is a static method.
- On line three we are calling the static `isArray` method from `Array` and we can check if `x` is an array.

If you look at the [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray) documentation you can see that methods and properties are either defined on the `Array.prototype` or `Array`:

- `Array.prototype.x`: makes `x` available to all the instances of `Array`
- `Array.x`: `x` is static and only available through `Array`.

Now that we have some context, let's see how you can define static methods and properties in TypeScript. Consider the code below:

```typescript
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

- On line 2 we are defining a static property called `controls` using the `static` modifier. Then we specify the form and then assign a value for it.
- On line 5 we are defining a static method called `isAuto` using the the `static` modifier. This method simply returns the value of `isAuto` from the static `control` object. Not that we get access to the class using the name of the class as opposed to using `this`. i.e. `return Car.controls.isAuto`

### Implementing an Interface

Classes can implement one or multiple interfaces. We can make the `Car` class implement two interfaces:

```typescript
interface ICarProps {
  distance: number;
}
interface ICarMethods {
  move():void;
}
```

Making the `Car` class implement the interfaces:

```typescript
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

The above example is silly, but it shows the point that a class can implement one or more interfaces. Now if the class does not provide implementations for any of the interfaces, the compiler will complain. For example, if we leave out the `distance` instance variable, the compiler will print out the following error:

>error TS2420: Class 'Car' incorrectly implements interface 'ICarProps'.
  Property 'distance' is missing in type 'Car'.

### Inheritance

In Object-oriented programming, a class can inherit from another class which helps to define shared attributes and methods among objects. Although this pattern is very useful, it should be used cautiously as it can lead to code that is hard to maintain. You can learn more about classical inheritance and prototypical inheritance by watching Eric Elliot's [talk](https://www.youtube.com/watch?v=lKCCZTUx0sI) at O'Reilly's Fluent Conference. The project files for this section are in [**`angular2-intro/project-files/typescript/classes/inheritance`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/classes/inheritance).

Let's get started by creating a base class called `Vehicle`. This class is going to be the base class for other classes that we create later.

```typescript
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

There is nothing special in this class. We are just creating a class that has two private properties (name, distance) and we are creating the setters and getters for them. Additionally, we are defining the `toString` method that JavaScript internally calls in "textual contexts". The constructor is the most notable of all the other methods:

- It sets the `name` property to "Vehicle" for all the instances
- It also sets the `distance` property to 0.

This means that when a class extends the `Vehicle` class, it will have to call the constructor of `Vehicle` using the `super` keyword. Let's do that now by creating two classes called `Car` and `Truck` that inherit from the `Vehicle` class:

**`cars.ts`**

```typescript
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

- The `Car` class and the `Truck` class both look almost identical. They both inherit from the `Vehicle` using the `extends` keyword.
- They both call the `Vehicle`'s constructor in their own constructor method before implementing their own:
    `constructor(name?: string) { super(); }`
- They both take an optional `name` property to set the name of the vehicle. If not name is provided, it will be set to either 'Car' or 'Truck'

Now let's create the `main` file and run the file:

```typescript
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

- On line 1 we are importing the `Car` and the `Truck` class.
- and then we create a `Car` and `Truck` instance and log their names and distance to the console.

Run the build task (command + shift + b) and run the file (F5) and you should see the output:

```
node --debug-brk=7394 --nolazy output/main.js
Debugger listening on port 7394
Car
7
Truck
```

You can play around with the code above an try passing a string when instantiating a `Car` or a `Truck` to see the name change.

**TODO**

- `constructor overloading`

### Class Decorators

There are different types of decorators in TypeScript. In this section we are going to focus on Class Decorators.

**TODO**

`add content`

## Modules

- In TypeScript you can use modules to organize your code, avoid polluting the global space, and expose functionalities for others to use.
- Multiple modules can be defined in the same file. However, it makes more sense to keep on module per file
- If you want, you can split a single module across multiple files
- If you decide to split a module across different files, this is how you would do it:
    - Create the module file: `mymodule.ts` and declare your module there: `module MyModule {}`
    - Create another file: `mymodule.ext1.ts` and on top of the file add: `/// <reference path="mymodule.ts" />`. Then in the file, you can use the same name of the module and add more stuff to it: `module MyModule { // other stuff... }`
    - Then in your main file, you need two things on top of the file:
        - `/// <reference path="mymodule.ts" />`
        - `/// <reference path="mymodule.ext1.ts" />`
    - Then, you can use the name of your module to refer to the symbols defined: `MyModule.something`, `MyModule.somethingElse`
- TypeScript has two system: one used internally and the other used externally
- External modules are used if your app uses CommonJS or AMD modules. Otherwise, you can use TypeScript's internal module system
- Using TypeScript's internal module system, you can:
    - use the `module` keyword to define a module: `module MyModule { ... }`
    - split modules into different files that contribute to a single module
    - use the `/// <reference path="File.ts" />` tag to tell the compiler how files are related to each other when modules are split across files
- Using TypeScript's external module system:
    - you cannot use the `module` keyword. The `module` keyword is used only by the internal module system.
    - instead of the `reference` tag, you can use the `import` keyword to define the relationship between modules
    - you can import symbols using the file name: `import mymodule = require('mymodule')`

The project files for this chapter are in [**`angular2-intro/project-files/typescript/modules`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules).

### Simple Module

Let's create a simple module that contains two classes. The first class is a vehicle class and the second is a car class that inherits from the vehicle class. Then we are going to expose the car class to the outside world and import it from another file. The project files for this section are in [**`angular2-intro/project-files/typescript/modules/basic-module`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules/basic-module).

First, create the `main.ts` file and copy paste the following:

**`main.ts`**

```typescript
module MyModule {
  class Vehicle {
    constructor (public name: string = 'Vehicle', private _distance: number = 0) {}
    get distance():number { return this._distance; }
    set distance(newDistance: number) { this._distance = newDistance; }
    move() { this.distance += 1 }
  }
}
```

- On line 1 we are defining the module called `MyModule`.
- Inside this module we have defined a class called `Vehicle` that has a distance property and a setter and getter.

Now we want to create a class and export it so that it can be imported by others:

**`main.ts`**

```typescript
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

- On line 9 we are using the `export` keyword to indicate that the `Car` class is exposed and can be used by others.

Now, let's create a car using the `Car` class defined in the `MyModule` module:

```typescript
const mycar = new MyModule.Car('My Car');
console.log(mycar.name);
```

Note that we accessed the `Car` class using the `MyModule` symbol: `MyModule.Car`. Now we can split up the module into its own file and import it into the main file. Let's create a file called `MyModule.ts` and move the module definition to that file. Now in our main file we are just going to import the module and use the car class from it.

**`main.ts`**

```typescript
/// <reference path="MyModule.ts" />
const mycar = new MyModule.Car('My Car');
console.log(mycar.name);
```

Note that we can create an alias to the `MyModule` using `import AliasName = MyModule`. Now you can reference the module name with `AliasName`:

```typescript
/// <reference path="MyModule.ts" />
import AliasName = MyModule;
const mycar = new AliasName.Car('My Car');
console.log(mycar.name);
```


Now if we run this in debug mode, the compiler will complain that it can't find the `MyModule` reference. Because of that we need to make some changes to our config files. First, we are going to add the `out` property in the `tsconfig.json` file. This will tell the compiler to compile all the files into a single file:

```
"out": "output/run.js",
```

So our `tsconfig.json` file will look like this:

```
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
```

Now if you run the build, you should see that all the project has been compiled into `output/run.js`. In addition to the `tsconfig.json` file, we are going to update the `launch.json` file and add a new configuration field:

```
{
  "name": "TS All Debugger",
  "type": "node",
  "program": "output/run.js",
  "stopOnEntry": false,
  "sourceMaps": true
}
```

Now we should be able to use the debugger and put breakpoints in our TypeScript files. Select `TS All Debugger` from the debugger dropdown and run the debugger and it should stop if you put a breakpoint in any of your TypeScript files.

**NOTE** Using the configuration files above we can compile all the TypeScript files into a single JavaScript file. But sometimes that is not what you want. Be aware that using the above configuration you will not get an output for each TypeScript file.

### Splitting Internal Modules

Internal modules in TypeScript are open ended. This means that you can define a module with the same name in different files and keep adding to it. This is also known as merging. In this section we are going to demonstrate merging multiple files that contribute to a single module called `Merged`. The project files for this section are in [**`angular2-intro/project-files/typescript/modules/merged-module`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules/merged-module).

First, we are going to make two files: `A.ts` and `B.ts`. In each file we are going to define the `Merged` module:

```typescript
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

```typescript
// B.ts
module Merged {
  const name = 'File B'; // not exported
  export class Car {
    constructor(public distance = 0) {}
    move () {this.distance += 1;}
  }
}
```

We just created two files called `A.ts` and `B.ts` and each file we defined the `Merged` module and added a class to each and exported it. Now we are going to make the `main.ts` file and reference these two files:

```typescript
// main.ts
/// <reference path="./A.ts" />
/// <reference path="./B.ts" />
```

And now we can use the classes defined in the `Merged` module, that is the `Car` and the `Door` class:

```typescript
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

if you run the build task (command + shift + b) and hit F5 you should see the following output:

```
node --debug-brk=19237 --nolazy output/run.js
Debugger listening on port 19237
2
blue
```

### External Modules

In addition to TypeScript's internal module system, you can use external modules as well. In this section we are going to demonstrate how you can use external modules in TypeScript. The project files for this section are in [**`angular2-intro/project-files/typescript/modules/external-module`**](https://github.com/st32lth/angular2-intro/tree/master/project-files/typescript/modules/external-module).

Let's say I have a JavaScript Node module defined in CommonJS format in a file called `common.js`:

```javascript
// common.js
module.exports = function () {
  this.name = 'CommonJS Module';
};
```

In order to import this we need to do two things: first, we need to install Node's Type Definitions. Then we need to require the module. To install Node's Type Definitions run the following the terminal in the root of your project:

```
tsd install node --save
```

Now you should see a folder called `typings` containing the type definitions. Now that we have Node's type definitions, let's add a reference to it on top of `main.ts`:

```typescript
// main.ts
/// <reference path="./typings/node/node.d.ts" />
```

and then we are going to require the module and log it to the console:

```typescript
// main.ts
/// <reference path="./typings/node/node.d.ts" />
const common = require('./common');
console.log(common()); // --> CommonJS Module
```

After running the build task ( command + shift + b ), and running the file (F+5) you should see the following output:

```
node --debug-brk=32221 --nolazy run.js 
Debugger listening on port 32221
CommonJS Modules
```

**Note** the configuration files that we are using:

**`tsconfig.json`**

```
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
```

**`launch.json`**

```
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
```

## Decorators

- Decorators can be used to add additional properties and methods to existing objects.
- Decorators are a declarative way to add metadata to code.
- There are four decorators: ClassDecorator, PropertyDecorator, MethodDecorator, ParameterDecorator
- TypeScript supports decorators and does not know about Angular's specific annotations.
- Angular provides annotations that are made with decorators behind the scenes

### Method Decorators

Goals:
- make a method decorator called `log`.
- Decorate `someMethod` in a class using `@log`

```typescript
class SomeClass {
  @log
  someMethod(n: number) {
    return n * 2;
  }
}
```

In the usage, `someMethod` has been decorated with `log` using the `@` symbol. `@log` is decorating `someMethod` because it is placed right before the method.

- Decorator Implementation:

```typescript
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

- `target`: the method being decorated.
- `key`: the name of the method being decorated.
- `value`: a property descriptor of the given property if it exists on the object, undefined otherwise. The property descriptor is obtained by invoking the `Object.getOwnPropertyDescriptor` function.

**TODO**

- Add decorator content for each type.

