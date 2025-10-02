# update-all-the-packages
utilities for with `unattended-upgrades` to include all repos, and do things a bit more holistically.

## 🥅 Goals
You now have a fully automated, idempotent setup:
  - Ubuntu defaults at the top
  - Third-party repos (Docker, Tailscale, etc.) appended
  - Deduplicated and updated only when needed
  - Logging of changes
  - Works with systemd timer and logrotate

## ✅ How to Use
  - Clone the repo on your Ubuntu machine.
  - Run the installer: `sudo ./install-unattended-upgrades`
  - Check logs with:<br />
```bash
journalctl -u update-unattended-upgrades.service
tail -f /var/log/unattended-upgrades.log
```
  - This setup will be fully functional immediately, daily, idempotent, and logs changes to a rotating log.