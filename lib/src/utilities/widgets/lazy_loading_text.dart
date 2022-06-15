import 'package:flutter/material.dart';

class LazyLoadingText extends StatefulWidget {
  const LazyLoadingText(
    this.text, {
    Key? key,
    this.style,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);
  final String text;
  final Duration duration;
  final TextStyle? style;

  @override
  State<LazyLoadingText> createState() => _LazyLoadingTextState();
}

class _LazyLoadingTextState extends State<LazyLoadingText>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<int>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animate();
  }

  @override
  void didUpdateWidget(covariant LazyLoadingText oldWidget) {
    _animate();
    super.didUpdateWidget(oldWidget);
  }

  void _animate() {
    _controller.reset();
    _animation = IntTween(begin: 0, end: widget.text.length).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (_, __) {
        return Text(
          widget.text.substring(0, _animation!.value),
          style: widget.style,
        );
      },
    );
  }
}
