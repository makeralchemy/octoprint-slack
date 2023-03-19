#!/bin/bash
# this file should be stored in /home/pi/.octoprint/slack-message.sh
# replace AAAAAAAAA/BBBBBBBBB/CCCCCCCCCCCCCCCCCCCCCCCC with your slack webhook credentials
curl -d "{'text': '$1'}" -H "Content-Type: application/json" https://hooks.slack.com/services/AAAAAAAAA/BBBBBBBBB/CCCCCCCCCCCCCCCCCCCCCCCC
