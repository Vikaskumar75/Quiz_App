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

// This provides otp to the UI, It gets its value from authenticationProvider after generateAndSendOtp() is called
final otpProvider = StateProvider<int?>((_) => null);

// This provides an instance of AuthenticationProvider and populate AuthenticationProvider with ref
final authenticationProvider = StateNotifierProvider(
  (ref) => AuthenticationProvider(ref),
);

class AuthenticationProvider extends StateNotifier<AuthenticationState> {
  final Ref ref;
  AuthenticationProvider(this.ref) : super(AuthenticationState.initial);
  final _repo = AuthenticationRepo.instance;

  Future<void> generateAndSendOtp() async {
    state = AuthenticationState.loading;
    final String email = ref.read(emailControllerProvider).text;
    await _repo.sendOtp(email: email);
    await Future.delayed(const Duration(seconds: 1));
    ref.read(otpProvider.notifier).state = 1111;
    state = AuthenticationState.success;
  }
}

enum AuthenticationState { initial, loading, erron, success }
