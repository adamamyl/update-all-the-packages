#!/usr/bin/env bash
set -e

# Paths
SCRIPT_SRC="./update-unattended-upgrades.py"
SERVICE_SRC="./update-unattended-upgrades.service"
TIMER_SRC="./update-unattended-upgrades.timer"
LOGROTATE_SRC="./unattended-upgrades-logrotate.conf"

# Destination
SCRIPT_DEST="/usr/local/bin/update-unattended-upgrades.py"
SERVICE_DEST="/etc/systemd/system/update-unattended-upgrades.service"
TIMER_DEST="/etc/systemd/system/update-unattended-upgrades.timer"
LOGROTATE_DEST="/etc/logrotate.d/unattended-upgrades"

echo "Installing update-unattended-upgrades script and systemd units..."

# Copy Python script
install -m 755 "$SCRIPT_SRC" "$SCRIPT_DEST"

# Copy systemd service & timer
install -m 644 "$SERVICE_SRC" "$SERVICE_DEST"
install -m 644 "$TIMER_SRC" "$TIMER_DEST"

# Copy logrotate config
install -m 644 "$LOGROTATE_SRC" "$LOGROTATE_DEST"

# Reload systemd, enable timer
systemctl daemon-reload
systemctl enable --now update-unattended-upgrades.timer

echo "Installation complete."
echo "Timer is active. Check status with: systemctl status update-unattended-upgrades.timer"
