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

class _NumberCarousel extends StatelessWidget {
  const _NumberCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, Widget? child) {
        final int noOfQuestion = ref.watch(noOfQuestionsProvider);
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
      },
    );
  }
}
