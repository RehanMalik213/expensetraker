import 'package:flutter/material.dart';

class CircleWidgets extends StatelessWidget {
  final double height;
  final double widht;
  final Color? bgColor;
  final Color? borderColor;
  final double? boderWidht;
  final Widget widget;
  const CircleWidgets(
      {super.key,
      required this.height,
      required this.widht,
      required this.widget,
      this.bgColor,
      this.borderColor,
      this.boderWidht});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widht,
      decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: boderWidht ?? 1)),
      child: Center(child: widget),
    );
  }
}
