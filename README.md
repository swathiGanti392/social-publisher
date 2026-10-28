# Social Publisher

A project for scheduling and publishing social media posts across 13 platforms using SocialClaw.

## Supported Platforms

- X (Twitter)
- LinkedIn (profile & page)
- Instagram (Business & standalone)
- Facebook Pages
- TikTok
- YouTube
- Reddit
- WordPress
- Discord
- Telegram
- Pinterest

## Setup

1. Get your workspace API key from [SocialClaw Dashboard](https://getsocialclaw.com/dashboard)
2. Install the SocialClaw CLI:
   ```bash
   npm install -g socialclaw@0.1.12
   ```
3. Set your API key:
   ```bash
   export SC_API_KEY="your-workspace-key"
   ```
4. Login to SocialClaw:
   ```bash
   socialclaw login --api-key $SC_API_KEY
   ```

## Usage

### Connect Social Media Accounts

```bash
# List connected accounts
socialclaw accounts list --json

# Connect a new account (opens browser for OAuth)
socialclaw accounts connect --provider x --open
socialclaw accounts connect --provider linkedin --open
```

### Create a Post Schedule

Edit `schedule.json` with your posts, then:

```bash
# Validate before publishing
socialclaw validate -f schedule.json --json

# Publish the schedule
socialclaw apply -f schedule.json --json
```

### Monitor Posts

```bash
# Check status of a publishing run
socialclaw status --run-id <run-id> --json

# List all posts
socialclaw posts list --json
```

## Project Structure

- `schedule.json` - Post schedule configuration
- `examples/` - Example schedules for different scenarios
- `media/` - Place for media assets to upload
