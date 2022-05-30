part of 'authentication_screen.dart';

class _EmailScreen extends ConsumerStatefulWidget {
  const _EmailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<_EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<_EmailScreen> {
  final TextEditingController _controller = TextEditingController();
  late bool _isSignup;

  @override
  Widget build(BuildContext context) {
    _isSignup = ref.watch(isSignUpProvider);
    return Stack(
      children: <Widget>[
        if (_isSignup) const _SignupHeader(),
        _EmailScreenBody(
          controller: _controller,
          isSignup: _isSignup,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _EmailScreenBody extends ConsumerWidget {
  const _EmailScreenBody({
    Key? key,
    required this.controller,
    required this.isSignup,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isSignup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LabelTextField(
          labelText: 'Email',
          hintText: 'yourname@example.com',
          controller: controller,
          onNext: (){
            log('Next');
          },
        ),
        SizedBox(height: 22.toHeight),
        Text.rich(
          TextSpan(
            text: isSignup ? 'Already a user? ' : "Haven't registered yet? ",
            style: CustomTheme.bodyText1.copyWith(
              color: ColorPallet.white.withOpacity(0.3),
            ),
            children: <TextSpan>[
              TextSpan(
                text: isSignup ? 'Login' : 'Register',
                style: CustomTheme.bodyText1.copyWith(
                  color: ColorPallet.white,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ref.read(isSignUpProvider.notifier).state = !isSignup;
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

