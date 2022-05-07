import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz_home/provider/availability_provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../utilities/export.dart';
import '../provider/scroll_to_top_provider.dart';
import '../repository/availability_repo.dart';

part 'quiz_category.dart';
part 'quiz_home_list.dart';
part 'quiz_home_loader.dart';
part 'quiz_list_item.dart';
part 'sliver_app_bar.dart';

class QuizHome extends ConsumerStatefulWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends ConsumerState<QuizHome> {
  late ScrollController _scrollController;
  late AsyncValue<QuizAvailability> availability;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    availability = ref.watch(availabilityProvider);
    _scrollController = ref.watch(scrollControllerProvider);
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
            data: (QuizAvailability data) {
              return _QuizHomeList(
                availability: data,
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
            loading: () => const _QuizHomeLoader(),
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
