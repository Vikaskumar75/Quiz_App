import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:quiz_app/src/authentication/provider/authentication_provider.dart';

import '../../utilities/export.dart';

part 'email_screen.dart';
part 'otp_screen.dart';
part 'password_screen.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  late bool isSignUp;
  final PageController _controller = PageController();
  final List<Widget> _signupScreens = const <Widget>[
    _EmailScreen(),
    _OtpScreen(),
    _PasswordScreen(),
  ];

  final List<Widget> _loginScreens = const <Widget>[
    _EmailScreen(),
    _PasswordScreen(),
  ];


  void _authListener(AuthState? previous, AuthState next) {
    switch (next) {
      case AuthState.otpSuccess:
      case AuthState.otpValidated:
        ref.read(pageIndexProvider.notifier).state++;
        break;

      case AuthState.loginSuccess:
      case AuthState.registerSuccess:
        Navigator.pushNamedAndRemoveUntil(
          context,
          Navigation.quizHome,
          (_) => false,
        );
        break;

      default:
        break;
    }
  }

  void _pageIndexListener(int? previous, int next) {
    if (!isSignUp && next > _loginScreens.length - 1) {
      ref.read(pageIndexProvider.notifier).state--;
      return;
    }
    if (isSignUp && next > _signupScreens.length - 1) {
      ref.read(pageIndexProvider.notifier).state--;
      return;
    }
    _controller.animateToPage(
      next,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    isSignUp = ref.watch(isSignUpProvider);
    ref.listen(pageIndexProvider, _pageIndexListener);
    ref.listen(authProvider, _authListener);

    return Scaffold(
      backgroundColor: ColorPallet.darkBlueGrey.withOpacity(0.98),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0.toWidth,
            vertical: 20.0.toHeight,
          ),
          child: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: isSignUp ? _signupScreens : _loginScreens,
          ),
        ),
      ),
    );
  }
}
