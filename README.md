# 🤖 GoogleBot Webhook Trigger

Fire a webhook when GoogleBot visit your website.

## 💡 How does it work?

Using `tail` and `grep` to monitor the nginx log file. Once it matches the word "GoogleBot" it'll immediately send notification to your telegram

> This script is for Nginx webserver. If you're using different one. Please change the path accordingly.

## 🔧 Script Setup

- Download the [gbotwebhook.sh](https://github.com/mcnaveen/GoogleBot-Webhook-Trigger/blob/main/gbotwebhook.sh) file on your linux server in `root` or `home` (Home Recommended)

- Open the file and add these values (Required)

```sh
webhookURL= PASTE THE WEBHOOK URL HERE
logFile=/var/log/nginx/access.log #Path to your Nginx access log file. (This one is default) 
```

> This logFile path is for Nginx webserver. If you're using different one. Please change accordingly.
- Now, Make it executable `chmod +x gbotwebhook.sh`
- Next Setup `systemd` for Running this script continuously

```bash


# Navigate to this Directory
cd /etc/systemd/system

# Create New Service File
touch gbotwebhook.service

# Create a Service file for systemd service
nano gbotwebhook.service

```

- Now paste everything from <https://github.com/mcnaveen/GoogleBot-Webhook-Trigger/blob/main/gbotwebhook.service> and save it.

- Reload the systemd and enable the gbotwebhook service

```bash
systemctl daemon-reload
systemctl enable gbotwebhook
systemctl start gbotwebhook
```

- You can Check the service status with

```bash
systemctl status gbotwebhook
```

## ☑ LICENSE 

MIT

----

### Shoutout

Similar useful bash scripts: 
- Get Isso Comments Notification on your Telegram by Santhosh Veer - <https://github.com/mskian/isso-telegram-notifier/>
- Get Telegram Notification when GoogleBot visit your website - <https://github.com/mcnaveen/GoogleBot-Nginx-Telegram-Notifier>