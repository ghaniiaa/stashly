Ghania Larasati Nurjayadi Putri

2206083003

Tugas 7: Elemen Dasar Flutter

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