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
                            _favoritesController.tempListFavorites.length,
                        itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white60,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfF0496E2),
                                          blurRadius: 25,
                                          offset: Offset(4, 0))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: 100,
                                          height: 160,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                              color: Colors.white60,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black45,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 6))
                                              ]),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                _favoritesController
                                                    .tempListFavorites[i]
                                                    .picture,
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                _favoritesController
                                                    .tempListFavorites[i].title,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 28,
                                                    color: Colors.black,
                                                    letterSpacing: 4),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                _favoritesController
                                                    .tempListFavorites[i]
                                                    .description,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                    letterSpacing: 4),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                _favoritesController
                                                    .tempListFavorites[i].price
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Color(0xffDE3C5D),
                                                    letterSpacing: 4),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: FavoriteButton(
                                                  isFavorite:
                                                      _favoritesController
                                                          .tempListFavorites[i]
                                                          .is_favorites,
                                                  valueChanged: (_isFavorite) {
                                                    print(
                                                        'Is Favorite : $_isFavorite');
                                                    // if(!is_favorites){
                                                    //   _favoritesController.
                                                    // }
                                                  },
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
                            ],
                          ),
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
