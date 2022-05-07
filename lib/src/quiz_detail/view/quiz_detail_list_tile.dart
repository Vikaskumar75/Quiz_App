part of 'quiz_detail.dart';

class _QuizDetailListTile extends StatelessWidget {
  const _QuizDetailListTile({
    Key? key,
    required this.heading,
    required this.subHeading,
    required this.icon,
  }) : super(key: key);

  final String heading;
  final String subHeading;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.toHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: ColorPallet.black,
            child: Icon(
              icon,
              color: ColorPallet.white,
            ),
          ),
          SizedBox(width: 14.toWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                heading,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                subHeading,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: ColorPallet.lightGrey,
                      fontSize: 18.toFont,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}