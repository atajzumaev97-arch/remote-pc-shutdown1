# 🔌 Remote PC Shutdown

Remotely shut down your Windows PC from your phone or any device with internet access.

## 📱 How It Works

```
📱 Your Phone          ☁️ Cloud (CodeWords)          💻 Your PC
   "Shut down!" ──────→ Stores command ──────→ Script checks & shuts down
```

1. You send a shutdown command from your phone (or any browser)
2. The cloud service stores the command
3. The script on your PC checks every 5 seconds
4. When it finds the command — your PC shuts down!

## 🚀 Quick Start

### 1. Get your API Key
1. Go to [CodeWords](https://codewords.agemo.ai/account/keys)
2. Create an account (free)
3. Copy your API key (starts with `cwk-`)

### 2. Configure the Script
1. Open `shutdown_listener.bat` in Notepad
2. Replace `YOUR_API_KEY_HERE` with your actual API key
3. Replace `YOUR_SERVICE_ID_HERE` with your service ID
4. Save the file

### 3. Run It
1. Double-click `shutdown_listener.bat`
2. You'll see "Listening for shutdown commands..."
3. To shut down remotely — open the CodeWords UI from your phone

### 4. Stop the Script
Press `Ctrl+C` in the command window.

## ⚠️ Security

- **NEVER** share your API key publicly
- **NEVER** commit real API keys to GitHub
- The script uses HTTPS for secure communication
- Only you can send shutdown commands (protected by your API key)

## 🛠 Requirements

- **Windows 10/11** (uses PowerShell for HTTP requests)
- **Internet connection** on your PC
- **CodeWords account** (free) — [Sign up here](https://codewords.agemo.ai)

## 📄 License

MIT License — feel free to use, modify, and share!
