import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:counter_7/model/mywatchlist_model.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/watchlistdetail.dart';

class ShowWatchList extends StatefulWidget {
  const ShowWatchList({Key? key}) : super(key: key);

  @override
  _ShowWatchListState createState() => _ShowWatchListState();
}

class _ShowWatchListState extends State<ShowWatchList> {
  Future<List<MyWatchList>> fetchWatchList() async {
        var url = Uri.parse('https://tugas2-catalog-pbp.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object MyWatchList
        List<MyWatchList> listMyWatchList = [];
        for (var d in data) {
        if (d != null) {
            listMyWatchList.add(MyWatchList.fromJson(d));
        }
        }

        return listMyWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Watch List'),
      ),
      // Menambahkan drawer menu
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: fetchWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Tidak ada Watch List :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> InkWell(
                      onTap:(){
                          Details.getFields = snapshot.data![index].fields;
                          Navigator.push(
                              context, 
                              MaterialPageRoute(builder:(context) => const WatchListDetail())
                          );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0
                            )
                            ]
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        )
                      )
                )
              );
            }
            }
        }
      ),
    );
  }       
}