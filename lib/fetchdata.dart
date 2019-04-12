import 'dart:convert';

import 'package:fljson/models/photo.dart';
import 'package:fljson/utils/API.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
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
        ));
  }
}
