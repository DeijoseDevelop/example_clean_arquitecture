import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setLocalStorageString(String key, String value) async {
    SharedPreferences pref = await _prefs;
    await pref.setString(key, value);
  }

  void setLocalStorageBool(String key, bool value) async {
    SharedPreferences pref = await _prefs;
    await pref.setBool(key, value);
  }

  Future<String?> getLocalStorageString(String key) async {
    SharedPreferences pref = await _prefs;
    return pref.getString(key);
  }

  Future<bool?> getLocalStorageBool(String key) async {
    SharedPreferences pref = await _prefs;
    return pref.getBool(key);
  }

  Future<void> removeValueLocalStorage(String key) async {
    SharedPreferences pref = await _prefs;
    await pref.remove(key);
  }
}