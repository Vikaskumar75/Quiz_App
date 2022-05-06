import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz_home/provider/availability_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utilities/export.dart';
import '../provider/scroll_to_top_provider.dart';
import '../repository/availability_repo.dart';

part 'quiz_category.dart';
part 'quiz_list_item.dart';
part 'sliver_app_bar.dart';

class QuizHome extends ConsumerStatefulWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends ConsumerState<QuizHome> {
  final ScrollController _scrollController = ScrollController();

  late AsyncValue<Availability> availability;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    availability = ref.watch(availabilityProvider);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        scrollBehavior: const ScrollBehavior().copyWith(
          overscroll: false,
        ),
        slivers: <Widget>[
          const _SliverAppBar(),
          const SliverToBoxAdapter(
            child: _QuizCategory(),
          ),
          availability.when(
            data: (Availability data) {
              return _AvailabilityList(
                availability: data,
                scrollController: _scrollController,
              );
            },
            error: (Object e, StackTrace? stack) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 280.0.toHeight),
                  child: const GenericErrorWidget(),
                ),
              );
            },
            loading: () => const _AvailabilityLoader(),
          )
        ],
      ),
      floatingActionButton: ref.watch(showScrollToTopProvider)
          ? BackToTopButton(onTap: _scrollToTop)
          : const SizedBox.shrink(),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}

class _AvailabilityList extends ConsumerStatefulWidget {
  const _AvailabilityList({
    Key? key,
    required this.availability,
    required this.scrollController,
  }) : super(key: key);
  final Availability availability;
  final ScrollController scrollController;

  @override
  ConsumerState<_AvailabilityList> createState() => __AvailabilityListState();
}

class __AvailabilityListState extends ConsumerState<_AvailabilityList> {
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
      _listItems.insert(i, const _QuizListItem());
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

class _AvailabilityLoader extends StatelessWidget {
  const _AvailabilityLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Shimmer.fromColors(
            highlightColor: ColorPallet.shimmerHighlight,
            baseColor: ColorPallet.extraLightGrey,
            child: const AvailabilityItemContainer(
              child: SizedBox.shrink(),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}
