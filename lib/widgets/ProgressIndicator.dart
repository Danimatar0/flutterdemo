import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/globals.dart';

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading=bool.hasEnvironment(globalStore.state.getValueFromKey('isLoading').toString());
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}