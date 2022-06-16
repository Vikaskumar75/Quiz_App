part of 'quiz_home.dart';

class _QuizCategory extends ConsumerWidget {
  const _QuizCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CategoriesModel> categories = ref.watch(categoryProvider);
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 40.toHeight,
          minHeight: 30.toHeight,
        ),
        child: categories.when(
          data: (CategoriesModel data) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 14.toWidth,
              ),
              itemCount: data.categoriesData.categories.length,
              separatorBuilder: (_, int index) => SizedBox(
                width: 10.toWidth,
              ),
              itemBuilder: (BuildContext context, int index) {
                final bool isSelected = index == 0;

                return Chip(
                  backgroundColor: isSelected
                      ? ColorPallet.darkGolden
                      : ColorPallet.grey.withOpacity(0.5),
                  label: Text(
                    data.categoriesData.categories[index].name.capitalize(),
                    style: CustomTheme.bodyText1,
                  ),
                );
              },
            );
          },
          error: (Object error, StackTrace? stack) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        ));
  }
}
