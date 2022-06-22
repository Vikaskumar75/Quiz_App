// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math.dart' as vector;

class Flipper extends ConsumerStatefulWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  const Flipper({
    Key? key,
    required this.firstWidget,
    required this.secondWidget,
  }) : super(key: key);

  @override
  ConsumerState<Flipper> createState() => _FlipperState();
}

class _FlipperState extends ConsumerState<Flipper>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final Tween<double> tween = Tween<double>(begin: 0, end: 180);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = tween.animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(flipProvider, ((_, bool next) {
      if (next) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }));
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(vector.radians(animation.value)),
          alignment: FractionalOffset.center,
          child: Scaffold(
            body: animation.value < 90
                ? widget.firstWidget
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.secondWidget,
                  ),
          ),
        );
      },
    );
  }
}

final StateProvider<bool> flipProvider = StateProvider<bool>((_) => false);
