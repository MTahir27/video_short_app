import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../helper/page_navigate.dart';
import '../../config/palette.dart';
import '../../router/routing_constants.dart';
import '../../models/product_modal.dart';
import '../../models/args/product_detail_screen_args.dart';
import '../slider/slider_indicator.dart';
import 'product_image_slider.dart';
import 'product_info_widget.dart';
import 'product_social_list_widget.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    required this.product,
    this.isProductDetailScreen = false,
  });
  final ProductModal product;
  final bool isProductDetailScreen;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductImageSliderWidget(
          images: widget.product.images,
          videoUrl: widget.product.videoUrl,
          onSlideChange: (index) {
            setState(() {
              _current = index;
            });
            _controller.animateToPage(
              index,
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
        Positioned(
          bottom: 24,
          left: 24,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .7,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductInfoWidget(
                  name: widget.product.name,
                  price: widget.product.price.toString(),
                  description: widget.product.description,
                  hashtag: widget.product.hashtag,
                  location: widget.product.country.countryName,
                  localtionImageUrl: widget.product.country.countryFlag,
                  onPressed: !widget.isProductDetailScreen
                      ? () => pushNamedNavigate(
                            context: context,
                            pageName: productDetailScreenRoute,
                            argument: ProductDetailScreenArgs(
                              product: widget.product,
                            ),
                          )
                      : () {},
                ),
                SliderIndecator(
                  margin: const EdgeInsets.only(top: 24),
                  sliders: [...widget.product.images, ''],
                  activeSliderNumber: _current,
                  activeWidth: 16,
                  activeGradientColor: Pallete.orangeGradientColor,
                  activeColor: Pallete.orangeColor,
                  inactiveColor: Pallete.whiteColor,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: ProductSocialListWidget(
            likes: widget.product.socialInfo.likes,
            comments: widget.product.socialInfo.comments,
            shares: widget.product.socialInfo.shares,
            offers: widget.product.socialInfo.offers,
            profileImage: widget.product.user.image,
          ),
        ),
      ],
    );
  }
}
