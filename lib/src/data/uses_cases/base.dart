class Params {}

//Type == T

abstract class UseCase<Type, Params> {
  Future<Type> call({Params? params});
}

abstract class UseCaseNoParams<Type, Params> {
  Future<Type> call();
}

class UseCaseException implements Exception {
  final String message;
  UseCaseException(this.message);
}

class CreateOrLoginUserCaseParams extends Params{
  final Map<String, dynamic> user;
  CreateOrLoginUserCaseParams({required this.user});
}
