
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/screens/about.dart';
import 'package:flutterdemo/screens/login.dart';
import 'package:flutterdemo/screens/users.dart';

const String homeScreen='home';
const String aboutScreen='about';
const String loginScreen='login';
const String usersScreen='users';

Route<dynamic> controller(RouteSettings settings){
  switch (settings.name) {
    case loginScreen:
          return MaterialPageRoute(builder: (context) => LoginScreen(title:'Login Screen'));
    case homeScreen:
          return MaterialPageRoute(builder: (context) => HomeScreen(title:'Home Screen'));
    case aboutScreen:
          return MaterialPageRoute(builder: (context) => AboutScreen(title:'About Screen')) ;
    case usersScreen:
          return MaterialPageRoute(builder: (context) => UsersScreen(title:'Users Screen')) ;
    default:
        throw ('This Route Name is Invalid.');
  }
}
