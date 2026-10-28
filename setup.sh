#!/bin/bash

# Social Publisher Setup Script

echo "🚀 Setting up Social Publisher..."

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install Node.js first."
    exit 1
fi

# Install SocialClaw CLI
echo "📦 Installing SocialClaw CLI..."
npm install -g socialclaw@0.1.12

# Check for API key
if [ -z "$SC_API_KEY" ]; then
    echo ""
    echo "⚠️  SC_API_KEY environment variable not set."
    echo ""
    echo "Please get your workspace API key from: https://getsocialclaw.com/dashboard"
    echo "Then run:"
    echo "  export SC_API_KEY=\"your-workspace-key\""
    echo ""
    echo "Or add it to your shell profile (~/.zshrc or ~/.bashrc)"
    exit 1
fi

# Verify API key
echo "🔑 Verifying API key..."
printf 'header = "Authorization: Bearer %s"\n' "$SC_API_KEY" |
  curl -sS -K - https://getsocialclaw.com/v1/keys/validate

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Setup complete! Your API key is valid."
    echo ""
    echo "Next steps:"
    echo "1. Connect your social media accounts:"
    echo "   socialclaw accounts list --json"
    echo "   socialclaw accounts connect --provider x --open"
    echo ""
    echo "2. Edit schedule.json with your posts"
    echo ""
    echo "3. Validate and publish:"
    echo "   socialclaw validate -f schedule.json --json"
    echo "   socialclaw apply -f schedule.json --json"
else
    echo ""
    echo "❌ API key verification failed. Please check your SC_API_KEY."
    exit 1
fi
