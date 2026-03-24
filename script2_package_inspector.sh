#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: Om Shrivastava | Roll: 24BSA10362
# Course: Open Source Software
# Description: Checks if Python is installed, prints its
#              version and license, and uses a case statement
#              to display a philosophy note about the package.
# =============================================================

# --- Define the package to inspect ---
PACKAGE="python3"

echo "=============================================="
echo "     FOSS Package Inspector"
echo "     Student: Om Shrivastava | 24BSA10362"
echo "=============================================="
echo ""

# --- Check if the package is installed using dpkg (Ubuntu/Debian) ---
if dpkg -l | grep -qw "$PACKAGE"; then
    echo "  [✔] $PACKAGE is INSTALLED on this system."
    echo ""

    # --- Display version information ---
    VERSION=$(python3 --version 2>&1)
    echo "  Version  : $VERSION"

    # --- Show install location of the python3 binary ---
    LOCATION=$(which python3)
    echo "  Location : $LOCATION"

    # --- Show the installed package details via dpkg ---
    echo ""
    echo "  --- Package Details (dpkg) ---"
    dpkg -l | grep -w "python3" | head -1 | awk '{print "  Package: "$2, "\n  Version: "$3}'

else
    # --- If not installed, show a message ---
    echo "  [✘] $PACKAGE is NOT installed."
    echo "  Install it with: sudo apt install python3"
fi

echo ""
echo "----------------------------------------------"
echo "  Open Source Philosophy Notes"
echo "----------------------------------------------"

# --- Case statement: print a philosophy note based on the package name ---
case $PACKAGE in
    python3 | python)
        echo "  Python: A language built entirely by its"
        echo "  community — Guido van Rossum released it"
        echo "  freely so everyone could benefit from it."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open"
        echo "  internet — powering ~30% of all websites."
        ;;
    mysql | mariadb)
        echo "  MySQL: Open source at the heart of millions"
        echo "  of applications worldwide."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris — plays"
        echo "  anything and is free for everyone."
        ;;
    git)
        echo "  Git: Built by Linus Torvalds when proprietary"
        echo "  tools failed the Linux kernel project."
        ;;
    firefox)
        echo "  Firefox: A nonprofit browser fighting for"
        echo "  an open and accessible web."
        ;;
    *)
        echo "  $PACKAGE: An open-source tool that stands"
        echo "  on the shoulders of a generous community."
        ;;
esac

echo ""
echo "  License: Python Software Foundation License (PSF)"
echo "  PSF License allows free use, modification, and"
echo "  distribution — even in commercial products."
echo ""
echo "=============================================="
