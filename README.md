# Pertanyaan
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