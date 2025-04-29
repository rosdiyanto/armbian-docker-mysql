# Instalasi MySQL menggunakan Docker

Panduan ini akan membantu Anda mengatur MySQL menggunakan Docker.

## Prasyarat

- Docker terinstal di sistem Anda.

## Langkah-langkah

1. **Tarik gambar Docker MySQL**

   Buka terminal Anda dan jalankan perintah berikut untuk menarik gambar MySQL dari Docker Hub:
   ```sh
   docker pull mysql:latest
   ```

2. **Jalankan kontainer MySQL**

   Jalankan perintah berikut untuk memulai kontainer MySQL:
   ```sh
   docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=ayamjago -d mysql:latest
   ```

   - `--name mysql-container`: Memberi nama kontainer `mysql-container`.
   - `-e MYSQL_ROOT_PASSWORD=ayamjago`: Menetapkan kata sandi root untuk MySQL.
   - `-d`: Menjalankan kontainer dalam mode terpisah.

3. **Akses kontainer MySQL**

   Untuk mengakses baris perintah MySQL di dalam kontainer, gunakan perintah berikut:
   ```sh
   docker exec -it mysql-container mysql -u root -p
   ```

   Masukkan kata sandi root (`ayamjago`) saat diminta.

4. **Membuat database `ceknik` dengan kata sandi `ayamjago`**

   Setelah masuk ke baris perintah MySQL, jalankan perintah berikut untuk membuat database `ceknik` dan pengguna dengan kata sandi `ayamjago`:
   ```sql
   CREATE DATABASE ceknik;
   CREATE USER 'ceknik_user'@'%' IDENTIFIED BY 'ayamjago';
   GRANT ALL PRIVILEGES ON ceknik.* TO 'ceknik_user'@'%';
   FLUSH PRIVILEGES;
   ```

5. **Menghentikan kontainer MySQL**

   Untuk menghentikan kontainer MySQL, jalankan:
   ```sh
   docker stop mysql-container
   ```

6. **Menghapus kontainer MySQL**

   Untuk menghapus kontainer MySQL, jalankan:
   ```sh
   docker rm mysql-container
   ```

## Informasi Tambahan

- Untuk detail lebih lanjut tentang gambar Docker MySQL, kunjungi [halaman resmi MySQL Docker Hub](https://hub.docker.com/_/mysql).
- Untuk instruksi instalasi Docker, kunjungi [dokumentasi resmi Docker](https://docs.docker.com/get-docker/).

