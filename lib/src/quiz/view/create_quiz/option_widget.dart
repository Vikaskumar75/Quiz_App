part of 'quiz_form.dart';

class _OptionWidget extends ConsumerStatefulWidget {
  const _OptionWidget({
    Key? key,
    required this.hasFocus,
    required this.optionNumber,
    required this.option,
  }) : super(key: key);

  final bool hasFocus;
  final int optionNumber;
  final QuizOptionController option;

  @override
  ConsumerState<_OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends ConsumerState<_OptionWidget> {
  @override
  Widget build(BuildContext context) {
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
            controller: widget.option.controller,
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
                    widget.option.isCorrect = !widget.option.isCorrect;
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: widget.option.isCorrect
                          ? ColorPallet.darkBlue
                          : ColorPallet.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: widget.option.isCorrect
                            ? ColorPallet.darkBlue
                            : ColorPallet.white,
                      ),
                    ),
                    child: Visibility(
                      visible: widget.option.isCorrect,
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
