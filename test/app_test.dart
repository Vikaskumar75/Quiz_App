import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/src/app/app_service.dart';
import 'package:quiz_app/src/authentication/view/authentication_screen.dart';
import 'package:quiz_app/src/quiz/export.dart';
import 'package:quiz_app/src/quiz/repository/quiz_repo.dart';

void main() {
  final AppService appService = AppService.getInstance;
  setUpAll(() {
    appService.initialize(
      availabilityRepository: MockAvailabilityRepo(),
    );
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
    'Sliver List',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: QuizHome(),
            ),
          ),
        );

        expect(find.byType(SliverList), findsWidgets);
      });
    },
  );

  test(
    'availability test',
    () async {
      final QuizAvailability result =
          await appService.availabilityRepo.fetchQuiz();

      expect(result.data, isEmpty);
    },
  );
}

class MockAvailabilityRepo extends Mock implements QuizRepository {
  @override
  Future<QuizAvailability> fetchQuiz() {
    return Future<QuizAvailability>.value(QuizAvailability(
      status: '',
      total: 10,
      data: <Quiz>[],
    ));
  }
}
