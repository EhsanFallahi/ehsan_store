import 'package:ehsan_store/controller/cart_controller/CartController.dart';
import 'package:ehsan_store/controller/favorites_controller/FavoritesController.dart';
import 'package:ehsan_store/controller/product_contoller/product_detail_controller/ProductDetailController.dart';
import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/BorderedContainer.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailController get _productDetailController =>
      Get.find<ProductDetailController>();

  FavoritesController get _favoritesController =>
      Get.find<FavoritesController>();

  CartController get _cartController =>
      Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<CartController>(() => CartController());

    // final productDetail = Products().getProduct(productId);

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Obx(
        () => _productDetailController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.70,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.70,
                              top: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Hero(
                                    child: Image.network(
                                        _productDetailController
                                            .tempSelectedProduct.value.picture),
                                    tag: _productDetailController
                                        .tempSelectedProduct.value.id,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              width: MediaQuery.of(context).size.width,
                              child: ListTile(
                                title: Transform.translate(
                                  offset: Offset(0, 4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _productDetailController
                                          .tempSelectedProduct.value.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  _productDetailController
                                      .tempSelectedProduct.value.description,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                              ),
                                              color: Colors.white,
                                              onPressed: () {
                                                _productDetailController
                                                    .amountCounter.value++;
                                              },
                                            ),
                                            Container(
                                              height: 26,
                                              width: 26,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.white24),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11)),
                                              child: Center(
                                                child: Obx(
                                                  () => Text(
                                                    _productDetailController
                                                        .amountCounter.value
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => IconButton(
                                                icon: Icon(Icons.remove),
                                                color: Colors.white,
                                                onPressed: () {
                                                  _productDetailController
                                                      .amountCounter.value--;
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FavoriteButton(
                                      isFavorite: false,
                                      valueChanged: (_isFavorite) {
                                        print('Is Favorite : $_isFavorite');
                                        if (_isFavorite) {
                                          _favoritesController.addFavorites(
                                              Favorites(
                                                  picture: _productDetailController
                                                      .tempSelectedProduct
                                                      .value
                                                      .picture,
                                                  title:
                                                      _productDetailController
                                                          .tempSelectedProduct
                                                          .value
                                                          .title,
                                                  description:
                                                      _productDetailController
                                                          .tempSelectedProduct
                                                          .value
                                                          .description,
                                                  price:
                                                      _productDetailController
                                                          .tempSelectedProduct
                                                          .value
                                                          .price,
                                                  is_favorites: true)
                                          );
                                          _favoritesController.getAllFavorites();
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BorderedContainer(
                                            childWidget: Column(
                                              children: [
                                                Text(
                                                  'Price',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '900000',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffD43030)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Theme.of(context).accentColor,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      splashColor: Colors.white24,
                                      onTap: () {
                                        _cartController.addCart(Cart(
                                          id: _productDetailController.tempSelectedProduct.value.id,
                                          picture: _productDetailController.tempSelectedProduct.value.picture,
                                          title: _productDetailController.tempSelectedProduct.value.title,
                                          price: _productDetailController.tempSelectedProduct.value.price,
                                          amount: _productDetailController.amountCounter.value
                                        )
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.add_shopping_cart_rounded,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'BUY',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
