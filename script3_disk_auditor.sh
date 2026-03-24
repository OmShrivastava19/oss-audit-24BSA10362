#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: Om Shrivastava | Roll: 24BSA10362
# Course: Open Source Software
# Description: Loops through key Linux directories and reports
#              their size, owner, and permissions. Also checks
#              Python's specific config and binary directories.
# =============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================================="
echo "     Disk and Permission Auditor"
echo "     Student: Om Shrivastava | 24BSA10362"
echo "=============================================="
echo ""
echo "  --- System Directory Audit ---"
echo ""

# --- Loop through each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # --- Check if the directory actually exists ---
    if [ -d "$DIR" ]; then

        # --- Extract permissions, owner, and group using ls and awk ---
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')   # e.g. drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')   # e.g. root
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')   # e.g. root

        # --- Get the disk usage of the directory ---
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  Directory : $DIR"
        echo "  Size      : $SIZE"
        echo "  Perms     : $PERMS"
        echo "  Owner     : $OWNER : $GROUP"
        echo "  ------------------------------"

    else
        # --- Directory does not exist on this system ---
        echo "  [!] $DIR does not exist on this system."
        echo "  ------------------------------"
    fi

done

echo ""
echo "  --- Python-Specific Directory Audit ---"
echo ""

# --- List of directories specific to Python on Linux ---
PYTHON_DIRS=("/usr/lib/python3" "/usr/local/lib" "/etc/python3")

for PDIR in "${PYTHON_DIRS[@]}"; do

    if [ -d "$PDIR" ]; then
        PERMS=$(ls -ld "$PDIR" | awk '{print $1}')
        OWNER=$(ls -ld "$PDIR" | awk '{print $3}')
        SIZE=$(du -sh "$PDIR" 2>/dev/null | cut -f1)
        echo "  [✔] Found : $PDIR"
        echo "  Size      : $SIZE | Perms: $PERMS | Owner: $OWNER"
    else
        echo "  [✘] Not found : $PDIR"
    fi
    echo "  ------------------------------"

done

# --- Check where the python3 binary lives ---
echo ""
echo "  --- Python Binary Location ---"
PYTHON_BIN=$(which python3 2>/dev/null)

if [ -n "$PYTHON_BIN" ]; then
    echo "  python3 binary found at: $PYTHON_BIN"
    # Show its permissions
    ls -lh "$PYTHON_BIN"
else
    echo "  python3 binary not found in PATH."
fi

echo ""
echo "=============================================="
