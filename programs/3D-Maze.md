# 3D Maze · Casio fx-8000G

**Three movement keys. Two dead ends. One way out.**

Explore a maze from a first-person view on the calculator’s 96 × 64 pixel LCD. Find the **X** marking the exit, then step into it to finish. The fixed map is 7 × 7 cells, including its outer walls, and the game uses just **408 bytes** of calculator program memory.

[Back to Pocket Lab](../README.md) · [Read the program](maze-3d.fxp)

## Load the game

1. Open [FX-8000G.html](../FX-8000G.html) locally in your browser, or use a launcher from the repository root.
2. Go to **Library → Games → 3D Maze · 408 bytes** and click **Copy to editor**.
3. Choose a destination, such as **P0**. Leave **Replace the selected program** checked to install the complete game in that slot.
4. Click **Send to calculator**. Watch the lines appear on the LCD as the emulator enters each keystroke, pausing between lines.
5. Wait for the transfer to finish. The code stays visible in **WRT** mode; **loading does not start the game automatically**.
6. Follow the highlighted calculator keys, or click **Run P0** (Run for your chosen slot). Wait for **Ready** below the calculator before making your first move.

**Show run guide** is on by default. For P0, it walks you through **MODE → 1 → Prog → 0 → EXE**, highlighting the next key as you go. AC is not needed after loading. If you choose another slot, the guide uses that program number. Uncheck **Show run guide** beside the transfer options to hide the hints; your choice is saved with the session.

To load the file from the repository instead, click **Open text** and select [programs/maze-3d.fxp](maze-3d.fxp), then continue from step 3. Both routes load the same game.

The transfer is deliberately slow enough to follow. **Speed 4×** makes the game draw faster after you run it; it does not accelerate program entry. You can use **Stop transfer** to cancel loading and **Undo transfer** to restore the previous calculator state.

## Find your way out

**Direct controls** are enabled by default. When the status says **Ready**, use:

| Key | Action |
| --- | --- |
| **4** | Turn left 90 degrees. |
| **6** | Turn right 90 degrees. |
| **8** | Move forward one cell. |
| **Esc / AC** | Stop the game. |

Press only the movement digit; **EXE is not needed with Direct controls enabled**. You can use your computer keyboard, the calculator’s number keys, or the three movement buttons below the calculator. The arrow keys and **7** are not movement commands.

After each move, wait for the corridor to finish drawing and **Ready** to return. Movement buttons are disabled while drawing. A wall blocks forward movement, so trying to walk into one leaves you in the same place.

Running the game moves keyboard focus to the LCD. If you click into the program editor, click the LCD again before using the movement keys.

The **X** marks the exit. Move into that cell to display **EXIT**. Click **Run** again to return to the entrance with the original position and direction.

## Use the original input sequence

For manual input, uncheck **Direct controls**. With the corridor visible and drawing complete:

1. Press **EXE** to leave the graphical pause.
2. Enter **4**, **6**, or **8** at the input prompt.
3. Press **EXE** again to make the move.

On your computer keyboard, **Enter** means EXE. For example, turning left is **Enter → 4 → Enter**. Wait for the next view before repeating the sequence.

Direct controls send this same EXE → digit → EXE sequence for you.

## Save a game or share a view

Use **Save state** to export a session containing your calculator memory, display, editor, and control settings. **Restore state** loads that session so you can continue from the saved position. Browser autosave is also available when the browser permits it; an exported state file lets you move between computers or browsers.

**Save .fxp** saves the program text. To keep your current position, use **Save state**. **Save screen** exports a PNG of the LCD.

## If you get stuck

- **The code is visible, but the game has not started.** Wait for the transfer to finish, then click **Run** for the slot where you installed it.
- **The movement keys do nothing.** Wait for **Ready**, click the LCD, and check that **Direct controls** is enabled.
- **The screen is taking time to redraw.** Choose **Speed 4×** and wait for the next corridor before moving.
- **Moving forward leaves the view unchanged.** There may be a wall directly ahead. Try turning left or right.
- **An older session has no direct movement controls.** Send the original maze program again with **Replace the selected program** checked, then run it. Sessions created before direct controls were introduced need this step.

## Map and solution

Prefer to explore first? Keep the following section closed.

<details>
<summary>Reveal the map and a route to the exit</summary>

Start a new run, then enter this sequence:

```text
8, 8, 4, 8, 8, 8, 8, 6, 8, 8
```

With **Direct controls** enabled, press each digit when the game is ready. In manual mode, enter each digit between two EXE presses.

The route is: forward twice, turn left, forward four times, turn right, then forward twice.

```text
#######
#S#...#
#.#.###
#.....#
#.###.#
#...#E#
#######
```

`S` is the entrance, `E` is the exit, `#` is a wall, and `.` is a walkable cell. You begin at `S`, facing down the map. The exit appears as **X** in the first-person view.

</details>

## How it fits in 408 bytes

The map packs each walkable cell into one bit of `M=6210175645`. For zero-based grid coordinates `(x, y)`, the bit index is `7*y+x-8`: the entrance is index `0`, and the exit is index `32`. Subtracting eight keeps the bitmap within the calculator’s ten-digit input limit.

The expression `Frac(Int(M/2^N)/2)` tests a cell. `Plot` and `Line` draw up to three levels of depth. `Graph Y=0` lies outside the viewing range, and the following display-pause command holds the graphical view before the program requests another move. The perspective updates one turn at a time.

The memory footprint was measured in the emulated ROM’s **WRT** mode:

| Measurement | Bytes |
| --- | ---: |
| Free before installation | 1,446 |
| Free after installation | 1,038 |
| Program memory used | **408** |

The `.fxp` file stores readable source text, so its file size differs from the program’s footprint in calculator memory.

The game uses variables **A, B, C, D, K, M, P, R, S, and T**, as well as graph coordinates, and changes the **Range** settings. It needs no variables beyond the standard memories.

Validated in the emulated fx-8000G; not tested on physical hardware or with fx-7000G firmware. See the [main README](../README.md) for the emulator’s technical background, credits, and limitations.
