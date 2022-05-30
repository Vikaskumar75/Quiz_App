part of 'authentication_screen.dart';

class _OtpScreen extends StatefulWidget {
  const _OtpScreen({Key? key}) : super(key: key);

  @override
  State<_OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<_OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        _OtpLabel(),
        Center(
          child: _OtpTextField(),
        ),
      ],
    );
  }
}

class _OtpLabel extends ConsumerWidget {
  const _OtpLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BackButton(
          onPressed: () {
            final int _state = ref.read(pageIndexProvider.notifier).state;
            ref.read(pageIndexProvider.notifier).state = _state - 2;
          },
          color: ColorPallet.white,
        ),
        SizedBox(height: 24.toHeight),
        LazyLoadingText(
          'Verify your email',
          style: CustomTheme.headline4.copyWith(color: ColorPallet.white),
        ),
        SizedBox(height: 10.toHeight),
        Text.rich(
          TextSpan(
            text: 'Code sent to ',
            style: CustomTheme.bodyText1.copyWith(
              color: ColorPallet.white.withOpacity(0.3),
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'yourname@example.com',
                style: CustomTheme.bodyText1.copyWith(
                  color: ColorPallet.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OtpTextField extends StatefulWidget {
  const _OtpTextField({Key? key}) : super(key: key);

  @override
  State<_OtpTextField> createState() => __OtpTextFieldState();
}

class __OtpTextFieldState extends State<_OtpTextField> {
  bool _isCompleteOtpEntered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        PinCodeTextField(
          autofocus: true,
          defaultBorderColor: ColorPallet.white.withOpacity(0.5),
          hasTextBorderColor: ColorPallet.white,
          pinBoxWidth: ScreenScaleFactor.screenWidth * 0.11,
          maxLength: 6,
          onTextChanged: (String text) {
            if (text.length == 6) {
              _isCompleteOtpEntered = true;
              setState(() {});
            }
          },
          onDone: (String text) {},
          wrapAlignment: WrapAlignment.spaceEvenly,
          pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
          pinTextStyle: TextStyle(
            fontSize: 22.0,
            color: ColorPallet.white.withOpacity(0.8),
          ),
          pinTextAnimatedSwitcherTransition:
              ProvidedPinBoxTextAnimation.scalingTransition,
          pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
          keyboardType: TextInputType.number,
        ),
        SizedBox(width: 20.toWidth),
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Navigation.quizHome,
              (_) => false,
            );
          },
          child: Icon(
            Icons.arrow_circle_right_outlined,
            color: _isCompleteOtpEntered
                ? ColorPallet.golden
                : ColorPallet.blackishGolden,
          ),
        ),
      ],
    );
  }
}
