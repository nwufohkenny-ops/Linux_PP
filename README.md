# Linux Task 02 — File Management & Permissions Practical

## Project Description
This repository documents the workflow for a Linux command-line practical task performed as a newly created user (`student01`) in Kali Linux. It covers user creation, directory/file management, file editing, moving/copying/renaming files, and permission management with `chmod`.

## Objective
Demonstrate understanding of basic Linux commands by completing the task **as a newly created user (`student01`)** in Kali Linux.

## Lab/Activity Requirements
- Create a new user `student01`, set a password, add to sudo group (if required)
- Switch to `student01` and confirm identity with `whoami`
- Create a `project` directory with `docs`, `scripts`, `bin` subdirectories
- Create `report.txt` in `docs` using `echo`
- View hidden files with `ls -la`
- Create a hidden file `.secret.txt` in `docs`
- Edit `report.txt` with `nano`, adding a second line
- Copy `report.txt` to `scripts`
- Move and rename `.secret.txt` to `bin/classified.txt`
- Create `install.sh` in `scripts` with a bash script body
- Make `install.sh` executable by all users
- Remove read permission for others from `classified.txt`
- Create `admin_notes.txt` in `docs`, restrict to owner read/write only
- Delete `admin_notes.txt`
- Create a `backup` directory inside `project`
- Copy the entire contents of `docs` and `scripts` into `backup`
- Run `tree project` for final structure verification
- Confirm final permissions and file locations with `ls -la`
- Bonus: use `history` and redirect output to `commands_used.txt`

## Technologies / Tools Used
- Kali Linux
- Bash / Linux command line
- Core utilities: `useradd`, `passwd`, `usermod`, `su`, `mkdir`, `echo`, `nano`, `cp`, `mv`, `chmod`, `rm`, `tree`, `history`

## Prerequisites
- A working Kali Linux system (VM or bare metal) with terminal access
- `sudo`/root access to create a new user
- `tree` package (installed during the task if missing: `sudo apt install tree`)

## Environment / Setup Information
- Performed as user: **student01** (created during Step 1)
- Working directory: `student01`'s home directory (`~`, i.e. `/home/student01`)
- All Step 2 onward commands are run **as `student01`**, not root, unless noted otherwise

## Project Structure
```
linux-task-02-file-management-permissions/
│
├── README.md
├── .gitignore
│
├── docs/
│   ├── README.md
│   └── task-overview.md
│
├── workflow/
│   ├── README.md
│   └── workflow.md
│
├── commands/
│   ├── README.md
│   └── commands.sh
│
├── scripts/
│   ├── README.md
│   ├── setup.sh
│   └── verify.sh
│
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   └── terminal-output/
│
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

## Step-by-Step Workflow
See [`workflow/workflow.md`](workflow/workflow.md) for the full phase-by-phase procedure with commands, expected results, verification steps, and evidence to capture.

## Commands Used
See [`commands/commands.sh`](commands/commands.sh) for the ordered, commented command reference. **Do not run this file blindly end-to-end** — it includes an interactive `passwd` step and a `nano` editing step that require manual interaction (see comments in the file).

## Expected Results
- `student01` exists and owns a `project` directory tree containing `docs`, `scripts`, `bin`, and `backup`
- `report.txt` exists in `docs` (and a copy in `scripts`) with two lines of content
- `classified.txt` exists in `bin` with others' read permission removed
- `install.sh` in `scripts` is executable by all (`755` or `777` depending on how "executable by all" is applied — see workflow notes)
- `admin_notes.txt` was created, restricted to owner-only read/write, then deleted
- `backup` contains copies of everything originally in `docs` and `scripts`
- `tree project` and `ls -la` confirm the final structure and permissions

## Evidence Requirements
See [`evidence/README.md`](evidence/README.md) for the full list of required screenshots and what each one must show.

## Submission Requirements
See [`submission/README.md`](submission/README.md). Submission includes command history and final verification output — **you must generate these yourself while performing the lab**; placeholders are provided.

## Troubleshooting
| Issue | Likely Cause | Fix |
|---|---|---|
| `tree: command not found` | `tree` not installed | `sudo apt install tree` |
| `Permission denied` creating user or using `usermod` | Not run as root/sudo | Prefix with `sudo` |
| `chmod` change doesn't seem to apply | Wrong path or wrong file targeted | Re-check `pwd` and use `ls -la` to confirm current permissions before and after |
| `nano` not saving | Forgot `Ctrl+O` (write out) then `Ctrl+X` (exit) | Save with `Ctrl+O`, Enter, then exit with `Ctrl+X` |
| `su - student01` still shows old user in some shells | Session not fully switched | Run `whoami` to confirm; open a new terminal if needed |

## Safety / Permission Notes
- Creating users and modifying group membership (`sudo` group) requires root privileges — only use `sudo` for those specific steps.
- Once switched to `student01`, all file/directory work in Steps 2–5 should be performed as that user, not as root, to correctly reflect ownership in permission checks.
- `classified.txt` and `admin_notes.txt` simulate sensitive files — the permission changes are the actual learning objective, so don't skip verifying them with `ls -la` before and after.
