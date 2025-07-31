import 'package:flutter/material.dart';

class AnimatedFormWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final double slideOffset;
  final double delay;

  const AnimatedFormWidget({
    super.key,
    required this.child,
    required this.animation,
    this.slideOffset = 30.0,
    this.delay = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final formAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Interval(delay, 1.0, curve: Curves.easeOut),
        ));
        
        return Transform.translate(
          offset: Offset(0, slideOffset * (1 - formAnimation.value)),
          child: Opacity(
            opacity: formAnimation.value,
            child: this.child,
          ),
        );
      },
    );
  }
} 