part of 'quiz_form.dart';

class _QuizCategory extends StatefulWidget {
  const _QuizCategory({Key? key}) : super(key: key);

  @override
  State<_QuizCategory> createState() => _QuizCategoryState();
}

class _QuizCategoryState extends State<_QuizCategory> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LabelTextField(
          controller: controller,
          hintText: 'Ex: TV Series',
          labelText: 'Categories',
        ),
      ],
    );
  }
}
