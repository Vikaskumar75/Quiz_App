part of 'quiz_home.dart';

class _QuizListItem extends StatelessWidget {
  const _QuizListItem({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AvailabilityItemContainer(
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: quiz.imageUrl,
                  width: ScreenScaleFactor.screenHeight * 0.12,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.toWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ShaderMask(
                    shaderCallback: (_) => ColorPallet.quizListItemTitleShader,
                    child: Text(
                      quiz.name,
                      style: TextStyle(fontSize: 19.toFont),
                    ),
                  ),
                  const Spacer(),
                  TextWithLeadingIcon(
                    text: '${quiz.noOfQuestions} Questions',
                    icon: Icons.summarize,
                  ),
                  const Spacer(),
                  TextWithLeadingIcon(
                    text: '${quiz.duration.hour()} hour '
                        '${quiz.duration.minute()} minutes',
                    icon: Icons.access_time,
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Container(
                height: double.maxFinite,
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.star,
                      color: ColorPallet.golden,
                    ),
                    Text(
                      quiz.starRating.toString(),
                      style: TextStyle(fontSize: 19.toFont),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 30.toHeight,
          color: ColorPallet.extraLightGrey,
          indent: 14.toWidth,
          endIndent: 14.toWidth,
        ),
      ],
    );
  }
}
