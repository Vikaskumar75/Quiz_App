// ignore_for_file: always_specify_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';

// Controllers
final emailControllerProvider = Provider((_) => TextEditingController());
final passwordControllerProvider = Provider.autoDispose(
  (_) => TextEditingController(),
);
final confirmPasswordControllerProvider = Provider.autoDispose(
  (_) => TextEditingController(),
);
final otpControllerProvider = Provider.autoDispose(
  (_) => TextEditingController(),
);

// This provider tells wether user is trying to login or signup
final StateProvider<bool> isSignUpProvider = StateProvider<bool>((_) => false);

// This provider helps in the navigation of authentication screens
final StateProvider<int> pageIndexProvider = StateProvider<int>((_) => 0);

// This provides an instance of AuthenticationProvider and populate AuthenticationProvider with ref
final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
  (ref) => AuthProvider(ref),
);

// This shows different error messages based on otp entered.
final otpErrorProvider = StateProvider((_) => '');

class AuthProvider extends StateNotifier<AuthState> {
  final Ref ref;
  AuthProvider(this.ref) : super(AuthState.initial);

  final _repo = AuthenticationRepo.instance;
  int? otp;

  Future<void> generateAndSendOtp() async {
    state = AuthState.otpLoading;
    final String email = ref.read(emailControllerProvider).text;
    await _repo.sendOtp(email: email);
    await Future.delayed(const Duration(seconds: 1));
    otp = 111111;
    state = AuthState.otpSuccess;
  }

  Future<void> validateOtp() async {
    final enteredOtp = ref.read(otpControllerProvider).text;
    if (enteredOtp.isEmpty) {
      ref.read(otpErrorProvider.notifier).state = 'Please enter otp';
      state = AuthState.otpError;
      return;
    } else if (enteredOtp != otp.toString()) {
      ref.read(otpErrorProvider.notifier).state = 'Wrong otp';
      state = AuthState.otpError;
      return;
    }

    // Todo: Register/Signup User
    state = AuthState.registerLoading;
    await Future.delayed(const Duration(seconds: 2));
    state = AuthState.registerSuccess;
  }

  Future<void> login() async {
    final String email = ref.read(emailControllerProvider).text;
    final String password = ref.read(passwordControllerProvider).text;
    // Todo: Register/Signup User
    // await _repo.login(email: email, password: password);
    state = AuthState.loginLoading;
    await Future.delayed(const Duration(seconds: 2));
    state = AuthState.loginSuccess;
  }
}

enum AuthState {
  initial,
  registerLoading,
  registerError,
  registerSuccess,
  loginLoading,
  loginError,
  loginSuccess,
  otpLoading,
  otpSuccess,
  otpError
}
