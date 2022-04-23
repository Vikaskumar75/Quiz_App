import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/theme_provider.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Authentication Screen'),
            CupertinoSwitch(
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
                ref.read(themeModeProvider.notifier).changeThemeMode();
              },
            )
          ],
        ),
      ),
    );
  }
}
