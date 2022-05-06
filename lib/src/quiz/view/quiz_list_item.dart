part of 'quiz_home.dart';

class _QuizListItem extends StatelessWidget {
  const _QuizListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenScaleFactor.screenHeight * 0.15,
      margin: EdgeInsets.symmetric(
        vertical: 10.toHeight,
        horizontal: 14.toWidth,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.toWidth,
        vertical: 20.toHeight,
      ),
      decoration: BoxDecoration(
        color: ColorPallet.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              2.0,
              4.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              Assets.subject,
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
                  'UI UX Design',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const Spacer(),
              const TextWithLeadingIcon(
                text: '10 Questions',
                icon: Icons.summarize,
              ),
              const Spacer(),
              const TextWithLeadingIcon(
                text: '1 hour 15 min',
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
                    '4.8',
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
