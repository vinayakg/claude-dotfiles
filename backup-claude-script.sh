#!/bin/bash
# backup-claude-code.sh

BACKUP_DIR=~/claude-dotfiles/

mkdir -p "$BACKUP_DIR"

# Config and settings
cp ~/.claude/settings.json "$BACKUP_DIR/"
cp -r ~/.claude/config "$BACKUP_DIR/" 2>/dev/null

# Custom commands, agents, skills, plugins
cp -r ~/.claude/commands "$BACKUP_DIR/" 2>/dev/null
cp -r ~/.claude/agents "$BACKUP_DIR/" 2>/dev/null
cp -r ~/.claude/skills "$BACKUP_DIR/" 2>/dev/null
cp -r ~/.claude/plugins "$BACKUP_DIR/" 2>/dev/null

echo "Backed up to $BACKUP_DIR"
