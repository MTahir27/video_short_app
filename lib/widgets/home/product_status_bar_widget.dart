import 'package:flutter/material.dart';

import '../../helper/data.dart';
import '../../widgets/product/social_icon_widget.dart';

class ProductStatusBarWidget extends StatelessWidget {
  const ProductStatusBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 24, left: 24),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SocialIconWidget(
            size: 50,
            name: 'Add Listing',
            imgUrl: 'assets/images/icons/plus_icon.png',
            border: true,
            transparentBg: true,
            fontWeight: FontWeight.w400,
            margin: EdgeInsets.only(right: 16),
          ),
          const SocialIconWidget(
            size: 50,
            name: 'Search',
            imgUrl: 'assets/images/icons/search-icon.png',
            border: true,
            transparentBg: true,
            fontWeight: FontWeight.w400,
            margin: EdgeInsets.only(right: 16),
          ),
          const SocialIconWidget(
            size: 50,
            name: 'Notification',
            imgUrl: 'assets/images/icons/notification-icon.png',
            border: true,
            transparentBg: true,
            fontWeight: FontWeight.w400,
            margin: EdgeInsets.only(right: 16),
          ),
          ...userProfileLists.map(
            (data) => SocialIconWidget(
              size: 50,
              imgUrl: data.image,
              name: data.name,
              border: true,
              transparentBg: true,
              isProfileImage: true,
              fontWeight: FontWeight.w400,
              margin: const EdgeInsets.only(right: 16),
            ),
          ),
        ],
      ),
    );
  }
}
