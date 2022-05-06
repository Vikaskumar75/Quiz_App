import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/src/app/app_init_service.dart';
import 'package:quiz_app/src/authentication/authentication_screen.dart';
import 'package:quiz_app/src/quiz_home/view/quiz_home.dart';

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

  testWidgets(
    'Circular Progress Indicator',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: QuizHome(),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    },
  );
}
