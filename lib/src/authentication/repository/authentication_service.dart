part of 'authentication_repo.dart';

abstract class AuthenticationService {
  Future<AuthenticationModel> signUp(RegistrationModel model);

  Future<AuthenticationModel> login({
    required String email,
    required String password,
  });

  Future<void> sendOtp({required String email});

  Future<bool> checkUserAvailability({required String email});
}
