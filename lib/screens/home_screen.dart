import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../config/palette.dart';
import '../helper/page_navigate.dart';
import '../provider/product_provider.dart';
import '../widgets/product/product_detail_widget.dart';
import '../widgets/home/product_status_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
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
      // showErrorMessage();
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
            child: SafeArea(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.vertical,
                    ),
                    carouselController: _controller,
                    items: Provider.of<ProductProvider>(context)
                        .productList
                        .map(
                          (item) => Builder(
                            builder: (BuildContext context) {
                              return ProductDetailWidget(product: item);
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 100,
                    child: ProductStatusBarWidget(),
                  )
                ],
              ),
            ),
          );
  }
}
