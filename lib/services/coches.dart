import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Coaches {
  getCoach(value) async {
    // String url = 'http://10.0.2.2:8000/api/coaches/${value}';
    String url = 'https://jsonplaceholder.typicode.com/photos';

    var header = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Connection": "Keep-Alive",
    };

    print(url);
    final response = await http.get(Uri.parse(url), headers: header);
    return jsonDecode(response.body);
  }
}
