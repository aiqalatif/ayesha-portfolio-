import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class NavigationTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<NavigationTextButton> createState() => _NavigationTextButtonState();
}

class _NavigationTextButtonState extends State<NavigationTextButton> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHoverChanged(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverChanged(true),
      onExit: (_) => _onHoverChanged(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotateAnimation.value,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: smallPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  gradient: _isHovered
                      ? const LinearGradient(
                          colors: [accentColor1, accentColor2],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: accentColor2.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                          BoxShadow(
                            color: accentColor1.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ]
                      : null,
                  border: Border.all(
                    color: _isHovered ? accentColor2 : Colors.white24,
                    width: 2,
                  ),
                ),
                child: TextButton(
                  onPressed: widget.onTap,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.text,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _isHovered ? Colors.white : Colors.white70,
                              fontSize: 16,
                              letterSpacing: 0.5,
                            ),
                      ),
                      if (_isHovered) ...[
                        const SizedBox(width: 8),
                        TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 200),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(10 * value, 0),
                              child: Opacity(
                                opacity: value,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
