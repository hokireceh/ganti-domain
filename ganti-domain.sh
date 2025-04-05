#!/bin/bash

# === Konfigurasi ===
OLD_DOMAIN="contoh.com"
NEW_DOMAIN="hokireceh.fun"
TARGET_DIR="/www/wwwroot/contoh.com"

BOT_TOKEN="123456789:ABCDEFghijklMNOpqrstuvwxyz"  # Ganti token bot kamu
CHAT_ID="123456789"  # Ganti ID Telegram kamu

# === Fungsi untuk kirim pesan Telegram ===
send_telegram() {
  local MESSAGE="$1"
  curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=${MESSAGE}" \
    -d "parse_mode=Markdown"
}

# === Kirim notifikasi awal ===
send_telegram "🔁 *DOMAIN REPLACER*

🚀 Mulai proses ganti domain...

📆 Waktu: \`$(date '+%Y-%m-%d %H:%M:%S')\`
🔍 Dari: \`${OLD_DOMAIN}\`
➡️ Ke: \`${NEW_DOMAIN}\`
📁 Folder: \`${TARGET_DIR}\`"

# === Proses ganti domain di semua file HTML, CSS, JS, PHP ===
find "$TARGET_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" -o -name "*.php" \) -exec perl -i -pe '
  s/\bcontoh\.com\b/
    $& eq "contoh.com" ? "hokireceh.fun" :
    $& eq "Contoh.com" ? "Hokireceh.fun" :
    $& eq "CONTOH.COM" ? "HOKIRECEH.FUN" :
    $&/eg
' {} +

# === Kirim notifikasi selesai ===
send_telegram "✅ *SELESAI!*

🟢 Semua domain \`${OLD_DOMAIN}\` telah diganti menjadi \`${NEW_DOMAIN}\` pada direktori:
📁 \`${TARGET_DIR}\`

📆 Waktu selesai: \`$(date '+%Y-%m-%d %H:%M:%S')\`"
