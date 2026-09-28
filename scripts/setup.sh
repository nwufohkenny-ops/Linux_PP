#!/bin/bash
# =====================================================================
# setup.sh — Automates the safe, non-interactive parts of Task 02
# Run this AS student01, after Phase 1 (user creation) is done manually.
# Does NOT: create the user, set the password, edit report.txt in nano,
# or create/populate the backup directory (do those steps yourself).
# =====================================================================

set -e  # stop on first error

echo "==> Creating project directory structure..."
mkdir -p ~/project/docs ~/project/scripts ~/project/bin

echo "==> Creating report.txt in docs..."
echo "This is the initial report by student01." > ~/project/docs/report.txt

echo "==> Creating hidden .secret.txt in docs..."
echo "Top Secret" > ~/project/docs/.secret.txt

echo "==> NOTE: Edit report.txt manually with 'nano ~/project/docs/report.txt'"
echo "    and add the line: Appended line using nano."
echo "    Press Enter once you've done this to continue..."
read -r _

echo "==> Copying report.txt to scripts..."
cp ~/project/docs/report.txt ~/project/scripts/report.txt

echo "==> Moving and renaming .secret.txt to bin/classified.txt..."
mv ~/project/docs/.secret.txt ~/project/bin/classified.txt

echo "==> Creating install.sh in scripts..."
cat > ~/project/scripts/install.sh << 'EOF'
#!/bin/bash
echo "Installing project dependencies..."
EOF

echo "==> Setting permissions..."
chmod a+x ~/project/scripts/install.sh
chmod o-r ~/project/bin/classified.txt

echo "==> Creating and restricting admin_notes.txt..."
touch ~/project/docs/admin_notes.txt
chmod 600 ~/project/docs/admin_notes.txt

echo "==> admin_notes.txt permissions set. Capture your screenshot now if needed."
echo "    Press Enter to delete admin_notes.txt and continue..."
read -r _

rm ~/project/docs/admin_notes.txt

echo "==> Setup complete."
echo "    Remaining manual steps: create ~/project/backup and copy docs/ and scripts/ into it"
echo "    (see commands/commands.sh, Phase 5.2-5.3), then run verify.sh."
