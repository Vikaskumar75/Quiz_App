part of 'quiz_home.dart';

class _QuizCategory extends ConsumerWidget {
  const _QuizCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CategoryState state = ref.watch(categoryProvider);

    if (state is CategorySuccess) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 36.toHeight,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 14.toWidth,
          ),
          itemCount: state.data.categoriesData.categories.length,
          separatorBuilder: (_, int index) => SizedBox(
            width: 10.toWidth,
          ),
          itemBuilder: (BuildContext context, int index) {
            final bool isSelected = index == 0;

            return Chip(
              backgroundColor: isSelected
                  ? ColorPallet.darkBlue
                  : ColorPallet.grey.withOpacity(0.5),
              label: Text(
                state.data.categoriesData.categories[index].name.capitalize(),
                style: CustomTheme.bodyText1,
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
