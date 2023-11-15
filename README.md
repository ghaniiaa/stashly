Ghania Larasati Nurjayadi Putri

2206083003

# Tugas 7: Elemen Dasar Flutter

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Jawab:

Stateless dan stateful widget adalah dua jenis widget yang sering digunakan dalam pengembangan aplikasi Flutter. Perbedaan utama antara keduanya adalah:

- Stateless widget adalah widget yang tidak memiliki keadaan (state) yang dapat berubah, sehingga tampilan dan perilakunya tetap sama sepanjang siklus hidupnya. Stateless widget hanya memiliki satu objek yang mewakili widget tersebut, dan tidak memerlukan metode khusus untuk membangun (build) atau memperbarui (update) widget tersebut. Contoh stateless widget adalah Text, Icon, dan RaisedButton.

- Stateful widget adalah widget yang memiliki keadaan (state) yang dapat berubah, sehingga tampilan dan perilakunya dapat berubah sesuai dengan keadaan tersebut. Stateful widget memiliki dua objek, yaitu objek StatefulWidget itu sendiri dan objek State yang mengelola keadaan widget tersebut. Stateful widget memerlukan metode khusus untuk membangun (build) dan memperbarui (update) widget tersebut, serta untuk menginisialisasi (init) dan mengakhiri (dispose) keadaannya. Contoh stateful widget adalah Checkbox, TextField, dan Slider.

Stateless dan stateful widget dapat digunakan sesuai dengan kebutuhan dan tujuan aplikasi yang dibangun. Secara umum, stateless widget lebih sederhana dan efisien, sedangkan stateful widget lebih kompleks dan fleksibel.

1. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

Jawab:

Berikut adalah daftar widget tersebut beserta fungsinya:

    - `MaterialApp`: Ini adalah widget di tingkat paling atas yang menyelubungi seluruh aplikasi Flutter dan menyediakan banyak fungsi penting seperti theming, navigasi, dan orientasi.
    
    - `Scaffold`: Widget ini menyediakan kerangka dasar untuk tata letak halaman di aplikasi material. Ini memberikan struktur untuk app bar, body, floating buttons, dan drawers.
    
    - `AppBar`: Ini adalah widget yang biasanya ditampilkan di bagian atas `Scaffold` dan biasanya menampilkan judul, leading, dan actions. Dalam kode Anda, Anda juga menggunakan `ShaderMask` di judul untuk memberikan efek gradien.
    
    - `ShaderMask`: Widget ini digunakan untuk menerapkan efek gradien pada child widget-nya dengan menggunakan shader yang dihasilkan dari `LinearGradient`.
    
    - `Text`: Menampilkan string teks dengan gaya yang bisa disesuaikan.
    
    - `SingleChildScrollView`: Widget ini menyediakan kemampuan scroll pada kontennya, yang berguna jika konten melebihi layar.
    
    - `Padding`: Widget ini digunakan untuk memberi padding di sekeliling widget anaknya, yaitu memberikan ruang kosong di sekelilingnya.
    
    - `Column`: Widget ini mengatur anak-anaknya secara vertikal. Dalam kode Anda, `Column` ini digunakan untuk menyusun teks dan grid secara vertikal di dalam `Padding`.
    
    - `GridView`: Widget ini menyediakan grid yang bisa di-scroll. Dalam kasus Anda, Anda menggunakan `GridView.count` untuk membuat grid dengan jumlah kolom yang tetap.
    
    - `Card`: Widget ini menyediakan material card dengan sudut yang membulat dan bayangan, memberikan efek elevasi.
    
    - `InkWell`: Widget yang menanggapi sentuhan dengan efek ripple. Dalam kode Anda, ini digunakan untuk mendeteksi tap pada kartu dan menampilkan `SnackBar`.
    
    - `Container`: Widget ini digunakan untuk mendekorasi, mengubah ukuran, atau memberikan margin atau padding pada child-nya. Dalam kasus ini, digunakan untuk menerapkan gradien pada background dari card.
    
    - `Icon`: Widget ini menampilkan ikon dari font yang diberikan, dalam hal ini, ikon dari Material Icons.
    
    - `SnackBar`: Widget yang muncul dari bawah layar untuk memberikan pesan singkat kepada pengguna. Ini digunakan di sini untuk memberikan feedback ketika kartu ditekan.
    
    - `LinearGradient`: Ini bukan widget tetapi merupakan properti yang biasanya digunakan bersama dengan widget seperti `Container` atau `DecoratedBox` untuk memberikan efek gradien.
    
    - `ScaffoldMessenger`: Widget yang digunakan untuk menampilkan `SnackBar`, dan dalam kasus ini, memberikan umpan balik ke pengguna.


1. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

Jawab:

* Membuat repository dan folder baru dengan nama applikasi "Stashly"

* Kemudain melakukan generate proyek Flutter dengan nama "stashly" 

```
flutter create stashly

```

* Selanjutnya, membuat file baru pada stashly/lib, dengan nama `inventory.dart`. File tersebut dibuat untuk melakukan setting baik UI maupun logic program.

* Melakukan setting applikasi, dengan mengcopy dan cut line dari `main.dart` ke file `inventory.dart`

* Melakukan penyesuaian terhadap class yang dibuat:

    - MyHomePage:
        
        ```
        class MyHomePage extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);
            final List<InventoryItem> items = [
            InventoryItem("Lihat Item", Icons.checklist, [Colors.blue, Colors.blueAccent]),
            InventoryItem("Tambah Item", Icons.add_shopping_cart, [Colors.green, Colors.teal]),
            InventoryItem("Logout", Icons.logout, [Colors.redAccent, Colors.red]), 
            ];
            @override
            Widget build(BuildContext context) {
            return Scaffold(
            backgroundColor: Colors.grey[200], // Set the background color of the app
            appBar: AppBar(
                ....
            )
            )
            }
        }
        ```

        MyHomePage adalah sebuah StatelessWidget yang bertindak sebagai halaman utama   dalam aplikasi Anda. Ini merupakan titik masuk utama UI yang Anda definisikan. Class ini mengatur tampilan dengan Scaffold dan mendefinisikan struktur UI termasuk AppBar, teks sambutan, dan grid dari InventoryCard. Dalam MyHomePage, Anda juga mendefinisikan daftar InventoryItem yang nantinya akan ditampilkan dalam GridView.

    - InventoryItem:

    ```
    class InventoryItem {
        final String name;
        final IconData icon;
        final List<Color> colors; // To hold gradient colors

        InventoryItem(this.name, this.icon, this.colors); // Constructor includes colors
        }
    ```

    InventoryItem adalah class yang berfungsi untuk menyimpan data yang berhubungan dengan item inventaris. Setiap InventoryItem memiliki sebuah name, icon, dan colors yang mendefinisikan nama, ikon, dan warna gradien untuk setiap kartu inventaris. Ini adalah sebuah model data yang Anda gunakan untuk menyimpan informasi yang kemudian digunakan oleh InventoryCard untuk menampilkan informasi tersebut.

    - InventoryCard:

    ```
    class InventoryCard extends StatelessWidget {
        final InventoryItem item;

        const InventoryCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
            ...)
            )
        }
    }
    ```

    InventoryCard adalah sebuah StatelessWidget yang merepresentasikan kartu inventaris dalam UI. Ini menggunakan data dari InventoryItem untuk membangun tampilan kartu dengan Card widget, yang di dalamnya ada InkWell untuk menangani ketukan, dan menampilkan ikon serta teks. Setiap InventoryCard merupakan representasi visual dari InventoryItem dengan style yang sesuai.


# Tugas 8

### 1. Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`

- **`Navigator.push()`**:
 
  - Fungsi ini digunakan untuk menavigasi ke halaman baru tanpa menghapus halaman sebelumnya dari stack navigasi.
 
  - Halaman yang dituju ditambahkan ke atas stack, dan pengguna dapat kembali ke halaman sebelumnya dengan menggunakan tombol back atau gestur navigasi.
 
  - **Contoh Penggunaan**: Misalnya, dalam aplikasi e-commerce, saat pengguna memilih produk dan kemudian menekan tombol untuk melihat detail produk, Anda akan menggunakan `Navigator.push()` untuk membawa mereka ke halaman detail produk. Pengguna dapat kembali ke halaman daftar produk dengan menekan tombol back.

- **`Navigator.pushReplacement()`**:
  
  - Metode ini digunakan untuk menavigasi ke halaman baru dengan mengganti (menghapus) halaman saat ini dari stack navigasi.
 
  - Halaman lama dihapus, dan pengguna tidak dapat kembali ke halaman tersebut dengan tombol back.
 
  - **Contoh Penggunaan**: Ini berguna dalam kasus seperti proses login. Setelah pengguna berhasil login, Anda mungkin ingin membawa mereka ke halaman beranda dan menghapus halaman login dari stack sehingga mereka tidak kembali ke halaman login saat menekan tombol back.

### 2. Layout Widgets pada Flutter

- **`Column` dan `Row`**:
 
  - `Column` mengatur child widgets secara vertikal, dan `Row` mengatur child widgets secara horizontal.
  
  - **Konteks Penggunaan**: Digunakan saat Anda ingin menampilkan elemen dalam orientasi vertikal atau horizontal, seperti daftar item atau tombol dalam satu baris.

- **`Stack`**:
 
  - Memungkinkan widgets ditumpuk di atas satu sama lain.
 
  - **Konteks Penggunaan**: Berguna untuk overlay widgets, seperti menempatkan teks di atas gambar atau membuat efek tertentu yang membutuhkan penumpukan elemen.

- **`Container`**:
 
  - Widget yang memungkinkan penyesuaian dekorasi, padding, margin, dan banyak lagi.
 
  - **Konteks Penggunaan**: Digunakan hampir di mana saja untuk menambahkan spasi, dekorasi, atau untuk mengontrol ukuran dan posisi widget lain.

- **`Flex` dan `Expanded`**:
  
  - `Flex` memungkinkan layout yang lebih kompleks dengan menggunakan konsep flexbox, dan `Expanded` mengisi ruang yang tersedia.
 
  - **Konteks Penggunaan**: Ketika Anda ingin child widgets memiliki proporsi ukuran yang spesifik atau ingin memanfaatkan ruang yang tersedia secara efisien.

### 3. Elemen Input pada Form

Dalam contoh kode Anda:

- **`TextFormField`**:
  
  - Digunakan untuk memasukkan teks, seperti nama produk, harga, dan deskripsi.
  
  - **Alasan Penggunaan**: Memberikan input teks yang mudah bagi pengguna dan mendukung validasi input, yang penting untuk memastikan bahwa data yang masuk valid dan lengkap.

### 4. Penerapan Clean Architecture pada Aplikasi Flutter

Clean Architecture adalah konsep arsitektur perangkat lunak yang memisahkan kekhawatiran kode menjadi lapisan yang berbeda:

- **Lapisan Presentasi**:
 
  - Menangani UI dan logika tampilan. Di Flutter, ini termasuk widgets dan state management.
  
  - **Implementasi**: Gunakan `Provider`, `Bloc`, atau `Riverpod` untuk mengelola state.

- **Lapisan Bisnis**:
  
  - Berisi logika bisnis aplikasi. Ini independen dari framework.
 
  - **Implementasi**: Buat class dan fungsi yang mengelola logika aplikasi, seperti pengelolaan data pengguna, pengelolaan produk, dll.

- **Lapisan Data**:
 
  - Menangani operasi data seperti panggilan API, operasi database, dan penyimpanan lokal.
 
  - **Implementasi**: Gunakan package seperti `http`, `sqflite`, atau `shared_preferences` untuk implementasi lapisan data.

- **Abstraksi**:

  - Menggunakan abstraksi untuk memastikan lapisan tidak bergantung langsung satu sama lain, tetapi berkomunikasi melalui interfaces atau abstraksi.

  - **Implementasi**: Tentukan interfaces atau contracts yang harus diikuti oleh setiap lapisan.

Mengadopsi Clean Architecture membantu dalam memelihara dan menguji kode, serta memudahkan dalam proses pengembangan karena setiap lapisan dapat dikembangkan dan diuji secara independen.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

Berikut adalah ringkasan langkah demi langkah dari tutorial yang Anda minta, disesuaikan dengan kode dan konteks aplikasi Flutter Anda:

### Tutorial: Menambahkan Drawer Menu Untuk Navigasi

**Langkah 1: Membuat Berkas `left_drawer.dart`**

1. Buat file baru dengan nama `left_drawer.dart` di direktori `widgets`.

2. Tambahkan kode berikut ke dalam `left_drawer.dart`:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:stashly/inventory.dart'; // Sesuaikan dengan struktur project Anda
   import 'package:stashly/product_list_page.dart'; // Sesuaikan dengan struktur project Anda

   class LeftDrawer extends StatelessWidget {
     final List<Product> products;
     final Function(Product) onProductAdded;

     const LeftDrawer({Key? key, required this.products, required this.onProductAdded}) : super(key: key);

     @override
     Widget build(BuildContext context) {
       return Drawer(
         child: ListView(
           children: [
             const DrawerHeader(
               // Kustomisasi header drawer
             ),
             ListTile(
               leading: const Icon(Icons.home_outlined),
               title: const Text('Halaman Utama'),
               onTap: () {
                 Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => MyHomePage(),
                     ));
               },
             ),
             ListTile(
               leading: const Icon(Icons.add_shopping_cart),
               title: const Text('Tambah Item'),
               onTap: () {
                 // Routing ke halaman form produk
               },
             ),
             // Tambahkan lebih banyak ListTile jika diperlukan
           ],
         ),
       );
     }
   }
   ```

**Langkah 2: Menambahkan Drawer ke `MyHomePage`**

1. Impor `left_drawer.dart` di file `inventory.dart` dimana `MyHomePage` didefinisikan.

2. Tambahkan `LeftDrawer` sebagai drawer di `Scaffold` di `MyHomePage`:

   ```dart
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Stashly'),
       ),
       drawer: LeftDrawer(products: _products, onProductAdded: _addNewProduct),
       // Sisa dari body Scaffold
     );
   }
   ```

### Tutorial: Menambahkan Form dan Elemen Input

**Langkah 1: Membuat `InventoryFormPage`**

1. Buat file baru `inventorylist_form.dart` di direktori `lib`.

2. Tambahkan struktur dasar `StatefulWidget` dengan `Scaffold` di dalamnya, termasuk AppBar dan body `Form`.

   ```dart
   class InventoryFormPage extends StatefulWidget {
     final Function(Product) onProductAdded; 

     const InventoryFormPage({super.key, required this.onProductAdded});

     @override
     State<InventoryFormPage> createState() => _InventoryFormPageState();
   }

   class _InventoryFormPageState extends State<InventoryFormPage> {
     final _formKey = GlobalKey<FormState>();
     String _name = "";
     int _price = 0;
     String _description = "";

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text('Tambah Produk'),
         ),
         body: Form(
           key: _formKey,
           child: SingleChildScrollView(
             child: Column(
               // Tambahkan TextFormField dan tombol simpan di sini
             ),
           ),
         ),
       );
     }
   }
   ```

**Langkah 2: Menambahkan Field dan Tombol pada Form**

1. Di dalam `Column` di body `Form`, tambahkan `TextFormField` untuk nama produk, harga, dan deskripsi.

2. Tambahkan tombol `ElevatedButton` untuk menyimpan produk.

   ```dart
   Padding(
     padding: EdgeInsets.all(8.0),
     child: TextFormField(
       // Konfigurasi untuk nama, harga, dan deskripsi
     ),
   ),
   // Tombol simpan
   ```

**Langkah 3: Menampilkan Pop-up Saat Produk Disimpan**

1. Di dalam `onPressed` dari tombol simpan, tambahkan `showDialog` dengan `AlertDialog` untuk menampilkan informasi produk yang disimpan.

**Langkah 4: Menambahkan Navigasi pada Tombol**

1. Pada `onTap` dari setiap `InkWell` atau `ListTile` di `LeftDrawer`, tambahkan `Navigator.push` atau `Navigator.pushReplacement` untuk navigasi ke halaman yang sesuai.

2. Pastikan `Navigator.push` digunakan untuk navigasi ke `InventoryFormPage` sehingga pengguna dapat kembali ke halaman sebelumnya.