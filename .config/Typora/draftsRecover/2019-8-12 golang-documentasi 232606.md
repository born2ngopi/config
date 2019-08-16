# Go Tutorial

## Apa Itu Go?

go adalah bahasa pemrograman yang dibuat oleh google pada tahun 2007 oleh Robert Griesemer, Rob Pike, and Ken Thompson. Go adalah bahasa static-typing, memiliki sintax yang mirip dengan C. Go juga memiliki banyak sekali standart library sendiri.

### Fitur-fitur dari Go

+ dukungan seperti bahasa dinamis, contoh `x:=0`
+ waktu compile yang cepat
+ support concurensi bawaan
+ program Go sederhana, ringkas, dan aman

> tapi ada hal yang sangat aku suka dari go yaitu di bagian error handling ***just kidding :)***.
>
> `if err != nill` kalian akan sering melihat kode ini ketika berinstraksi dengan go.

program go disimpan dengan extensi `.go`.

setup workspace yang disakarankan adalah `go/src/github.com/username-github/`



## Hello World

sebelum kita menyelam lebih dalam, ada baiknya untuk melakukan ritual nenek moyang programer.

silah kan buat file hello.go.

contoh workspace saya `go/src/github.com/needkopi/belajar/hello.go`

lalu ketikan kode berikut

``` go
package main

import "fmt"

func main(){
    fmt.Println("hello world");
}
```

lalu jalankan file go tersebut dengan perintah `go run main.go` dan lihat apa yang terjadi :).

### Penjelasan Kode Program

+ baris pertama dalam bahasa Go adalah pendefinisian nama peket dimana kode ini seharusnya terletak, karena program Go berjalan dalam paket. sebagai contoh kode di atas `package main` berarti kita mendefinisikan nama paket main, dimana main adalah titik awal untuk menjalankan program. kode Golang setidaknya harus memiliki satu package main.
+ baris selanjutnya yaitu `import "fmt"` yaitu perintah preprocessor yang memberitahu compiller untuk memasukkan file yang ada di paket fmt.
+ `func main()` merupakan fungsi utama yang akan di eksekusi pertama kali ketika program dijalankan.
+ 