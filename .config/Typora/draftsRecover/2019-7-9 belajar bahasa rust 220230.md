# Belajar Bahasa RUST

### **Berkenalan dengan RUST**

**RUST** adalah salah satu bahasa pemrograman yang dapat membantu kita dalam membuat subuah perangkat lunak yang lebih cepat dan handal. RUST memberi kita opsi untuk mengontrol detail tingkat rendah (seperti penggunaan memori) yang tidak terlalu rumit.

### Installasi RUST

Sebelum kita mengenal bahasa ini lebih jauh ada baiknya kita juga menginstallnya terlebh dahulu, panduan installasi bisa dilihat [disini](https://www.rust-lang.org/tools/install).

#### installasi `rustup` di linux dan macOS

rust di install dan dikelola oleh `rustup` ,installasi rustup di oprasi sistem ini terbilang mudah, anda tinggal mengetikkan baris perintah ini di terminal.

``` bash
curl https://curl https://sh.rustup.rs -sSf | sh
```

bila sudah selesai selanjutnya adalah mengkonfigurasi `PATH` evironment variabel. di RUST semua tools di install di `~/.cargo/bin` direktori

`linux` dengan bash shell

``` bash
echo  export PATH="$HOME/.cargo/bin:$PATH"
```

``` bash
source ~/.bashrc
```



