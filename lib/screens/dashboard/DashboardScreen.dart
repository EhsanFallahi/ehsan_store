import 'dart:js';

import 'package:ehsan_store/model/category/Category.dart';
import 'package:ehsan_store/model/product/Product.dart';
import 'package:ehsan_store/screens/bottom_sheet/PopUp.dart';
import 'package:ehsan_store/screens/drawer/MainDrawer.dart';
import 'package:ehsan_store/widgets/CategoryItem.dart';
import 'package:ehsan_store/widgets/ProductItem.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  bool _isSelected = false;
  RangeValues _values = RangeValues(1, 100);
  RangeLabels _labels = RangeLabels('1', '100');

  @override
  Widget build(BuildContext context) {
    List<Product> products = Products().products;
    final mediaQuery = MediaQuery.of(context);

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      // leading: Padding(padding: EdgeInsets.only(left: 15),
      //   child: IconButton(
      //     icon: Icon(Icons.apps_rounded, color: Colors.white,),
      //     onPressed: () {
      //
      //     },
      //   ),
      // ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    height: 100,
                    width: double.infinity,
                    child: Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: Categories().getCategories().map((category) {
                          return CategoryItem(
                              name: category.name,
                              active: category.active,
                              picture: category.picture);
                        }).toList()),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      )),
                ]
                ),
                Container(
                  height: listHeight,
                  child: ListView.builder(
                      itemBuilder: (_, i) => ProductItem(
                            id: products[i].id,
                            picture: products[i].picture,
                            title: products[i].title,
                            description: products[i].description,
                            price: products[i].price,
                            amount: products[i].amount,
                            tag: products[i].tag,
                          )),
                )
              ],
            ),
          ),
        ),
      ),
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
