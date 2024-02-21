part of 'authentication_screen.dart';

class _OtpScreen extends StatefulWidget {
  const _OtpScreen({Key? key}) : super(key: key);

  @override
  State<_OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<_OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[
        _OtpLabel(),
        _OtpTextField(),
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
          onPressed: () => ref.read(pageIndexProvider.notifier).state--,
          color: ColorPallet.white,
        ),
        SizedBox(height: 24.toHeight),
        LazyLoadingText(
          'Verify your email',
          style: CustomTheme.headline4,
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
                text: ref.watch(emailControllerProvider).text,
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

class _OtpTextField extends ConsumerStatefulWidget {
  const _OtpTextField({Key? key}) : super(key: key);

  @override
  ConsumerState<_OtpTextField> createState() => __OtpTextFieldState();
}

class __OtpTextFieldState extends ConsumerState<_OtpTextField> {
  bool _isCompleteOtpEntered = false;
  late AuthState _authState;
  late AuthProvider _authProvider;

  @override
  Widget build(BuildContext context) {
    _authProvider = ref.watch(authProvider.notifier);
    _authState = ref.watch(authProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            PinCodeTextField(
              controller: ref.watch(otpControllerProvider),
              autofocus: true,
              pinBoxBorderWidth: 1,
              defaultBorderColor: ColorPallet.white.withOpacity(0.5),
              hasTextBorderColor: ColorPallet.white,
              errorBorderColor: ColorPallet.red,
              hasError: _authState == AuthState.otpError,
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
              pinBoxDecoration:
                  ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
              pinTextStyle: TextStyle(
                fontSize: 22.0,
                color: ColorPallet.white.withOpacity(0.8),
              ),
              pinTextAnimatedSwitcherTransition:
                  ProvidedPinBoxTextAnimation.scalingTransition,
              pinTextAnimatedSwitcherDuration:
                  const Duration(milliseconds: 300),
              keyboardType: TextInputType.number,
            ),
            SizedBox(width: 20.toWidth),
            GestureDetector(
              onTap: () => _authProvider.validateOtp(),
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: _isCompleteOtpEntered
                    ? ColorPallet.golden
                    : ColorPallet.blackishGolden,
              ),
            ),
          ],
        ),
        if (_authState == AuthState.otpError) ...<Widget>[
          SizedBox(height: 10.toHeight),
          Text(
            ref.watch(otpErrorProvider),
            style: CustomTheme.bodyText2.copyWith(
              color: ColorPallet.red,
            ),
          ),
        ],
      ],
    );
  }
}
