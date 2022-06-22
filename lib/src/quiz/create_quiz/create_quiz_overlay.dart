import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz/provider/quiz_overlay_provider.dart';

import '../../utilities/export.dart';

class CreateQuizOverlay extends ConsumerStatefulWidget {
  const CreateQuizOverlay({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CreateQuizOverlay> createState() => _CreateQuizOverlayState();
}

class _CreateQuizOverlayState extends ConsumerState<CreateQuizOverlay> {
  final double _radius = 6;
  final double _height = 60;
  final double _width = 20;
  final double _maximumWidth = 150;
  final double _thresholdWidth = 120;
  bool _triggerAnimation = false;

  @override
  Widget build(BuildContext context) {
    final double widthProvider = ref.watch(overlayWidthProvider(_width));
    final double heightProvider = ref.watch(overlayHeightProvider(_height));
    return Positioned(
      bottom: ScreenScaleFactor.screenHeight * 0.18,
      child: GestureDetector(
        onLongPress: () {
          ref.read(overlayHeightProvider(heightProvider).notifier).state = 80;
          ref.read(overlayWidthProvider(widthProvider).notifier).state = 24;
        },
        onLongPressEnd: (LongPressEndDetails details) {
          ref.read(overlayHeightProvider(_height).notifier).state = _height;
          ref.read(overlayWidthProvider(_width).notifier).state = _width;
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          if (details.localPosition.dx < _width) return;
          if (details.localPosition.dx >= _maximumWidth) return;
          if (details.localPosition.dx > _thresholdWidth) {
            _triggerAnimation = true;
          }
          ref.read(overlayWidthProvider(_width).notifier).state =
              details.localPosition.dx;
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          if (_triggerAnimation) {
            bool flipState = ref.read(flipProvider.notifier).state;
            ref.read(flipProvider.notifier).state = !flipState;
            _triggerAnimation = false;
          }
          ref.read(overlayWidthProvider(_width).notifier).state = _width;
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(_radius),
            bottomRight: Radius.circular(_radius),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: heightProvider.toHeight,
            width: widthProvider.toWidth,
            child: const Icon(
              Icons.arrow_right_sharp,
              size: 18,
            ).glassMorphism(),
          ),
        ),
      ),
    );
  }
}
