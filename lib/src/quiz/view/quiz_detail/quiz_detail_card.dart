part of 'quiz_detail.dart';

class _QuizDetailsCard extends StatelessWidget {
  const _QuizDetailsCard({
    Key? key,
    required this.quiz,
  }) : super(key: key);
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.toWidth),
      decoration: const BoxDecoration(
        color: ColorPallet.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 14.toHeight),
          Center(
            child: Container(
              height: 4,
              width: 50.toWidth,
              decoration: BoxDecoration(
                gradient: ColorPallet.blueGreyGradient,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(height: 20.toHeight),
          Text(
            'Brief explanation about the quiz',
            style: CustomTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.toFont,
                ),
          ),
          SizedBox(height: 20.toHeight),
          _QuizDetailListTile(
            icon: Icons.article_outlined,
            heading: '${quiz.noOfQuestions} Questions',
            subHeading:
                '${quiz.pointsForCorrectAnswer} point for correct answer',
          ),
          SizedBox(height: 20.toHeight),
          _QuizDetailListTile(
            icon: Icons.access_time,
            heading:
                '${quiz.duration.hour()} hour ${quiz.duration.minute()} minutes',
            subHeading: 'Total duration of quiz',
          ),
          SizedBox(height: 20.toHeight),
          _QuizDetailListTile(
            icon: Icons.star_border_rounded,
            heading: 'Win ${quiz.starsToWin} star',
            subHeading: 'Answer all questions correctly',
          ),
          SizedBox(height: 20.toHeight),
          Text(
            'Please read the text below carefully so you can understand it',
            style: CustomTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.toFont,
                ),
          ),
          SizedBox(height: 20.toHeight),
          BulletList(quiz.warnings),
        ],
      ),
    );
  }
}
