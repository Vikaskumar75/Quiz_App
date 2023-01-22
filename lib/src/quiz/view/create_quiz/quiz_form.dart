import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/export.dart';

import '../../provider/category_provider.dart';
import '../../provider/quiz_creation_provider.dart';
import '../../repository/quiz_repo.dart';

part 'add_question_card.dart';
part 'no_of_question.dart';
part 'option_widget.dart';
part 'quiz_category_selection.dart';
part 'quiz_creation_pageview.dart';
part 'quiz_form_intro.dart';
part 'quiz_questions.dart';
part 'quiz_title.dart';
part 'quiz_time_and_points.dart';

class QuizForm extends ConsumerStatefulWidget {
  const QuizForm({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizForm> createState() => _QuizFormState();
}

class _QuizFormState extends ConsumerState<QuizForm>
    with TickerProviderStateMixin {
  final Offset initialOffset = Offset.zero;
  final Offset endOffset = const Offset(-1, 0);

  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = Tween<Offset>(
      begin: initialOffset,
      end: endOffset,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final QuizCreationState state = ref.watch(quizCreationProvider);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: (state == QuizCreationState.quizIntroInitial)
            ? SlideTransition(
                position: animation,
                child: _QuizFormIntro(
                  onGettingStarted: () {
                    controller.forward();
                    ref
                        .read(quizCreationProvider.notifier)
                        .startCreatingNewQuiz();
                  },
                ),
              )
            : const _QuizCreationPageView(),
      ),
    );
  }
}
