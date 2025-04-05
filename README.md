# Ganti Domain

Script untuk mengganti domain di file-file web, serta mengirimkan notifikasi melalui Telegram ketika proses selesai.

## Deskripsi

Script ini digunakan untuk mengganti domain lama (`OLD_DOMAIN`) dengan domain baru (`NEW_DOMAIN`) pada file-file web yang ada di direktori tertentu. Script ini akan mencari file dengan ekstensi `.html`, `.js`, `.css`, dan `.php` di dalam direktori yang sudah ditentukan, kemudian mengganti semua kemunculan domain lama dengan domain baru. Setelah proses selesai, script akan mengirimkan notifikasi ke Telegram untuk memberi tahu bahwa proses penggantian domain telah selesai.

## Cara Penggunaan

1. **Clone repository** ke direktori lokal:
    ```bash
    git clone https://github.com/hokireceh/ganti-domain.git
    ```

2. **Masuk ke direktori** `ganti-domain`:
    ```bash
    cd ganti-domain
    ```

3. **Edit script** menggunakan text editor (misalnya `nano`):
    ```bash
    nano ganti-domain.sh
    ```

4. **Ubah variabel-variabel berikut** di dalam script sesuai dengan kebutuhan kamu:
    ```bash
    OLD_DOMAIN="contoh.com"        # Ganti dengan domain lama
    NEW_DOMAIN="hokireceh.fun"     # Ganti dengan domain baru
    TARGET_DIR="/www/wwwroot/contoh.com"  # Ganti dengan path direktori yang ingin kamu ganti domainnya
    BOT_TOKEN="123456789:ABCDEFghijklMNOpqrstuvwxyz"  # Ganti dengan token bot Telegram kamu
    CHAT_ID="123456789"           # Ganti dengan ID Telegram kamu
    ```

5. **Ubah permission** agar script bisa dijalankan:
    ```bash
    chmod +x ganti-domain.sh
    ```

6. **Jalankan script**:
    ```bash
    ./ganti-domain.sh
    ```

## Penjelasan Kode

Berikut adalah penjelasan tentang apa yang dilakukan oleh script `ganti-domain.sh`:

```bash
#!/bin/bash
