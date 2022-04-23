import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'app_init_service.dart';
import 'src/utilities/export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitService.initialize();
  runApp(
    ProviderScope(
      observers: <ProviderObserver>[Observer()],
      child: const App(),
    ),
  );
}
