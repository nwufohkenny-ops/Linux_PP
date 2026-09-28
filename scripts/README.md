# scripts/

Two helper scripts are provided. **Both must be run as `student01`, after Phase 1 (user creation/switch) is done manually.**

## `setup.sh`
Automates the safe, non-interactive parts of Phases 2–4: creating the `project` directory tree, `report.txt`, the hidden file, `install.sh`, and applying all the `chmod` changes. It also creates and immediately removes `admin_notes.txt` after setting its permissions, matching Phase 5.1 — but it does **not** perform the `nano` edit (Step 3.1) or the backup copy (Phase 5.2–5.3), since those are called out separately below.

It deliberately does **not**:
- Create the user or set the password (Phase 1) — must be done manually with `sudo`.
- Edit `report.txt` in `nano` — must be done manually so you actually practice using the editor.
- Create the `backup` directory or copy files into it — run those two lines yourself from `commands/commands.sh` (Phase 5.2–5.3) so you can verify each result before moving on.

Usage:
```bash
chmod +x setup.sh
./setup.sh
```

## `verify.sh`
Runs the final verification checks (Phase 6): confirms the directory tree exists, prints `ls -la` output for every relevant folder, and reports pass/fail for each expected permission setting.

Usage:
```bash
chmod +x verify.sh
./verify.sh
```
