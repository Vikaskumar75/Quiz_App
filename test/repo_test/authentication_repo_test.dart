import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';

void main() {
  MockAuthenticationRepo repo = MockAuthenticationRepo();
  const String email = 'vikas@geekyants.com';
  const String password = 'password';

  test('SignUp', () async {
    final AuthenticationModel model = await repo.signUp();
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
  Future<AuthenticationModel> signUp() {
    return Future<AuthenticationModel>.value(
      AuthenticationModel(
        name: 'name',
        email: 'email',
        password: 'password',
        manufacture: 'manufacture',
        deviceName: 'deviceName',
        androidVersion: 'androidVersion',
      ),
    );
  }

  @override
  Future<AuthenticationModel> login({
    required String email,
    required String password,
  }) {
    return Future<AuthenticationModel>.value(
      AuthenticationModel(
        name: 'name',
        email: 'email',
        password: 'password',
        manufacture: 'manufacture',
        deviceName: 'deviceName',
        androidVersion: 'androidVersion',
      ),
    );
  }
}
