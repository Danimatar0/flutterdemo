import 'package:flutterdemo/constants/importConstants.dart';
import 'package:flutterdemo/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class HTTPRequest {
  //static Future<DataModel> fetchUsers (int next,String orderBy) async {
  // var url=Uri.parse('/users/$next/$orderBy');
  static Future<dynamic> fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print("the body: ${response.body}");
      return json.decode(response.body);
    } else {
      throw Exception('NO users found !');
    }
  }

  static Future<List<UserModel>> getUsersSuggestions(String query) async {
    final dynamic respBody = await fetchUsers();
    final List users = (respBody);

    return users.map((json) => UserModel.fromJson(json)).where((user) {
      final nameLower = user.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  static Future<List<dynamic>> getUserSuggestions(String query, {required String key}) async {
    //print('query->$query'); //correct
    //List<Widget> temp = [];
    List temp = [];
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);
      //print('user list =>$users'); //correct
      // print(users.map((json) => print(json['name'].toLowerCase().contains(query.toLowerCase()))).toList());
      // print(query);
      temp = users
          .where((element) =>
              element[key].toLowerCase().contains(query.toLowerCase()))
          .map((json) => 
                json[key],
              )
          .toList();
      // print('temp->>$temp');
      print('done');
    } else {
      throw Exception('No Items Found');
    }
    print('temp->$temp');
    return temp;
  }
}

/*final queryParameters = {
  'param1': 'one',
  'param2': 'two',
};
final uri =
    Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
final response = await http.get(uri, headers: {
  HttpHeaders.authorizationHeader: 'Token $token',
  HttpHeaders.contentTypeHeader: 'application/json',
});*/
