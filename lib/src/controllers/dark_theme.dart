import 'package:flutter/cupertino.dart';

class DarkTheme extends ChangeNotifier {
  bool isDarkTheme = false;

  void changeTheme(bool value){
    isDarkTheme = value;
    notifyListeners();
  }
}
