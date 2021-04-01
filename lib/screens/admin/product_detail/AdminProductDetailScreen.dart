import 'package:ehsan_store/controller/product_contoller/ProductController.dart';
import 'package:ehsan_store/screens/admin/add_product/AddProductAdminScreen.dart';
import 'package:ehsan_store/screens/admin/drawer/AdminDrawer.dart';
import 'package:ehsan_store/widgets/AdminProductItem.dart';
import 'package:ehsan_store/widgets/HeaderWithoutSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductDetailScreen extends StatelessWidget {
  ProductController get _productController => Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductController>(() => ProductController());
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
    );
    final mediaQuery = MediaQuery.of(context);
    final listHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        100 -
        mediaQuery.padding.top);

    return Scaffold(
      appBar: appBar,
      drawer: AdminDrawer(),
      floatingActionButton: handleFAB(),
      body: mainBody(context, listHeight),
    );
  }

  Obx mainBody(BuildContext context, double listHeight) {
    return Obx(
      () => _productController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
                ),
              ),
              child: Stack(children: [
                HeaderWithoutSearch(
                  title: 'Product Details',
                ),
                Positioned(
                  top: 80,
                  left: 15,
                  right: 15,
                  child: productList(listHeight),
                ),
              ]),
            ),
    );
  }

  Container productList(double listHeight) {
    return Container(
      height: listHeight,
      child: ListView.builder(
          itemCount: _productController.tempListProducts.length,
          itemBuilder: (_, i) => AdminProductItem(
                id: _productController.tempListProducts[i].id,
                picture: _productController.tempListProducts[i].picture,
                title: _productController.tempListProducts[i].title,
                description: _productController.tempListProducts[i].description,
                price: _productController.tempListProducts[i].price,
                amount: _productController.tempListProducts[i].amount,
                tag: _productController.tempListProducts[i].tag,
                is_display: _productController.tempListProducts[i].is_display,
                is_favorites:
                    _productController.tempListProducts[i].is_favorites,
              )),
    );
  }

  Align handleFAB() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
        onPressed: () {
          Get.to(AddProductAdminScreen());
        },
        label: Text('Add Product'),
        icon: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
