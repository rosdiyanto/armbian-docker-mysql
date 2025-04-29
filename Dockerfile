# Gunakan image MySQL terbaru
FROM mysql:latest

# Set timezone ke Asia/Jakarta
RUN echo "Mengatur timezone ke Asia/Jakarta..."
ENV TZ=Asia/Jakarta

# Salin skrip SQL untuk membuat database dan user
RUN echo "Menyalin create_db_and_user.sql ke /docker-entrypoint-initdb.d/..."
COPY create_db_and_user.sql /docker-entrypoint-initdb.d/

# Salin file konfigurasi kustom my.cnf ke lokasi yang tepat
RUN echo "Menyalin konfigurasi kustom my.cnf ke /etc/my.cnf..."
COPY my_custom_config.cnf /etc/my.cnf

# Menentukan port yang digunakan
RUN echo "Membuka port 3306 untuk MySQL..."
EXPOSE 3306

# Pesan terakhir setelah build selesai
RUN echo "Build Docker image selesai. MySQL siap digunakan!"
