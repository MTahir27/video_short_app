import 'package:flutter/material.dart';

import '../../widgets/home/social_icon_widget.dart';

class ProductSocialListWidget extends StatelessWidget {
  const ProductSocialListWidget({
    super.key,
    required this.comments,
    required this.likes,
    required this.offers,
    required this.profileImage,
    required this.shares,
  });
  final int likes;
  final int comments;
  final int shares;
  final int offers;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SocialIconWidget(
          imgUrl: 'assets/images/icons/offer-icon.png',
          name: 'offers',
          margin: EdgeInsets.only(bottom: 16),
        ),
        SocialIconWidget(
          imgUrl: 'assets/images/icons/heart-icon.png',
          name: "$likes",
          margin: const EdgeInsets.only(bottom: 16),
        ),
        SocialIconWidget(
          imgUrl: 'assets/images/icons/chat-icon.png',
          name: '$comments',
          margin: const EdgeInsets.only(bottom: 16),
        ),
        SocialIconWidget(
          imgUrl: 'assets/images/icons/share-icon.png',
          name: "$shares",
          margin: const EdgeInsets.only(bottom: 16),
        ),
        SocialIconWidget(
          imgUrl: profileImage,
          isProfileImage: true,
        ),
      ],
    );
  }
}
