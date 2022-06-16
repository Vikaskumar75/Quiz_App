part of 'quiz_home.dart';

class _QuizHomeLoader extends StatelessWidget {
  const _QuizHomeLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Shimmer.fromColors(
                highlightColor: Color.fromARGB(255, 7, 34, 49),
                baseColor: ColorPallet.darkBlueGrey,
                period: const Duration(milliseconds: 2000),
                child: Container(
                  width: double.maxFinite,
                  height: ScreenScaleFactor.screenHeight * 0.10,
                  margin: EdgeInsets.symmetric(horizontal: 16.toWidth),
                  decoration: BoxDecoration(
                    color: ColorPallet.darkBlueGrey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              Divider(
                height: 24.toHeight,
                color: ColorPallet.extraLightGrey,
                indent: 14.toWidth,
                endIndent: 14.toWidth,
              ),
            ],
          );
        },
        childCount: 8,
      ),
    );
  }
}
