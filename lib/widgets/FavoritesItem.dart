import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesItem extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();
  int id;
  String title;
  String description;
  String picture;
  double price;
  bool is_favorites;

  FavoritesItem(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.price,
      this.is_favorites});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    return mainBody();
  }

  Padding mainBody() {
    return Padding(
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
                  imageItem(),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: columnItemsView(),
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

  Column columnItemsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        titleItem(),
        SizedBox(height: 8),
        descriptionItem(),
        SizedBox(height: 8),
        priceItem(),
      ],
    );
  }

  Text priceItem() {
    return Text(
      price.toString(),
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xffDE3C5D),
          letterSpacing: 4),
    );
  }

  Text descriptionItem() {
    return Text(
      description,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black87,
          letterSpacing: 4),
    );
  }

  Text titleItem() {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.black,
          letterSpacing: 4),
    );
  }

  Expanded imageItem() {
    return Expanded(
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
                  color: Colors.black45, blurRadius: 10, offset: Offset(0, 6))
            ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              picture,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
