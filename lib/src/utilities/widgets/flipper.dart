import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../../quiz/provider/carousel_index_provider.dart';
import '../export.dart';

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
  final int milliseconds = 800;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  late AnimationController rotateController;
  late Animation<double> rotateAnimation;
  final Tween<double> rotateTween = Tween<double>(begin: 0, end: 180);
  final Tween<double> scaleTween = Tween<double>(begin: 1, end: 0.5);

  @override
  void initState() {
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (milliseconds / 2).floor()),
    );

    scaleAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: scaleController,
        curve: Curves.linearToEaseOut,
      ),
    );

    rotateController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (milliseconds / 2).floor(),
      ),
    );

    rotateAnimation = rotateTween.animate(
      CurvedAnimation(
        parent: rotateController,
        curve: Curves.linearToEaseOut,
      ),
    );
    super.initState();
  }

  Future<void> animate(bool isForward) async {
    final Duration waitDuration = Duration(
      milliseconds: (milliseconds / 2).floor(),
    );

    scaleController.forward();
    await Future<void>.delayed(waitDuration);

    if (isForward) {
      rotateController.forward();
    } else {
      rotateController.reverse();
    }
    await Future<void>.delayed(waitDuration);
    scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final int carouselIndex = ref.watch(carouselIndexProvider);
    ref.listen(flipProvider, (_, bool next) => animate(next));
    return Stack(
      children: <Widget>[
        Image.asset(
          CarouselItems.items[carouselIndex].asset,
          height: ScreenScaleFactor.screenHeight,
          width: ScreenScaleFactor.screenWidth,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: ScreenScaleFactor.screenHeight,
          width: ScreenScaleFactor.screenWidth,
        ).glassMorphism(),
        ScaleTransition(
          scale: scaleAnimation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AnimatedBuilder(
              animation: rotateAnimation,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(2, 2, 0.01)
                    ..rotateY(vector.radians(rotateAnimation.value)),
                  alignment: Alignment.center,
                  child: rotateAnimation.value < 90
                      ? widget.firstWidget
                      : Transform(
                          transform: Matrix4.identity()..rotateY(pi),
                          alignment: Alignment.center,
                          child: widget.secondWidget,
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

final StateProvider<bool> flipProvider = StateProvider<bool>((_) => false);
