import 'package:flutter/material.dart';

class BottomNavigatonBarLayoutWidget extends StatelessWidget {
  const BottomNavigatonBarLayoutWidget({
    super.key,
    this.padding,
    this.backgroundColor,
    required this.child,
  });
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding ?? const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
        ],
      ),
    );
  }
}
