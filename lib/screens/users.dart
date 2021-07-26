import 'dart:convert';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterdemo/core/api.dart';
import 'package:flutterdemo/models/DataModel.dart';
import 'package:flutterdemo/models/UserModel.dart';
import 'package:flutterdemo/redux/AppState.dart';
import 'package:flutterdemo/redux/action.dart';
import 'package:flutterdemo/widgets/CustomBar.dart';
import 'package:flutterdemo/widgets/Loader.dart';
import 'package:flutterdemo/widgets/RoundedButton.dart';
import 'package:redux/redux.dart';
import '../constants/importConstants.dart';
import '../constants/globals.dart' as globals;

class UsersScreen extends StatefulWidget {
  const UsersScreen({ Key? key, required String title }) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  ScrollController _scrollController = new ScrollController();
  late DataModel _dataModel;
  List<UserModel> _users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: StoreConnector<AppState,_ViewModel>(
                converter: (store) {
                  globals.globalStore=store;
                  //_loadUsers(store,_page);
                  return _ViewModel(
                    state: store.state,
                    );
                },
                builder: (context, _ViewModel vm) {
                  return Stack(
                    children: <Widget>[
                      CustomBar(height: 210.0),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 40.0),
                          child: new Column(
                            children: <Widget>[
                              _buildButtonsRow(context),
                              Expanded(
                                child: Text('hi')
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
              },
           ),
        );
     }

  Widget _buildButtonsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          new RoundedButton(text: "Navigate To About", onTap: () { Navigator.pushNamed(context, aboutScreen); },),
        ],
      ),
    );
  }
}


class _ViewModel {
  final AppState state;
  
  _ViewModel({required this.state});
}