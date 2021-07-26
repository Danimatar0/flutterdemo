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
  var term;
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
  Widget build(BuildContext context) {
    // loadUsers();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SafeArea(
                top: true,
                child: TextField(
                  onChanged: (value) async {
                    setState(() {
                      term = value;
                    });
                  },
                ),
              ),
              FutureBuilder(
                initialData: [],
                future: HTTPRequest.getUserSuggestions(term, key: 'title'),
                builder: (context, AsyncSnapshot snapshot) {
                  //print('snapshot -> $snapshot');
                  if (ConnectionState.active != null && !snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (ConnectionState.done != null &&
                      snapshot.hasError) {
                    return Center(child: Text('Something Went Wrong:('));
                  }

                  var myData = snapshot.data;
                  //print('snapshot data-> $myData');
                  return Expanded(
                    child: ListView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          String title = (myData as dynamic)[index];
                          print('title->$title');
                          return ListTile(title: Text(title));
                        }),
                  );
                },
              )
            ],
          ),
          // child: TypeAheadField<List>(
          //   hideSuggestionsOnKeyboardHide: false,
          //   textFieldConfiguration: TextFieldConfiguration(
          //     controller: controller,
          //     autofocus: true,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(Icons.search),
          //       border: OutlineInputBorder(),
          //       hintText: 'Search Name',
          //     ),
          //   ),
          //   suggestionsCallback: (pattern) async {
          //       return await HTTPRequest.getUserSuggestions(pattern);
          //   },
          //   itemBuilder: (context, UserModel? suggestion) {
          //     final user = suggestion!;
          //     print("REACHED");
          //     print(user.name);
          //     return Text(user.name);
          //     /*return ListTile(
          //         leading: Icon(Icons.people),
          //         title: Text(user.name),
          //     );*/
          //   },
          //   transitionBuilder: (context, suggestionsBox, controller) {
          //     return suggestionsBox;
          //   },
          //   noItemsFoundBuilder: (context) => Container(
          //     height: 100,
          //     child: Center(
          //       child: Text(
          //         'No Users Found.',
          //         style: TextStyle(fontSize: 24),
          //       ),
          //     ),
          //   ),
          //   onSuggestionSelected: (UserModel? suggestion) {
          //     final user = suggestion!;

          //     ScaffoldMessenger.of(context)
          //       ..removeCurrentSnackBar()
          //       ..showSnackBar(SnackBar(
          //         content: Text('Selected user: ${user.name}'),
          //       ));
          //   },
          // ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Flutter Demo'),
    );
  }

  void onChangedField(String value) {
    final snackBar = SnackBar(content: Text('$value'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
