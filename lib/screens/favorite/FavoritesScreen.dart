import 'package:ehsan_store/controller/favorites_controller/FavoritesController.dart';
import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/FavoritesItem.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();
  // FavoritesController get _favoritesController =>
  //     Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    // Get.lazyPut<FavoritesController>(() => FavoritesController());
    return Scaffold(body: Obx(() {
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
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Your Favorites',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            letterSpacing: 6,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        itemCount:
                            _productController.tempListFavorites.length,
                        itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FavoritesItem(
                            id: _productController.tempListFavorites[i].id,
                            picture:  _productController.tempListFavorites[i].picture,
                            title:  _productController.tempListFavorites[i].title,
                            description:  _productController.tempListFavorites[i].description,
                            price:  _productController.tempListFavorites[i].price,
                            is_favorites:  _productController.tempListFavorites[i].is_favorites,
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
