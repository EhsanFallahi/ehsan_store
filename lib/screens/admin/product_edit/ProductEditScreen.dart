import 'package:ehsan_store/controller/admin_controller/admin_product_controller/AdminProductController.dart';
import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductEditScreen extends StatelessWidget {
  AdminProductController get _adminProductController =>
      Get.find<AdminProductController>();

  ProductController get _productController => Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AdminProductController>(() => AdminProductController());
    Get.lazyPut<ProductController>(() => ProductController());

    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: Padding(
        padding: EdgeInsets.all(4),
        child: TextButton(
          onPressed: () {
            Get.off(() => AdminProductDetailScreen());
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              letterSpacing: 1,
              fontSize: 12,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(4),
          child: TextButton(
            onPressed: () {
              // [id,title,description,price,tag,amount,is_display,picture]
             if (_productController.formKey.currentState.validate()) {
                _productController.updateProduct(Product(
                    id: _adminProductController.neededProductsDetails[0],
                    picture: _adminProductController.neededProductsDetails[7],
                    title: _adminProductController.titleController.text
                        .trim()
                        .toLowerCase(),
                    description: _adminProductController.descriptionController.text
                        .trim()
                        .toLowerCase(),
                    price: double.parse(_adminProductController.priceController.text
                        .trim()
                        .toLowerCase()),
                    amount: _adminProductController.amountCounter.value,
                    is_display: _adminProductController.changeDisplayProduct.value,
                    tag: _adminProductController.tagController.text
                        .trim()
                        .toLowerCase(),
                  is_favorites: _adminProductController.neededProductsDetails[8]
                ));
                _productController.getAllProducts();
                Get.off(() => AdminProductDetailScreen());
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                letterSpacing: 1,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
    return Scaffold(
        appBar: appBar,
        body: Obx(() => _adminProductController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height +
                        appBar.preferredSize.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
                      ),
                    ),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35))),
                        height: 60,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Product Edit',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                letterSpacing: 6,
                                color: Colors.white70),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 15,
                        right: 15,
                        child: Form(
                          key: _productController.formKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      _adminProductController.picture,
                                    ),
                                    colorFilter: !_adminProductController
                                            .changeDisplayProduct.value
                                        ? ColorFilter.mode(
                                            Colors.black.withOpacity(0.2),
                                            BlendMode.dstATop)
                                        : ColorFilter.mode(
                                            Colors.black.withOpacity(1),
                                            BlendMode.dstATop,
                                    )
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: double.infinity,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _adminProductController
                                                      .tempSelectedProduct
                                                      .value
                                                      .title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 2),
                                                ),
                                                Text(
                                                  _adminProductController
                                                      .tempSelectedProduct
                                                      .value
                                                      .description,
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  _adminProductController
                                                      .tempSelectedProduct
                                                      .value
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xffFB365F),
                                                      fontSize: 16),
                                                ),
                                              ]),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .delete_forever_rounded,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    size: 40,
                                                  ),
                                                  onPressed: () {
                                                    _productController.deleteProduct(Product(
                                                        id: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .id,
                                                        picture: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .picture,
                                                        title: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .title
                                                            .trim()
                                                            .toLowerCase(),
                                                        description: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .description
                                                            .trim()
                                                            .toLowerCase(),
                                                        price: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .price,
                                                        amount: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .amount,
                                                        is_favorites: _adminProductController
                                                            .tempSelectedProduct
                                                            .value
                                                            .is_favorites,
                                                        is_display: _adminProductController.tempSelectedProduct.value.is_display,
                                                        tag: _adminProductController.tempSelectedProduct.value.tag.trim().toLowerCase()));
                                                    _productController
                                                        .getAllProducts();
                                                    Get.off(() =>
                                                        AdminProductDetailScreen());
                                                  }),
                                              IconButton(
                                                  icon: Icon(
                                                    _adminProductController
                                                            .changeDisplayProduct
                                                            .value
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  ),
                                                  onPressed: () {
                                                    _adminProductController
                                                            .changeDisplayProduct
                                                            .value =
                                                        !_adminProductController
                                                            .changeDisplayProduct
                                                            .value;
                                                    print(
                                                        'value is : ${_adminProductController.changeDisplayProduct.value}');
                                                    if (!_adminProductController
                                                        .changeDisplayProduct
                                                        .value) {
                                                      _adminProductController
                                                          .tempSelectedProduct
                                                          .value
                                                          .is_display = false;
                                                      print(
                                                          'this product is hidden for users');
                                                    }
                                                  }),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Container(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.add,
                                                        ),
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          if (_adminProductController
                                                                  .amountCounter >
                                                              999) {
                                                            return;
                                                          }
                                                          _adminProductController
                                                              .amountCounter++;
                                                        },
                                                      ),
                                                      Container(
                                                        height: 26,
                                                        width: 26,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white24),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        11)),
                                                        child: Center(
                                                          child: Text(
                                                            _adminProductController
                                                                .amountCounter
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon:
                                                            Icon(Icons.remove),
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          if (_adminProductController
                                                                  .amountCounter
                                                                  .value <
                                                              1) {
                                                            return;
                                                          }
                                                          _adminProductController
                                                              .amountCounter--;
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 4, right: 4, top: 6),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xfF0496E2)),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _adminProductController.titleController,
                                maxLength: 12,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  if (value.length < 3) {
                                    return 'Must be more than 3 charater';
                                  } else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.white70, width: 3),
                                  ),
                                  labelText: 'title',

                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 4, right: 4, top: 2),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xfF0496E2)),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller:_adminProductController.descriptionController,

                                maxLength: 100,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  if (value.length < 30) {
                                    return 'Must be more than 30 charater';
                                  } else
                                    return null;
                                },
                                maxLines: 3,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.white70, width: 3),
                                    ),
                                    labelText: 'description',
                                )
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 4, right: 4, top: 2),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xfF0496E2)),
                                controller: _adminProductController.priceController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 6,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  if (value.length < 5) {
                                    return 'Must be more than 2 charater';
                                  } else
                                    return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.white70, width: 3),
                                    ),
                                    labelText: 'price',

                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 4, right: 4, top: 2),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xfF0496E2)),
                                controller: _adminProductController.tagController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // controller: nameController,
                                maxLength: 15,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  if (value.length < 5) {
                                    return 'Must be more than 5 charater';
                                  } else
                                    return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.white70, width: 3),
                                    ),
                                    labelText: 'tag',
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              )));
  }
}
