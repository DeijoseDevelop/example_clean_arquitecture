import 'package:flutter/material.dart';
import 'package:photos_fake/src/data/uses_cases/uses_cases.dart';

class CreateUserController extends ChangeNotifier {
  final CreateUserUseCase createUserUseCase = CreateUserUseCase();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future createUser() async {
    final Map<String, dynamic> body = {
      'email': email.text,
      'password': password.text,
    };

    try {
      await createUserUseCase.call(
        params: CreateOrLoginUserCaseParams(user: body),
      );
    } catch (e) {
      rethrow;
    }
  }
}
