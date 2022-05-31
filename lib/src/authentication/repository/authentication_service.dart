part of 'authentication_repo.dart';

abstract class AuthenticationService {
  Future<AuthenticationModel> signUp();
  Future<AuthenticationModel> login({required String email,required String password});
  Future<void> sendOtp({required String email});
}
