# Workflow: Linux Task 02 — File Management & Permissions

This workflow breaks the practical into phases matching the uploaded task. Each step lists: what to do, the command, expected result, verification, and evidence to capture. Commands are marked by which user must run them.

---

## Phase 1 — User Creation (run as root / with sudo)

### 1.1 Create the user `student01`
**Command (root/sudo):**
```bash
sudo useradd -m student01
```
**Purpose:** Creates a new user account named `student01` with a home directory (`-m`).
**Expected result:** No output on success.
**Verify:** `id student01` should show the new UID/GID.
**Evidence:** `01-user-created.png` — terminal showing the command and the `id student01` output.

### 1.2 Set a password
**Command (root/sudo):**
```bash
sudo passwd student01
```
**Purpose:** Sets/updates the login password for `student01`. This is interactive — you will be prompted to type and confirm the password.
**Expected result:** `passwd: password updated successfully`
**Note:** This step **cannot** be safely scripted — run it manually.

### 1.3 Add user to the sudo group (if required)
**Command (root/sudo):**
```bash
sudo usermod -aG sudo student01
```
**Purpose:** Grants `student01` administrative privileges via the `sudo` group.
**Verify:** `groups student01` should list `sudo`.
**Evidence:** `02-sudo-group-added.png`.

### 1.4 Switch to the new user
**Command (root/sudo shell):**
```bash
su - student01
```
**Purpose:** Switches the current shell session to `student01`, loading their environment (`-`).
**Expected result:** Shell prompt changes to reflect `student01`.

### 1.5 Confirm identity
**Command (as student01):**
```bash
whoami
```
**Expected result:** `student01`
**Evidence:** `03-whoami-confirmation.png`.

---

## Phase 2 — Directory & File Management (run as student01)

### 2.1 Create the project directory tree
```bash
cd ~
mkdir -p project/docs project/scripts project/bin
```
**Purpose:** Creates `project` with `docs`, `scripts`, and `bin` subdirectories in one step (`-p` creates parents as needed).
**Verify:** `ls -R project` should list all three subdirectories.

### 2.2 Create `report.txt` in `docs`
```bash
cd ~/project/docs
echo "This is the initial report by student01." > report.txt
```
**Purpose:** Creates `report.txt` with the required initial content using `echo` and output redirection.
**Verify:** `cat report.txt`

### 2.3 View hidden files
```bash
ls -la
```
**Purpose:** Lists all entries in the current directory, including hidden files (those starting with `.`) and permission/ownership details.
**Evidence:** `04-ls-la-docs-before-hidden-file.png`.

### 2.4 Create a hidden file
```bash
echo "Top Secret" > .secret.txt
```
**Purpose:** Creates a hidden file (`.secret.txt`) in `docs` — hidden simply because its name starts with a dot.
**Verify:** `ls -la` should now list `.secret.txt`.
**Evidence:** `05-hidden-file-created.png`.

---

## Phase 3 — Editing and Moving Files (run as student01)

### 3.1 Edit `report.txt` with nano
```bash
nano ~/project/docs/report.txt
```
**Purpose:** Opens `report.txt` in the nano text editor to append a second line.
**Action inside nano:** Move to the end of the file and add:
```
Appended line using nano.
```
Then save with `Ctrl+O`, Enter, and exit with `Ctrl+X`.
**Verify:** `cat ~/project/docs/report.txt` should show both lines.
**Evidence:** `06-report-txt-two-lines.png`.

### 3.2 Copy `report.txt` to `scripts`
```bash
cp ~/project/docs/report.txt ~/project/scripts/report.txt
```
**Purpose:** Duplicates the file into `scripts` while leaving the original in `docs`.
**Verify:** `ls ~/project/scripts`

### 3.3 Move and rename `.secret.txt`
```bash
mv ~/project/docs/.secret.txt ~/project/bin/classified.txt
```
**Purpose:** Moves the hidden file into `bin` and renames it to `classified.txt` in the same command (Linux `mv` handles move + rename together).
**Verify:** `ls -la ~/project/bin` should show `classified.txt`; `ls -la ~/project/docs` should no longer show `.secret.txt`.
**Evidence:** `07-secret-moved-renamed.png`.

### 3.4 Create `install.sh` in `scripts`
```bash
cat > ~/project/scripts/install.sh << 'EOF'
#!/bin/bash
echo "Installing project dependencies..."
EOF
```
**Purpose:** Creates the `install.sh` script with the required shebang and echo line.
**Verify:** `cat ~/project/scripts/install.sh`

---

## Phase 4 — Permissions with chmod (run as student01)

### 4.1 Make `install.sh` executable by all users
```bash
chmod a+x ~/project/scripts/install.sh
```
**Purpose:** Adds execute permission for owner, group, and others (`a+x` = all).
**Verify:** `ls -la ~/project/scripts/install.sh` — permission string should include `x` for all three groups (e.g. `-rwxr-xr-x`).
**Evidence:** `08-install-sh-executable.png`.

### 4.2 Remove read permission for others on `classified.txt`
```bash
chmod o-r ~/project/bin/classified.txt
```
**Purpose:** Removes the read bit from the "others" permission class, restricting who can read the file.
**Verify:** `ls -la ~/project/bin/classified.txt` — the last permission triplet should no longer show `r` (e.g. `-rw-r-----`).
**Evidence:** `09-classified-permissions.png`.

### 4.3 Create and restrict `admin_notes.txt`
```bash
touch ~/project/docs/admin_notes.txt
chmod 600 ~/project/docs/admin_notes.txt
```
**Purpose:** `touch` creates an empty file; `chmod 600` sets permissions to `rw-------` — read/write for the owner only, nothing for group or others.
**Verify:** `ls -la ~/project/docs/admin_notes.txt` should show `-rw-------`.
**Evidence:** `10-admin-notes-owner-only.png`.

---

## Phase 5 — Clean-Up and Final Touches (run as student01)

### 5.1 Delete `admin_notes.txt`
```bash
rm ~/project/docs/admin_notes.txt
```
**Purpose:** Removes the file now that its permission restriction has been demonstrated.
**Verify:** `ls ~/project/docs` should no longer list `admin_notes.txt`.

### 5.2 Create the `backup` directory
```bash
mkdir ~/project/backup
```
**Purpose:** Creates the destination directory for the backup copy.

### 5.3 Copy contents of `docs` and `scripts` into `backup`
```bash
cp -r ~/project/docs/. ~/project/backup/
cp -r ~/project/scripts/. ~/project/backup/
```
**Purpose:** Recursively copies (`-r`) all contents of both source directories into `backup`. The trailing `/.` copies the contents rather than the folder itself.
**Verify:** `ls -la ~/project/backup` should contain `report.txt` and `install.sh` (and anything else remaining in `docs`/`scripts`).
**Evidence:** `11-backup-directory-contents.png`.

---

## Phase 6 — Final Verification (run as student01)

### 6.1 Return to home directory
```bash
cd ~
```

### 6.2 Install tree if missing, then run it
```bash
sudo apt install tree   # only if not already installed
tree project
```
**Purpose:** Displays the full `project` directory tree for a visual structure check.
**Evidence:** `12-tree-project-final.png`.

### 6.3 Final permissions and location check
```bash
ls -la project/docs project/scripts project/bin project/backup
```
**Purpose:** Confirms final file locations and permission bits across all subdirectories in one pass.
**Evidence:** `13-final-ls-la-verification.png`.

---

## Phase 7 — Bonus: Command History (optional, run as student01)

### 7.1 List command history
```bash
history
```

### 7.2 Redirect history to a file
```bash
history > ~/commands_used.txt
```
**Purpose:** Saves the full session's command history to `commands_used.txt` in the home directory for record-keeping.
**Evidence:** `14-commands-used-txt.png` (optional).

---

## Important Notes
- Steps 1.2 (`passwd`) and 3.1 (`nano`) are interactive and cannot be safely automated in a single script — they are called out separately in `commands/commands.sh`.
- All commands from Phase 2 onward assume you are logged in **as `student01`**, not root — this matters for the permission/ownership checks to be meaningful.
- Do not skip the `ls -la` verification steps — they are the actual evidence that a chmod change worked, not just that the command ran without error.
