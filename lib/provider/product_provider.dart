import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:video_short/config/api.dart';

import '../models/product_modal.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModal> _productList = [];

  List<ProductModal> get productList => _productList;

  Future<void> getAllProductApiFun() async {
    try {
      final response = await http.post(
        Uri.parse(getProductsApiUrl),
        headers: {
          'Accept': 'application/json',
        },
        // body: {},
      );
      final responseData = json.decode(response.body);
      print('getAllProductApiFun responseData => $responseData');
      _productList.clear();
      if (responseData['status'] == true) {
        for (var data in (responseData['posts'] as List<dynamic>)) {
          _productList.add(ProductModal.fromJson(data));
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error in fetching product => $error');
      }
      rethrow;
    }
    notifyListeners();
  }
}
