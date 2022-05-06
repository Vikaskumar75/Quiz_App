part of 'quiz_home.dart';

class _QuizCategory extends StatelessWidget {
  const _QuizCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 60.toHeight,
        minHeight: 40.toHeight,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 14.toWidth,
        ),
        itemCount: 10,
        separatorBuilder: (_, int index) => SizedBox(
          width: 10.toWidth,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Chip(
            label: Text('Computers'),
          );
        },
      ),
    );
  }
}
