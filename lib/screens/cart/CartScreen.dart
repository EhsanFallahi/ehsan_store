import 'package:ehsan_store/controller/cart_controller/CartController.dart';
import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/cart/Cart.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/widgets/CartItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    // final productDetail=Products().getProduct('1');

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );
    return Scaffold(
      appBar: appBar,
      body:Container(
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
              if(_productController.tempListCarts.length>0)
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _productController.tempListCarts.length,
                  itemBuilder: (context, i) => CartItem(
                    picture: _productController.tempListCarts[i].picture,
                    title: _productController.tempListCarts[i].title,
                    price: _productController.tempListCarts[i].price,
                    amount: _productController.tempListCarts[i].amount,
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
                                  calulateTotal(),
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
                                onPressed: () {
                                  Get.defaultDialog(
                                  title: 'Purchase confirmation',
                                  titleStyle:
                                  TextStyle(fontSize: 25, color: Colors.red),
                                  middleTextStyle: TextStyle(fontSize: 21),
                                  backgroundColor: PRIMARY_COLOR.withOpacity(0.8),
                                  radius: 32,
                                  content: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                  children: [
                                  Text(
                                  'Do you confirm your shopping list?',
                                  style: TextStyle(
                                  fontSize: 16, color: Colors.white60),
                                  ),
                                  SizedBox(height: 6,),
                                    Container(
                                      height: 300,
                                      width: 200,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 20,right:20),
                                            child: Divider(
                                              color: SECONDARY_COLOR,
                                            ),
                                          );
                                        },
                                        itemCount: _productController.tempListCarts.length,
                                        itemBuilder: (context, i) => Container(
                                          child: ListTile(
                                            title: Text(
                                              _productController.tempListCarts[i].title,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: SECONDARY_COLOR,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                            trailing: Text(
                                                _productController.tempListCarts[i].amount.toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),

                                        ),
                                      ),
                                    )
                                  ],
                                  ),
                                  ),
                                  textCancel: 'Cancel',
                                  cancelTextColor: Colors.white,
                                  onCancel: () {
                                   Navigator.pop(context);
                                  },
                                  textConfirm: 'Purchse',
                                  confirmTextColor: Colors.white,
                                  onConfirm: () {
                                    Navigator.pop(context);
                                  _productController.showPurchseSnackBar();
                                  }
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ]),
          ),
        )
    );
  }
  //
  String calulateTotal() {
    double total=0;
    for(var i=0;i< _productController.tempListCarts.length;i++ ){
      total=total+_productController.tempListCarts[i].amount*_productController.tempListCarts[i].price;
    }
    return total.toString();
  }


}
