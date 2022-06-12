import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';

void main() {
  MockAuthenticationRepo repo = MockAuthenticationRepo();
  const String email = 'vikas@geekyants.com';
  const String password = 'password';

  test('SignUp', () async {
    const RegistrationModel registrationModel = RegistrationModel(
      email: 'email',
      name: 'name',
      password: 'password',
    );
    final AuthenticationModel model = await repo.signUp(registrationModel);
    expect(model.runtimeType, AuthenticationModel);
  });

  test('login', () async {
    final AuthenticationModel model = await repo.login(
      email: email,
      password: password,
    );
    expect(model.runtimeType, AuthenticationModel);
  });
}

class MockAuthenticationRepo extends Mock implements AuthenticationRepo {
  @override
  Future<AuthenticationModel> signUp(RegistrationModel registrationModel) {
    return Future<AuthenticationModel>.value(authenticationModel);
  }

  @override
  Future<AuthenticationModel> login({
    required String email,
    required String password,
  }) {
    return Future<AuthenticationModel>.value(authenticationModel);
  }
}

final AuthenticationModel authenticationModel = AuthenticationModel(
  status: 'success',
  data: User(
    token: 'token',
    email: 'email',
    name: 'name',
    id: 'id',
  ),
);
