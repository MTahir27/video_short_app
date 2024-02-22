import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../config/palette.dart';
import '../../widgets/video_player_widget.dart';

class ProductImageSliderWidget extends StatefulWidget {
  const ProductImageSliderWidget({
    super.key,
    required this.images,
    required this.videoUrl,
    required this.onSlideChange,
  });
  final List<String> images;
  final String videoUrl;
  final Function onSlideChange;
  @override
  State<ProductImageSliderWidget> createState() =>
      _ProductImageSliderWidgetState();
}

class _ProductImageSliderWidgetState extends State<ProductImageSliderWidget> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1.0,
        initialPage: 0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) => widget.onSlideChange(index),
      ),
      carouselController: _controller,
      items: [
        Container(
          color: Pallete.primaryColor,
          width: double.infinity,
          height: double.infinity,
          child: VideoPlayerWidget(videoUrl: widget.videoUrl),
        ),
        ...widget.images
            .map(
              (item) => Builder(
                builder: (BuildContext context) {
                  return Container(
                    color: Pallete.primaryColor,
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                      // item,
                      'https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            )
            .toList()
      ],
    );
  }
}
