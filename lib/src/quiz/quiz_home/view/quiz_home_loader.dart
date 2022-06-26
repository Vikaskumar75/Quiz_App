part of 'quiz_home.dart';

class _QuizHomeLoader extends StatelessWidget {
  const _QuizHomeLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SnakeLoader(
            width: double.maxFinite,
            height: ScreenScaleFactor.screenHeight * 0.12,
            margin: EdgeInsets.symmetric(
              horizontal: 16.toWidth,
              vertical: 10.toHeight,
            ),
            insideColor: ColorPallet.blueGrey.withOpacity(0.1),
          );
        },
        childCount: 5,
      ),
    );
  }
}
