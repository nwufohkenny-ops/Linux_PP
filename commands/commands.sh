#!/bin/bash
# =====================================================================
# REFERENCE COMMAND LIST — Linux Task 02: File Management & Permissions
# Do NOT run this file end-to-end. Some steps are interactive/manual
# and are clearly marked below. Run each block yourself, in order.
# =====================================================================

# ---------------------------------------------------------------------
# PHASE 1: User creation (run as root / with sudo)
# ---------------------------------------------------------------------

# Create the new user with a home directory
sudo useradd -m student01

# MANUAL / INTERACTIVE — set the password (you will be prompted)
sudo passwd student01

# Add student01 to the sudo group (if required by your environment)
sudo usermod -aG sudo student01

# Switch to the new user (loads student01's environment)
su - student01

# Confirm you are now student01
whoami

# ---------------------------------------------------------------------
# PHASE 2: Directory & file management (run as student01)
# ---------------------------------------------------------------------

cd ~

# Create project structure in one step
mkdir -p project/docs project/scripts project/bin

# Create report.txt with initial content
cd ~/project/docs
echo "This is the initial report by student01." > report.txt

# View hidden files and permissions
ls -la

# Create hidden file with secret content
echo "Top Secret" > .secret.txt

# ---------------------------------------------------------------------
# PHASE 3: Edit and move files (run as student01)
# ---------------------------------------------------------------------

# MANUAL / INTERACTIVE — opens nano; add the line "Appended line using nano."
# then save with Ctrl+O, Enter, and exit with Ctrl+X
nano ~/project/docs/report.txt

# Copy report.txt into scripts
cp ~/project/docs/report.txt ~/project/scripts/report.txt

# Move and rename the hidden file into bin
mv ~/project/docs/.secret.txt ~/project/bin/classified.txt

# Create install.sh with required content
cat > ~/project/scripts/install.sh << 'EOF'
#!/bin/bash
echo "Installing project dependencies..."
EOF

# ---------------------------------------------------------------------
# PHASE 4: Permissions with chmod (run as student01)
# ---------------------------------------------------------------------

# Make install.sh executable by all (owner, group, others)
chmod a+x ~/project/scripts/install.sh

# Remove read permission for "others" on classified.txt
chmod o-r ~/project/bin/classified.txt

# Create admin_notes.txt and restrict to owner read/write only
touch ~/project/docs/admin_notes.txt
chmod 600 ~/project/docs/admin_notes.txt

# ---------------------------------------------------------------------
# PHASE 5: Clean-up and final touches (run as student01)
# ---------------------------------------------------------------------

# Remove admin_notes.txt now that the permission demo is done
rm ~/project/docs/admin_notes.txt

# Create backup directory
mkdir ~/project/backup

# Copy contents (not the folders themselves) of docs and scripts into backup
cp -r ~/project/docs/. ~/project/backup/
cp -r ~/project/scripts/. ~/project/backup/

# ---------------------------------------------------------------------
# PHASE 6: Final verification (run as student01)
# ---------------------------------------------------------------------

cd ~

# Install tree only if it isn't already available
sudo apt install tree

# Show the final project tree
tree project

# Confirm permissions and file locations across all subdirectories
ls -la project/docs project/scripts project/bin project/backup

# ---------------------------------------------------------------------
# PHASE 7: Bonus — command history (optional, run as student01)
# ---------------------------------------------------------------------

history
history > ~/commands_used.txt
