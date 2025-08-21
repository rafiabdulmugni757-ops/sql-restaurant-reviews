# Langkah-Langkah Menyelesaikan Tugas di GitHub Codespaces (SQLite)

> Semua aktivitas dilakukan di **Codespace** sesuai instruksi tugas.

## 1) Siapkan Codespace
1. Buat repo baru di GitHub (mis. `restaurant-reviews-sql`), atau gunakan repo kelasmu.
2. Klik tombol **Code** > tab **Codespaces** > **Create codespace on main**.
3. Di VS Code Web (Codespaces) buka **Terminal** (Ctrl+`).

## 2) Pasang SQLite CLI (sekali saja)
```bash
sudo apt-get update && sudo apt-get install -y sqlite3
sqlite3 --version
```

## 3) Salin file SQL ke repo
- Unggah file-file berikut ke root repo (atau folder `sql/`):
  - `00_sqlite_setup.sql`
  - `01_create_tables.sql`
  - `02_insert_sample_data.sql`
  - `03_crud_queries.sql`
  - `04_additional_queries.sql`
  - `05_extra_credit.sql` (opsional)

## 4) Buat & buka database
```bash
sqlite3 restaurant_reviews.db
```
Di dalam prompt `sqlite>`, jalankan ini agar output rapi & FK aktif:
```sql
.read 00_sqlite_setup.sql
```

## 5) Buat tabel & masukkan data sampel
```sql
.read 01_create_tables.sql
.read 02_insert_sample_data.sql
```
Cek isi tabel:
```sql
SELECT * FROM restaurant;
SELECT * FROM review;
```

## 6) Jalankan operasi CRUD (satu per satu dan **screenshot hasilnya**)
```sql
.read 03_crud_queries.sql
```
Atau jalankan per query (copy-paste) agar mudah memotret setiap hasil.

## 7) Jalankan **Additional Queries** (dan screenshot hasilnya)
```sql
.read 04_additional_queries.sql
```

## 8) (Opsional) Extra Credit
```sql
.read 05_extra_credit.sql
```

## 9) Bukti & Pengumpulan
1. **Kumpulkan skrip SQL**: `01_create_tables.sql`, `02_insert_sample_data.sql`, `03_crud_queries.sql`, `04_additional_queries.sql` (+ `05_extra_credit.sql` jika dikerjakan).
2. **Ambil screenshot** hasil setiap query (SELECT/COUNT dsb.) dari terminal Codespaces.
3. Simpan screenshot ke folder `screenshots/` di repo, lalu push ke GitHub.

> Catatan:
> - Database SQLite disimpan sebagai file `restaurant_reviews.db` di workspace Codespaces.
> - Untuk *cascade delete*, SQLite butuh `PRAGMA foreign_keys = ON;` (sudah ada di `00_sqlite_setup.sql`). Jalankan file ini setiap kali membuka sesi `sqlite3` baru.
> - Skrip disusun supaya kompatibel dan mudah dipahami. Jika dosen meminta DBMS lain (PostgreSQL/MySQL), struktur dan query tetap berlaku dengan penyesuaian kecil pada tipe data/auto-increment.
