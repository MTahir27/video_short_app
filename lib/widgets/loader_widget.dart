import 'package:flutter/material.dart';

import '../config/palette.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? Pallete.whiteColor,
      ),
    );
  }
}
