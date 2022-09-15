import 'package:flutter/material.dart';
import 'package:photos_fake/src/data/uses_cases/uses_cases.dart';

class LoginUserController extends ChangeNotifier {
  final LoginUserUseCase loginUserUseCase = LoginUserUseCase();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future loginUser() async {
    final Map<String, dynamic> body = {
      'email': email.text,
      'password': password.text,
    };

    try {
      await loginUserUseCase.call(
        params: CreateOrLoginUserCaseParams(user: body),
      );
    } catch (e) {
      rethrow;
    }
  }
}
