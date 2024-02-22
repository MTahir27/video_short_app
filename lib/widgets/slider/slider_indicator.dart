import 'package:flutter/material.dart';
import 'package:video_short/config/palette.dart';

class SliderIndecator extends StatelessWidget {
  const SliderIndecator({
    super.key,
    required this.sliders,
    required this.activeSliderNumber,
    this.activeColor = Pallete.whiteColor,
    this.inactiveColor,
    this.size = 8,
    this.activeWidth = 8,
    this.margin,
  });

  final List<dynamic> sliders;
  final int activeSliderNumber;
  final Color activeColor;
  final Color? inactiveColor;
  final double size;
  final double activeWidth;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: sliders.map(
          (slide) {
            return Container(
              width: activeSliderNumber == sliders.indexOf(slide)
                  ? activeWidth
                  : size,
              height: size,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size / 2),
                color: activeSliderNumber == sliders.indexOf(slide)
                    ? activeColor
                    : inactiveColor ?? activeColor.withOpacity(0.5),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
