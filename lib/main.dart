import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterdemo/redux/AppState.dart';
import 'package:flutterdemo/redux/reducer.dart';
import 'package:redux/redux.dart';
import 'config/routes/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Store<AppState> store = Store<AppState>(reducer, initialState: AppState());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.controller,
        initialRoute: router.homeScreen,
      ),
    );
  }
}
