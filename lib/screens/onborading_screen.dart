import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_short/config/palette.dart';
import 'package:video_short/helper/page_navigate.dart';
import 'package:video_short/router/routing_constants.dart';
import 'package:video_short/widgets/buttons/custom_elevated_button.dart';
import 'package:video_short/widgets/buttons/gradien_elevated_button.dart';

import '../models/onboarding_modal.dart';
import '../widgets/layout/bottom_navigation_bar_widget.dart';
import '../widgets/slider/slider_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  static final List<OnboardingModal> _onBoardingDataList = [
    OnboardingModal(
      title: 'Discover Great Deals',
      description:
          "Have something to sell? Just snap, upload, and price your items. We've made theprocess simple and quick. Get your items in front of buyers in no time!",
      image: 'assets/images/onboarding/slide-1.png',
    ),
    OnboardingModal(
      title: 'Effortless Selling',
      description:
          "Have something to sell? Just snap, upload, and price your items. We've made the process simple and quick. Get your items in front of buyers in no time!",
      image: 'assets/images/onboarding/slide-2.png',
    ),
    OnboardingModal(
      title: 'Promote Your Business',
      description:
          "Our platform is a powerful tool for businesses as well! Advertise your products or services to a large and engaged audience,",
      image: 'assets/images/onboarding/slide-3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: SingleChildScrollView(
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .80,
            viewportFraction: 1.0,
            initialPage: 0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _controller,
          items: _onBoardingDataList
              .map(
                (item) => Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 48,
                            left: 24,
                            right: 24,
                            bottom: 24,
                          ),
                          color: Pallete.tertiaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              Text(
                                item.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigatonBarWidget(
        backgroundColor: Pallete.tertiaryColor,
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 48,
        ),
        child: Column(
          children: [
            SliderIndecator(
              margin: const EdgeInsets.only(bottom: 40),
              sliders: _onBoardingDataList,
              activeSliderNumber: _current,
              activeColor: Pallete.secondaryColor,
              inactiveColor: Pallete.grayColor,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButtonWidget(
                    onPressed: () => pushNamedAndRemoveUntilNavigate(
                      context: context,
                      pageName: homeScreenRoute,
                    ),
                    label: 'Skip',
                    backgroundColor: Colors.white,
                    foregroundColor: Pallete.primaryColor,
                    borderRadius: 50,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GradientElevatedButtonWidget(
                    onPressed: () {
                      if (_current < _onBoardingDataList.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        pushNamedAndRemoveUntilNavigate(
                          context: context,
                          pageName: homeScreenRoute,
                        );
                      }
                    },
                    label: _current < _onBoardingDataList.length - 1
                        ? 'Next'
                        : 'Explore',
                    borderRadius: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
