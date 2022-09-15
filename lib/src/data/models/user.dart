class UserSession {
  final String? localId;
  final String? email;
  final String? token;

  UserSession({this.email, this.localId, this.token});

  factory UserSession.fromJson(Map<String, dynamic> json) => UserSession(
    localId: json["localId"] ?? '',
    email: json["email"] ?? '',
    token: json["idToken"] ?? '',
  );
}
