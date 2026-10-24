# fx-8000G · Pocket Lab

**A programmable Casio calculator, a library of experiments, and a tiny 3D maze — in one browser tab.**

Explore the Casio fx-8000G through an experimental emulator with a US English interface. Write a program, watch its lines appear on the calculator, then run it when you are ready. Try a loop, plot a curve, or find your way through a maze on a 96 × 64 pixel display.

The emulator is a single HTML file that works offline. Everything needed to launch it is in the repository root; no build step, package installation, or local server is required.

## Start here

Clone the [FX-8000G-EN repository](https://github.com/luiscunhacsc/FX-8000G-EN):

```sh
git clone https://github.com/luiscunhacsc/FX-8000G-EN.git
cd FX-8000G-EN
```

Open **[FX-8000G.html](FX-8000G.html)** locally in your web browser. You can also use the launcher for your operating system:

| Platform | Launch from the repository folder |
| --- | --- |
| Windows | Double-click `Start-Windows.exe`. |
| macOS | Double-click `Start-Mac.command`. |
| Linux | Run `sh ./Start-Linux.sh` in a terminal. |

Keep the launchers beside `FX-8000G.html`. The Windows launcher uses .NET Framework 4; the Linux launcher uses `xdg-open` or `gio` in a graphical desktop environment. Opening the HTML file directly is also an option on every platform.

If macOS needs executable permission for the launcher, run:

```sh
chmod +x ./Start-Mac.command
./Start-Mac.command
```

Close the browser tab to exit. Use **Save state** first if you want a portable copy of your session.

## Your first program

On a fresh session, the editor contains **Sum from 1 to 10**:

```text
0->A
10->B
Lbl 0
A+B->A
Dsz B
Goto 0
A
```

1. Leave the destination set to **P0** and click **Send to calculator**.
2. Watch the code arrive on the LCD, one keystroke at a time, with pauses between lines.
3. Wait for the transfer to finish. The calculator stays in **WRT** mode with the program visible.
4. Click **Run P0**. The result is **55**.

If a previous session was restored, find this example under **Library → Loops** and click **Copy to editor** first.

**Loading a program does not run it automatically.** This applies to library examples, imported program files, and your own code. You choose when to click **Run**.

**Show run guide** is enabled by default. After a transfer, it shows **MODE → 1 → Prog → program number → EXE** and highlights the next calculator key. Click each highlighted key to run the program yourself, or use the **Run** button to send the sequence. For P0, the program number is **0**; for P3, it is **3**. AC is not needed after entering a program in WRT mode; this follows the [owner’s manual, page 95](https://archive.org/details/casio-fx-8000g-owners-manual/page/n104/mode/1up).

Uncheck **Show run guide** beside the transfer options to hide the instructions and key highlights. Your preference and any unfinished guide are saved with the session.

Try changing `10->B` to `100->B`, send the revised program, and run it again. The result becomes `5050`.

## What you can explore

The built-in **Library** contains 21 examples, each with an explanation, an expected result, and an exercise:

| Topic | Examples |
| --- | --- |
| Getting started | Order of operations, storing variables, factorials |
| Science | Circle area, trigonometry, logarithms, temperature conversion, compound interest |
| Loops | Sums, Fibonacci numbers, Newton’s square root method |
| Conditions | Comparing values and branching |
| Interaction | Keyboard input and results displayed in stages |
| Graphs | A parabola, a sine wave, and a straight line |
| Games | A first-person 3D maze |

Search by title, command, or topic, or use the category filter. Choose **Copy to editor**, then **Send to calculator**. After the transfer finishes, click **Run** for the selected slot.

For a quick calculation, enter `sqrt(3^2+4^2)` in **Quick calculation** and click **EXE**. The result is `5`.

## Load, edit, and save programs

Use **Open text** to import a program such as [programs/maze-3d.fxp](programs/maze-3d.fxp). An `.fxp` file is plain program text. Opening it updates the editor; **Send to calculator** transfers it into calculator memory.

Choose a destination from **P0–P9**. With **Replace the selected program** checked, sending clears that slot before entering the new code. **Stop transfer** cancels an unfinished transfer, and **Undo transfer** restores the calculator state from before it began.

Transfers are deliberately paced so you can follow the code on the LCD. Longer programs take more time. The **Speed** selector changes emulation speed while the calculator runs; program-entry pacing stays the same.

The editor supports Casio commands such as `Lbl`, `Goto`, `Isz`, `Dsz`, `Range`, `Plot`, and `Graph Y=`. A few useful conventions:

| Syntax | Meaning |
| --- | --- |
| `12->A` | Store 12 in variable A. |
| `?->A` | Ask for a value and store it in A. |
| `2+2◢` or `2+2#` | Display a result and wait for EXE. |
| `A>B=>Goto 1` | Jump to label 1 when A is greater than B. |
| `(-)5` | Enter negative five. |
| `pi`, `sqrt`, `sin`, `log` | Enter the corresponding calculator functions. |

Use a period for decimals and omit thousands separators. Source lines become calculator new lines; explicit colons join instructions on the same line. Follow the command capitalization used in the examples. The in-app **Guide** includes more syntax and mode details.

## Play the 3D maze

A fixed 7 × 7 map, two dead ends, and an exit marked **X**, using **408 bytes** of calculator program memory.

1. Open **Library → Games → 3D Maze · 408 bytes** and choose **Copy to editor**, or use **Open text** to import `programs/maze-3d.fxp`.
2. Click **Send to calculator** and watch the program load.
3. When the transfer finishes, click **Run P0**, or Run for your selected slot.
4. Wait for **Ready** below the calculator before each move.

| Key | Move |
| --- | --- |
| **4** | Turn left. |
| **6** | Turn right. |
| **8** | Move forward. |
| **Esc / AC** | Stop the game. |

**Direct controls** are enabled by default: press just the movement digit, without EXE. You can use your keyboard, the calculator keys, or the movement buttons below the calculator. Choose **Speed 4×** for faster drawing.

To use the original input sequence, uncheck **Direct controls** and enter **EXE → movement digit → EXE**. Move into the exit to display `EXIT`; click **Run** again to restart.

The [maze guide](programs/3D-Maze.md) includes full controls, implementation notes, a map, and a solution. The [program file](programs/maze-3d.fxp) is ready to read or modify.

## Keyboard reference

Click the calculator display before using these shortcuts. When the editor or another text field has focus, your keys edit that field.

| Computer key | Calculator action |
| --- | --- |
| Enter | EXE: evaluate, confirm input, or continue after a display pause |
| Esc | AC: clear or stop; cancel an active transfer |
| Home | SHIFT |
| End | ALPHA |
| F2 | MODE |
| Arrow keys | Move the calculator cursor |
| Backspace / Delete | DEL |
| A–Z | Enter a letter using ALPHA automatically |

When `?` appears, enter a value and press **EXE**. When **– Disp –** appears, press **EXE** to continue. The maze uses **4 / 6 / 8** for movement.

## Keep your work

| Control | What it saves or restores |
| --- | --- |
| **Save .fxp** | The program text currently in the editor |
| **Open text** | A program text file into the editor |
| **Save state** | A JSON session containing calculator memory, display, editor text, and settings |
| **Restore state** | A previously exported session |
| **Save screen** | A PNG image of the LCD |

The emulator also tries to autosave in your browser. Storage availability depends on the browser and how the file is opened. Use **Save state** before switching browsers or computers, moving the emulator folder, or clearing browser data. If autosave is unavailable, the interface tells you to save a state file.

## Repository layout

```text
FX-8000G-EN/
├── FX-8000G.html       # Complete offline emulator and built-in library
├── README.md          # This guide
├── Start-Windows.exe  # Windows launcher
├── Start-Mac.command  # macOS launcher
├── Start-Linux.sh     # Linux launcher
└── programs/
    ├── maze-3d.fxp    # Importable maze program
    └── 3D-Maze.md     # Controls, map, solution, and implementation notes
```

The HTML contains the interface, styling, emulator code, firmware data, and example library. This repository provides the standalone application directly. Changes to the application can be made in `FX-8000G.html`; the `programs/` folder holds readable program files and their documentation.

## If something does not work

- **The launcher opens an editor.** Open `FX-8000G.html` with a web browser, or change the default application associated with `.html` files.
- **The launcher cannot find the emulator.** Keep the launcher and `FX-8000G.html` together in the repository root.
- **The program is loaded but has not started.** That is expected: click **Run** after the transfer completes.
- **The calculator is waiting.** Look for `?` or **– Disp –** and respond with input or EXE. In the maze, wait for **Ready** before moving.
- **Keyboard controls seem inactive.** Click the LCD to move focus away from the editor. In the maze, use **4 / 6 / 8**.
- **Your session is not being retained.** Use **Save state** and **Restore state** to keep a portable copy.

## Technical background and credits

The emulator uses vanilla JavaScript to model the NEC μPD1007 / NM320 CPU, 8 KiB of RAM, and an HD44352 LCD controller. Calculations and programs execute through the emulated ROM firmware, and editor transfers enter code through the calculator’s keyboard.

The technical foundation is [Piotr Piatek’s research and v13 emulator](https://www.pisi.com.pl/piotr433/fx8000ee.htm). The workspace design draws on the [TI-74 emulator project](https://github.com/luiscunhacsc/TI-74-Emulator-Publishable). The in-app Guide also links to the [fx-8000G manual](https://www.manualslib.com/manual/777250/Casio-Fx-8000g.html).

This is an experimental implementation: timing is approximate, the FA-80 interface, printer, and cassette are not implemented, and not all functions have been verified against physical hardware.

ROMs remain the property of their respective owners; their inclusion does not grant redistribution rights. This independent project is not affiliated with Casio.
