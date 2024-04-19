import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  Widget child;
  double borderRadius, elevation;
  Color backgroundColor;

  CardWidget({
    this.backgroundColor = Colors.white,
    this.borderRadius = 8.0,
    this.elevation = 5.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 3.0,
        right: 3.0,
        bottom: 10.0,
        top: 0.0,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: elevation,
        child: child,
      ),
    );
  }
}
