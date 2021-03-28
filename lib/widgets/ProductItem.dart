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

            Stack(
              children:[
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
                Positioned(
                  bottom: 30,
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    title: Transform.translate(
                      offset: Offset(0, 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: TextStyle(color: Colors.black45, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ]
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
