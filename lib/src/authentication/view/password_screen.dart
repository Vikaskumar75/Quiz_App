part of 'authentication_screen.dart';

class _PasswordScreen extends ConsumerStatefulWidget {
  const _PasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<_PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<_PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  late bool _isSignup;
  @override
  Widget build(BuildContext context) {
    _isSignup = ref.watch(isSignUpProvider);
    return Stack(
      children: <Widget>[
        BackButton(
          onPressed: () => ref.read(pageIndexProvider.notifier).state--,
          color: ColorPallet.white,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LabelTextField(
              labelText: 'Password',
              hintText: '************',
              controller: _controller,
              obsecure: true,
              onNext: () {
                ref.read(pageIndexProvider.notifier).state++;
              },
            ),
            if (_isSignup) ...<Widget>[
              SizedBox(height: 24.toHeight),
              LabelTextField(
                labelText: 'Confirm Password',
                hintText: '************',
                controller: _confirmController,
              ),
            ]
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _confirmController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
