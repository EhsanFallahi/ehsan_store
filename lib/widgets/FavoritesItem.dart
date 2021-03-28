import 'package:ehsan_store/controller/favorites_controller/FavoritesController.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesItem extends StatelessWidget {
  FavoritesController get _favoritesController => Get.find<FavoritesController>();
  int id;
  String title;
  String description;
  String picture;
  double price;
  String tag;
  bool is_favorites;

  FavoritesItem({this.id,
    this.picture,
    this.title,
    this.description,
    this.price,
    this.tag,
    this.is_favorites});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children:[
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
                          borderRadius: BorderRadius.circular(
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
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            picture,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.black,
                                letterSpacing: 4),
                          ),
                          SizedBox(height: 8),
                          Text(
                            description,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black87,
                                letterSpacing: 4),
                          ),
                          SizedBox(height: 8),
                          Text(
                            price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffDE3C5D),
                                letterSpacing: 4),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: FavoriteButton(
                              isFavorite: is_favorites,
                              valueChanged: (_isFavorite) {
                                print('Is Favorite : $_isFavorite');
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
    );
  }
}
