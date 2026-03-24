#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Om Shrivastava | Roll: 24BSA10362
# Course: Open Source Software
# Description: Displays a welcome screen with system info
#              and confirms the OS license (GPL v2 for Linux)
# ============================================================

# --- Student & Project Variables ---
STUDENT_NAME="Om Shrivastava"         
ROLL_NUMBER="24BSA10362"
SOFTWARE_CHOICE="Python"

# --- Gather System Information using command substitution ---
KERNEL=$(uname -r)                          # Linux kernel version
USER_NAME=$(whoami)                         # Currently logged-in user
HOME_DIR=$HOME                              # Home directory of current user
UPTIME=$(uptime -p)                         # Human-readable uptime
DATETIME=$(date '+%d %B %Y | %H:%M:%S')    # Formatted date and time

# --- Get Linux Distribution name from os-release file ---
DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')

# --- OS License (Linux kernel is licensed under GPL v2) ---
OS_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Display the Identity Report ---
echo "================================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT            "
echo "================================================================"
echo ""
echo "  Student   : $STUDENT_NAME ($ROLL_NUMBER)"
echo "  Auditing  : $SOFTWARE_CHOICE"
echo ""
echo "----------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "----------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged in as : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATETIME"
echo ""
echo "----------------------------------------------------------------"
echo "  LICENSE"
echo "----------------------------------------------------------------"
echo "  This operating system (Linux) is covered under:"
echo "  $OS_LICENSE"
echo ""
echo "  This means you are free to run, study, modify, and"
echo "  redistribute the OS — the four freedoms of free software."
echo ""
echo "================================================================"
echo "  Audit environment ready. Let's explore open source!"
echo "================================================================"
