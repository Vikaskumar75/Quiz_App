part of 'quiz_form.dart';

class _QuizCategory extends ConsumerStatefulWidget {
  const _QuizCategory({Key? key}) : super(key: key);

  @override
  ConsumerState<_QuizCategory> createState() => _QuizCategoryState();
}

class _QuizCategoryState extends ConsumerState<_QuizCategory> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Category> selectedCategory = ref.watch(selectedCategoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30.toHeight),
        BackButton(
          onPressed: () => ref.read(quizPageIndexProvider.notifier).state--,
          color: ColorPallet.white,
        ),
        if (selectedCategory.isNotEmpty) ...<Widget>[
          SizedBox(height: 30.toHeight),
          const _QuizCategorySelectedList()
        ],
        SizedBox(height: 30.toHeight),
        LabelTextField(
          controller: controller,
          hintText: 'Ex: TV Series',
          labelText: 'Search for Category',
          autofocus: true,
        ),
        SizedBox(height: 20.toHeight),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: ColorPallet.darkBlueGrey,
              builder: (_) => const AddCategoryBottomSheet(),
            );
          },
          child: const TextWithLeadingIcon(
            text: 'Add new category',
            icon: Icons.add_circle_outline,
            iconColor: ColorPallet.golden,
          ),
        ),
        SizedBox(height: 20.toHeight),
        const _QuizCategorySelectionList(),
        SizedBox(height: 20.toHeight),
        CommonButton(
          text: 'Next',
          width: double.maxFinite,
          enable: selectedCategory.isNotEmpty,
          onTap: () {
            ref.read(quizPageIndexProvider.notifier).state++;
          },
        ),
      ],
    );
  }
}

class AddCategoryBottomSheet extends ConsumerStatefulWidget {
  const AddCategoryBottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCategoryBottomSheet> createState() =>
      _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState
    extends ConsumerState<AddCategoryBottomSheet> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool enableAddButton = ref.watch(addCategoryButtonProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 22.toHeight,
        horizontal: 16.toWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LabelTextField(
            controller: controller,
            autofocus: true,
            labelText: 'New category name',
            onChanged: (String? value) {
              if (value == null || value.isEmpty) {
                ref.read(addCategoryButtonProvider.notifier).state = false;
              } else {
                if (ref.read(addCategoryButtonProvider) == false) {
                  ref.read(addCategoryButtonProvider.notifier).state = true;
                }
              }
            },
          ),
          SizedBox(height: 22.toHeight),
          CommonButton(
            text: 'ADD',
            enable: enableAddButton,
            onTap: () {
              ref.read(categoryProvider.notifier).addCategory(controller.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class _QuizCategorySelectedList extends ConsumerWidget {
  const _QuizCategorySelectedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Category> selectedCategory = ref.watch(selectedCategoryProvider);

    return Wrap(
      runSpacing: 10.toHeight,
      spacing: 10.toWidth,
      children: List<Widget>.generate(
        selectedCategory.length,
        (int index) {
          return CustomActionChip(
            label: selectedCategory[index].name.capitalize(),
            actionIcon: Icons.close,
            backgroundColor: ColorPallet.darkBlue,
            onTap: () {
              ref
                  .read(selectedCategoryProvider.notifier)
                  .remove(selectedCategory[index]);
            },
          );
        },
      ),
    );
  }
}

class _QuizCategorySelectionList extends ConsumerWidget {
  const _QuizCategorySelectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CategoryState state = ref.watch(categoryProvider);
    final List<Category> selectedCategory = ref.watch(selectedCategoryProvider);

    if (state is CategorySuccess) {
      return Expanded(
        child: SingleChildScrollView(
          child: Wrap(
            children: List<Widget>.generate(
              state.data.categoriesData.categories.length,
              (int index) {
                final bool isSelected = selectedCategory.contains(
                  state.data.categoriesData.categories[index],
                );
                return isSelected
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.only(
                          right: 10.0.toWidth,
                          bottom: 10.toHeight,
                        ),
                        child: CustomActionChip(
                          label: state
                              .data.categoriesData.categories[index].name
                              .capitalize(),
                          actionIcon: Icons.add,
                          backgroundColor: ColorPallet.white,
                          labelColor: ColorPallet.black,
                          actionIconColor: ColorPallet.black,
                          dividerColor: ColorPallet.grey,
                          onTap: () {
                            ref.read(selectedCategoryProvider.notifier).add(
                                  state.data.categoriesData.categories[index],
                                );
                          },
                        ),
                      );
              },
            ),
          ),
        ),
      );
    } else if (state is CategoryError) {
      return GenericErrorWidget(error: state.error);
    } else {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: ColorPallet.darkBlue,
            strokeWidth: 2,
            backgroundColor: ColorPallet.white,
          ),
        ),
      );
    }
  }
}
