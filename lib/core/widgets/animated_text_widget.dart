import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Animation<double> animation;
  final double slideOffset;
  final double delay;

  const AnimatedTextWidget({
    super.key,
    required this.text,
    required this.animation,
    this.style,
    this.textAlign,
    this.slideOffset = 20.0,
    this.delay = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final delayedAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Interval(delay, 1.0, curve: Curves.easeOut),
        ));
        
        return Transform.translate(
          offset: Offset(0, slideOffset * (1 - delayedAnimation.value)),
          child: Opacity(
            opacity: delayedAnimation.value,
            child: Text(
              text,
              style: style,
              textAlign: textAlign,
            ),
          ),
        );
      },
    );
  }
} 