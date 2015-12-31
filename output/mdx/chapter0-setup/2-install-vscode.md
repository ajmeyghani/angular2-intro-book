# Visual Studio Code

- Install Visual Studio Code from: [https://code.visualstudio.com/](https://code.visualstudio.com/)

- You can open new projects by going to the `File > Open` tag, to etierh open a folder containing your project or a single file

- Some useful keyboard shortcuts are:

    - `command + b`: to close/open the file navigator
    - `command + shift + p`: to open the prompt

- To install extensions open the prompt with `command + shift + p` and type:

    - `> install extension`

- Open the shortcuts settings from `Preferences > Keyboard Shortcuts`, and then you can add your own shortcuts:

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
