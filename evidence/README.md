# evidence/

Store screenshots in `screenshots/` and any raw terminal output captures in `terminal-output/`.

## Required Screenshots

| Filename | When to capture | What it proves |
|---|---|---|
| `01-user-created.png` | After `useradd` + `id student01` | `student01` account exists |
| `02-sudo-group-added.png` | After `usermod -aG sudo` + `groups student01` | User added to sudo group |
| `03-whoami-confirmation.png` | After `su - student01` + `whoami` | Logged in as `student01` |
| `04-ls-la-docs-before-hidden-file.png` | After `ls -la` in `docs`, before hidden file | Baseline directory listing shown |
| `05-hidden-file-created.png` | After creating `.secret.txt` + `ls -la` | Hidden file exists |
| `06-report-txt-two-lines.png` | After editing with nano + `cat report.txt` | File has both required lines |
| `07-secret-moved-renamed.png` | After `mv` to `bin/classified.txt` + `ls -la` on both dirs | File moved and renamed correctly |
| `08-install-sh-executable.png` | After `chmod a+x install.sh` + `ls -la` | Script is executable by all |
| `09-classified-permissions.png` | After `chmod o-r classified.txt` + `ls -la` | Others' read permission removed |
| `10-admin-notes-owner-only.png` | After `chmod 600 admin_notes.txt` + `ls -la` | Owner-only read/write set |
| `11-backup-directory-contents.png` | After copying `docs` and `scripts` into `backup` + `ls -la` | Backup contains expected files |
| `12-tree-project-final.png` | After `tree project` | Final directory structure |
| `13-final-ls-la-verification.png` | After final `ls -la` across all subdirectories | Final permissions/locations confirmed |
| `14-commands-used-txt.png` *(optional/bonus)* | After `history > commands_used.txt` | Bonus step completed |

## Terminal Output
If your instructor also wants raw text logs (not just screenshots), save the corresponding terminal output as `.txt` files in `terminal-output/`, named to match the screenshot they support (e.g. `08-install-sh-executable.txt`).

Do not fabricate screenshots or output — capture them as you actually perform each step.
