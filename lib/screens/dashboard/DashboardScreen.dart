import 'dart:js';

import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/screens/bottom_sheet/PopUp.dart';
import 'package:ehsan_store/screens/cart/CartScreen.dart';
import 'package:ehsan_store/screens/drawer/MainDrawer.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/widgets/CategoryItem.dart';
import 'package:ehsan_store/widgets/HeaderWithSearch.dart';
import 'package:ehsan_store/widgets/MyAppBar.dart';
import 'package:ehsan_store/widgets/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();

  bool _isSelected = false;
  RangeValues _values = RangeValues(1, 100);
  RangeLabels _labels = RangeLabels('1', '100');

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    // List<Product> products = Products().products;
    // List<Product> productss = _productController.getAllProducts() ;
    // print('on dashboard product is: $productss');
    final mediaQuery = MediaQuery.of(context);

    Size size=MediaQuery.of(context).size;

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: PRIMARY_COLOR,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(CartScreen());
            },
          ),
        )
      ],
    );

    final listHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        100 -
        mediaQuery.padding.top);

    return Scaffold(
      appBar: appBar,
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 2,
          label: Text('Search by Filter'),
          icon: Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () {
            _handlerFab(context);
          }),
      body: Obx(()=>_productController.isLoading.value?Center(
        child: CircularProgressIndicator(),
      ):SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
            ),
          ),
            child: Column(
              children: [
                HeaderWithSearch(size: size),
                Container(
                  height: listHeight,
                  child: ListView.builder(
                    itemCount: _productController.listUserProducts.length,
                      itemBuilder: (_, i) {
                        return ProductItem(
                          id: _productController.listUserProducts[i].id,
                          picture: _productController.listUserProducts[i].picture,
                          title: _productController.listUserProducts[i].title,
                          description: _productController.listUserProducts[i].description,
                          price: _productController.listUserProducts[i].price,
                          amount: _productController.listUserProducts[i].amount,
                          tag: _productController.listUserProducts[i].tag,
                        );
                      }
                  ),
                )
              ],
            ),
        ),
      ),
      )
    );
  }

  void _handlerFab(BuildContext context) {
    showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PopUp(
          child: Column(
            children: [
              Text(
                'Set Price Range',
                style: TextStyle(color: Colors.white70),
              ),
              Center(
                child: RangeSlider(
                  max: 100,
                  min: 1,
                  values: _values,
                  divisions: 2,
                  labels: _labels,
                  onChanged: (values) {
                    print('Start:${values.start}, End: ${values.end}');
                    // _values=values;
                    _labels = RangeLabels(
                        '${values.start.toInt().toString()}\$',
                        '${values.end.toInt().toString()}\$');
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 3),
                    ),
                    labelText: 'The desired word',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: _isSelected
                                  ? Theme.of(context).accentColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: _isSelected
                                  ? null
                                  : Border.all(
                                      color: Theme.of(context).accentColor,
                                      width: 2)),
                          child: _isSelected
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: _isSelected
                                  ? Theme.of(context).accentColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: _isSelected
                                  ? null
                                  : Border.all(
                                      color: Theme.of(context).accentColor,
                                      width: 2)),
                          child: _isSelected
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tag : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: _isSelected
                                  ? Theme.of(context).accentColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: _isSelected
                                  ? null
                                  : Border.all(
                                      color: Theme.of(context).accentColor,
                                      width: 2)),
                          child: _isSelected
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  child: Text('Search'),
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  // onPressed: () {
                  //   if (_formKey.currentState.validate() &&
                  //       !validateUserName() &&
                  //       !validatePassword()) {
                  //     Get.snackbar('User Not Found!',
                  //         'Please enter the information correctly',
                  //         snackPosition: SnackPosition.BOTTOM,
                  //         margin: EdgeInsets.all(8),
                  //         colorText: Colors.redAccent,
                  //         backgroundColor: Colors.black87);
                  //   } else if (_formKey.currentState.validate() &&
                  //       validateUserName() &&
                  //       validatePassword()) {
                  //     // Get.off(TodoList());
                  //
                  //     Get.snackbar('Hi Dear $userName', 'Welcome to ToDo App',
                  //         snackPosition: SnackPosition.BOTTOM,
                  //         margin: EdgeInsets.all(8),
                  //         colorText: Colors.green,
                  //         backgroundColor: Colors.black87);
                  //   } else {
                  //     return;
                  //   }
                  // },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


