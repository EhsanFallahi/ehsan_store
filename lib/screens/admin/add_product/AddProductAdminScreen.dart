import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductAdminScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: Padding(
        padding: EdgeInsets.all(4),
        child: TextButton(
          onPressed: () {return;},
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
              _productController.addProduct(Product(
                picture: 'https://assets.ajio.com/medias/sys_master/root/h6b/hbb/15281228087326/-473Wx593H-461089583-grey-MODEL.jpg',
                title: _productController.titleController.text.trim().toLowerCase(),
                description: _productController.descriptinController.text.trim().toString().toLowerCase(),
                price: double.parse(_productController.priceController.text.trim()),
                amount:int.parse(_productController.amountController.text.trim()) ,
                is_display: true,
                tag: _productController.tagController.text.trim().toLowerCase(),
                is_favorites: false

              ));
              _productController.getAllProducts();
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
      body: SingleChildScrollView(
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
                    'Add Product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 6,
                        color: Colors.white70),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 70,
                      child: ClipOval(
                        child: Image.asset(
                          '',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              color: Theme.of(context).accentColor,
                            ),
                            color: Colors.white,
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _productController.titleController,
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
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Title',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _productController.descriptinController,
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
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Description',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _productController.priceController,
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
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Price',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                child: TextFormField(
                  style: TextStyle(color: Color(0xfF0496E2)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _productController.tagController,
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
                      borderSide: BorderSide(color: Colors.white70, width: 3),
                    ),
                    labelText: 'Tag',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 160,
                  padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xfF0496E2)),
                    maxLength: 3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _productController.amountController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 1) {
                        return 'Must be more than 1charater';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white70, width: 3),
                      ),
                      labelText: 'Amount',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
