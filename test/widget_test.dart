import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/src/app/app_init_service.dart';
import 'package:quiz_app/src/authentication/authentication_screen.dart';

void main() {
  setUpAll(() {
    AppInitService.initialize();
  });
  testWidgets('Authentication Screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: AuthenticationScreen(),
        ),
      ),
    );
    expect(find.byType(Column), findsOneWidget);
  });
}
