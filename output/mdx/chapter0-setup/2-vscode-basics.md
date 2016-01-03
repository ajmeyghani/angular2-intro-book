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

