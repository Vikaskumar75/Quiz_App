import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/authentication/provider/authentication_provider.dart';

import '../../utilities/export.dart';

part 'email_screen.dart';
part 'login_screen.dart';

class AuthenticationScreen extends ConsumerWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSignUp = ref.watch(isSignUpProvider);
    return Scaffold(
      backgroundColor: ColorPallet.darkBlueGrey.withOpacity(0.98),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.toWidth,
              vertical: 20.0.toHeight,
            ),
            child: PageView(
              children: isSignUp
                  ? const <Widget>[
                      _EmailScreen(),
                      _LoginScreen(),
                    ]
                  : const <Widget>[
                      _EmailScreen(),
                      _LoginScreen(),
                    ],
            )),
      ),
    );
  }
}
