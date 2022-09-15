// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:photos_fake/src/utils/local_repository.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  final String baseUrl = 'identitytoolkit.googleapis.com';
  final String firebaseToken = 'AIzaSyCGlXjaGtOr3uNCTjMuy9-stKt4sxyvIbg';
  final LocalRepository prefs = LocalRepository();
}

/*
  ? methods:
  * - signUp
  * - signInWithPassword

*/

class AuthRepository extends Api {
  Future<http.Response> createOrLoginUser(
      Map<String, dynamic> user, String type) {
    return http
        .post(Uri.https(baseUrl, type, {'key': firebaseToken}), body: user)
        .timeout(const Duration(seconds: 30));
  }

  Future<void> logout() async {
    await prefs.removeValueLocalStorage('token');
    print('logout');
  }

  Future<String> radToken() async {
    final token = await prefs.getLocalStorageString('token');
    return token != null && token.isNotEmpty ? token : 'empty';
  }

  Future<Map<String, dynamic>> decodedResp({
    required http.Response method,
  }) {
    final res = method;
    return json.decode(res.body);
  }
}
