#!/usr/bin/env bash

# Move to main directory
cd "$(dirname "$0")" || exit

# Activate virtual environment
[ ! -d "$PWD/.venv" ] && python3 -m venv .venv
source "$PWD/.venv/bin/activate"

# Install requirements
pip install -r requirements.txt

# Creating the systemd service file for later use
[ ! -f "$PWD/biometric_attendance_sync.service" ] && cat <<- EOF > "$PWD/biometric_attendance_sync.service"
[Unit]
Description=ERPNext Biometric Attendance Sync
Wants=network-online.target network.target
After=network.target

[Service]
WorkingDirectory=$PWD
ExecStart=$PWD/.venv/bin/python erpnext_sync.py
Restart=always
KillMode=process

[Install]
WantedBy=default.target
EOF

# Run
exec python erpnext_sync.py
