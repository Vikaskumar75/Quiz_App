part of 'authentication_screen.dart';

class _EmailScreen extends ConsumerStatefulWidget {
  const _EmailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<_EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<_EmailScreen> {
  late bool _isSignup;

  @override
  Widget build(BuildContext context) {
    _isSignup = ref.watch(isSignUpProvider);
    return Stack(
      children: <Widget>[
        if (_isSignup) const _SignupHeader(),
        _EmailScreenBody(
          isSignup: _isSignup,
        ),
      ],
    );
  }
}

class _EmailScreenBody extends ConsumerStatefulWidget {
  const _EmailScreenBody({
    Key? key,
    required this.isSignup,
  }) : super(key: key);

  final bool isSignup;

  @override
  ConsumerState<_EmailScreenBody> createState() => _EmailScreenBodyState();
}

class _EmailScreenBodyState extends ConsumerState<_EmailScreenBody> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
          key: _form,
          child: LabelTextField(
            labelText: 'Email',
            hintText: 'yourname@example.com',
            controller: ref.watch(emailControllerProvider),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please provide an email';
              } else if (!value.isValidEmail()) {
                return 'Please provide a valid email';
              }
              return null;
            },
            onNext: () {
              if (!_form.currentState!.validate()) return;
              ref.read(pageIndexProvider.notifier).state++;
            },
          ),
        ),
        SizedBox(height: 22.toHeight),
        Text.rich(
          TextSpan(
            text: widget.isSignup
                ? 'Already a user? '
                : "Haven't registered yet? ",
            style: CustomTheme.bodyText1.copyWith(
              color: ColorPallet.white.withOpacity(0.3),
            ),
            children: <TextSpan>[
              TextSpan(
                text: widget.isSignup ? 'Login' : 'Register',
                style: CustomTheme.bodyText1.copyWith(
                  color: ColorPallet.white,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ref.read(isSignUpProvider.notifier).state =
                        !widget.isSignup;
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SignupHeader extends StatelessWidget {
  const _SignupHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 24.toHeight),
        LazyLoadingText(
          'Welcome, Onboard',
          style: CustomTheme.headline4.copyWith(color: ColorPallet.white),
        ),
      ],
    );
  }
}
