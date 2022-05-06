part of 'quiz_home.dart';

class _QuizHomeList extends ConsumerStatefulWidget {
  const _QuizHomeList({
    Key? key,
    required this.availability,
    required this.scrollController,
  }) : super(key: key);
  final Availability availability;
  final ScrollController scrollController;

  @override
  ConsumerState<_QuizHomeList> createState() => __AvailabilityListState();
}

class __AvailabilityListState extends ConsumerState<_QuizHomeList> {
  final List<Widget> _listItems = <Widget>[];
  late GlobalKey<SliverAnimatedListState> _listKey;
  late Tween<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<SliverAnimatedListState>();
    _offset = Tween<Offset>(begin: const Offset(1.0, 0), end: Offset.zero);
    widget.scrollController.addListener(addMoreItemsToList);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _addWidgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: _listKey,
      itemBuilder: (_, int index, Animation<double> animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: _listItems[index],
        );
      },
      initialItemCount: _listItems.length,
    );
  }

  Future<void> _addWidgets({int noOfWidgetsToAdd = 5}) async {
    final int _start = _listItems.isEmpty ? 0 : _listItems.length - 1;
    final int _end = _start + noOfWidgetsToAdd;

    for (int i = _start; i < _end; i++) {
      _listItems.insert(
        i,
        _QuizListItem(availability: widget.availability.data[i]),
      );
      await Future<void>.delayed(const Duration(milliseconds: 5));
      _listKey.currentState!.insertItem(i);
    }
  }

  void addMoreItemsToList() {
    final ScrollPosition _position = widget.scrollController.position;
    if (_position.pixels > _position.maxScrollExtent - 120) {
      _addWidgets(noOfWidgetsToAdd: 1);
    }

    if (widget.scrollController.offset > 500) {
      ref.read(showScrollToTopProvider.notifier).state = true;
    } else {
      ref.read(showScrollToTopProvider.notifier).state = false;
    }
  }
}
