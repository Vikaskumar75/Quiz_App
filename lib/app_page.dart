import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/authentication/authentication_screen.dart';
import 'src/utilities/export.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          AuthenticationScreen(),
          InternetOverlay(),
        ],
      ),
    );
  }
}

class InternetOverlay extends ConsumerWidget {
  const InternetOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isInternetAvailable = ref.watch(connectivityProvider);
    if (isInternetAvailable) {
      return const SizedBox.shrink();
    } else {
      return Container(
        height: 120.toHeight,
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        color: Colors.black.withOpacity(0.2),
        child: const Text(Strings.internetError),
      );
    }
  }
}
