import 'package:flutter/material.dart';
import 'package:flutterdemo/config/routes/router.dart';
import 'package:flutterdemo/widgets/ContentCard.dart';
import 'package:flutterdemo/widgets/CustomBar.dart';
import 'package:flutterdemo/widgets/RoundedButton.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  Widget _buildButtonsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          new RoundedButton(text: "Navigate To Users", onTap: () { Navigator.pushNamed(context, usersScreen); },),
          new RoundedButton(text: "Navigate To About", onTap: () { Navigator.pushNamed(context, aboutScreen); },),
        ],
      ),
    );
  }
}
