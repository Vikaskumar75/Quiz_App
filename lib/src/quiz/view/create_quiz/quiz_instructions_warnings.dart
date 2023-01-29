part of 'quiz_form.dart';

class _QuizInstructionsAndWarnings extends ConsumerWidget {
  const _QuizInstructionsAndWarnings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.toHeight),
          BackButton(
            onPressed: () => ref.read(quizPageIndexProvider.notifier).state--,
            color: ColorPallet.white,
          ),
          SizedBox(height: 30.toHeight),
          Text(
            'Warnings / Rules / Description',
            style: CustomTheme.headline5,
          ),
          Text(
            'Please mention any point that should be kept in mind before starting the quiz',
            style: CustomTheme.bodyText1.copyWith(
              color: ColorPallet.white.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 30.toHeight),
          const Expanded(child: _WarningTextFields()),
          CommonButton(
            text: 'Next',
            onTap: () {
              ref.read(quizCreationProvider.notifier).createQuiz();
            },
          ),
          SizedBox(height: 20.toHeight),
        ],
      ),
    );
  }
}

class _WarningTextFields extends ConsumerStatefulWidget {
  const _WarningTextFields({Key? key}) : super(key: key);

  @override
  ConsumerState<_WarningTextFields> createState() => _WarningTextFieldsState();
}

class _WarningTextFieldsState extends ConsumerState<_WarningTextFields> {
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        ref.watch(warningsControllerProvider);

    return ListView.separated(
      itemCount: controllers.length,
      separatorBuilder: (_, __) => SizedBox(height: 30.toHeight),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.circle, size: 12),
            SizedBox(width: 10.toWidth),
            Expanded(
              child: TextFormField(
                controller: controllers[index],
                style: CustomTheme.headline6,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  border: _border(
                    color: ColorPallet.white.withOpacity(0.5),
                  ),
                  focusedBorder: _border(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide(
        color: color ?? ColorPallet.white,
        width: 1.2,
      ),
    );
  }
}
