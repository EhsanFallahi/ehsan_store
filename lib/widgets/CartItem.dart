import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();
  int id;
  String title;
  double amount;
  String picture;
  double price;

  CartItem({this.id, this.picture, this.title, this.price, this.amount});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    return mainBody(context);
  }

  Padding mainBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: mainBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [imageItem(), titleAndAmountItem(), iconDeleteItem()],
              ),
            ),
          )
        ],
      ),
    );
  }

  IconButton iconDeleteItem() {
    return IconButton(
      icon: Icon(
        Icons.delete_forever_rounded,
        color: Colors.black87,
      ),
      onPressed: () {
        _productController.deleteCart(Cart(
            id: id,
            picture: picture,
            title: title,
            price: price,
            amount: amount));
        _productController.getAllCarts();
      },
    );
  }

  Expanded titleAndAmountItem() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [titleItem(), amountItem()],
        ),
      ),
    );
  }

  Text amountItem() {
    return Text(
      '${amount} * ' + price.toString(),
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(0xffDE3C5D),
          letterSpacing: 1),
    );
  }

  Text titleItem() {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.black87,
          letterSpacing: 4),
    );
  }

  Expanded imageItem() {
    return Expanded(
      flex: 1,
      child: Container(
        width: 80,
        height: 80,
        decoration: boxImage(),
        child: clipRRect(),
      ),
    );
  }

  ClipRRect clipRRect() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          picture,
          fit: BoxFit.fill,
        ));
  }

  BoxDecoration boxImage() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: Colors.white60,
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 6))
        ]);
  }

  BoxDecoration mainBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white60,
        boxShadow: [
          BoxShadow(
              color: Color(0xfF0496E2), blurRadius: 25, offset: Offset(4, 0))
        ]);
  }
}
