part of 'authentication_screen.dart';

class _PasswordScreen extends ConsumerStatefulWidget {
  const _PasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<_PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<_PasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late bool _isSignup;
  late AuthenticationProvider _authProvider;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _authProvider.addListener(_authListener);
    });
    super.initState();
  }

  void _authListener(AuthenticationState state) {
    if (state == AuthenticationState.success) {
      ref.read(pageIndexProvider.notifier).state++;
    }
  }

  @override
  Widget build(BuildContext context) {
    _isSignup = ref.watch(isSignUpProvider);
    _authProvider = ref.watch(authenticationProvider.notifier);
    return Stack(
      children: <Widget>[
        BackButton(
          onPressed: () => ref.read(pageIndexProvider.notifier).state--,
          color: ColorPallet.white,
        ),
        Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabelTextField(
                labelText: 'Password',
                hintText: '************',
                controller: ref.watch(passwordControllerProvider),
                obsecure: true,
                validator: _passwordValidator,
                onNext: () {
                  if (!_form.currentState!.validate()) return;
                  _authProvider.generateAndSendOtp();
                },
              ),
              if (_isSignup) ...<Widget>[
                SizedBox(height: 24.toHeight),
                LabelTextField(
                  labelText: 'Confirm Password',
                  hintText: '************',
                  validator: _confirmPasswordValidator,
                  controller: ref.watch(confirmPasswordControllerProvider),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }

  String? _passwordValidator(String? value) {
    String confirmPassword = ref.watch(confirmPasswordControllerProvider).text;
    if (_isSignup) {
      if (confirmPassword.isEmpty && (value == null || value.isEmpty)) {
        return '';
      } else if (confirmPassword != value) {
        return '';
      }
    } else if (value == null || value.isEmpty) {
      return 'Please provide password';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    String password = ref.watch(passwordControllerProvider).text;
    if (password.isEmpty && (value == null || value.isEmpty)) {
      return 'Please provide passwords';
    } else if (password != value) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  @override
  void dispose() {
    _authProvider.dispose();
    super.dispose();
  }
}
