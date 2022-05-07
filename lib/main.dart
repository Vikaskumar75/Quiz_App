import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

import 'src/app/app.dart';
import 'src/app/app_service.dart';
import 'src/utilities/export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppService.getInstance.initialize(
    availabilityRepository: AvailabilityRepository(),
  );

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
