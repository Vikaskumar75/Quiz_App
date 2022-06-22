// ignore_for_file: always_specify_types

import 'package:flutter_riverpod/flutter_riverpod.dart';

final overlayWidthProvider =
    StateProvider.family<double, double>((_, double width) {
  return width;
});

final overlayHeightProvider =
    StateProvider.family<double, double>((_, double height) {
  return height;
});
