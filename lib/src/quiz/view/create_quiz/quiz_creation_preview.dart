part of 'quiz_form.dart';

class _QuizCreationPreview extends ConsumerWidget {
  const _QuizCreationPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool checkBoxValue = ref.watch(createQuizCheckBoxProvider);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const _Preview(),
          Container(
            color: ColorPallet.darkBlueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      visualDensity: const VisualDensity(vertical: -4),
                      activeColor: ColorPallet.darkBlue,
                      value: checkBoxValue,
                      onChanged: (bool? value) {
                        ref.read(createQuizCheckBoxProvider.notifier).state =
                            value ?? false;
                      },
                    ),
                    Text(
                      'I have read all the details of quiz',
                      style: CustomTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(height: 4.toHeight),
                CommonButton(
                  onTap: () {
                    ref.read(quizCreationProvider.notifier).createQuiz();
                  },
                  enable: checkBoxValue,
                  text: 'Create Quiz',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Preview extends ConsumerWidget {
  const _Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = ref.read(quizTitleControllerProvider).text;
    final List<String> warnings = ref.read(warningsListProvider);
    final int noOfQuestions = ref.read(noOfQuestionsProvider);
    final double pointsForEachAnswer = ref.read(pointsPerQuestionProvider);
    final double pointsToWin = ref.read(noOfCorrectAnswerToClearQuizProvider);
    final double timeForEachQuestion = ref.read(timePerQuestionProvider);
    return ListView(
      children: <Widget>[
        SizedBox(height: 30.toHeight),
        Row(
          children: <Widget>[
            BackButton(
              onPressed: () {
                ref.read(quizPageIndexProvider.notifier).state--;
              },
              color: ColorPallet.white,
            ),
            LazyLoadingText(
              'Preview',
              style: CustomTheme.headline3,
            ),
          ],
        ),
        SizedBox(height: 10.toHeight),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ImageWithTitleAndDescription(
            height: ScreenScaleFactor.screenHeight * 0.26,
            asset: Assets.cinematography,
            title: title.capitalize(),
            description: 'This is a temporary description',
          ),
        ),
        Container(
          height: 20.toHeight,
          alignment: Alignment.centerRight,
          child: Text(
            'Quiz duration: ${timeForEachQuestion.toInt() * noOfQuestions.toInt()} mins.',
            style: CustomTheme.bodyText2.copyWith(
              color: ColorPallet.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const TextWithLeadingIcon(
          text: 'Categories',
          icon: Icons.category,
          iconColor: ColorPallet.golden,
        ),
        SizedBox(height: 10.toHeight),
        const _QuizCategorySelectedList(
          actionEnabled: false,
        ),
        SizedBox(height: 20.toHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const TextWithLeadingIcon(
              text: 'Questions',
              icon: Icons.question_answer,
              iconColor: ColorPallet.golden,
            ),
            const Spacer(),
            Text(
              'No. of questions: $noOfQuestions',
              style: CustomTheme.bodyText1.copyWith(
                color: ColorPallet.golden,
                fontSize: 13.toFont,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.toHeight),
        const _QuestionsPreview(),
        SizedBox(height: 20.toHeight),
        const TextWithLeadingIcon(
          text: 'Points',
          icon: Icons.scoreboard_rounded,
          iconColor: ColorPallet.golden,
        ),
        SizedBox(height: 10.toHeight),
        _PointsWidget(
          points: pointsForEachAnswer,
          suffixText: 'per answer',
        ),
        _PointsWidget(
          points: pointsToWin * pointsForEachAnswer,
          suffixText: 'to win',
        ),
        SizedBox(height: 20.toHeight),
        const TextWithLeadingIcon(
          text: 'Warnings / Rules / Description',
          icon: Icons.warning,
          iconColor: ColorPallet.golden,
        ),
        SizedBox(height: 10.toHeight),
        BulletList(warnings, spacing: 2),
        SizedBox(height: 90.toHeight),
      ],
    );
  }
}

class _PointsWidget extends StatelessWidget {
  const _PointsWidget({
    Key? key,
    required this.points,
    required this.suffixText,
  }) : super(key: key);

  final double points;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.auto_awesome_rounded,
          color: ColorPallet.darkGolden,
        ),
        SizedBox(width: 8.toWidth),
        Text(
          '${points.toInt()} pts. ',
          style: CustomTheme.headline6,
        ),
        Text(
          suffixText,
          style: CustomTheme.bodyText1.copyWith(
            color: ColorPallet.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _QuestionsPreview extends ConsumerWidget {
  const _QuestionsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<QuestionModel> questions = ref.watch(questionListProvider);

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: questions.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.toHeight);
      },
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ShaderMask(
              shaderCallback: (Rect rect) => ColorPallet.dialogShader,
              child: Text(
                '${index + 1}. ${questions[index].title}',
                style: CustomTheme.headline6,
              ),
            ),
            SizedBox(height: 10.toHeight),
            ...List<Widget>.generate(
              questions[index].options.length,
              (int optionIndex) {
                final Options option = questions[index].options[optionIndex];
                return Padding(
                  padding: EdgeInsets.only(left: 20.0.toWidth),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(option.answer, style: CustomTheme.headline6),
                          if (option.isCorrect) ...<Widget>[
                            const Spacer(),
                            const Icon(
                              Icons.check_circle,
                              color: ColorPallet.green,
                            ),
                          ],
                        ],
                      ),
                      if (optionIndex < questions[index].options.length - 1)
                        Divider(height: 14.toHeight)
                    ],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
