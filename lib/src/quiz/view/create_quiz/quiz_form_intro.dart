// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_form.dart';

class _QuizFormIntro extends StatefulWidget {
  const _QuizFormIntro({
    Key? key,
    required this.onGettingStarted,
  }) : super(key: key);
  final VoidCallback onGettingStarted;

  @override
  State<_QuizFormIntro> createState() => __QuizFormIntroState();
}

class __QuizFormIntroState extends State<_QuizFormIntro>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      lowerBound: -10,
      duration: const Duration(milliseconds: 2000),
    );
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: ScreenScaleFactor.screenWidth * 0.8,
          padding: EdgeInsets.symmetric(
            horizontal: 14.toWidth,
            vertical: 14.toHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LazyLoadingText(
                'Welcome to quiz creation !',
                style: CustomTheme.headline5.copyWith(
                  fontStyle: FontStyle.italic,
                  foreground: ColorPallet.dialogShaderPaint,
                ),
                delay: const Duration(milliseconds: 700),
              ),
              SizedBox(height: 10.toHeight),
              LazyLoadingText(
                'Now you can create and share your quiz.',
                style: CustomTheme.headline6.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 16.toFont,
                ),
                delay: const Duration(milliseconds: 1200),
              ),
              SizedBox(height: 20.toHeight),
              FadeTransition(
                opacity: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const BulletList(
                      <String>[
                        'Quiz must contain a title.',
                        'Quiz must be in one or more categories.',
                        "Don't worry you can add more category.",
                        'A quiz should contain at least 1 question.',
                        'A quiz can have 10 questions max.'
                      ],
                      spacing: 8.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CommonButton(
                        onTap: widget.onGettingStarted,
                        text: "Let's get started",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ).glassMorphism(),
      ),
    );
  }
}
