#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: Om Shrivastava | Roll: 24BSA10362
# Course: Open Source Software
# Description: Interactively asks the user 3 questions and
#              generates a personalised open source philosophy
#              statement, saving it to a .txt file.
# =============================================================

# --- Alias concept (demonstrated via comment) ---
# In a real shell session you could define:
#   alias manifesto='./script5_manifesto.sh'
# This lets you run the script simply by typing: manifesto

echo "=============================================="
echo "     Open Source Manifesto Generator"
echo "     Student: Om Shrivastava | 24BSA10362"
echo "=============================================="
echo ""
echo "  Answer three questions to generate your"
echo "  personal open source philosophy statement."
echo ""

# --- Interactively read answers from the user ---
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

# --- Get current date for the manifesto timestamp ---
DATE=$(date '+%d %B %Y')

# --- Define output filename using current username ---
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Write the manifesto to a file using > (overwrite) ---
# The heredoc block composes the full paragraph neatly
cat > "$OUTPUT" << EOF
================================================
  MY OPEN SOURCE MANIFESTO
  Author : Om Shrivastava (24BSA10362)
  Date   : $DATE
================================================

Every day, I rely on $TOOL — a tool that exists
because someone chose to build it openly and share
it with the world without asking for anything in return.

To me, freedom means $FREEDOM. That is exactly what
open source represents: the freedom to see how things
work, the freedom to improve them, and the freedom to
pass them on to others without restriction.

If I could build anything and share it freely, I would
build $BUILD — and I would release it as open source,
because the greatest software in the world was not
locked away. It was given freely, and it made the
world better for everyone.

Open source is not just a licence. It is a philosophy.
It says: knowledge belongs to everyone.

================================================
EOF

# --- Confirm the file was saved ---
echo "  [✔] Manifesto saved to: $OUTPUT"
echo ""

# --- Display the manifesto on screen ---
echo "  --- Your Manifesto ---"
echo ""
cat "$OUTPUT"

echo ""
echo "=============================================="
