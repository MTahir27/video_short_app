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
    this.size = 40,
    this.isNetworkImage = false,
    this.transparentBg = false,
    this.fontWeight = FontWeight.w600,
  });
  final String? name;
  final String imgUrl;
  final bool isProfileImage;
  final bool border;
  final EdgeInsetsGeometry? margin;
  final double size;
  final bool isNetworkImage;
  final bool transparentBg;
  final FontWeight fontWeight;

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
                : const EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: !transparentBg ? Pallete.primaryGradientColor : null,
              shape: BoxShape.circle,
              border: border
                  ? Border.all(
                      color: Pallete.secondaryColor,
                      width: 1,
                    )
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size),
              child: isNetworkImage
                  ? Image.network(
                      imgUrl,
                      width: isProfileImage ? size : null,
                      height: isProfileImage ? size : null,
                      fit: isProfileImage ? BoxFit.cover : null,
                    )
                  : Image.asset(
                      imgUrl,
                      width: isProfileImage ? size : null,
                      height: isProfileImage ? size : null,
                      fit: isProfileImage ? BoxFit.cover : null,
                    ),
            ),
          ),
          if (name != null)
            Text(
              name!,
              style: TextStyle(
                color: Pallete.whiteColor,
                fontSize: 12,
                fontWeight: fontWeight,
              ),
            )
        ],
      ),
    );
  }
}
