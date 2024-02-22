import 'package:flutter/material.dart';
import 'package:video_short/config/palette.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
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
  final Color? backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor ?? Pallete.primaryColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: backgroundColor != null
              ? backgroundColor!.withOpacity(.5)
              : Pallete.primaryColor.withOpacity(.5),
          disabledForegroundColor: foregroundColor,
        ).copyWith(
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: !loading ? onPressed : null,
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
    );
  }
}
