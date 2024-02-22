import 'package:flutter/material.dart';
import 'package:video_short/config/palette.dart';

class SliderIndecator extends StatelessWidget {
  const SliderIndecator({
    super.key,
    required this.sliders,
    required this.activeSliderNumber,
    this.activeGradientColor,
    this.activeColor = Pallete.whiteColor,
    this.inactiveColor,
    this.size = 8,
    this.activeWidth = 8,
    this.margin,
    this.alignment,
  });

  final List<dynamic> sliders;
  final int activeSliderNumber;
  final Color activeColor;
  final Gradient? activeGradientColor;
  final Color? inactiveColor;
  final double size;
  final double activeWidth;
  final EdgeInsets? margin;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
                gradient: activeSliderNumber == sliders.indexOf(slide)
                    ? activeGradientColor
                    : null,
                color: activeSliderNumber == sliders.indexOf(slide)
                    ? activeGradientColor == null
                        ? activeColor
                        : null
                    : inactiveColor ?? activeColor.withOpacity(0.5),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
