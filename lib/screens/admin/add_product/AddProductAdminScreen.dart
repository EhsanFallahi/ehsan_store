import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/widgets/AmountTextFormField.dart';
import 'package:ehsan_store/widgets/DescriptionTextFormField.dart';
import 'package:ehsan_store/widgets/HeaderWithoutSearch.dart';
import 'package:ehsan_store/widgets/PriceTextFormField.dart';
import 'package:ehsan_store/widgets/TagTextFormField.dart';
import 'package:ehsan_store/widgets/TitleTextFormField.dart';
import 'package:ehsan_store/widgets/UserNameTextFormField.dart';
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
          onPressed: () {
            return;
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
      actions: [saveButtonAppBar()],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: mainBody(context),
      ),
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
        ),
      ),
      child: Column(
        children: [
          HeaderWithoutSearch(
            title: 'Add Product',
          ),
          selectImage(context),
          TitleTextFormField(controller: _productController.titleController),
          DescriptionTextFormField(
              controller: _productController.descriptinController),
          PriceTextFormField(controller: _productController.priceController),
          TagTextFormField(controller: _productController.tagController),
          Align(
            alignment: Alignment.topLeft,
            child: AmountTextFormField(
                controller: _productController.amountController),
          ),
        ],
      ),
    );
  }

  Padding selectImage(BuildContext context) {
    return Padding(
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
              ))
        ],
      ),
    );
  }

  Padding saveButtonAppBar() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: TextButton(
        onPressed: () {
          _productController.addProduct(Product(
              picture:
                  'https://assets.ajio.com/medias/sys_master/root/h6b/hbb/15281228087326/-473Wx593H-461089583-grey-MODEL.jpg',
              title:
                  _productController.titleController.text.trim().toLowerCase(),
              description: _productController.descriptinController.text
                  .trim()
                  .toString()
                  .toLowerCase(),
              price:
                  double.parse(_productController.priceController.text.trim()),
              amount:
                  int.parse(_productController.amountController.text.trim()),
              is_display: true,
              tag: _productController.tagController.text.trim().toLowerCase(),
              is_favorites: false));
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
    );
  }
}
