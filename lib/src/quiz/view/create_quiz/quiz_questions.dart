part of 'quiz_form.dart';

class _QuizQuestions extends ConsumerStatefulWidget {
  const _QuizQuestions({Key? key}) : super(key: key);

  @override
  ConsumerState<_QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends ConsumerState<_QuizQuestions> {
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  late PageController _pageController;
  final List<Question> questions = <Question>[];

  @override
  void initState() {
    _pageController = PageController(
      initialPage: ref.read(currentQuestionProvider),
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int noOfQuestions = ref.watch(noOfQuestionsProvider);
    final int currentQuestion = ref.watch(currentQuestionProvider);
    final List<QuizQuestionController> controllers =
        ref.watch(questionControllers);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.toHeight),
          BackButton(
            onPressed: () => ref.read(quizPageIndexProvider.notifier).state--,
            color: ColorPallet.white,
          ),
          if (noOfQuestions > 1) ...<Widget>[
            SizedBox(height: 10.toHeight),
            const _ProgressTrail()
          ],
          SizedBox(height: 10.toHeight),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              padEnds: currentQuestion >= (noOfQuestions - 1),
              scrollDirection: Axis.vertical,
              itemCount: noOfQuestions,
              itemBuilder: (_, int index) {
                return _AddQuestionCard(
                  hasFocus: index == currentQuestion,
                );
              },
              onPageChanged: (int index) {
                ref.read(currentQuestionProvider.notifier).state = index;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _PageNavigatorButton(
        pageController: _pageController,
      ),
    );
  }
}

class _PageNavigatorButton extends ConsumerWidget {
  const _PageNavigatorButton({required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int noOfQuestions = ref.watch(noOfQuestionsProvider);
    final int currentQuestion = ref.watch(currentQuestionProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (currentQuestion > 0)
          CustomFloatingButton(
            tag: 'up',
            icon: Icons.keyboard_arrow_up_outlined,
            onTap: () => _navigateTo(currentQuestion - 1),
          ),
        SizedBox(height: 10.toHeight),
        if (currentQuestion < noOfQuestions - 1)
          CustomFloatingButton(
            tag: 'down',
            icon: Icons.keyboard_arrow_down_outlined,
            onTap: () => _navigateTo(currentQuestion + 1),
          ),
      ],
    );
  }

  void _navigateTo(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

class _ProgressTrail extends ConsumerWidget {
  const _ProgressTrail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int noOfQuestions = ref.watch(noOfQuestionsProvider);
    final int currentQuestion = ref.watch(currentQuestionProvider);

    return SizedBox(
      height: 20.toHeight,
      child: Row(
        children: List<Widget>.generate(
          noOfQuestions,
          (int index) {
            return Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                height: 4.toHeight,
                margin: EdgeInsets.only(right: 2.toWidth),
                decoration: BoxDecoration(
                  color: index <= currentQuestion
                      ? ColorPallet.darkBlue
                      : ColorPallet.white,
                  borderRadius: BorderRadius.circular(1.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
