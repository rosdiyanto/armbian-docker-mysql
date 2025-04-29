-- Membuat database cekik
CREATE DATABASE IF NOT EXISTS ceknik;

-- Membuat user dede dengan password ayamjago
CREATE USER 'dede'@'%' IDENTIFIED BY 'ayamjago';

-- Memberikan hak akses ke database ceknik untuk user dede
GRANT ALL PRIVILEGES ON ceknik.* TO 'dede'@'%';

-- Flush privileges untuk memastikan perubahan diterapkan
FLUSH PRIVILEGES;
