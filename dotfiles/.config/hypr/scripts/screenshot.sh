#!/bin/bash

# Pastikan script dapat dieksekusi
# chmod +x ~/.config/hypr/scripts/screenshot.sh

MODE=$1
NOTIFY_TITLE="Screenshot"

case $MODE in
    "area")
        # 1. Gunakan slurp untuk memilih area dan berikan koordinat ke grim.
        # 2. Hasil screenshot disalurkan (-) ke wl-copy.
        grim -g "$(slurp)" - | wl-copy

        # 3. Kirim notifikasi menggunakan dunst
        dunstify "$NOTIFY_TITLE" "Area berhasil disalin ke clipboard." -t 1500 # Tampilkan selama 1.5 detik
        ;;

    "full")
        # 1. Gunakan grim tanpa argumen untuk seluruh layar.
        # 2. Hasil screenshot disalurkan (-) ke wl-copy.
        grim - | wl-copy

        # 3. Kirim notifikasi menggunakan dunst
        dunstify "$NOTIFY_TITLE" "Seluruh layar berhasil disalin ke clipboard." -t 1500
        ;;

    *)
        # Jika argumen tidak valid
        dunstify "$NOTIFY_TITLE" "Penggunaan: area atau full" -t 3000
        exit 1
        ;;
esac