part of 'quiz_home.dart';

class _QuizHomeList extends ConsumerStatefulWidget {
  const _QuizHomeList({
    Key? key,
    required this.availability,
  }) : super(key: key);
  final QuizAvailability availability;

  @override
  ConsumerState<_QuizHomeList> createState() => __AvailabilityListState();
}

class __AvailabilityListState extends ConsumerState<_QuizHomeList> {
  final List<Widget> _listItems = <Widget>[];
  late GlobalKey<SliverAnimatedListState> _listKey;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<SliverAnimatedListState>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController = ref.read(scrollControllerProvider);
      _scrollController.addListener(scrollListener);
      _addWidgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: _listKey,
      itemBuilder: (_, int index, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Navigation.quizDetails,
                arguments: widget.availability.data[index],
              );
            },
            child: _listItems[index],
          ),
        );
      },
      initialItemCount: _listItems.length,
    );
  }

  Future<void> _addWidgets({int noOfWidgetsToAdd = 4}) async {
    final List<Quiz> data = widget.availability.data;
    if (data.isEmpty) return;
    if (_listItems.length == data.length) return;

    final int length = data.length;

    final int start = _listItems.length;
    final int end =
        length >= noOfWidgetsToAdd ? start + noOfWidgetsToAdd : length;

    for (int i = start; i < end; i++) {
      if (i >= length) break;
      _listItems.insert(i, _QuizListItem(quiz: data[i]));
      await Future<void>.delayed(const Duration(milliseconds: 50));
      _listKey.currentState!.insertItem(i);
    }
  }

  void scrollListener() {
    final ScrollPosition position = _scrollController.position;
    if (position.pixels > position.maxScrollExtent - 120) {
      _addWidgets(noOfWidgetsToAdd: 1);
    }

    if (_scrollController.offset > 500) {
      ref.read(showScrollToTopProvider.notifier).state = true;
    } else {
      ref.read(showScrollToTopProvider.notifier).state = false;
    }
  }
}
