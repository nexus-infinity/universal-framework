#!/bin/bash

# Step 1: Add .env to .gitignore if not already present
if ! grep -q ".env" .gitignore; then
    echo ".env" >> .gitignore
    echo ".env added to .gitignore"
fi

# Step 2: Remove secrets from setup_universal_framework.sh
sed -i '' '/export GCP_CLIENT_EMAIL/d' setup_universal_framework.sh
sed -i '' '/export GOOGLE_API_CLIENT_ID/d' setup_universal_framework.sh
sed -i '' '/export GOOGLE_API_SECRET/d' setup_universal_framework.sh
echo "Secrets removed from setup_universal_framework.sh"

# Step 3: Rewrite Git history to remove .env and other secret-containing files
bfg --delete-files .env
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch .env setup_universal_framework.sh' --prune-empty --tag-name-filter cat -- --all

# Step 4: Force-push the cleaned repo history
git push origin --force --all
echo "Repository history cleaned and force-pushed."

# Step 5: Instruct user to add secrets to GitHub Secrets
echo "Make sure to add your credentials to GitHub Secrets in the repository settings."
