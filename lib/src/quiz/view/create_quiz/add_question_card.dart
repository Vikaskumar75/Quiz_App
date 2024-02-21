// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_form.dart';

class _AddQuestionCard extends ConsumerStatefulWidget {
  const _AddQuestionCard({
    Key? key,
    required this.hasFocus,
    required this.quizController,
  }) : super(key: key);
  final bool hasFocus;
  final QuizQuestionController quizController;

  @override
  ConsumerState<_AddQuestionCard> createState() => _AddQuestionCardState();
}

class _AddQuestionCardState extends ConsumerState<_AddQuestionCard> {
  late List<QuizQuestionController> quizControllers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.toHeight),
      padding: EdgeInsets.symmetric(
        vertical: 20.toHeight,
        horizontal: 22.toWidth,
      ),
      decoration: BoxDecoration(
        color: widget.hasFocus
            ? ColorPallet.black.withOpacity(0.15)
            : ColorPallet.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: widget.quizController.titleController,
            autofocus: widget.hasFocus,
            enabled: widget.hasFocus,
            style: CustomTheme.headline4,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Question',
              hintStyle: CustomTheme.headline4.copyWith(
                foreground: widget.hasFocus
                    ? ColorPallet.whiteTextStyleForeground
                    : ColorPallet.lightWhiteTextStyleForeground,
              ),
            ),
          ),
          const Divider(),
          Text(
            'Options',
            style: CustomTheme.headline5.copyWith(
              color: widget.hasFocus
                  ? ColorPallet.white
                  : ColorPallet.white.withOpacity(0.2),
            ),
          ),
          SizedBox(height: 5.toHeight),
          Text(
            "Don't forget to mark the correct option ",
            style: CustomTheme.headline6.copyWith(
              color: widget.hasFocus
                  ? ColorPallet.white.withOpacity(0.4)
                  : ColorPallet.white.withOpacity(0.2),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(
                widget.quizController.optionControllers.length,
                (int index) => _OptionWidget(
                  hasFocus: widget.hasFocus,
                  optionNumber: index,
                  option: widget.quizController.optionControllers[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
