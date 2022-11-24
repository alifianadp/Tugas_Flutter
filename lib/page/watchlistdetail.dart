import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:counter_7/model/mywatchlist_model.dart';

class WatchListDetail extends StatefulWidget {
  const WatchListDetail({Key? key}) : super(key: key);

  @override
  _WatchListDetailState createState() => _WatchListDetailState();
}

class _WatchListDetailState extends State<WatchListDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      // Menambahkan drawer menu
      drawer: const AppDrawer(),
      body: Column(children: [
        Text(Details.fetcher.title),
        Text('Release Date : ' + Details.fetcher.releaseDate),
        Text('Rating : ' + Details.fetcher.rating.toString()),
        Text('Status : ' + Details.fetcher.watched),
        Text('Review : ' + Details.fetcher.review),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ]),
    );
  }
}

class Details {
  static late Fields getFields;
  static Fields get fetcher => getFields;
}