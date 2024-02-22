import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_short/config/palette.dart';
import 'package:video_short/helper/page_navigate.dart';
import 'package:video_short/provider/product_provider.dart';
import 'package:video_short/widgets/home/product_image_slider.dart';
import 'package:video_short/widgets/home/product_info_widget.dart';
import 'package:video_short/widgets/home/product_social_list_widget.dart';
import 'package:video_short/widgets/slider/slider_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _getAllProductFunction();
    });
    super.initState();
  }

  Future<void> _getAllProductFunction() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<ProductProvider>(context, listen: false)
          .getAllProductApiFun();
    } catch (error) {
      if (kDebugMode) {
        print('Error in _getAllProductFunction => $error');
      }
      showErrorMessage();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error in fetching data!'),
        content: const Text('Error in fetching data! Please try again later.'),
        actions: [
          TextButton(
            onPressed: () async {
              popNavigator(context: context);
              await _getAllProductFunction();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            color: Pallete.primaryColor,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                initialPage: 0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              carouselController: _controller,
              items: Provider.of<ProductProvider>(context)
                  .productList
                  .map(
                    (item) => Builder(
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            ProductImageSliderWidget(
                              images: item.images,
                              videoUrl: item.videoUrl,
                              onSlideChange: (index) {
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
                                  maxWidth:
                                      MediaQuery.of(context).size.width * .7,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ProductInfoWidget(
                                      name: item.name,
                                      price: item.price.toString(),
                                      description: item.description,
                                      hashtag: item.hashtag,
                                      location: item.country.countryName,
                                      localtionImageUrl:
                                          item.country.countryFlag,
                                      onPressed: () {},
                                    ),
                                    SliderIndecator(
                                      margin: const EdgeInsets.only(top: 24),
                                      sliders: item.images,
                                      activeSliderNumber: _current,
                                      activeWidth: 24,
                                      activeGradientColor:
                                          Pallete.orangeGradientColor,
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
                              child: Container(
                                child: ProductSocialListWidget(
                                  likes: item.socialInfo.likes,
                                  comments: item.socialInfo.comments,
                                  shares: item.socialInfo.shares,
                                  offers: item.socialInfo.offers,
                                  profileImage: item.user.image,
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(24),
                            //   // color: Pallete.blackColor.withOpacity(.2),
                            //   alignment: Alignment.bottomLeft,
                            //   child: Column(
                            //     mainAxisSize: MainAxisSize.min,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Row(
                            //         crossAxisAlignment: CrossAxisAlignment.end,
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           ProductInfoWidget(
                            //             name: item.name,
                            //             price: item.price.toString(),
                            //             description: item.description,
                            //             hashtag: item.hashtag,
                            //             location: item.country.countryName,
                            //             localtionImageUrl:
                            //                 item.country.countryFlag,
                            //             onPressed: () {},
                            //           ),
                            //           Container(
                            //             height: 60,
                            //             width: 60,
                            //             decoration: BoxDecoration(
                            //               color: Pallete.whiteColor,
                            //               borderRadius:
                            //                   BorderRadius.circular(12),
                            //             ),
                            //             child: Icon(
                            //               Icons.play_arrow,
                            //               color: Pallete.primaryColor,
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //       SliderIndecator(
                            //         margin: const EdgeInsets.only(top: 24),
                            //         sliders: item.images,
                            //         activeSliderNumber: _current,
                            //         activeWidth: 24,
                            //         activeGradientColor:
                            //             Pallete.orangeGradientColor,
                            //         activeColor: Pallete.orangeColor,
                            //         inactiveColor: Pallete.whiteColor,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
