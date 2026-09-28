#!/bin/bash
# =====================================================================
# verify.sh — Final verification checks for Task 02
# Run this AS student01 after completing all phases.
# =====================================================================

echo "===== Directory structure ====="
if command -v tree >/dev/null 2>&1; then
    tree ~/project
else
    echo "'tree' not installed — run: sudo apt install tree"
    find ~/project
fi

echo
echo "===== Permission checks ====="

check_perm() {
    local path="$1"
    local expected_desc="$2"
    if [ -e "$path" ]; then
        echo "$path -> $(ls -ld "$path" | awk '{print $1}')  (expected: $expected_desc)"
    else
        echo "$path -> NOT FOUND"
    fi
}

check_perm ~/project/scripts/install.sh "executable by all, e.g. -rwxr-xr-x"
check_perm ~/project/bin/classified.txt "no read for others, e.g. -rw-r-----"
check_perm ~/project/docs "docs directory should no longer contain admin_notes.txt"

echo
echo "===== File locations ====="
ls -la ~/project/docs ~/project/scripts ~/project/bin ~/project/backup 2>/dev/null

echo
echo "===== admin_notes.txt should be gone ====="
if [ -e ~/project/docs/admin_notes.txt ]; then
    echo "WARNING: admin_notes.txt still exists — Phase 5.1 not completed."
else
    echo "OK: admin_notes.txt has been removed."
fi

echo
echo "Verification complete. Compare this output against the Final Verification"
echo "Checklist in submission/README.md before capturing your final evidence."
