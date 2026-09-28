# Task Overview: Linux Command Line Practical Task

Source: uploaded lab document, "Linux Command Line Practical Task."

## Objective
Demonstrate understanding of basic Linux commands by completing the task **as a newly created user (`student01`)** in Kali Linux.

## STEP 1 — Create and Switch to a New User
1. Open the terminal.
2. Create a new user called `student01`.
3. Set a password for the user.
4. Add the user to the sudo group (if required).
5. Switch to the new user using `su` or `login`.
6. Confirm login as `student01` by running `whoami`.

## STEP 2 — Directory & File Management
1. Inside `student01`'s home directory, create a directory named `project`, and inside it, subdirectories `docs`, `scripts`, `bin`.
2. Navigate to `docs` and create `report.txt` via `echo` with content: `This is the initial report by student01.`
3. Use `ls -la` to view hidden files and directories.
4. Create a hidden file in `docs` named `.secret.txt` with the text `Top Secret`.

## STEP 3 — Edit and Move Files
1. Open `report.txt` with `nano` and add a second line: `Appended line using nano.`
2. Copy `report.txt` to the `scripts` directory.
3. Move `.secret.txt` to the `bin` directory and rename it to `classified.txt`.
4. Create a new file in `scripts` named `install.sh` containing:
   ```bash
   #!/bin/bash
   echo "Installing project dependencies..."
   ```

## STEP 4 — Permissions with chmod
1. In `scripts`: make `install.sh` executable by all users.
2. In `bin`: remove read permission for others from `classified.txt`.
3. In `docs`: create `admin_notes.txt`; set permissions so only the owner can read and write it.

## STEP 5 — Clean-Up and Final Touches
1. Delete `admin_notes.txt`.
2. Create a directory inside `project` called `backup`.
3. Copy the entire content of `docs` and `scripts` into `backup`.

## Final Checks
1. Navigate back to the home directory.
2. Run `tree project` (install `tree` first if needed: `sudo apt install tree`).
3. Use `ls -la` to confirm correct permissions and file locations.

## Bonus (Optional)
1. Use `history` to list all commands run so far.
2. Redirect the history output to `commands_used.txt` in the home directory using `>`.
