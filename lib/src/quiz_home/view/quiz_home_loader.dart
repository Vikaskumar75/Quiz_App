part of 'quiz_home.dart';

class _QuizHomeLoader extends StatelessWidget {
  const _QuizHomeLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Shimmer.fromColors(
            highlightColor: ColorPallet.shimmerHighlight,
            baseColor: ColorPallet.extraLightGrey,
            child: const AvailabilityItemContainer(
              child: SizedBox.shrink(),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}