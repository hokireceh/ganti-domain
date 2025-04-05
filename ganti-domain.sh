#!/bin/bash

OLD_DOMAIN="contoh.com"
NEW_DOMAIN="hokireceh.fun"
TARGET_DIR="/www/wwwroot/contoh.com"
BOT_TOKEN="123456789:ABCDEFghijklMNOpqrstuvwxyz"  # ganti token bot kamu
CHAT_ID="123456789"  # ganti ID Telegram kamu

send_telegram() {
  MESSAGE=$1
  curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
       -d "chat_id=${CHAT_ID}" \
       -d "text=${MESSAGE}" > /dev/null
}

send_telegram "🚀 Mulai ganti domain '$OLD_DOMAIN' ➡️ '$NEW_DOMAIN' di $TARGET_DIR..."

# Ganti domain sesuai huruf aslinya
find "$TARGET_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" -o -name "*.php" \) -exec perl -i -pe '
  s/\bcontoh\.com\b/
    $& eq "contoh.com" ? "hokireceh.fun" :
    $& eq "Contoh.com" ? "Hokireceh.fun" :
    $& eq "CONTOH.COM" ? "HOKIRECEH.FUN" :
    $&/eg
' {} +

send_telegram "✅ Selesai! Semua domain '$OLD_DOMAIN' telah diganti menjadi '$NEW_DOMAIN'. 🎉"
