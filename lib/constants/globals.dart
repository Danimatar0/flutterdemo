import 'package:flutterdemo/redux/AppState.dart';
import 'package:flutterdemo/redux/reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> globalStore =
    Store<AppState>(reducer, initialState: AppState());
