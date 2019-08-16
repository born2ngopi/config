### Basic RPC(*Remote Procedure Call*) dengan go-lang

#### Basic crud

yang pertama kita buat ya itu basic **crud**. Silahkan masuk kedalam derektory go anda lalu buat sebuah file dengan nama rpc, lalu masuk ke dalam file tersebut

``` bash
mkdir rpc
cd rpc
```

buat file dengan nama `main.go` lalu kita import package fmt

``` go
package main

import "fmt"

func main{
    //main program
}
```

lalu buat sebuah struct dengan nama **User**

``` go
import "fmt"

type User struct{
    Name string
    Email string
    Age int
}

var database []User
//main function
```

variabel object database digunakan untuk menyimpan data dari slice `User`

> ingat nama struct dan properti didalamnya diawali dengan huruf kapital karana akan diexport

nah selanjutnya kita membuat sebuah fungsi mengambil data yang dicari data pada database

```go
var database []User

func GetUset(name string)User{
    var getUser User
    
    for _, val := range database{
        if val.Name == name{
            getUser = val
        }
    }
    return getUser
}

//func main()

```

GetUser adalah variabel object dari struct user, lalu kita ambil data dari variabel object `database` menggunakan `for-range`, lalu kita validasi apakah nilai dari `val.Name` sama dengan `name` yang kita dapat dari parameter.

selanjutnya kita buat fungsi untuk menambah data pada `database`

```go
//func GetUset()

func AddUser(user User)User{
    database = append(database,user)
    return user
}

//func main()
```

fungsi [append](https://golang.org/pkg/builtin/#append) digunakan untuk menambahkan element diakhir slice, fungsi ini membutuhkan dua parameter, parameter pertama adalah tujuan(atau slice), parameter kedua adalah data yang akan di tambahkan.

`slice = append(slice, elem1,elem2,...)`

selanjutnya kita buat fungsi untuk mengedit data di `database`.

``` go
//func AddUser()

func ChangeUser(nama string, user User)User{
 	var changeUser User
    
    for i, val := range database{
        if val.Name == nama{
            database[i] = User{user.Nama,user.Email,user.Age}
            changeUser = database[i]
        }
    }
    return changeUser
}

//func main()
```

oke setelah selesai kita buat fungsi delete user

```go
//func ChangeUser()

func DeleteUser(user User)User{
    var deleteUser User
    
    for i, val := range database{
        if val.Name == user.Name && val.Email == user.Email && val.Age == user.Age{
            database = append(database[:i],database[i+1:]...)
            deleteUser = user
        }
    }
    return deleteUser
}

//func main()
```

​	