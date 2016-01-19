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

