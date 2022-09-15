import 'package:photos_fake/src/data/models/models.dart';

class Session {
  Session._();

  static final Session instance = Session._();
  UserSession? _userSession;
  UserSession? get userSession => _userSession;

  Future<void> init(UserSession? value) async {
    _userSession = value;
  }
  Future<void> stop() async => _userSession = null;
}
