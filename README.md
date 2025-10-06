# SOND App Version

Version information for SOND iOS app update checker.

## latest_version.json

Fetched by the app to check for updates on launch.

**Update after each TestFlight deployment:**
```bash
# Edit version
nano latest_version.json

# Commit and push
git add latest_version.json
git commit -m "Update to version X.X.X"
git push
```
