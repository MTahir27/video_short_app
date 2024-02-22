import 'package:flutter/material.dart';
import 'package:video_short/helper/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../config/palette.dart';
import '../helper/page_navigate.dart';
import '../router/routing_constants.dart';
import '../widgets/slider/slider_indicator.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/buttons/gradien_elevated_button.dart';
import '../widgets/layout/bottom_navigation_bar_layout_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void handleGotoFrontendScreen() {
    pushNamedAndRemoveUntilNavigate(
      context: context,
      pageName: frontendScreenRoute,
    );
  }

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
          items: onBoardingDataList
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
                                        color: Pallete.whiteColor,
                                      ),
                                ),
                              ),
                              Text(
                                item.description,
                                textAlign: TextAlign.center,
                                style:
                                    const TextStyle(color: Pallete.whiteColor),
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
      bottomNavigationBar: BottomNavigatonBarLayoutWidget(
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
              sliders: onBoardingDataList,
              activeSliderNumber: _current,
              activeColor: Pallete.secondaryColor,
              inactiveColor: Pallete.grayColor,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButtonWidget(
                    onPressed: handleGotoFrontendScreen,
                    label: 'Skip',
                    backgroundColor: Pallete.whiteColor,
                    foregroundColor: Pallete.primaryColor,
                    borderRadius: 50,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GradientElevatedButtonWidget(
                    onPressed: () {
                      if (_current < onBoardingDataList.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        handleGotoFrontendScreen();
                      }
                    },
                    label: _current < onBoardingDataList.length - 1
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
