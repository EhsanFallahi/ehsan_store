import 'package:ehsan_store/controller/favorites_controller/FavoritesController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/FavoritesItem.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesController get _favoritesController =>
      Get.find<FavoritesController>();


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    print(
        'favorites lenght is :${_favoritesController.tempListFavorites.length}');
    _favoritesController.onInit();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
          ),
        ),
        child: SafeArea(
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
                height: 10,
              ),
              Obx(
                () => _favoritesController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 190,
                        child: Obx(
                          () => ListView.builder(
                              itemCount:
                                  _favoritesController.tempListFavorites.length,
                              itemBuilder: (_, i) => FavoritesItem(
                                    id: _favoritesController
                                        .tempListFavorites[i].id,
                                    picture: _favoritesController
                                        .tempListFavorites[i].picture,
                                    title: _favoritesController
                                        .tempListFavorites[i].title,
                                    description: _favoritesController
                                        .tempListFavorites[i].description,
                                    price: _favoritesController
                                        .tempListFavorites[i].price,
                                    tag: _favoritesController
                                        .tempListFavorites[i].tag,
                                    is_favorites: _favoritesController
                                        .tempListFavorites[i].is_favorites,
                                  )),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
