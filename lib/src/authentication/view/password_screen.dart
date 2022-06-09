part of 'authentication_screen.dart';

class _PasswordScreen extends ConsumerStatefulWidget {
  const _PasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<_PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<_PasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  late bool _isSignup;
  late AuthProvider _authProvider;

  @override
  Widget build(BuildContext context) {
    _isSignup = ref.watch(isSignUpProvider);
    _authProvider = ref.watch(authProvider.notifier);

    return Stack(
      children: <Widget>[
        BackButton(
          onPressed: () {
            final int _state = ref.read(pageIndexProvider.notifier).state;
            if (_isSignup) {
              ref.read(pageIndexProvider.notifier).state = _state - 2;
            } else {
              ref.read(pageIndexProvider.notifier).state = _state - 1;
            }
          },
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
                  if (_isSignup) {
                    _authProvider.register();
                  } else {
                    _authProvider.login();
                  }
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
}
