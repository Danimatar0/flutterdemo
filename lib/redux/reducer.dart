import 'AppState.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  newState.status[action.type] = action.payload;
  return newState;
}
