part of 'quiz_home.dart';

class _QuizListItem extends StatelessWidget {
  const _QuizListItem({
    Key? key,
    required this.availability,
  }) : super(key: key);

  final AvailabilityItem availability;

  @override
  Widget build(BuildContext context) {
    return AvailabilityItemContainer(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: availability.imageUrl,
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
                shaderCallback: (Rect rect) {
                  return ColorPallet.blueGreyGradient.createShader(rect);
                },
                child: Text(
                  availability.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const Spacer(),
              TextWithLeadingIcon(
                text: '${availability.noOfQuestions} Questions',
                icon: Icons.summarize,
              ),
              const Spacer(),
              TextWithLeadingIcon(
                text: '${availability.duration.hour()} hour '
                    '${availability.duration.minute()} minutes',
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
                ShaderMask(
                  shaderCallback: (Rect rect) {
                    return ColorPallet.blueGreyGradient.createShader(rect);
                  },
                  child: Text(
                    availability.starRating.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextWithLeadingIcon extends StatelessWidget {
  const TextWithLeadingIcon({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: ColorPallet.grey,
          size: 20,
        ),
        SizedBox(width: 10.toWidth),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: ColorPallet.grey),
        ),
      ],
    );
  }
}
