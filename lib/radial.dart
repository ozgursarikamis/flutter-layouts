import 'package:flutter/material.dart';

class RadialTransition extends StatelessWidget {
  final double maxRadius;
  final Widget child;

  const RadialTransition(
      {Key? key, required this.maxRadius, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: maxRadius,
          height: maxRadius,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
