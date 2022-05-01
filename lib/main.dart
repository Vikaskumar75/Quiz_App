import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'app_init_service.dart';
import 'src/utilities/export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitService.initialize();

  // ErrorWidget.builder = ((FlutterErrorDetails details) {
  //   return const Material(
  //     child: Scaffold(
  //       body: Center(
  //         child: Text(
  //           'Something very bad happend.\n Please contact the developer.',
  //         ),
  //       ),
  //     ),
  //   );
  // });
  
  runApp(
    ProviderScope(
      observers: <ProviderObserver>[Observer()],
      child: const App(),
    ),
  );
}
