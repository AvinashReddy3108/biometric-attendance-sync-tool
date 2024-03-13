#!/bin/bash

# Move to main directory
cd "$(dirname "$0")" || exit

# Activate virtual environment
[ ! -d "$PWD/.venv" ] && python3 -m venv .venv
source $PWD/.venv/bin/activate

# Install requirements
pip install -r requirements.txt

# Run
exec python erpnext_sync.py
