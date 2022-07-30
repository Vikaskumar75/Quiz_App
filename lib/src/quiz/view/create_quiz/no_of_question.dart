part of 'quiz_form.dart';

class _NoOfQuestions extends ConsumerWidget {
  const _NoOfQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30.toHeight),
        BackButton(
          onPressed: () => ref.read(quizPageIndexProvider.notifier).state--,
          color: ColorPallet.white,
        ),
        SizedBox(height: 30.toHeight),
        LazyLoadingText(
          'Enter the number of questions\nYou want for the quiz.',
          style: CustomTheme.headline5,
        ),
        const Spacer(),
        const _NumberCarousel(),
        const Spacer(),
        CommonButton(
          text: 'Next',
          width: double.maxFinite,
          onTap: () {
            ref.read(quizPageIndexProvider.notifier).state++;
          },
        ),
      ],
    );
  }
}

class _NumberCarousel extends ConsumerStatefulWidget {
  const _NumberCarousel({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<_NumberCarousel> createState() => _NumberCarouselState();
}

class _NumberCarouselState extends ConsumerState<_NumberCarousel> {
  @override
  Widget build(BuildContext context) {
    final int noOfQuestion = ref.watch(noOfQuestionsProvider);
    ref.listen(noOfQuestionsProvider, quizControllerListener);

    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (_, int index, __) {
        return Text(
          (index + 1).toString(),
          style: TextStyle(
            fontSize: 140.toFont,
            color: noOfQuestion == (index + 1)
                ? ColorPallet.white
                : ColorPallet.white.withOpacity(0.2),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: 0.4,
        initialPage: noOfQuestion - 1,
        onPageChanged: (int index, _) {
          ref.read(noOfQuestionsProvider.notifier).state = index + 1;
        },
      ),
    );
  }

  // This listener is needs to be added here since we create a set of TextEditingControllers.
  // Before entering the _QuizQuestions screen and user can change the no. of questions afterwards.
  // Therefore we need to alter that set of TextEditingControllers and insert more sets based on next and previous value.
  void quizControllerListener(int? previous, int next) {
    if (previous == null || next <= previous) return;

    final List<QuizQuestionController> controllers =
        ref.read(quizControllersProvider);
    if (controllers.isEmpty) return;

    int noOfQuestionIncreased = next - previous;

    final int noOfOptionsPerQuestion = ref.read(noOfOptionsPerQuestionProvider);
    for (int i = 0; i < noOfQuestionIncreased; i++) {
      controllers.add(
        QuizQuestionController.getInstance(noOfOptionsPerQuestion),
      );
    }

    ref.read(quizControllersProvider.notifier).state = controllers;

  }
}
