import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/utilities/export.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData lightTheme = ref.watch(lightThemeProvider);
    final ThemeData darkTheme = ref.watch(darkThemeProvider);
    final ThemeMode? themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Quiz',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      navigatorObservers: <NavigatorObserver>[Routes()],
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.appPage,
    );
  }
}
