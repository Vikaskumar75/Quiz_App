// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_form.dart';

class _AddQuestionCard extends ConsumerWidget {
  const _AddQuestionCard({
    Key? key,
    required this.hasFocus,
  }) : super(key: key);
  final bool hasFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentQuestion = ref.read(currentQuestionProvider);
    final QuizQuestionController quizControllers =
        ref.read(questionControllers)[currentQuestion];

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.toHeight,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.toHeight,
        horizontal: 22.toWidth,
      ),
      decoration: BoxDecoration(
        color: hasFocus
            ? ColorPallet.black.withOpacity(0.15)
            : ColorPallet.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: quizControllers.titleController,
            autofocus: hasFocus,
            enabled: hasFocus,
            style: CustomTheme.headline4.copyWith(
              foreground: ColorPallet.dialogShaderPaint,
            ),
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Question',
              hintStyle: CustomTheme.headline4.copyWith(
                foreground: hasFocus
                    ? ColorPallet.whiteTextStyleForeground
                    : ColorPallet.lightWhiteTextStyleForeground,
              ),
            ),
          ),
          const Divider(),
          Text(
            'Options',
            style: CustomTheme.headline5.copyWith(
              color: hasFocus
                  ? ColorPallet.white
                  : ColorPallet.white.withOpacity(0.2),
            ),
          ),
          SizedBox(height: 5.toHeight),
          Text(
            "Don't forget to mark the correct oprtion ",
            style: CustomTheme.headline6.copyWith(
              color: hasFocus
                  ? ColorPallet.white.withOpacity(0.4)
                  : ColorPallet.white.withOpacity(0.2),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(
                quizControllers.optionControllers.length,
                (int index) => _OptionWidget(
                  hasFocus: hasFocus,
                  optionNumber: index,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OptionWidget extends ConsumerStatefulWidget {
  const _OptionWidget({
    Key? key,
    required this.hasFocus,
    required this.optionNumber,
  }) : super(key: key);

  final bool hasFocus;
  final int optionNumber;

  @override
  ConsumerState<_OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends ConsumerState<_OptionWidget> {
  @override
  Widget build(BuildContext context) {
    final int currentQuestion = ref.read(currentQuestionProvider);
    final QuizOptionController option = ref
        .read(questionControllers)[currentQuestion]
        .optionControllers[widget.optionNumber];
    return Row(
      children: <Widget>[
        Text(
          '${widget.optionNumber + 1}.',
          style: CustomTheme.headline4.copyWith(
            color: widget.hasFocus
                ? ColorPallet.white
                : ColorPallet.white.withOpacity(0.4),
          ),
        ),
        SizedBox(
          width: 10.toWidth,
        ),
        Expanded(
          child: TextFormField(
            controller: option.controller,
            style: CustomTheme.headline6,
            decoration: InputDecoration(
              border: _border(
                color: ColorPallet.white.withOpacity(0.2),
              ),
              focusedBorder: _border(),
              suffixIcon: Transform.scale(
                scale: 0.44,
                child: GestureDetector(
                  onTap: () {
                    option.isCorrect = !option.isCorrect;
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: option.isCorrect
                          ? ColorPallet.darkBlue
                          : ColorPallet.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: option.isCorrect
                            ? ColorPallet.darkBlue
                            : ColorPallet.white,
                      ),
                    ),
                    child: Visibility(
                      visible: option.isCorrect,
                      child: const Icon(
                        Icons.check,
                        color: ColorPallet.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide(
        color: color ?? ColorPallet.white,
        width: widget.hasFocus ? 1.2 : 1.0,
      ),
    );
  }
}
