part of 'quiz_form.dart';

class _QuizCreationPageView extends ConsumerStatefulWidget {
  const _QuizCreationPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<_QuizCreationPageView> createState() =>
      __QuizCreationPageViewState();
}

class __QuizCreationPageViewState extends ConsumerState<_QuizCreationPageView> {
  late PageController controller;
  final List<Widget> screens = <Widget>[
    const _QuizTitle(),
    const _QuizCategory(),
    const _NoOfQuestions(),
    const _QuizQuestions(),
    const _QuizTimeAndPoints(),
    const _QuizInstructionsAndWarnings(),
    const _QuizCreationPreview(),
  ];

  void pageIndexChangeListener(int? previous, int next) {
    controller.animateToPage(
      next,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(quizPageIndexProvider, pageIndexChangeListener);
    controller = ref.read(quizCreationPageControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: ref.read(quizCreationFormKeyProvider),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.toWidth),
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: screens,
            ),
          ),
        ),
      ),
    );
  }
}
