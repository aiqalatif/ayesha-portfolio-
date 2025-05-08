import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class FadeSlideAnimation extends StatelessWidget {
  final Widget child;
  final bool isVisible;
  final Offset offset;
  final Duration duration;

  const FadeSlideAnimation({
    Key? key,
    required this.child,
    this.isVisible = true,
    this.offset = const Offset(0, 20),
    this.duration = defaultDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: isVisible ? 1.0 : 0.0,
      child: AnimatedSlide(
        duration: duration,
        offset: isVisible ? Offset.zero : offset,
        child: child,
      ),
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final bool isVisible;
  final Duration duration;

  const ScaleAnimation({
    Key? key,
    required this.child,
    this.isVisible = true,
    this.duration = defaultDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: duration,
      scale: isVisible ? 1.0 : 0.8,
      child: AnimatedOpacity(
        duration: duration,
        opacity: isVisible ? 1.0 : 0.0,
        child: child,
      ),
    );
  }
}

class HoverAnimation extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const HoverAnimation({
    Key? key,
    required this.child,
    this.scale = 1.05,
    this.duration = fastDuration,
  }) : super(key: key);

  @override
  State<HoverAnimation> createState() => _HoverAnimationState();
}

class _HoverAnimationState extends State<HoverAnimation> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        duration: widget.duration,
        scale: isHovered ? widget.scale : 1.0,
        child: widget.child,
      ),
    );
  }
}

class GradientAnimation extends StatefulWidget {
  final Widget child;
  final List<Color> colors;
  final Duration duration;

  const GradientAnimation({
    Key? key,
    required this.child,
    this.colors = const [accentColor1, accentColor2, accentColor3],
    this.duration = slowDuration,
  }) : super(key: key);

  @override
  State<GradientAnimation> createState() => _GradientAnimationState();
}

class _GradientAnimationState extends State<GradientAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: widget.colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0,
                _animation.value,
                1.0,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
} 