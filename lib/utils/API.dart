import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future fetchData() {
    var url = baseUrl + "/photos";
    return http.get(url);
  }
}