#!/bin/bash
# this file should be stored in /home/pi/.octoprint/slack-message.sh
curl -d "{'text': '$1'}" -H "Content-Type: application/json" https://hooks.slack.com/services/AAAAAAAAA/BBBBBBBBB/CCCCCCCCCCCCCCCCCCCCCCCC