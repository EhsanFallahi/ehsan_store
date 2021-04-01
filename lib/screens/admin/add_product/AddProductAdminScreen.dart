import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
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
      leading: cancelButtonAppBar(),
      actions: [saveButtonAppBar()],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: mainBody(context),
      ),
    );
  }

  Padding cancelButtonAppBar() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: cancellButton(),
    );
  }

  TextButton cancellButton() {
    return TextButton(
      onPressed: () {
        Get.to(AdminProductDetailScreen());
      },
      child: titleCancel(),
    );
  }

  Text titleCancel() {
    return Text(
      'Cancel',
      style: TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
        letterSpacing: 1,
        fontSize: 12,
      ),
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
      decoration: gradientBackground(),
      child: Form(
          key:  _productController.formKey,
          child: columnItemViews(context)),
    );
  }

  Column columnItemViews(BuildContext context) {
    return Column(
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
    );
  }

  Padding selectImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: <Widget>[circleAvatar(context), buttonSelectPhoto(context)],
      ),
    );
  }

  Positioned buttonSelectPhoto(BuildContext context) {
    return Positioned(
        bottom: 1,
        right: 1,
        child: Container(
          height: 40,
          width: 40,
          child: iconAddPhoto(context),
        ));
  }

  IconButton iconAddPhoto(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo_rounded,
        color: Theme.of(context).accentColor,
      ),
      color: Colors.white,
    );
  }

  CircleAvatar circleAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      radius: 70,
      child: clipOval(),
    );
  }

  ClipOval clipOval() {
    return ClipOval(
      child: Image.asset(
        '',
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding saveButtonAppBar() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: saveButton(),
    );
  }

  TextButton saveButton() {
    return TextButton(
      onPressed: () {
          _productController.addProduct(Product(
              picture:
              'https://assets.ajio.com/medias/sys_master/root/h6b/hbb/15281228087326/-473Wx593H-461089583-grey-MODEL.jpg',
              title: _productController.titleController.text.trim()
                  .toLowerCase(),
              description: _productController.descriptinController.text
                  .trim()
                  .toString()
                  .toLowerCase(),
              price: double.parse(
                  _productController.priceController.text.trim()),
              amount: int.parse(
                  _productController.amountController.text.trim()),
              is_display: true,
              tag: _productController.tagController.text.trim().toLowerCase(),
              is_favorites: false));
          _productController.getAllProducts();
      },
      child: titleSave(),
    );
  }

  Text titleSave() {
    return Text(
      'Save',
      style: TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
        letterSpacing: 1,
        fontSize: 12,
      ),
    );
  }
}
