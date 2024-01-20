import 'package:flutter/material.dart';

class ClickableWiget extends StatelessWidget {
  final Widget child;
  final Function() onPress;

  const ClickableWiget({
    super.key,
    required this.child,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPress,
      child: child,
    );
  }
}
