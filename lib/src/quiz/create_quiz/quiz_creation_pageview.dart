part of 'quiz_form.dart';

class _QuizCreationPageView extends ConsumerStatefulWidget {
  const _QuizCreationPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<_QuizCreationPageView> createState() =>
      __QuizCreationPageViewState();
}

class __QuizCreationPageViewState extends ConsumerState<_QuizCreationPageView> {
  final List<Widget> screens = <Widget>[
    const _QuizTitle(),
    const _QuizCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: ref.read(quizCreationFormKeyProvider),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.toWidth),
          child: Stack(
            children: <Widget>[
              const _ProgressBar(),
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                children: screens,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
