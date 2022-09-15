// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:photos_fake/src/data/models/models.dart';
import 'package:photos_fake/src/data/repository/auth_repository.dart';
import 'package:photos_fake/src/data/uses_cases/base.dart';
import 'package:http/http.dart' as http;
import 'package:photos_fake/src/utils/local_repository.dart';
import 'package:photos_fake/src/utils/session.dart';

class LoginUserUseCase implements UseCase<void, CreateOrLoginUserCaseParams> {
  final AuthRepository authRepository = AuthRepository();
  @override
  Future call(
      {CreateOrLoginUserCaseParams? params}) async {
    LocalRepository localRepository = LocalRepository();
    final http.Response response = await authRepository.createOrLoginUser(
      params!.user,
      '/v1/accounts:signInWithPassword',
    );
    final decodedRes = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        Session.instance.init(UserSession.fromJson(decodedRes));
        localRepository.setLocalStorageString('userSession', response.body);
        localRepository.setLocalStorageString('token', decodedRes['idToken']);
        print('login successful');
        break;
      default:
        throw UseCaseException('Bad request');
    }
  }
}
