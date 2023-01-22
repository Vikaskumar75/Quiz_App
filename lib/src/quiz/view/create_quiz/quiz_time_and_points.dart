// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_form.dart';

class _QuizTimeAndPoints extends ConsumerStatefulWidget {
  const _QuizTimeAndPoints({Key? key}) : super(key: key);

  @override
  ConsumerState<_QuizTimeAndPoints> createState() => __QuizTimeAndPointsState();
}

class __QuizTimeAndPointsState extends ConsumerState<_QuizTimeAndPoints> {
  @override
  Widget build(BuildContext context) {
    final double timePerQuestion = ref.watch(timePerQuestionProvider);
    final double pointsPerQuestion = ref.watch(pointsPerQuestionProvider);
    final double pointsToclearQuiz = ref.watch(pointsToclearQuizProvider);
    final int noOfQuestion = ref.watch(noOfQuestionsProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.toHeight),
          BackButton(
            onPressed: () => ref.read(quizPageIndexProvider.notifier).state--,
            color: ColorPallet.white,
          ),
          const Spacer(),
          LabelSlider(
            label: 'Time for each question ( in mins. )',
            min: 1,
            max: 5,
            value: timePerQuestion,
            sliderText: '${timePerQuestion.toInt()} min.',
            onChanged: (double value) {
              ref.read(timePerQuestionProvider.notifier).state = value;
            },
          ),
          Divider(height: 30.toHeight),
          LabelSlider(
            label: 'Point for each correct answer',
            min: 1,
            max: 10,
            value: pointsPerQuestion,
            sliderText: '${pointsPerQuestion.toInt()} pts.',
            onChanged: (double value) {
              ref.read(pointsPerQuestionProvider.notifier).state = value;
            },
          ),
          Divider(height: 30.toHeight),
          LabelSlider(
            label: 'Point to clear the quiz',
            min: 1,
            max: noOfQuestion.toDouble(),
            value: pointsToclearQuiz,
            sliderText:
                '${pointsToclearQuiz.toInt() * pointsPerQuestion.toInt()} pts.',
            onChanged: (double value) {
              ref.read(pointsToclearQuizProvider.notifier).state = value;
            },
          ),
          const Spacer(),
          const Spacer(),
          CommonButton(
            text: 'Next',
            width: double.maxFinite,
            onTap: () {
              ref.read(quizCreationProvider.notifier).createQuiz();
            },
          ),
          SizedBox(height: 20.toHeight),
        ],
      ),
    );
  }
}

class LabelSlider extends StatelessWidget {
  const LabelSlider({
    Key? key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    this.sliderText,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final double value;
  final double min;
  final double max;
  final String? sliderText;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            label,
            style: CustomTheme.headline6,
          ),
        ),
        SizedBox(height: 6.toHeight),
        Row(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Slider(
                min: min,
                max: max,
                value: value,
                activeColor: ColorPallet.darkBlue,
                inactiveColor: ColorPallet.white.withOpacity(0.4),
                onChanged: onChanged,
              ),
            ),
            if (sliderText != null)
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    sliderText!,
                    style: CustomTheme.headline4,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
