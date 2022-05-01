import 'package:flutter/material.dart';

import '../utilities/export.dart';

part 'quiz_list_item.dart';
part 'sliver_app_bar.dart';
part 'quiz_category.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  final ScrollController _scrollController = ScrollController();

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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              _buildListItem,
              childCount: 50,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return const _QuizListItem();
  }
}


