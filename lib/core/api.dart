import 'package:flutterdemo/constants/importConstants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class HTTPRequest {
  static Future<dynamic> fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      json.decode(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('NO users found !');
    }
  }

  static Future<List<Widget>> getUserSuggestions(
      String query, List<dynamic> users,
      {required String key}) async {
    List<Widget> temp = [];
    try {
      for (var item in users) {
        print(item['title']);
        if (item['title']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          temp.add(ListTile(
            title: Text(item['title']),
          ));
        }
      }
    } catch (e) {
      print(e);
    }
    return temp;
  }
}
