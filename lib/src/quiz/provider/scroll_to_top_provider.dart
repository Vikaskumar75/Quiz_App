// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollControllerProvider = Provider.autoDispose<ScrollController>(
  (_) => ScrollController(),
);

final showScrollToTopProvider = StateProvider<bool>((_) => false);
