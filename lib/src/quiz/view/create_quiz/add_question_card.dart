part of 'quiz_form.dart';

class _AddQuestionCard extends StatelessWidget {
  const _AddQuestionCard({
    Key? key,
    required this.hasFocus,
  }) : super(key: key);
  final bool hasFocus;

  @override
  Widget build(BuildContext context) {
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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
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
              color: ColorPallet.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
