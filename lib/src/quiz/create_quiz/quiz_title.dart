part of 'quiz_form.dart';

class _QuizTitle extends ConsumerWidget {
  const _QuizTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = ref.read(quizCreationFormKeyProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LabelTextField(
          controller: ref.read(quizTitleControllerProvider),
          labelText: 'Quiz Title',
          hintText: 'Ex: Friends TV Series Facts',
          autofocus: true,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'You cannot create a quiz without a title';
            }
            return null;
          },
          onNext: () {
            if (formKey.currentState!.validate()) {}
          },
        ),
        SizedBox(height: 10.toHeight),
        Text(
          'Note: Two quizzes cannot have same name.',
          style: CustomTheme.bodyText1.copyWith(
            color: ColorPallet.white.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
