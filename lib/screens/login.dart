import 'package:flutterdemo/constants/importConstants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            child: Text("Hello World !"),
            onPressed: () {
              Navigator.pushNamed(context, homeScreen);
            },
          ),
        ),
      ),
    );
  }
}
