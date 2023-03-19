# octoprint-slack
This repository contains customizations for Octoprint for using events to send messages to Slack via webhooks. 
The two files in this repository can be used to configure OctoPrint to send messages to slack when various events occurs (e.g., server started, server shutting down, print started, print done, print paused, print resumed, print failed, print cancelled). 

### Configuring OctoPrint events to send Slack messages
The contents of `config.yaml.events` can be copied into the events section of Octoprint's `config.yaml` file.
The `config.yaml` file is located at `~/.octoprint` on Linux, at `%APPDATA%/OctoPrint` on Windows and at `~/Library/Application Support/OctoPrint` on macOS.

Details on the `config.yaml` file structure, content, and location can be found at https://docs.octoprint.org/en/master/configuration/config_yaml.html

### Installing and configuring the script that sends messages to Slack
`slack-message.sh` is called by OctoPrint for the various events as specified in the events section of the `config.yaml` file. 
- The script takes one argument which is the text to send to Slack.
- The script uses the `curl` command to call the webhook with the specified text. 
- You must replace 'AAAAAAAAA/BBBBBBBBB/CCCCCCCCCCCCCCCCCCCCCCCC' with your Slack webhook credentials. 
- Information on how to setup a Slack webhook can be found at https://api.slack.com/messaging/webhooks
- `slack-message.sh` must be stored in the directory specified in the config.yaml. 
In the case of my configuration it's: `/home/pi/.octoprint/slack-message.sh` where 'pi' is the username I setup when installing OctoPrint. 
- If you setup Octoprint using a different username, then you will need to replace 'pi' with your username in each of the `curl` commands in the `config.yaml` file to use your username:
```
- command: bash /home/pi/.octoprint/slack-message.sh "OctoPi Server Started"
```
After you make the changes to `config.yaml` and put the `slack-message.sh` in the proper directory, reboot your OctoPrint server. You should get a message on Slack that the server has started. 
Be careful when editing your `config.yaml` file: my experience is that errors in that file prevent Octoprint from starting and you don't get great error messages to help you understand where to find the problem.

### Example messages
My Slack webhoot goes to a channel in my slack account called 'IoT Device'. 
Examples of the messages I get are:

```
IoT Device APP 6:51 PM
OctoPi Server Started

IoT Device APP 7:00 PM
3D Print tentacles_v0_0.2mm_PLA_MINI_1h24.gcode Started

IoT Device APP 8:26 PM
3D Print tentacles_v0_0.2mm_PLA_MINI_1h24.gcode Finished

IoT Device APP 8:45 PM
OctoPi Server Shutting Down
```

This is really convenient to get these notifications on my phone. Make sure to turn on Slack notifications on the devices you want to receive notifications.
