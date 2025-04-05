#!/bin/bash

# === Konfigurasi ===
OLD_DOMAIN="contoh.com"
NEW_DOMAIN="hokireceh.fun"
OLD_NAME="Contoh"
NEW_NAME="HokiReceh"
TARGET_DIR="/www/wwwroot/contoh.com"

BOT_TOKEN="123456789:ABCDEFghijklMNOpqrstuvwxyz"  # Token bot kamu
CHAT_ID="123456789"  # ID Telegram kamu

# === Fungsi untuk kirim pesan ke Telegram ===
send_telegram() {
  local MESSAGE="$1"
  curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=${MESSAGE}" \
    -d "parse_mode=Markdown"
}

# === Notifikasi awal ===
send_telegram "🔁 *DOMAIN + NAMA REPLACER*

🚀 Mulai proses ganti domain dan nama...

📆 Waktu: \`$(date '+%Y-%m-%d %H:%M:%S')\`
🔍 Domain: \`${OLD_DOMAIN}\` ➡️ \`${NEW_DOMAIN}\`
🔤 Nama: \`${OLD_NAME}\` ➡️ \`${NEW_NAME}\`
📁 Folder: \`${TARGET_DIR}\`"

# === Proses ganti domain dan nama ===
find "$TARGET_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" -o -name "*.php" \) -exec perl -i -pe '
  s/\bcontoh\.com\b/
    $& eq "contoh.com" ? "hokireceh.fun" :
    $& eq "Contoh.com" ? "Hokireceh.fun" :
    $& eq "CONTOH.COM" ? "HOKIRECEH.FUN" :
    $&/eg;

  s/\bContoh\b/
    $& eq "Contoh" ? "HokiReceh" :
    $& eq "CONTOH" ? "HOKIRECEH" :
    $& eq "contoh" ? "hokireceh" :
    $&/eg;
' {} +

# === Notifikasi selesai ===
send_telegram "✅ *SELESAI!*

🟢 Semua domain dan nama berhasil diganti.

🔍 Domain: \`${OLD_DOMAIN}\` ➡️ \`${NEW_DOMAIN}\`
🔤 Nama: \`${OLD_NAME}\` ➡️ \`${NEW_NAME}\`
📁 Folder: \`${TARGET_DIR}\`

📆 Waktu selesai: \`$(date '+%Y-%m-%d %H:%M:%S')\`"
