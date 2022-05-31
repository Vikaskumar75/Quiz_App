part of 'quiz_home.dart';

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 140.toHeight,
      elevation: 0,
      centerTitle: false,
      leading: Image.asset(
        Assets.logo,
        fit: BoxFit.cover,
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 14.toWidth),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                Assets.demoProfile,
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: const _QuizHomeAppBar(),
    );
  }
}

class _QuizHomeAppBar extends StatelessWidget {
  const _QuizHomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorPallet.blueGreyGradient,
      ),
      child: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.only(
          start: 14.toWidth,
          bottom: 16.toHeight,
        ),
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxHeight < 135.toHeight) {
              return const SizedBox.shrink();
            } else {
              return SizedBox(
                width: double.maxFinite,
                child: Text.rich(
                  TextSpan(
                    text: 'Hello, James\n',
                    children: <InlineSpan>[
                      TextSpan(
                        text: "Let's test your knowledge",
                        style: CustomTheme.headline5.copyWith(
                          color: ColorPallet.white,
                        ),
                      ),
                    ],
                  ),
                  style:
                      CustomTheme.headline6.copyWith(color: ColorPallet.white),
                  textAlign: TextAlign.left,
                ),
              );
            }
          },
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
