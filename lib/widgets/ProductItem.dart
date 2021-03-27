import 'package:ehsan_store/screens/product_detail/ProductDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  int id;
  String title;
  String description;
  String picture;
  double price;
  int amount;
  bool is_display;
  String tag;
  bool is_favorites;


  ProductItem(
      {this.id,
        this.picture,
        this.title,
        this.description,
        this.price,
        this.amount,
        this.is_display,
        this.tag,
        this.is_favorites});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetailScreen(),arguments:id );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  child: Image.network(picture),
                  tag: id,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    price.toString(),
                    style: TextStyle(color: Color(0xffCB3232)),
                  ),
                  Text(
                    tag,
                    style: TextStyle(color: Color(0xffFFFFFF)),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
