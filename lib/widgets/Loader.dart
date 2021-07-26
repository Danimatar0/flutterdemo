import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
                height:MediaQuery.of(context).size.height*0.15,
                color: Colors.blueAccent,
                child: Center(
                  child: new CircularProgressIndicator(),
                ),
              ),
      );
  }
}