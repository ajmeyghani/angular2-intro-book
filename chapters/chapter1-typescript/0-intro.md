# TypeScript Crash-course

## Installing TypeScript

You can install the TypeScript compiler with node:

```bash
npm i typescript -g
```

Then to verify that it is installed, run `tsc -v` to see the version of the compiler. You will get an output like this:

```
message TS6029: Version 1.7.5
```

In addition to the compiler, we also need to install the TypeScript Definition manager for DefinitelyTyped (tsd). You can install tsd with:

```bash
npm i tsd -g
```

Using TSD, you can search and install TypeScript definition files directly from the community driven DefinitelyTyped repository. To verify that tsd is installed, run tsd with the `version` flag:

```bash
tsd --version
```

You should get an output like this:

```
>> tsd 0.6.5
```

After `tsd` and `tsc` are installed, we can compile a hello world program:

- make a file called `hello.ts` on your desktop:

    ```bash
    touch ~/Desktop/hello.ts
    ```

- Then, put some TypeScript code in the file:

    ```bash
    echo "const adder = (a: number, b: number): number => a + b;" > ~/Desktop/hello.ts
    ```

- Then you can compile the file to JavaScript:

    ```bash
    tsc ~/Desktop/hello.ts
    ```

- It should output a file in `Desktop/hello.js`:

    ```javascript
    var adder = function (a, b) { return a + b; };
    ```

Now that your TypeScript compiler setup, we can move on to configuring Visual Studio Code.
