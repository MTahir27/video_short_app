import 'package:flutter/material.dart';

import '../../config/palette.dart';
import '../buttons/gradien_elevated_button.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.hashtag,
    required this.location,
    required this.localtionImageUrl,
    required this.onPressed,
  });
  final String name;
  final String price;
  final String description;
  final String hashtag;
  final String location;
  final String localtionImageUrl;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Pallete.whiteColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Text(
            'AED $price',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Pallete.orangeColor,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            '$description $hashtag',
            style: TextStyle(
              fontSize: 12,
              color: Pallete.whiteColor.withOpacity(.8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(localtionImageUrl),
              ),
              const SizedBox(width: 8),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 12,
                  color: Pallete.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 150,
          child: GradientElevatedButtonWidget(
            label: 'Visit Website',
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
