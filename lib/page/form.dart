import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:flutter/material.dart';

class DataBudget{
  static List<String> judulBudgetList = [];
  static List<int> nominalBudgetList = [];
  static List<String> jenisBudgetList = [];
}

class AddFormPage extends StatefulWidget {
  const AddFormPage({super.key});

  @override
  State<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  int _nominalBudget = 0;
  String jenisBudget = 'Pilih Jenis';
  List<String> listJenisBudget = ['Pilih Jenis','Pengeluaran', 'Pemasukan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      // Menambahkan drawer menu
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}