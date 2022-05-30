// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This provider tells wether user is trying to login or signup
final StateProvider<bool> isSignUpProvider = StateProvider<bool>((_) => false);

// These provider helps in the navigation of authentication screens
final StateProvider<int> pageIndexProvider = StateProvider<int>((_) => 0);
final pageControllerProvider = Provider<PageController>(
  (_) => PageController(initialPage: 0),
);

