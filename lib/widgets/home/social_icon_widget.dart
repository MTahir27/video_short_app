import 'package:flutter/material.dart';

import '../../config/palette.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({
    super.key,
    this.name,
    required this.imgUrl,
    this.border = false,
    this.isProfileImage = false,
    this.margin,
  });
  final String? name;
  final String imgUrl;
  final bool isProfileImage;
  final bool border;
  final EdgeInsetsGeometry? margin;
  final double size = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            constraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            width: size,
            height: size,
            padding: !isProfileImage
                ? const EdgeInsets.all(12)
                : const EdgeInsets.all(1),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: Pallete.primaryGradientColor,
              shape: BoxShape.circle,
              border: border
                  ? Border.all(
                      color: Pallete.secondaryColor,
                      width: 1,
                    )
                  : null,
            ),
            child: isProfileImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(size),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                      width: size,
                      height: size,
                    ),
                  )
                : Image.asset(imgUrl),
          ),
          if (name != null)
            Text(
              name!,
              style: const TextStyle(
                color: Pallete.whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
        ],
      ),
    );
  }
}
