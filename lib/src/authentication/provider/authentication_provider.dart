// ignore_for_file: always_specify_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';
import 'package:quiz_app/src/utilities/export.dart';

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
  final DialogService _dialogService = DialogService.instance;
  int? otp;

  Future<void> sendOtp() async {
    try {
      state = AuthState.otpLoading;
      final String email = ref.read(emailControllerProvider).text;
      OtpModel otpModel = await _repo.sendOtp(email: email);
      otp = otpModel.data.otp;
      state = AuthState.otpSuccess;
    } on AppError catch (e) {
      state = AuthState.otpError;
      _dialogService.showDialog(message: e.serverMessage ?? e.errorMessage);
    }
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
    state = AuthState.otpValidated;
  }

  Future<void> register() async {
    try {
      state = AuthState.registerLoading;

      final RegistrationModel model = RegistrationModel(
        email: ref.read(emailControllerProvider).text,
        name: ref.read(emailControllerProvider).text,
        password: ref.read(passwordControllerProvider).text,
      );
      final AuthenticationModel authModel = await _repo.signUp(model);
      await startSession(authModel);
      state = AuthState.registerSuccess;
    } on AppError catch (e) {
      state = AuthState.registerError;
      _dialogService.showDialog(message: e.serverMessage ?? e.errorMessage);
    }
  }

  Future<void> login() async {
    try {
      state = AuthState.loginLoading;
      final String email = ref.read(emailControllerProvider).text;
      final String password = ref.read(passwordControllerProvider).text;
      final AuthenticationModel authModel = await _repo.login(
        email: email,
        password: password,
      );
      await startSession(authModel);
      state = AuthState.loginSuccess;
    } on AppError catch (e) {
      state = AuthState.loginError;
      _dialogService.showDialog(message: e.serverMessage ?? e.errorMessage);
    }
  }

  Future<void> checkUserAvailability() async {
    state = AuthState.userAvailabilityLoading;
    final String email = ref.read(emailControllerProvider).text;
    final bool isUserRegistered = await _repo.checkUserAvailability(
      email: email,
    );

    final bool isSignUp = ref.read(isSignUpProvider);

    if (isSignUp && isUserRegistered) {
      state = AuthState.userRegistered;
      DialogService.instance.showDialog(
        message: Strings.emailAlreadyRegistered,
      );
    } else if (!isSignUp && !isUserRegistered) {
      state = AuthState.userNotRegistered;
      DialogService.instance.showDialog(
        message: Strings.userNotRegistered,
      );
    } else {
      if (isSignUp) {
        state = AuthState.userNotRegistered;
      } else {
        state = AuthState.userRegistered;
      }
    }
  }

  Future<void> startSession(AuthenticationModel model) async {
    await StorageService.instance.saveAuthData(model);
  }
}

enum AuthState {
  initial,
  registerLoading,
  registerError,
  registerSuccess,
  userAvailabilityLoading,
  userRegistered,
  userNotRegistered,
  loginLoading,
  loginError,
  loginSuccess,
  otpLoading,
  otpSuccess,
  otpError,
  otpValidated,
}
