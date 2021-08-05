import 'package:flutter/material.dart';
import 'package:flutterdemo/config/routes/router.dart';
import 'package:flutterdemo/widgets/ContentCard.dart';
import 'package:flutterdemo/widgets/CustomBar.dart';
import 'package:flutterdemo/widgets/RoundedButton.dart';
import 'package:flutterdemo/widgets/Widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_customPopupBottomMenu(context)],
      ),
      body: Stack(
        children: <Widget>[
          CustomBar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(context),
                  Expanded(child: ContentCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customPopupBottomMenu(BuildContext context) {
    //TODO Edit elements and overirde onSelected tag
    return PopupMenuButton(
      itemBuilder: (BuildContext bc) => [
        PopupMenuItem(child: Text("New Chat"), value: "/newchat"),
        PopupMenuItem(child: Text("New Group Chat"), value: "/new-group-chat"),
        PopupMenuItem(child: Text("Settings"), value: "/settings"),
      ],
      onSelected: (route) {
        print(route.toString());
        // Note You must create respective pages for navigation
        // Navigator.pushNamed(context, route.toString());
      },
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          new RoundedButton(
            text: "Navigate To profile",
            onTap: () {
              Navigator.pushNamed(context, profilescreen);
            },
          ),
          new RoundedButton(
            text: "Navigate To search",
            onTap: () {
              Navigator.pushNamed(context, aboutScreen);
            },
          ),
        ],
      ),
    );
  }
}
