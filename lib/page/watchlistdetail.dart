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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20, ),
        padding: const EdgeInsets.all(20.0),
        child: Stack (
          children: [
            Center(
              heightFactor: 0.5, 
                child: Container(
                    // padding: EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 100, ),
                    child: Text(
                        Details.fetcher.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,),
                    ),
                ),
            ),

            RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black,),
                  children: [
                      const TextSpan(text:'Release Date:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: Details.fetcher.releaseDate), 
                      const TextSpan(text: '\n', ),
                      const TextSpan(text:'\nRating:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: Details.fetcher.rating.toString()), 
                      const TextSpan(text: '\n', ),
                      const TextSpan(text:'\nStatus:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                      if (Details.fetcher.watched == 'Yes') TextSpan(text: 'watched'),
                      if (Details.fetcher.watched == 'No') TextSpan(text: 'unwatched'),
                      const TextSpan(text: '\n', ),
                      const TextSpan(text:'\nReview:  ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: Details.fetcher.review), 
                  ],
              ),
            ),

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
        ]
        ),
      ),
    );
  }
}

class Details {
  static late Fields getFields;
  static Fields get fetcher => getFields;
}