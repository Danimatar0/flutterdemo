import 'package:flutterdemo/constants/importConstants.dart';
import 'RoundedButton.dart';

class ButtonsRow extends StatefulWidget {
  const ButtonsRow({Key? key}) : super(key: key);

  @override
  _ButtonsRowState createState() => _ButtonsRowState();
}

class _ButtonsRowState extends State<ButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          new RoundedButton(
            text: "Navigate To About",
            onTap: () {
              Navigator.pushNamed(context, aboutScreen);
            },
          ),
        ],
      ),
    );
  }
}
