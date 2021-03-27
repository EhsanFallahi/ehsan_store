import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/BorderedContainer.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = Get.arguments;
    final productDetail = Products().getProduct(productId);

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              color: Colors.black,
              child: Stack(
                children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.70,
                    top: 0,
                    child: Transform.scale(
                      scale: 1.1,
                      child: Container(
                        child: Hero(
                          tag: productDetail.id,
                          child: Image.network(
                            productDetail.picture,
                            fit: BoxFit.cover,
                          ),
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
                            productDetail.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        productDetail.description,
                        style: TextStyle(color: Colors.black45, fontSize: 16),
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
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(12)),
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
                                    onPressed: () {},
                                  ),
                                  Container(
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                        border:
                                            Border.all(color: Colors.white24),
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    child: Center(
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon:Icon(Icons.remove),
                                    color: Colors.white,
                                    onPressed: (){},
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FavoriteButton(
                            isFavorite: true,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite : $_isFavorite');
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BorderedContainer(
                                  childWidget: Column(
                                    children: [
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
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
                            onTap: () {},
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
                                      'ADD',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
    );
  }
}
