import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutterdemo/config/routes/router.dart';
import 'package:flutterdemo/constants/globals.dart' as globals;
import 'package:flutterdemo/core/api.dart';
import 'package:flutterdemo/core/api.dart';
import 'package:flutterdemo/models/models.dart';
import 'package:flutterdemo/redux/action.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  ScrollController controller = ScrollController();
  List<Widget> listtiles = [];
  late List users;
  var term = '';
  var tilesLength;

  void loadUsers() async {
    dynamic response = await HTTPRequest.fetchUsers();
    users = response;
    setState(() {
      listtiles = users
          .map((e) => ListTile(
                title: Text(e['title']),
              ))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SafeArea(
                top: true,
                child: TextField(
                  enableSuggestions: true,
                  onChanged: (value) async {
                    listtiles = [];
                    var temp = await HTTPRequest.getUserSuggestions(
                        value, users,
                        key: 'title');
                    listtiles = temp;
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                  child: ListView(
                children: listtiles,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
