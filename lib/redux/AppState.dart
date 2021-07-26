import 'dart:convert';

class AppState {
  var status = {
    "author": "dani",
    "items": [],
    "isLoading": "false",
    "error":"",
    "startingIndex":-10,
  };

  AppState();

  AppState.fromAppState(AppState another) {
    status = another.status;
  }

  Object getValueFromKey(String keyVar) {
    Object result = "Couldn't find key.";
    status.forEach((key, value) {
      if (key.compareTo(keyVar) == 0) {
        result = value;
      }
    });
    return result;
  }

  Object ToJson() {
    return jsonDecode(this.status.toString());
  }
}
