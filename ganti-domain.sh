#!/bin/bash

OLD_DOMAIN="contoh.com"
NEW_DOMAIN="hokireceh.fun"
TARGET_DIR="/www/wwwroot/contoh.com"
BOT_TOKEN="123456789:ABCDEFghijklMNOpqrstuvwxyz"  # ganti dengan token bot kamu
CHAT_ID="123456789"  # ganti dengan ID Telegram kamu

send_telegram() {
  MESSAGE=$1
  curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
       -d "chat_id=${CHAT_ID}" \
       -d "text=${MESSAGE}" > /dev/null
}

send_telegram "🚀 Mulai ganti domain '$OLD_DOMAIN' ➡️ '$NEW_DOMAIN' di $TARGET_DIR..."

find "$TARGET_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" -o -name "*.php" \) -exec sed -i "s|$OLD_DOMAIN|$NEW_DOMAIN|g" {} +

send_telegram "✅ Selesai ganti domain! Semua file di '$TARGET_DIR' telah diperbarui."
