import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fljson/photo.dart';
import 'package:fljson/API.dart';

void main() => runApp(Myapp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFetchData(),
    );
  }
}


class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  // List<Photo> list = List();
  var list = new List<Photo>();
  var isLoading = false;

  _fetchData() {
    setState(() {
      isLoading = true;
    });
    API.fetchData().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        list = list.map((model) => Photo.fromJson(model)).toList();
        isLoading = false;
      });
    });
  }

    initState() {
    super.initState();
    _fetchData();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(list[index].title));
          },
        )
        );
  }
}

