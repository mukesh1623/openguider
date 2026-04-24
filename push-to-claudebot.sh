#!/bin/bash
# One-shot: push OpenGuider to ClaudeBot org
# Run: bash push-to-claudebot.sh

cd "$(dirname "$0")"

echo "Pushing to ClaudeBot/openguider..."
git push -u origin main 2>&1

if [ $? -eq 0 ]; then
  echo ""
  echo "Done! Repo is live at: https://github.com/ClaudeBot/openguider"
else
  echo ""
  echo "Push failed. You may need to authenticate first:"
  echo "  /c/Users/claudebot/bin/gh.exe auth login"
  echo "Then re-run this script."
fi
