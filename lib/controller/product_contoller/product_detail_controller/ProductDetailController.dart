import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/favorites/FavoritesRepository.dart';
import 'package:ehsan_store/data_source/repository/product/ProductRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController{
  ProductRepository _productRepository = ProductRepository();
  FavoritesRepository _favoritesRepository = FavoritesRepository();
  final productId = Get.arguments;

  dynamic _selectedProduct = Product().obs;
  var tempSelectedProduct =Product().obs;
  RxDouble amountCounter=0.0.obs;

  RxBool isLoading = false.obs;
  @override
  void onInit() async{
    getSelectedProduct();
    super.onInit();
  }

  void getSelectedProduct(){
    try {
      isLoading(true);
      _productRepository.getSelectedProducts(productId).then((response) {
        isLoading(false);
        _selectedProduct=response.data;
        Product _tempProduct = Product();
        _tempProduct.fromJson(_selectedProduct);
        tempSelectedProduct(_tempProduct);
      });
    } catch (error) {
      isLoading(false);
      print('network error:$error');
    }
  }



}