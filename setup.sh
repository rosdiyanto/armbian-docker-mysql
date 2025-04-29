#!/bin/bash

# Set direktori proyek (ubah jika perlu)
PROJECT_DIR=$(pwd)

# Pesan awal
echo "Memulai setup untuk proyek Docker Compose MySQL..."

# Memastikan file yang diperlukan ada (Dockerfile, create_db_and_user.sql, docker-compose.yml)
if [[ ! -f "$PROJECT_DIR/Dockerfile" || ! -f "$PROJECT_DIR/create_db_and_user.sql" || ! -f "$PROJECT_DIR/docker-compose.yml" ]]; then
    echo "File yang diperlukan (Dockerfile, create_db_and_user.sql, docker-compose.yml) hilang!"
    exit 1
fi

# Fungsi untuk menanyakan pilihan pengguna
ask_option() {
    echo "Pilih opsi:"
    echo "1. Clean (hapus semuanya dan rebuild)"
    echo "2. Rebuild (hanya rebuild tanpa menghapus volume atau data)"
    echo -n "Masukkan pilihan Anda (1 atau 2): "
    read choice
    case $choice in
        1)
            echo "Anda memilih Clean: Menghapus container, volume, dan rebuild."
            docker compose down -v  # Hapus container dan volume
            docker compose up --build -d  # Rebuild dan restart container
            ;;
        2)
            echo "Anda memilih Rebuild: Hanya rebuild container tanpa menghapus volume."
            docker compose up --build -d  # Hanya rebuild container
            ;;
        *)
            echo "Pilihan tidak valid. Keluar."
            exit 1
            ;;
    esac
}

# Menanyakan pilihan kepada pengguna
ask_option

# Menampilkan pesan bahwa setup selesai
echo "Setup Docker Compose MySQL selesai dengan sukses!"

# Menampilkan pesan bahwa MySQL sekarang dapat diakses dari remote
echo "Sekarang Anda dapat mengakses MySQL dari remote menggunakan user 'dede' dan password 'ayamjago'."
