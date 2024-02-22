import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/product_modal.dart';
import '../widgets/product/product_detail_widget.dart';
import '../models/args/product_detail_screen_args.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isDataFetched = false;
  ProductModal? productData;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        final pageArgs = args as ProductDetailScreenArgs;

        setState(() {
          productData = pageArgs.product;
          _isDataFetched = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.primaryColor,
        foregroundColor: Pallete.whiteColor,
        centerTitle: true,
        title: const Text('Product Detail'),
      ),
      body: _isDataFetched
          ? ProductDetailWidget(
              product: productData!,
              isProductDetailScreen: true,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
