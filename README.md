# SOND App Version

Version information for SOND iOS app update checker.

Current: **11.5.0 (180)**, released to the App Store on 2026-10-21.

## latest_version.json

Fallback source for `AppUpdateChecker`. The app asks the server first
(`/health` → `minimum_build` / `minimum_version`, the real version gate) and reads
this file only when the server is unreachable. With `updateRequired: false` it can
only suggest an update, never block the app.

**Update after each App Store release** (after the version is live, not after TestFlight):
```bash
# Edit version, build and releaseNotes
nano latest_version.json

# Commit and push
git add latest_version.json README.md
git commit -m "bump: X.Y.Z (build) — short summary"
git push
```
