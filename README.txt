CASIO fx-8000G — US ENGLISH EDITION

Extract the entire FX-8000G-en-US.zip before starting.
Keep the launchers and FX-8000G.html in the same folder.

WINDOWS
Double-click Start-Windows.exe.
The launcher uses .NET Framework 4, included with Windows 10 and 11,
and opens the HTML in the application associated with .html files.
If that application is an editor, right-click FX-8000G.html, choose
Open with, and set a web browser as the default application.

LINUX
Run Start-Linux.sh from your file manager, or open a terminal
in this folder and enter:
    sh ./Start-Linux.sh
The launcher uses xdg-open or gio in a graphical desktop environment.
To run it directly, if necessary:
    chmod +x ./Start-Linux.sh
    ./Start-Linux.sh

macOS
Double-click Start-Mac.command.
If extraction did not preserve executable permissions, open a terminal
in this folder and enter:
    chmod +x ./Start-Mac.command
    ./Start-Mac.command

GETTING STARTED
The emulator opens in your browser and works offline.
You do not need Node.js, Python, an Internet connection, or a server.
You can also open FX-8000G.html directly in a web browser.
Close the browser tab to exit.
Use Save state to move a session between computers or browsers,
or before moving the emulator folder. Autosave depends on the browser;
if it is unavailable, the interface will ask you to use Save state.

Click Send to calculator, then Run P0 to try the default program.
The sum from 1 to 10 is 55. The Library contains 21 examples,
including 3D Maze under Games. The Guide explains modes and shortcuts.
Programs are inserted with calculator new lines between instructions.
Explicit colons in your code still join instructions on the same line.
Use a period for decimal values. Do not enter thousands separators
in calculator expressions. Saved times use US English formatting.

SAVED SESSIONS
Use Save state to export a session and Restore state to load it again.
Imported program text and calculator memory are kept exactly as saved.
To install the maze, copy 3D Maze from the Library and send it to the
calculator. The maze displays EXIT and uses 408 bytes of program memory.
See programs/3D-Maze.txt for controls and programs/maze-3d.fxp for code.

BUILDING FROM SOURCE
From the project root (the parent of en-US), with Node.js and Python 3:
    node tools/build.cjs
    python tools/package.py
The first command builds en-US/FX-8000G.html and the English maze file.
On Windows, the second compiles Start-Windows.exe and creates
FX-8000G-en-US.zip, preserving Linux/macOS executable permissions.
On other systems, an existing Windows launcher is required to package.
The emulator and build tools support US English only.

Page text is in src/shell.html, interface behavior in src/ui.js,
and the program library in src/library.json. CPU and keyboard logic
are in src/core.js and src/input.js. Styling is in src/style.css.
The Windows launcher source is tools/windows-launcher.cs.

VALIDATION (development dependency: .qa/node_modules/jsdom)
    node tests/integration.cjs
    node tests/maze.cjs
    node tests/ui.cjs
    node tests/game-ui.cjs

EXPERIMENTAL IMPLEMENTATION
Timing is approximate. The FA-80 interface, printer, and cassette are
not implemented. Not all functions have been verified against hardware.
Technical foundation: Piotr Piatek's research and v13 emulator.
ROMs remain the property of their respective owners. Inclusion does
not grant redistribution rights. This project is not affiliated with Casio.
