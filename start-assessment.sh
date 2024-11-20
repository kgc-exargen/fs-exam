#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if assessment has already started
if [ -f "ASSESSMENT_TIME.md" ]; then
    echo -e "${RED}Assessment has already been started!${NC}"
    echo "Start time: $(cat ASSESSMENT_TIME.md)"
    exit 1
fi

# Create and configure ASSESSMENT_TIME.md
echo "# Assessment Timeline" > ASSESSMENT_TIME.md
echo "Start time: $(date)" >> ASSESSMENT_TIME.md
echo "Expected end time: $(date -d "+6 hours")" >> ASSESSMENT_TIME.md

# Git operations
git add ASSESSMENT_TIME.md
git commit -m "Assessment started"
git push

# Print instructions
echo -e "${GREEN}Assessment timer started!${NC}"
echo "Start time: $(date)"
echo "You have 6 hours to complete the assessment"
echo "Expected end time: $(date -d "+6 hours")"
echo -e "${GREEN}Good luck!${NC}"