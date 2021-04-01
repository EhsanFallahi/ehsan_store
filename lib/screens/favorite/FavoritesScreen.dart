import 'package:ehsan_store/controller/favorites_controller/FavoritesController.dart';
import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/FavoritesItem.dart';
import 'package:ehsan_store/widgets/HeaderWithoutSearch.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    return Scaffold(body: mainBody(context));
  }

  Obx mainBody(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
                ),
              ),
              child: Column(
                children: [
                  HeaderWithoutSearch(
                    title: 'Your Favorites',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  favoritesListView(context)
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Padding favoritesListView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height * 0.2,
        child: listViewItem(),
      ),
    );
  }

  ListView listViewItem() {
    return ListView.builder(
      itemCount: _productController.tempListFavorites.length,
      itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FavoritesItem(
            id: _productController.tempListFavorites[i].id,
            picture: _productController.tempListFavorites[i].picture,
            title: _productController.tempListFavorites[i].title,
            description: _productController.tempListFavorites[i].description,
            price: _productController.tempListFavorites[i].price,
            is_favorites: _productController.tempListFavorites[i].is_favorites,
          )),
    );
  }
}
