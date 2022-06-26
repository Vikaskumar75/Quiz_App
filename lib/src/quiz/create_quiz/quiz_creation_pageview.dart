part of 'quiz_form.dart';

class _QuizCreationPageView extends ConsumerStatefulWidget {
  const _QuizCreationPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<_QuizCreationPageView> createState() =>
      __QuizCreationPageViewState();
}

class __QuizCreationPageViewState extends ConsumerState<_QuizCreationPageView> {
  final PageController controller = PageController();
  final List<Widget> screens = <Widget>[
    const _QuizTitle(),
    const _QuizCategory(),
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
    ref.listen(pageIndexProvider, pageIndexChangeListener);
    return Scaffold(
      body: Form(
        key: ref.read(quizCreationFormKeyProvider),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.toWidth),
          child: Stack(
            children: <Widget>[
              const _ProgressBar(),
              PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: screens,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
