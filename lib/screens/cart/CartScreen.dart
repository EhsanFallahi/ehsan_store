import 'package:ehsan_store/controller/cart_controller/CartController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/CartItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartController get _cartController =>
      Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CartController>(() => CartController());
    // final productDetail=Products().getProduct('1');

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );
    return Scaffold(
      appBar: appBar,
      body: Obx((){
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
            ),
          ),
          child: SafeArea(
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Your Cart',
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
              if(_cartController.tempListCarts.length>0)
                ListView.builder(
                  itemCount: _cartController.tempListCarts.length,
                  itemBuilder: (context, i) => CartItem(
                    picture: _cartController.tempListCarts[i].picture,
                    title: _cartController.tempListCarts[i].title,
                    price: _cartController.tempListCarts[i].price,
                    amount: _cartController.tempListCarts[i].amount,
                  ),
                ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      color: Colors.white60,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Total:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 6,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '10000',
                                  style: TextStyle(
                                      color: Color(0xffDE3C5D),
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SizedBox(
                              height: 40,
                              width: 140,
                              child: ElevatedButton(
                                child: Text('Buy'),
                                style: ButtonStyle(
                                    foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xfF0496E2)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ))),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ]),
          ),
        );
      },
      ),
    );
  }
}
