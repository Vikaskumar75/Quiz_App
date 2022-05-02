import 'package:flutter/material.dart';

import '../utilities/export.dart';

part 'quiz_category.dart';
part 'quiz_list_item.dart';
part 'sliver_app_bar.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  final ScrollController _scrollController = ScrollController();
  final Tween<Offset> _offset = Tween<Offset>(
    begin: const Offset(1.0, 0),
    end: Offset.zero,
  );
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  final List<Widget> _listItems = <Widget>[];
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(addMoreItemsToList);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _addWidgets();
    });
  }

  Future<void> _addWidgets({int noOfWidgetsToAdd = 5}) async {
    late int _start;
    if (_listItems.isEmpty) {
      _start = 0;
    } else {
      _start = _listItems.length - 1;
    }
    final int _end = _start + noOfWidgetsToAdd;
    for (int i = _start; i < _end; i++) {
      _listItems.insert(i, const _QuizListItem());
      await Future<void>.delayed(const Duration(milliseconds: 5));
      _listKey.currentState!.insertItem(i);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          SliverAnimatedList(
            key: _listKey,
            itemBuilder: (
              BuildContext context,
              int index,
              Animation<double> animation,
            ) {
              return SlideTransition(
                position: animation.drive(_offset),
                child: _listItems[index],
              );
            },
            initialItemCount: _listItems.length,
          )
        ],
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.blueGrey,
            )
          : const SizedBox.shrink(),
    );
  }

  void addMoreItemsToList() {
    final ScrollPosition _position = _scrollController.position;
    if (_position.pixels > _position.maxScrollExtent - 120) {
      _addWidgets(noOfWidgetsToAdd: 1);
    }

    if (_scrollController.offset > 500) {
      setState(() {
        _showBackToTop = true;
      });
    } else {
      setState(() {
        _showBackToTop = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
