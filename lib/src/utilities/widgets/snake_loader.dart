import 'dart:math';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:flutter/material.dart';


class SnakeLoader extends StatefulWidget {
  const SnakeLoader({
    Key? key,
    this.child,
    this.color = Colors.white70,
    this.insideColor,
    this.trailingColor = Colors.transparent,
    this.strokeWidth = 4.0,
    this.radius = 6,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.startWithRandomPosition = true,
    this.stopAnimation = false,
    this.duration = const Duration(milliseconds: 2000),
  }) : super(key: key);
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color color;
  final Color trailingColor;
  final Color? insideColor;
  final double strokeWidth;
  final double radius;
  final bool startWithRandomPosition;
  final bool stopAnimation;
  final Duration duration;

  @override
  State<SnakeLoader> createState() => _SnakeLoaderState();
}

class _SnakeLoaderState extends State<SnakeLoader>
    with TickerProviderStateMixin {
  late AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation.repeat();
  }

  @override
  void didUpdateWidget(covariant SnakeLoader oldWidget) {
    if (widget.stopAnimation) {
      animation.stop();
    } else {
      animation.repeat();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      height: widget.height,
      width: widget.width,
      child: CustomPaint(
        painter: LoadingPainter(
          animation: animation,
          color: widget.color,
          radius: widget.radius,
          strokeWidth: widget.strokeWidth,
          trailingColor: widget.trailingColor,
          randomNumber: widget.startWithRandomPosition ? getRandomNumber() : 0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.insideColor,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  double getRandomNumber() {
    final Random random = Random();
    return (random.nextInt(500) + 10).toDouble();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}

class LoadingPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final Color trailingColor;
  final double strokeWidth;
  final double radius;
  final double randomNumber;
  LoadingPainter({
    required this.animation,
    this.color = Colors.white70,
    this.trailingColor = Colors.transparent,
    this.strokeWidth = 4.0,
    this.radius = 6.0,
    this.randomNumber = 2,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    Paint pathPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: <Color>[
          Colors.transparent,
          color,
        ],
        stops: const <double>[0.6, 1.0],
        endAngle: vector.radians(360),
        transform: GradientRotation(
          vector.radians(
            (360 * animation.value) + randomNumber,
          ),
        ),
      ).createShader(rect.outerRect);

    final Path path = Path()..addRRect(rect);

    Paint paint = Paint()
      ..color = trailingColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rect, paint);
    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
