import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../export.dart';

class DragSwitch extends ConsumerStatefulWidget {
  const DragSwitch({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<DragSwitch> createState() => _CreateQuizOverlayState();
}

class _CreateQuizOverlayState extends ConsumerState<DragSwitch> {
  final double _radius = 6;
  final double _height = 60;
  final double _width = 20;
  final double _maximumWidth = 120;
  final double _thresholdWidth = 80;
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
            curve: Curves.linearToEaseOut,
            height: heightProvider.toHeight,
            width: widthProvider.toWidth,
            child: const Icon(
              Icons.drag_indicator,
              size: 18,
            ).glassMorphism(),
          ),
        ),
      ),
    );
  }
}

final StateProviderFamily<double, double> overlayWidthProvider =
    StateProvider.family<double, double>((_, double width) {
  return width;
});

final StateProviderFamily<double, double> overlayHeightProvider =
    StateProvider.family<double, double>((_, double height) {
  return height;
});
