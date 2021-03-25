import 'package:ehsan_store/screens/product_detail/ProductDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String picture;
  final String title;
  final String description;
  final String price;
  final String amount;
  final String tag;
  final int likes;

  ProductItem(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.price,
      this.amount,
      this.tag,
      this.likes});

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
                    price,
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
