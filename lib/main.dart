import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'app_init_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitService.initialize();
  runApp(
    const ProviderScope(child: App()),
  );
}
