import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/model/movie_container.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Result> moviesList = [];

  Future<List<Result>>? getData() async {
    Map data = {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting",
    };
    String url = "https://hoblist.com/movieList";
    String body = json.encode(data);
    http.Response res = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": 'application/json',
      },
      body: body,
    );
    Map<String, dynamic> jsonData = jsonDecode(res.body);
    jsonData["result"].forEach((element) {
      Result result = Result();
      result = Result.fromJson(element);
      moviesList.add(result);
    });
    return moviesList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(""),
            ),
            ListTile(
              title: Text("Company Info"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('''Company: Geeksynergy Technologies Pvt Ltd
Address: Sanjayanagar, Bengaluru-56
Phone: XXXXXXXXX09
Email: XXXXXX@gmail.com'''),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK")),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieContianer(result: moviesList[index]);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
