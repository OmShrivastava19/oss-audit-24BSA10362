# OSS Audit — Python
### Open Source Software Capstone Project | VITyarthi

**Student Name:** Om Shrivastava
**Roll Number:** 24BSA10362
**Course:** Open Source Software (OSS NGMC)
**Software Audited:** Python (PSF License)

---

## 📁 Repository Structure

```
oss-audit-24BSA10362/
│
├── script1_system_identity.sh       # System Identity Report
├── script2_package_inspector.sh     # FOSS Package Inspector
├── script3_disk_auditor.sh          # Disk and Permission Auditor
├── script4_log_analyzer.sh          # Log File Analyzer
├── script5_manifesto.sh             # Open Source Manifesto Generator
├── images/                          # Containing all the screenshots
└── README.md                        
```

---

## 📜 Script Descriptions

### Script 1 — System Identity Report
Displays a welcome screen with complete system information including
the Linux distribution name, kernel version, logged-in user, home
directory, system uptime, current date and time, and the open source
license that covers the operating system (GPL v2 for Linux).

**Concepts used:** Variables, command substitution (`$()`), `echo`,
`uname`, `whoami`, `uptime`, `date`, `grep`, `cut`, `tr`

---

### Script 2 — FOSS Package Inspector
Checks whether Python3 is installed on the system using `dpkg`,
displays its version and package details, and uses a `case` statement
to print a philosophy note about Python and other well-known open
source packages.

**Concepts used:** `if-then-else`, `case` statement, `dpkg -l`,
pipe with `awk`, `exit` codes

---

### Script 3 — Disk and Permission Auditor
Loops through a list of important Linux system directories (`/etc`,
`/var/log`, `/home`, `/usr/bin`, `/tmp`) using a `for` loop and
reports the size, permissions, and owner of each. Also audits
Python-specific directories (`/usr/lib/python3`, `/usr/local/lib`,
`/etc/python3`) and locates the Python binary.

**Concepts used:** `for` loop, arrays, `du`, `ls -ld`, `awk`,
`find`, conditional checks with `[ -d ]`

---

### Script 4 — Log File Analyzer
Accepts a log file path and an optional keyword as command-line
arguments. Reads the file line by line using a `while read` loop,
counts how many lines contain the keyword (case-insensitive), and
prints the last 5 matching lines. Includes input validation for
missing or empty files.

**Concepts used:** `while read` loop, `if-then`, counter variables,
command-line arguments (`$1`, `$2`), `grep`, `tail`, `exit` codes

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/syslog warning
```

---

### Script 5 — Open Source Manifesto Generator
Interactively asks the user three questions using `read`, then
composes a personalised open source philosophy statement using
string concatenation and saves it to a `.txt` file named after
the current user. The manifesto is also printed to the terminal.

**Concepts used:** `read` for user input, string concatenation,
writing to file with `>>`, `date` command, `cat`, aliases concept
demonstrated via comment

---

## ⚙️ How to Run the Scripts on Linux

### Prerequisites
- A Linux system (Ubuntu 20.04 or later recommended)
- Python3 installed: `sudo apt install python3`
- Bash shell (pre-installed on all Linux systems)

### Step-by-Step Instructions

**1. Clone the repository**
```bash
git clone https://github.com/OmShrivastava19/oss-audit-24BSA10362.git
cd oss-audit-24BSA10362
```

**2. Make all scripts executable**
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto.sh
```

**3. Run each script**
```bash
# Script 1 — System Identity Report
./script1_system_identity.sh

# Script 2 — FOSS Package Inspector
./script2_package_inspector.sh

# Script 3 — Disk and Permission Auditor
./script3_disk_auditor.sh

# Script 4 — Log File Analyzer (provide a log file and keyword)
./script4_log_analyzer.sh /var/log/syslog error

# Script 5 — Manifesto Generator (interactive)
./script5_manifesto.sh
```

---

## 🔗 Dependencies

| Dependency | Purpose | Install Command |
|-----------|---------|----------------|
| bash | Shell interpreter for all scripts | Pre-installed |
| python3 | Required for Script 2 inspection | `sudo apt install python3` |
| dpkg | Package manager queried in Script 2 | Pre-installed on Ubuntu |
| coreutils | `du`, `ls`, `whoami`, `date`, `uname` | Pre-installed |
| grep | Keyword search in Script 4 | Pre-installed |

All dependencies are pre-installed on Ubuntu 22.04 / 24.04 LTS.
No additional installation is required beyond a standard Ubuntu setup.

---

## 📄 Project Report

The full project report (PDF) has been submitted separately on the
VITyarthi portal as per submission requirements.

---

*This project was completed as part of the Open Source Software (OSS)
course at VIT. All scripts were written and tested on Ubuntu 24.04.4 LTS
running as a VirtualBox VM.*
