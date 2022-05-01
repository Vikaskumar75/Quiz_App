part of 'quiz_home.dart';

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 130.toHeight,
      elevation: 0,
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
            if (constraints.maxHeight < 90) {
              return const SizedBox.shrink();
            } else {
              return Text.rich(
                TextSpan(
                  text: 'Hello, James\n',
                  children: <InlineSpan>[
                    TextSpan(
                      text: "Let's test your knowledge",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
              );
            }
          },
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
