import 'package:flutter/material.dart';
import 'package:video_short/config/palette.dart';

class GradientElevatedButtonWidget extends StatelessWidget {
  const GradientElevatedButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = false,
    this.loading = false,
    this.borderRadius = 6,
    this.backgroundColor,
    this.foregroundColor = Pallete.whiteColor,
  });

  final String label;
  final bool fullWidth;
  final Function()? onPressed;
  final bool loading;
  final double borderRadius;
  final Gradient? backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: Pallete.primaryColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: Pallete.primaryColor.withOpacity(.5),
          disabledForegroundColor: foregroundColor,
        ).copyWith(
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: !loading ? onPressed : null,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: onPressed != null && !loading
                ? backgroundColor ?? Pallete.primaryGradientColor
                : null,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(minHeight: 48),
            child: loading
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: Pallete.whiteColor,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
