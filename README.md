# Konfigurasi Neovim (LazyVim)

Konfigurasi pribadi Neovim berbasis [LazyVim](https://www.lazyvim.org/) yang dioptimalkan untuk pengembangan Python modern, produktivitas, dan alur kerja pengembangan web.

---

## ⚡ Fitur Utama

- **Python Development Stack:**
  - **LSP:** Microsoft Pyright resmi yang stabil, minim bug *cache*, dan otomatis mengenali struktur folder `src/` serta *virtual environment* (`.venv`).
  - **Linter & Formatter:** [Ruff](https://docs.astral.sh/ruff/) via `conform.nvim`. Otomatis mengurutkan `import`, membersihkan variabel/import yang tidak terpakai, dan merapikan indentasi sesuai standar PEP 8 setiap kali file disimpan (`:w`).
- **Python Runner Terintegrasi:** Menjalankan file Python langsung menggunakan `uv run` di split terminal bawah dengan shortcut `<leader>r` atau `<Space>r`.
- **System Clipboard Sync:** Tersinkronisasi langsung dengan clipboard sistem operasi (`unnamedplus`), sehingga teks yang di-copy (`y`) bisa langsung di-paste ke aplikasi lain dengan `Ctrl+V`.
- **Dokumentasi Otomatis:** [Neogen](https://github.com/danymat/neogen) dengan konvensi *Google Docstrings*.
- **Remote Development:** Dukungan pengeditan jarak jauh via `remote-nvim.nvim`.
- **Latihan Ketangkasan Vim:** Dilengkapi `vim-be-good` untuk melatih navigasi keyboard.

---

## 📋 Kebutuhan Sistem (Dependencies)

Sebelum memasang di komputer baru, pastikan beberapa perkakas pendukung berikut sudah terpasang:

- **Neovim** (versi `0.10.0` atau yang lebih baru)
- **Git**
- **C Compiler & Make** (`gcc`/`clang` dan `make`) untuk kompilasi parser Treesitter
- **Node.js & npm** (dibutuhkan oleh Mason untuk mengunduh Language Server seperti Pyright)
- **ripgrep** & **fd** (untuk pencarian file dan teks super cepat)
- **Nerd Font** (misal: *JetBrainsMono Nerd Font*, *FiraCode Nerd Font*) agar ikon antarmuka tampil sempurna
- **Python 3** & **[uv](https://docs.astral.sh/uv/)** (manajer paket Python super cepat)

---

## 🚀 Panduan Pemasangan di Komputer Baru

Jika Anda berpindah ke komputer atau laptop baru, ikuti langkah berikut:

### 1. Cadangkan Konfigurasi Lama (Jika Ada)
```bash
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

### 2. Kloning Repositori Ini
```bash
git clone https://github.com/satrijo/nvim.git ~/.config/nvim
```

### 3. Buka Neovim
```bash
nvim
```
> **Catatan:** Saat pertama kali dibuka, `lazy.nvim` akan otomatis mengunduh semua plugin, dan Mason akan memasang parser serta Language Server yang dibutuhkan. Tunggu hingga proses instalasi awal selesai, lalu restart Neovim sekali lagi.

---

## ⌨️ Pintasan Keyboard Utama

| Pintasan | Mode | Keterangan |
| :--- | :---: | :--- |
| `<leader>r` atau `<Space>r` | Normal | Menjalankan file Python saat ini dengan `uv run` |
| `:Run` atau `:PyRun` | Command | Alternatif perintah untuk menjalankan file Python |
| `<leader>cr` | Normal | Restart Language Server (`:LspRestart`) seketika |
| `<leader>cf` | Normal | Format dokumen secara manual via Conform (Ruff / Prettier / Stylua) |
| `<leader>cv` | Normal | Memilih *virtual environment* Python (*VenvSelect*) |
| `<leader>cn` | Normal | Membuat template docstring otomatis dengan Neogen |
| `<` / `>` | Visual | Menggeser blok kode ke kiri/kanan tanpa menghilangkan seleksi |
| `q` | Normal | Menutup jendela split output runner Python |

---

## 🔄 Pembaruan Konfigurasi

- **Mengunggah perubahan dari komputer saat ini:**
  ```bash
  cd ~/.config/nvim
  git add .
  git commit -m "chore: perbarui konfigurasi"
  git push
  ```
- **Mengambil perubahan terbaru di komputer lain:**
  ```bash
  cd ~/.config/nvim
  git pull
  ```
