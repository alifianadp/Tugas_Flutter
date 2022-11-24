# <b>Tugas 7</b>

## Pertanyaan
1. <b>Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.<br></b>
    - <u>Stateless Widget</u> adalah widget yang hanya menampilkan sesuatu secara statis (tidak berubah-ubah). Hal ini menyebabkan tidak perlu adanya mekanisme untuk memantau state perubahan.<br>
    - <u>Stateful Widget</u> adalah widget yang dapat menampilkan sesuatu secara dinamis (berubah-ubah). Widget ini dapat merespon interaksi user, men-tracking perubahan data, dan merender ulang layout sesuai dengan data yang terubah.
2. <b>Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.<br></b>
Widget yang saya gunakan dalam proyek ini, sebagai berikut:
    - AppBar -> untuk menampilkan title dari aplikasi
    - Row & Column -> untuk layout widget perbaris/perkolom
    - Floating Action Button -> untuk menampilkan Button Decrement dan Increment
    - Container -> untuk menampung widget Button Decrement dan Increment
    - Text -> untuk menampilkan teks salah satunya "Page Counter" pada appbar

3. <b>Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.<br></b>
Fungsi setState() adalah fungsi yang digunakan untuk memberitahukan framework bahwa internal state dari object telah berubah dan mempengaruhi user interface, sehingga framework perlu melakukan rebuild untuk State object tersebut.<br>
Variabel yang terdampak adalah statefulWidgets karena variabel ini dapat berubah-ubah.

4. <b> Jelaskan perbedaan antara const dengan final.<br></b>
    - <u>const</u> merupakan value yang harus diketahui saat compile-time dan tidak dapat diubah-ubah. Oleh karena itu, nilainya harus sudah ditetapkan sebelum run-time<br>
    - <u>final</u> merupakan value yang harus diketahui saat run-time dan tidak dapat diubah-ubah. Oleh karena itu, berbeda dengan const, nilai final tidak harus ditetapkan sebelum run-time.

5. <b>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.<br></b>
    1. Membuat sebuah program Flutter baru dengan nama counter_7.<br>
    Menjalankan kode `flutter create counter_7` di terminal
    2. Mengubah tampilan program menjadi seperti berikut.<br>
    ![Tampilan_Program](https://user-images.githubusercontent.com/99129519/200991705-868dfb2e-20d0-4e3c-af8b-59ace1c05126.png)
        - Mengganti title dari aplikasi dengan menggunakna kode berikut<br>
    `home: const MyHomePage(title: 'Program Counter'),`
        - Membuat fungsi untuk mengembalikan "GENAP" atau "GANJIL"
            ```
            String _numberCheck() {
                if (_counter % 2 == 0) {
                return "GENAP";
                }
                else {
                return "GANJIL";
                }
            }
            ```
        - Menambahkan style untuk penampilan kata "GENAP" dan "GANJIL"<br>
        `style: TextStyle(color: _numberCheck() == "GENAP" ? Colors.red : Colors.cyan),`
        - Menambahkan tampilan button dan menghubungkannya ke sebuah fungsi
            ```
            floatingActionButton: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Visibility(
                    visible: _counter == 0 ? false : true,
                    child: (
                        FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: "Decrement",
                        child: const Icon(Icons.remove),
                        )
                    )
                    ),
                    FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: "Increment",
                    child: const Icon(Icons.add),
                    )
                ],
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            ```


    3.  Mengimplementasikan logika berikut pada program.<br>
        - <u>Tombol + menambahkan angka sebanyak satu satuan.<br></u>
        Membuat fungsi baru, ketika tombol + ditekan
            ```
            void _incrementCounter() {
                setState(() {
                _counter++;
                });
            }
            ```
    
        - <u>Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.<br></u>
        Membuat fungsi baru, ketika tombol - ditekan
            ```
            void _decrementCounter() {
                setState(() {
                if (_counter != 0) {
                    _counter--;
                }
                });
            }
            ```

# <b>Tugas 8</b>

## Pertanyaan

1. <b>Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.</b><br>
    - Navigator.push --> Menambahkan route baru ke stack routes yang diatur oleh navigator, tanpa menghapus route lama. Sehingga, hal tersebut memungkinkan user untuk kembali ke halaman sebelumnya.
    - Navigator.pushReplacement --> Mengganti route dari navigator ke route baru dan menghapus route lama ketika route baru selesai dimuat. Sehingga, hal tersebut tidak memungkinkan user untuk kembali ke halaman sebelumnya.
2. <b>Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.</b><br>
    - AppBar -> untuk menampilkan title dari aplikasi
    - Row & Column -> untuk layout widget perbaris/perkolom
    - Floating Action Button -> untuk menampilkan Button Decrement dan Increment
    - Container -> untuk menampung widget Button Decrement dan Increment
    - Text -> untuk menampilkan teks salah satunya "Page Counter" pada appbar
    - Drawer -> untuk navigasi ke page yang berbeda pada app
    - TextFormField -> untuk mendapatkan input berupa string
    - DropdownButton -> untuk mendapatkan input dari pilihan yang telah disediakan
    - TextButton -> untuk menampilkan Text yang berupa button
    - Expanded -> untuk memperluas bidang column/row
3. <b>Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).</b><br>
    - onPressed() --> eksekusi sebuah function ketika button ditekan
    - onClicked() --> eksekusi sebuah function ketika property diklik
    - onChanged() --> eksekusi sebuah function ketika TextField vallue berubah
    - onClose() --> eksekusi sebuah function ketika Sink ditutup
    - onSaved() --> eksekusi sebuah function ketika Form disimpan melalui FormState.save

4. <b>Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.</b><br>
    Navigator mengatur halaman aplikasi menggunakan stack. Apabila kita mengganti halaman, maka navigator akan menambahkan route baru ke dalam stack dan memuat halaman tersebut.<br>
5. <b>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.</b><br>
    1. <u>Menambahkan tiga tombol navigasi (halaman counter, halaman form, halaman yang menampilkan data budget) pada drawer/hamburger. <br></u>
        - Membuat file `drawer.dart` di folder `lib`
        - Menambahkan ListView untuk navigasi ke halaman counter, halaman form, halaman yang menampilkan data budget
            ```
            ListTile(
                title: const Text('counter_7'),
                onTap: () {
                    // Route menu ke halaman utama
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                },
                ),
                ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AddFormPage()),
                    );
                },
                ),
                ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ShowDataPage()),
                    );
                },
                ),
            ```
        - Menambahkan drawer ke setiap page, dengan menambahkan code berikut.<br>
            `
            drawer: const AppDrawer(),
            `

    2. <u>Menambahkan halaman form<br></u>
        - Menambahkan elemen input dengan tipe data String berupa judul budget & int berupa nominal budget.<br>
            Membuat variabel dalam kelas `_AddFormPageState`
            ```
            String _judulBudget = "";
            int _nominalBudget = 0;
            ```
            Menambahkan elemen input judul budget
            ```
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul",
                      labelText: "Judul Budget",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judulBudget = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judulBudget = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul Budget tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
            ```
            Menambahkan elemen input nominal budget
            ```
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nominal",
                      labelText: "Nominal Budget",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nominal diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nominalBudget = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nominalBudget = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal Budget tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
            ```
        - Menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran.<br>
            Membuat variabel dalam kelas `_AddFormPageState`
            ```
            String jenisBudget = 'Pilih Jenis';
            List<String> listJenisBudget = ['Pilih Jenis','Pengeluaran', 'Pemasukan'];
            ```
            Menambahkan elemen dropdown tipe budget
            ```
                ListTile(
                  title: const Text(
                    'Jenis Budget (Pengeluaran/Pemasukan)',
                  ),
                  trailing: DropdownButton(
                    value: jenisBudget,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listJenisBudget.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenisBudget = newValue!;
                      });
                    },
                  ),
                ),
            ```
        - Menambahkan button untuk menyimpan budget.<br>
            Membuat class untuk menyimpan data form di file `form.dart`
            ```
            class DataBudget{
                static List<String> judulBudgetList = [];
                static List<int> nominalBudgetList = [];
                static List<String> jenisBudgetList = [];
            }
            ```
            Menambahkan TextButton & menyimpan data yang didapatkan melalui Form
            ```
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DataBudget.judulBudgetList.add(_judulBudget);
                      DataBudget.nominalBudgetList.add(_nominalBudget);
                      DataBudget.jenisBudgetList.add(jenisBudget);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: ListView(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                const Center(child: Text('Data Berhasil Ditambahkan')),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
            ```
    3. <u>Menambahkan halaman data budget<br></u>
        Membuat variabel yang berisi data input BudgetList
        ```
        List<String> judulBudgetList = DataBudget.judulBudgetList;
        List<int> nominalBudgetList = DataBudget.nominalBudgetList;
        List<String> jenisBudgetList = DataBudget.jenisBudgetList;
        ```
        Menampilkan semua judul, nominal, dan tipe budget yang telah ditambahkan pada form.<br>
        ```
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Expanded(
                child: ListView.builder(
                itemCount: judulBudgetList.length,
                itemBuilder: (context, index) {
                    return Card(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                Text(
                                judulBudgetList[index],
                                style: TextStyle(fontSize: 20.0),
                                ),
                            ],
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(nominalBudgetList[index].toString()),
                                Text(jenisBudgetList[index]),
                            ],
                            ),
                        ),
                        ],
                    ),
                    );
                },
                ),
            )
            ],
        ),
        ```
        
# <b>Tugas 8</b>

## Pertanyaan

1. <b>Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</b><br>
  Ya, hal tersebut dapat dilakukan dengan menngunakan library dari flutter (code generation library) yaitu json_serializeable. Penggunaan metode tersebut sesuai untuk data json dengan skala sedang ke besar, sedangkan untuk skala kecil penggunaan model lebih efektif dan mudah dilakukan.<br>
2. <b>Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.</b><br>
    - AppBar -> untuk menampilkan title dari aplikasi
    - Row & Column -> untuk layout widget perbaris/perkolom
    - Floating Action Button -> untuk menampilkan Button Decrement dan Increment
    - Container -> untuk menampung widget Button Decrement dan Increment
    - Text -> untuk menampilkan teks salah satunya "Page Counter" pada appbar
    - Drawer -> untuk navigasi ke page yang berbeda pada app
    - TextFormField -> untuk mendapatkan input berupa string
    - DropdownButton -> untuk mendapatkan input dari pilihan yang telah disediakan
    - TextButton -> untuk menampilkan Text yang berupa button
    - Expanded -> untuk memperluas bidang column/row
    - Inkwell -> untuk widget dapat diklik 
    - Future builder -> untuk mengolah data dari hasil konversi json
    - Async -> untuk menerima http response yang akan dikonversi ke json
    - Stack -> untuk membuat widget-widget dapat saling bertumpuk
    - Center -> untuk membuat child berada di tengah
    - RichText -> untuk memuat tampilan text yang berbeda-beda
    - Align -> untuk membuat child berada di tempat yang diinginkan

3. <b>Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.</b><br>
    Pertama buat model. Kemudian tambahkan dependensi HTTP dan buat HTTP request ke web service. Lalu, lakukan decode response ke dalam bentuk json dan konversi data json menjadi object. Terakhir gunakan widget Future Builder untuk menampilkan data sebelumnya.<br>

4. <b>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.</b><br>
  1. <u>Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist.<br></u>
      - Menambahkan kode berikut pada file `drawer.dart`
      ```
      ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowWatchList()),
                );
              },
            ),
      ```
  2. <u>Membuat satu file dart yang berisi model mywatchlist.<br></u>
      - Membuat file `mywatchlist_model.dart` pada folder `model` di dalam foler `lib`
      - Menempelkan hasil kode dari Quicktype
      - Menambahkan dependensi HTTP
  3. <u>Menambahkan halaman mywatchlist<br></u>
      - Membuat file `mywatchlist.dart` pada folder `page` di dalam foler `lib`
      - File akan melakukan pengambilan data dari `https://tugas2-catalog-pbp.herokuapp.com/mywatchlist/json/` dan menampilkan Judul Watch List yang ada
      - Ketika Judul Watch List ditekan maka akan mengarahkan ke halaman detail
  4. <u>Menambahkan halaman detail untuk setiap mywatchlist<br></u>
      - Membuat file `watchlistdetail.dart` pada folder `page` di dalam foler `lib`
      - Halaman ini akan menampilkan detail dari Judul Watch List yang ditekan
  5. <u>Menambahkan tombol untuk kembali ke daftar mywatchlist<br></u>
      - Menambahkan kode berikut pada file `watchlistdetail.dart`
      ```
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
        width: double.infinity,
        height: 40,
        child: TextButton(
            onPressed: () {
            Navigator.pop(context);
            },
                child: const Text('Back'),
            ),
        ),
      )
      ```

        