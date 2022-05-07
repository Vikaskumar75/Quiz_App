import 'package:flutter/material.dart';
import 'package:quiz_app/src/utilities/export.dart';

class QuizDetails extends StatelessWidget {
  const QuizDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenScaleFactor.screenHeight * 0.5,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: ColorPallet.blueGreyGradient,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _QuizDetailsCard(),
          )
        ],
      ),
    );
  }
}

class _QuizDetailsCard extends StatelessWidget {
  const _QuizDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenScaleFactor.screenHeight * 0.75,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 18.toWidth),
      decoration: const BoxDecoration(
        color: ColorPallet.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.toFont,
                ),
          ),
          SizedBox(height: 20.toHeight),
          const _QuizDetailListTile(
            icon: Icons.article_outlined,
            heading: '10 Questions',
            subHeading: '10 point for correct answer',
          ),
          SizedBox(height: 20.toHeight),
          const _QuizDetailListTile(
            icon: Icons.access_time,
            heading: '10 Questions',
            subHeading: '10 point for correct answer',
          ),
          SizedBox(height: 20.toHeight),
          const _QuizDetailListTile(
            icon: Icons.star_border_rounded,
            heading: '10 Questions',
            subHeading: '10 point for correct answer',
          ),
          SizedBox(height: 20.toHeight),
          Text(
            'Please read the text below carefully so you can understand it',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.toFont,
                ),
          ),
          SizedBox(height: 20.toHeight),
          const BulletList(
            <String>['HI', 'Hello', 'Bye'],
          ),
        ],
      ),
    );
  }
}

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
