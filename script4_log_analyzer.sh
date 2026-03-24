#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: Om Shrivastava | Roll: 24BSA10362
# Course: Open Source Software
# Description: Reads a log file line by line, counts how many
#              lines contain a given keyword, and prints the
#              last 5 matching lines. Accepts file and keyword
#              as command-line arguments.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/dpkg.log error
# =============================================================

# --- Read command-line arguments ---
LOGFILE=$1                      # First argument: path to log file
KEYWORD=${2:-"error"}           # Second argument: keyword (default: 'error')

# --- Counter to track how many matches are found ---
COUNT=0

echo "=============================================="
echo "     Log File Analyzer"
echo "     Student: Om Shrivastava | 24BSA10362"
echo "=============================================="
echo ""

# --- Validate: check if a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [!] No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/dpkg.log install"
    exit 1
fi

# --- Validate: check if the log file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [✘] Error: File '$LOGFILE' not found."

    # --- Retry suggestion: offer an alternative log file ---
    echo ""
    echo "  [~] Retrying with /var/log/dpkg.log ..."
    LOGFILE="/var/log/dpkg.log"

    # --- Check if the fallback file exists ---
    if [ ! -f "$LOGFILE" ]; then
        echo "  [✘] Fallback file also not found. Exiting."
        exit 1
    else
        echo "  [✔] Using fallback: $LOGFILE"
    fi
fi

# --- Check if the log file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [!] Warning: $LOGFILE is empty. Nothing to analyze."
    exit 0
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""
echo "  --- Scanning file line by line ---"
echo ""

# --- Read file line by line using a while-read loop ---
while IFS= read -r LINE; do

    # --- Check if the current line contains the keyword (case-insensitive) ---
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter each time keyword is found
    fi

done < "$LOGFILE"               # Redirect file into the while loop

# --- Print the total count of matching lines ---
echo "  [✔] Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "      $LOGFILE"
echo ""

# --- Print the last 5 lines that match the keyword ---
echo "  --- Last 5 matching lines ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo ""
echo "=============================================="
